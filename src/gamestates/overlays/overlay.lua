-- Overlay Screen
--

local Base    = require 'src.gamestates.gamestate'
local Overlay = Base:extend()

-- Init
--
function Overlay:init(data)
	Base.init(self, {
		name     = data.name     or 'overlay',
		controls = data.controls or _Control['overlay']
	})

	-- properties
	self.timer = Timer.new()
end

-- Destroy Screen
--
function Overlay:onEsc()
	self.timer:clear()
	--
	Gamestate.pop()
end

-- Enter Screen
--
function Overlay:enter(from, ...)
	Base.enter(self, from, ...)
	--
	self.from = from -- previous screen
end

function Overlay:update(dt)
	Base.update(self, dt)
	--
	self.timer:update(dt)
end

-- Draw
--
function Overlay:draw()
	--
	self.from:draw()

	-- add dark overlay
	lg.setColor(self.bgcolor)
	lg.rectangle('fill', 0, 0, self.width, self.height)

	-- display line text
	local x = 0
	local y = self.height * 0.3
	local w = self.width

	for __, line in pairs(self.lines) do
		lg.setColor(line.color)
		lg.setFont(line.font)
		lg.printf(line.text, x, line.y, w, 'center')
	end
end

return Overlay