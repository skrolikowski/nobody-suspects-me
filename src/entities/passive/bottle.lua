-- Bottle Entity
--

local Base   = require 'src.entities.entity'
local Bottle = Base:extend()

-- New
--
function Bottle:new(data)
	Base.new(self, _:merge({
		name   = 'bottle',
		mixins = {
			transform = {
				x = data.x,
				y = data.y,
				w = data.w or Config.world.tileSize,
				h = data.h or Config.world.tileSize,
				sx = 0.65,
				sy = 0.65,
			}
		},
		systems = {
			animation = {
				sprite = Animator({
					idle = Animation(Sheet['bottle']):frames({1,1,1,8},{2,1,2,1}):at(5),
				})
			}
		}
	}, data))

	--
	-- flags
	self.points = 10
	self.pickup = 0.05
	self.isCollectable = true
end

-- Update
--
function Bottle:update(dt)
	Base.update(self, dt)
end

-- Collision Resolution
--
function Bottle:onResolve(con, nextPos)
	--
end

return Bottle