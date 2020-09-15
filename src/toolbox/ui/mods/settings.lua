--
--
local Base      = require 'src.toolbox.ui.mods.base'
local UISetting = Base:extend()

-- New
--
function UISetting:new(data)
	Base.new(self, _:merge(data, {
		x = data.x + data.w * 0.5,
		y = data.y + data.h * 0.5,
	}))
end

-- Update
--
function UISetting:update(dt)
	--
end

-- Draw
--
function UISetting:draw()
	lg.push("all")
	lg.translate(self:position())
	--
	local w, h = self:dimensions()

	-- bg
	lg.setColor(1,1,1,1)
	lg.rectangle('fill', 0, 0, w, h)
	lg.setColor(0,0,0,1)
	lg.rectangle('line', 0, 0, w, h)


	--
	lg.pop()
end

return UISetting