-- Room Gamestate
--
local Base = require 'src.gamestates.gamestate'
local Room = Base:extend()

-- Event: onLoad
--
function Room:init(data)
	Base.init(self, _:merge(data, {
		controls = _Control['room']
	}))
end

-- Update
--
function Room:update(dt)
	if not self.isPaused then
		--
		self.disco:update(dt)

		-- camera
		self.camera:lookAt(self.player:center())

		-- update entities
		self.world:queryWorld(function(item)
			item:update(dt)
		end)
	end
	
	--
    Base.update(self, dt)
end

-- Draw
--
function Room:draw()
	self.camera:draw(function()
		lg.setColor(Config.color.white)
		lg.draw(self.layers)

		self.world:queryScreen(function(item)
			item:draw()
		end)
	end)

	self.ui:draw()
end

---- ---- ---- ----

-- Event: onEnter
--
function Room:enter(from, ...)
	Base.enter(self, from, ...)
	--
    -- play intro
    Gamestate.push(Gamestates['intro'])
    
	--
	-- bootstrap
	self:loadRoom()

	-- spawn world
	self.world = World(self)
	self.world:addLayer(self.map.layers['Bounds'])
	self.world:addLayer(self.map.layers['Exit'])
	self.world:addLayer(self.map.layers['Bottle'])
	self.world:addLayer(self.map.layers['Blue'])
	self.world:addLayer(self.map.layers['Pink'])

	-- locate player
	self.player = nil
	self.world:queryWorld(function(item)
		if item.name == 'pink' then
			self.player = item
		end
	end)

	-- camera
	self.camera = Camera(0, 0, Config.world.scale or 1)

	-- audio
	self.disco = Disco(self.audio)

	-- ui
	self.ui = UI({
		UIItems['blendmeter']({ host = self.player, x = Config.width - 144*3-16, y = 16 }),
		UIItems['score']({ host = self.player, x = Config.width - 64*2.5, y = 16, w = 64*2, h = 16*2 })
	})

	-- flags
	self.isPaused = false
end

-- Event: onResume
--
function Room:resume()
	self.disco:play()
end

-- Event: onLeave
--
function Room:leave()
	Base.leave(self)
	--
	self.world:destroy()
end

---- ---- ---- ----

-- Event: onRequest
--
function Room:onRq(name, ...)
	self.player:dispatch('onRq' .. _:upperFirst(name), ...)
end

-- Event: offRequest
--
function Room:offRq(name, ...)
	self.player:dispatch('offRq' .. _:upperFirst(name), ...)
end

-- Event: on
--
function Room:on(name, ...)
	local items = self.world:queryScreen()

	for __, item in pairs(items) do
		item:dispatch('on' .. _:upperFirst(name), ...)
	end
	
	--
	self.ui:dispatch('on' .. _:upperFirst(name), ...)
end

-- Event: off
--
function Room:off(name, ...)
	local items = self.world:queryScreen()

	for __, item in pairs(items) do
		item:dispatch('off' .. _:upperFirst(name), ...)
	end
	
	--
	self.ui:dispatch('off' .. _:upperFirst(name), ...)
end

---- ---- ---- ----

-- Event: onCompleted
--
function Room:onPause()
	Gamestate.push(Gamestates['pause'])
end

-- Event: onRestart
--
function Room:onRestart()
	self.disco:stop()
	--
	Gamestate.switch(Gamestates['title'])
end

-- Event: onCompleted
--
function Room:onCompleted()
	self.disco:stop()
	--
	Gamestate.push(Gamestates['complete'], {
		blend = self.player:blend(),
		time  = lt.getTime() - self.initTime,
		items = self.player:items(),
		score = self.player:score(),
	})
end

-- Event: onSuspected
--
function Room:onSuspected()
	self.disco:stop()
	--
	Gamestate.switch(Gamestates['suspected'], {
		blend = 0,
		time  = _.__huge,
		items = self.player:items(),
		score = self.player:score(),
	})
end

---- ---- ---- ----

function Room:loadRoom()
	--
	local STI = require 'vendor.sti.sti'

	self.map    = STI(self.path)
	self.width  = self.map.width  * self.map.tilewidth
	self.height = self.map.height * self.map.tileheight

	--
	self.initTime = lt.getTime()

	--
	self.layers = lg.newCanvas(self.width, self.height)
    lg.setCanvas(self.layers)
    	lg.setColor(Config.color.white)
    	--
		self.map:drawTileLayer('Floor')
		self.map:drawTileLayer('Decorations')
		self.map:drawTileLayer('Walls')
    lg.setCanvas()
end

return Room