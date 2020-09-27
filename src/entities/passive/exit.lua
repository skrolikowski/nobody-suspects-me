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
				w = Config.world.tileSize*3,
				h = Config.world.tileSize*3,
			}
		}
	}, data))
end

-- Update
--
function Exit:update(dt)
	Base.update(self, dt)
end

function Exit:draw()
	local x, y, w, h = self:container()

	lg.setColor(0,1,0,0.25)
	lg.rectangle('fill', x, y, w, h)
	lg.setColor(1,1,1,0.75)
	lg.setFont(Config.ui.font.xs)
	lg.printf('Exit', x, y+h*0.25, w, 'center')
end

-- Collision Resolution
--
function Exit:onResolve(con, nextPos)
	--
end

return Exit