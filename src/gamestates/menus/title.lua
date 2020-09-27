-- Title - Menu
--
local Base  = require 'src.gamestates.gamestate'
local Title = Base:extend()

-- Event: onLoad
--
function Title:init(data)
	Base.init(self, {
		name     = 'title',
		controls = _Control['title']
	})

	--
	-- properties
	self.bgImage  = lg.newImage('res/ui/title.png')
	self.bgWidth  = self.bgImage:getWidth()
	self.bgHeight = self.bgImage:getHeight()
	self.bgScale  = 1.25
end

-- Event: onEnter
--
function Title:enter(from, ...)
	Base.enter(self, from, ...)

	--
	self.c1 = {1,1,1,0}
	self.c2 = {1,1,1,0.5}
	self.c3 = {1,1,1,0.5}
    Util:flashColor(self.c1, {1,1,1,1}, {1,1,1,0})
end

-- Draw
--
function Title:draw()
	local w, h   = Config.width, Config.height
	local sx, sy = self.bgScale, self.bgScale
	local ox, oy = self.bgWidth * 0.5, self.bgHeight * 0.5

	-- bg
	lg.setColor(Config.color.black)
	lg.rectangle('fill', 0, 0, w, h)

	-- ESC
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.xs)
	lg.printf('[ESC]Quit', w*0.050, h*0.050, w*0.1, 'left')

	-- volume
	Util:drawTriangle(w*0.81, h*0.050, _.__pi, 8, 8, Config.color.volume.up)
	Util:drawTriangle(w*0.81, h*0.080,      0, 8, 8, Config.color.volume.down)
	--
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.xs)
	lg.printf('Volume',     w*0.85, h*0.05, w*0.125, 'left')
	lg.printf(_GAME.volume, w*0.85, h*0.05, w*0.125, 'right')
	--

	-- difficulty
	Util:drawTriangle(w*0.80, h*0.12,  _.__pi/2, 8, 8, Config.color.difficulty.up)
	Util:drawTriangle(w*0.82, h*0.12, -_.__pi/2, 8, 8, Config.color.difficulty.down)
	--
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.xs)
	lg.printf('Difficulty',     w*0.85, h*0.1, w*0.125, 'left')
	lg.printf(_GAME.difficulty, w*0.85, h*0.1, w*0.125, 'right')
	--

	-- cover
	lg.setColor(Config.color.white)
	lg.draw(self.bgImage, w*0.5, h*0.4, 0, sx, sy, ox, oy)

	-- high score?
	if _GAME.highScore > 0 then
		lg.setColor(Config.color.white)
		lg.setFont(Config.ui.font.sm)
		lg.printf('HighScore: ' .. _GAME.highScore, 0, h*0.05, w, 'center')
	end

	-- text
	lg.setColor(self.c1)
	lg.setFont(Config.ui.font.lg)
	lg.printf('Press SPACE to Play', 0, h*0.75, w, 'center')

	-- credits
	lg.setColor(1,1,1,0.35)
	lg.setFont(Config.ui.font.xs)
	lg.printf('Developer: Shane Krolikowski', w*0.05, h*0.95, w-w*0.1, 'left')
	lg.printf('Audio & Fonts: KenneyNL', w*0.05, h*0.95, w-w*0.1, 'right')
end

---- ---- ---- ----

-- Event: onPlay
--
function Title:onPlay()
	Timer.clear()
	--

	loadGame()
	--
	Gamestate.switch(
		new(Gamestates.rooms[_GAME.level]))
end

return Title