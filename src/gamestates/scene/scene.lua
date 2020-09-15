-- Scene - Gameplay
--
local Base  = require 'src.gamestates.gamestate'
local Scene = Base:extend()

local dispatch = function(obj, name, ...)
	return obj:dispatch(name, ...)
end

-- Event: onLoad
--
function Scene:init(data)
	Base.init(self, {
		name     = 'scene',
		controls = _Control['scene']
	})
end

-- Tear down
--
function Scene:destroy()
	Base.destroy(self)
	--
	self.camera:destroy()
	self.metronome:destroy()
	self.world:destroy()
end

---- ---- ---- ----

-- Event: onEnter
--
function Scene:enter(from, ...)
	Base.enter(self, from, ...)
	--
	-- bootstrap
	self:loadMap()

	-- spawn world
	self.world = World(self)
	self.world:addLayer(self.map.layers['Bounds'])


	-- spawn player
	self.player = new(Entities['red'], {
		world = self.world,
		x     = (self.room.enter.col or 0) * Config.world.tileSize,
		y     = (self.room.enter.row or 0) * Config.world.tileSize,
	})

	-- new(Entities['blue'], {
	-- 	world = self.world,
	-- 	x     = (self.room.enter.col + 4) * Config.world.tileSize,
	-- 	y     = (self.room.enter.row) * Config.world.tileSize,
	-- })

	-- metronome
	self.metronome = Metronome(self)

	-- camera
	self.focus  = self.player
	self.camera = Camera(
		Config.world.tileSize * (self.room.enter.col or 0),
		Config.world.tileSize * (self.room.enter.row or 0),
		Config.camera.scale or 1
	)

	-- ui
	self.ui = UI({
		metronome  = { host = self.metronome, x = 16, y = 16 },
		message    = { host = nil, x = 240*2.5+32, y = 16 },
		blendmeter = { host = self.player, x = (240+64)*2.5+48, y = 16 },
	})

	-- flags
	self.isPaused = false
end

-- Event: onResume
--
function Scene:resume()

end

-- Event: onLeave
--
function Scene:leave()
	self:destroy()
end

---- ---- ---- ----

-- Event: onRequest
--
function Scene:onRq(name, ...)
	self.player:dispatch('onRq' .. _:upperFirst(name), ...)
end

-- Event: offRequest
--
function Scene:offRq(name, ...)
	self.player:dispatch('offRq' .. _:upperFirst(name), ...)
end

-- Event: on
--
function Scene:on(name, ...)
	local items = self.world:queryScreen()

	for __, item in pairs(items) do
		item:dispatch('on' .. _:upperFirst(name), ...)
	end
	
	--
	self.ui:dispatch('on' .. _:upperFirst(name), ...)
end

-- Event: off
--
function Scene:off(name, ...)
	local items = self.world:queryScreen()

	for __, item in pairs(items) do
		item:dispatch('off' .. _:upperFirst(name), ...)
	end
	
	--
	self.ui:dispatch('off' .. _:upperFirst(name), ...)
end

---- ---- ---- ----

-- Update
--
function Scene:update(dt)
	--
	-- metronome
	self.metronome:update(dt)
	
	-- ui
	self.ui:update(dt)

	-- camera
	self.camera:lookAt(self.focus:center())

	-- update entities
	self.world:queryWorld(function(item)
		item:update(dt)
	end)

	--
    Base.update(self, dt)
end

-- Draw
--
function Scene:draw()
    self.camera:draw(function()
        lg.setColor(Config.color.white)
        lg.draw(self.background)

        -- grid
        -- self.world.grid:draw()

        -- draw entities
		self.world:queryScreen(function(item)
			item:draw()
		end)

		lg.setColor(Config.color.white)
        lg.draw(self.foreground)
    end)

    self.ui:draw()    
    --
    Base.draw(self)
end

---- ---- ---- ----

function Scene:loadMap()
	--
	local STI = require 'vendor.sti.sti'

	self.room   = Room[self.settings.room]
	self.map    = STI(self.room.map)
	self.width  = self.map.width  * self.map.tilewidth
	self.height = self.map.height * self.map.tileheight

	--
	self.background = lg.newCanvas(self.width, self.height)
    lg.setCanvas(self.background)
		self.map:drawTileLayer('Walls')
    lg.setCanvas()

    --
    self.foreground = lg.newCanvas(self.width, self.height)
    lg.setCanvas(self.foreground)

    lg.setCanvas()
end

return Scene