--
--
local Base        = require 'src.toolbox.ui.mods.base'
local UIMetronome = Base:extend()

-- New
--
function UIMetronome:new(data)
	Base.new(self, _:merge(data, {
		image = lg.newImage('res/ui/Metronome.png')
	}))
end

-- Update
--
function UIMetronome:update(dt)
	--
end

-- Draw
--
function UIMetronome:draw()
	lg.push('all')
	lg.translate(self:position())
	lg.scale(2.5)
	--
	local w, h = self:dimensions()
	local r, g, b

	-- bg
	lg.setColor(Config.color.white)
	lg.draw(self.image)

	-- line
	r, g, b = unpack(Config.color.p4)
	lg.setColor(r, g, b, 0.25)
	lg.line(w * 0.1, h * 0.5, w * 0.9, h * 0.5)

	-- window
	lg.rectangle('fill', self.host.window:box(w, h))
	lg.setColor(Config.color.p5)
	lg.rectangle('line', self.host.window:box(w, h))

	-- beats
	for __, beat in pairs(self.host.beats) do
		lg.setColor(Config.color.white)
		lg.draw(beat.image, w * beat.pct, h * 0.5, 0,
			beat.sx, beat.sy, beat.ox, beat.oy)
	end

	--
	lg.pop()
end

return UIMetronome