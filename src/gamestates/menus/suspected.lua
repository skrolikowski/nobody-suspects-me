-- Suspected Screen
--

local Base      = require 'src.gamestates.menus.menu'
local Suspected = Base:extend()

-- Init
--
function Suspected:init()
	Base.init(self, { name = 'suspected' })
end

-- Enter Screen
--
function Suspected:enter(from, ...)
	Base.enter(self, from, ...)

	-- score
	self:calcScore(self.settings)

	-- sfx
	Config.audio.suspected:play()

	--
	Timer.after(0.5, function()
		Timer.tween(1, self.c1, {1,1,1,1}, 'linear')
	end)

	Timer.after(1.5, function()
		Timer.tween(1, self.c2, {1,1,1,1}, 'linear')
	end)

	Timer.after(3, function()
		Util:flashColor(self.c3, {1,1,1,1}, {1,1,1,0})
		--
		self.isReady = true
	end)
end

-- Calculate Score
--
function Suspected:calcScore(data)
	Base.calcScore(self, data)
	--
	saveGame({
		level     = 1,
		score     = 0,
		highScore = _GAME.highScore
	})
end

-- Draw
--
function Suspected:draw()
	local w, h = Config.width, Config.height

	-- bg
	lg.setColor(Config.color.black)
	lg.rectangle('fill', 0, 0, w, h)

	-- title
	lg.setColor(self.c1)
	lg.setFont(Config.ui.font.lg)
	lg.printf('You\'ve been suspected!', 0, h*0.25, w, 'center')

	-- score
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.sm)
	lg.printf('Your Score: '..self.score, 0, h*0.35, w, 'center')

	-- high-score?
	if self.score > 0 and self.score == _GAME.highScore then
		lg.setColor(self.c2)
		lg.setFont(Config.ui.font.sm)
		lg.printf('New High Score!', 0, h*0.4, w, 'center')
	end

	-- continue
	lg.setColor(self.c3)
	lg.setFont(Config.ui.font.md)
	lg.printf('Press SPACE to Try Again', 0, h*0.75, w, 'center')
end

return Suspected