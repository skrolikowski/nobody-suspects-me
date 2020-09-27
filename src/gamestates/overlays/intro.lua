-- Intro Screen
--

local Base  = require 'src.gamestates.overlays.overlay'
local Intro = Base:extend()

-- Init
--
function Intro:init()
	Base.init(self, { name = 'intro' })
end

-- Enter Intro Screen
--
function Intro:enter(from, ...)
	Base.enter(self, from, ...)

	-- colors
	self.c1 = {1,1,1,0}
	self.c2 = {1,1,1,0}
	self.c3 = {1,1,1,0}

	-- sfx
	Config.audio.intro:play()

	--
	self.timer:after(0.5, function()
		self.timer:tween(1, self.c1, {1,1,1,1}, 'linear')
	end)

	self.timer:after(1.5, function()
		self.timer:tween(1, self.c2, {1,1,1,1}, 'linear')
	end)

	self.timer:after(3, function()
		self.timer:tween(1, self.c3, {1,1,1,1}, 'linear')
	end)

	self.timer:script(function(wait)
		wait(5)
		--
		self.timer:tween(1.5, self.c1, {1,1,1,0}, 'linear')
		self.timer:tween(1.5, self.c2, {1,1,1,0}, 'linear')
		self.timer:tween(1.5, self.c3, {1,1,1,0}, 'linear')
		wait(2)
		--
		self:onEsc()
	end)
end

-- Draw
--
function Intro:draw()
	self.from:draw()
	--
	local w, h = Config.width, Config.height

	-- bg
	lg.setColor(Config.color.black)
	lg.rectangle('fill', 0, 0, w, h)

	-- title
	lg.setColor(self.c1)
	lg.setFont(Config.ui.font.lg)
	lg.printf(self.from.name, 0, h*0.25, w, 'center')

	-- map name
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.md)
	lg.printf('Map #: ' .. _GAME.level, 0, h*0.33, w, 'center')

	-- par time
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.md)
	lg.printf('Par Time: ' .. self.from.par .. 'sec', 0, h*0.4, w, 'center')

	-- text
	lg.setColor(self.c3)
	lg.setFont(Config.ui.font.lg)
	lg.printf('Find the Exit!', 0, h*0.55, w, 'center')
end

return Intro