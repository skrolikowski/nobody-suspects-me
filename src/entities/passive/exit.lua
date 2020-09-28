-- Exit Entity
--

local Base = require 'src.entities.entity'
local Exit = Base:extend()

-- New
--
function Exit:new(data)
	Base.new(self, _:merge({
		name   = 'exit',
		mixins = {
			transform = {
				x = data.x,
				y = data.y,
				w = data.width,
				h = data.height,
			}
		}
	}, data))
end

-- Update
--
function Exit:update(dt)
	Base.update(self, dt)
end

-- Collision Resolution
--
function Exit:onResolve(con, nextPos)
	--
end

return Exit