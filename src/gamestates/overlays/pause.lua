-- Pause Screen
--

local Base  = require 'src.gamestates.overlays.overlay'
local Pause = Base:extend()

-- Init
--
function Pause:init()
	Base.init(self, {
		name     = 'pause',
		controls = _Control['pause']
	})
end

-- Enter
--
function Pause:enter(from, ...)
	Base.enter(self, from, ...)
	--

	-- sfx
	Config.audio.pause:play()
end

-- Draw
--
function Pause:draw()
	self.from:draw()
	--
	local w, h = Config.width, Config.height

	-- bg
	lg.setColor(Config.color.overlay)
	lg.rectangle('fill', 0, 0, w, h)

	-- restart
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.xs)
	lg.printf('[SPACE] - Restart', w*0.05, h*0.05, w*0.5, 'left')

	-- volume
	Util:drawTriangle(w*0.81, h*0.050, _.__pi, 8, 8, Config.color.volume.up)
	Util:drawTriangle(w*0.81, h*0.080,      0, 8, 8, Config.color.volume.down)
	--
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.xs)
	lg.printf('Volume',     w*0.85, h*0.05, w*0.125, 'left')
	lg.printf(_GAME.volume, w*0.85, h*0.05, w*0.125, 'right')
	--

	-- text
	lg.setColor(Config.color.white)
	lg.setFont(Config.ui.font.md)
	lg.printf('Pause', 0, h*0.4, w, 'center')
end

-- Event: onRestart
--
function Pause:onRestart()
	self.from:onRestart()
end

return Pause