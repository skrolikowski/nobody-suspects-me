--
--
local Base    = require 'src.toolbox.ui.mods.base'
local UIScore = Base:extend()

-- New
--
function UIScore:new(data)
	Base.new(self, data)
end

-- Draw
--
function UIScore:draw()
	lg.push('all')
	lg.translate(self:position())
	--
		local w, h = self:dimensions()

		-- score
		lg.setColor(Config.color.white)
		lg.setFont(Config.ui.font.sm)
		lg.printf(self.host:score(), 0, h*0.3, w, 'right')
	--
	lg.pop()

end

return UIScore