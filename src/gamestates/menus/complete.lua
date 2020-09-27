-- Complete Screen
--

local Base     = require 'src.gamestates.menus.menu'
local Complete = Base:extend()

-- Init
--
function Complete:init()
	Base.init(self, { name = 'complete' })
end

-- Enter Complete Screen
--
function Complete:enter(from, ...)
	Base.enter(self, from, ...)

	-- score
	self:calcScore(self.settings)

	-- sfx
	Config.audio.complete:play()

	--
	Timer.after(0.25, function()
		Timer.tween(1, self.c1, {1,1,1,1}, 'linear')
	end)

	Timer.after(0.5, function()
		Timer.tween(1, self.c2, {1,1,1,1}, 'linear')
	end)

	Timer.after(1, function()
		Timer.tween(1, self.c3, {1,1,1,1}, 'linear')
	end)

	Timer.after(2, function()
		Util:flashColor(self.c4, {1,1,1,1}, {1,1,1,0})
		--
		self.isReady = true
	end)
end

-- Calculate Score
--
function Complete:calcScore(data)
	Base.calcScore(self, data)
	--
	saveGame({
		level     = _GAME.level + 1,
		score     = self.score,
		highScore = _GAME.highScore
	})
end

-- Draw
--
function Complete:draw()
	local w, h       = Config.width, Config.height
	local scorePad   = w*0.25
	local scoreWidth = w*0.5
	local blendText  = 'Blend %: ' .. (self.settings.blend * 100)
	local itemText   = self.settings.items['bottle'].qty .. 'x Bottles Collected'
	local timeText   = _:round(self.settings.time, 2) .. 'sec / Par Time: ' .. self.from.par

	-- bg
	lg.setColor(Config.color.black)
	lg.rectangle('fill', 0, 0, w, h)

	-- title
	lg.setColor(self.c1)
	lg.setFont(Config.ui.font.lg)
	lg.printf('You Found The Exit!', 0, h*0.25, w, 'center')

	-- blend score
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.md)
	lg.printf(blendText, scorePad, h*0.35, scoreWidth, 'left')
	lg.printf(self.blendScore, scorePad, h*0.35, scoreWidth, 'right')
	--

	-- item score
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.md)
	lg.printf(itemText, scorePad, h*0.4, scoreWidth, 'left')
	lg.printf(self.itemScore, scorePad, h*0.4, scoreWidth, 'right')
	--

	-- time score
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.md)
	lg.printf(timeText, scorePad, h*0.45, scoreWidth, 'left')
	lg.printf(self.timeScore, scorePad, h*0.45, scoreWidth, 'right')
	--

	-- totol score
	lg.setColor(self.c3)
	lg.setFont(Config.ui.font.md)
	lg.printf('---', scorePad, h*0.5, scoreWidth, 'center')
	lg.printf('Total Score', scorePad, h*0.55, scoreWidth, 'left')
	lg.printf(self.score, scorePad, h*0.55, scoreWidth, 'right')
	--

	-- high-score?
	if self.score > 0 and self.score == _GAME.highScore then
		lg.setColor(self.c3)
		lg.setFont(Config.ui.font.sm)
		lg.printf('New High Score!', scorePad, h*0.6, scoreWidth, 'center')
	end

	-- continue
	lg.setColor(self.c4)
	lg.setFont(Config.ui.font.md)
	lg.printf('Press SPACE to Continue', 0, h*0.75, w, 'center')
end

return Complete