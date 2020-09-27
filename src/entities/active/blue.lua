-- Blue - NPC
--

local Base = require 'src.entities.active.unit'
local Blue = Base:extend()

-- New
--
function Blue:new(data)
	Base.new(self, _:merge(data, { name = 'blue' }))
	--

	self.sm:add({
		'dance',
		animation = {
			color  = Config.color.blue,
			sprite = Animator({
				idle = Animation(Sheet['blue']):frames({3,6,3,8},{4,1,4,2}):at(6):offset(0,8),
				walk = Animation(Sheet['blue']):frames({5,8,5,8},{6,1,6,3}):at(6):offset(0,8),
				hop  = Animation(Sheet['blue']):frames({1,1,1,8},{2,1,2,3}):once():offset(0,12),
				wink = Animation(Sheet['blue']):frames({2,4,2,8},{3,1,3,4}):once():offset(0,12),
				spin = Animation(Sheet['blue']):frames({4,3,4,8}):once():offset(0,12),
				kiss = Animation(Sheet['blue']):frames({5,1,5,7}):once():offset(0,12),
			})
		}
	})
end

-- Update
--
function Blue:update(dt)
	Base.update(self, dt)
end

-- Draw
--
function Blue:draw()
	Base.draw(self)
end

---- ---- ---- ----

-- Event: onBeat
--
function Blue:onBeat(dance)
	self:onDance(dance)
end

return Blue 