-- GameOver - Menu
--
local Base     = require 'src.gamestates.gamestate'
local GameOver = Base:extend()

-- Event: onLoad
--
function GameOver:init(data)
	Base.init(self, {
		name     = 'gameover',
		controls = _Control['menu'] 
	})
end

-- Event: onPlay
--
function GameOver:onContinue()
	if self.isReady then
		Timer.clear()
		--
		Gamestate.switch(Gamestates['title'])
	end
end

-- Event: onEnter
--
function GameOver:enter(from, ...)
	Base.enter(self, from, ...)
	
	-- setup
	self.isReady = false

	-- sfx
	Config.audio.gameover:play()
	
	-- colors
	self.c1 = {1,1,1,0}
	self.c2 = {1,1,1,0}
	self.c3 = {1,1,1,0}

	--
	Timer.after(0.25, function()
		Timer.tween(1, self.c1, {1,1,1,1}, 'linear')
	end)

	Timer.after(0.5, function()
		Timer.tween(1, self.c2, {1,1,1,1}, 'linear')
	end)

	Timer.after(2, function()
		Util:flashColor(self.c3, {1,1,1,1}, {1,1,1,0})
		--
		self.isReady = true
	end)
end

-- Draw
--
function GameOver:draw()
	local w, h = Config.width, Config.height

	-- bg
	lg.setColor(Config.color.black)
	lg.rectangle('fill', 0, 0, w, h)

	-- title
	lg.setColor(self.c1)
	lg.setFont(Config.ui.font.lg)
	lg.printf('Congratulations!', 0, h*0.25, w, 'center')

	-- subtitle
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.sm)
	lg.printf('Nobody suspected you... :)', 0, h*0.35, w, 'center')

	-- score
	lg.setColor(self.c2)
	lg.setFont(Config.ui.font.sm)
	lg.printf('Your Score: '.._GAME.score, 0, h*0.4, w, 'center')

	-- text
	lg.setColor(self.c3)
	lg.setFont(Config.ui.font.lg)
	lg.printf('Press SPACE to Restart', 0, h*0.75, w, 'center')
end

return GameOver