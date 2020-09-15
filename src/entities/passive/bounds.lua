-- Bounds
--

local Base   = require 'src.entities.entity'
local Bounds = Base:extend()

-- New
--
function Bounds:new(data)
	Base.new(self, _:merge({
		mixins = {
			transform = {
				x = data.x,
				y = data.y,
				w = data.w or Config.world.tileSize,
				h = data.h or Config.world.tileSize,
			},
		}
	}, data))
end

-- Update
--
function Bounds:update(dt)
	Base.update(self, dt)
end

-- Collision Resolution
--
function Bounds:onResolve(con, nextPos)
	con:adjust(nextPos)
end

return Bounds