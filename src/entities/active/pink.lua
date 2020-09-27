-- Pink
--

local Base = require 'src.entities.active.unit'
local Pink = Base:extend()

-- New
--
function Pink:new(data)
	Base.new(self, _:merge(data, { name = 'pink' }))

	--
	self.sm:add({
		'blend',
		'room',
		--
		animation = {
			color  = Config.color.pink[10],
			sprite = Animator({
				idle = Animation(Sheet['pink']):frames({3,6,3,8},{4,1,4,2}):at(3):offset(0,8),
				walk = Animation(Sheet['pink']):frames({5,8,5,8},{6,1,6,3}):at(5):offset(0,8),
				hop  = Animation(Sheet['pink']):frames({1,1,1,8},{2,1,2,3}):once():offset(0,12),
				wink = Animation(Sheet['pink']):frames({2,4,2,8},{3,1,3,4}):once():offset(0,12),
				spin = Animation(Sheet['pink']):frames({4,3,4,8}):once():offset(0,12),
				kiss = Animation(Sheet['pink']):frames({5,1,5,7}):once():offset(0,12),
			})
		}
	})
end

-- Update
--
function Pink:update(dt)
	local index = _.__max(1, _.__floor(self:blend() * 10))
	local color = Config.color.pink[index]

	self:dispatch('onStateColor', color)
	--
	Base.update(self, dt)
end

return Pink 