-- Red - Player
--

local Base = require 'src.entities.active.unit'
local Red  = Base:extend()

-- New
--
function Red:new(data)
	Base.new(self, _:merge(data, { name = 'red' }))

	--
	-- properties
	self.sm:add({ 'blend' })
end

-- Update
--
function Red:update(dt)
	Base.update(self, dt)
end

---- ---- ---- ----

-- Event: onScore
--
function Red:onScore(score)
	local value = score.pts or 0

	if     value > 0 then self:onBlend(value)
	elseif value < 0 then self:offBlend(value)
	end
end

-- Event: onAct - acting
--
function Red:onAct(aKey)
	Gamestate.current()
		.metronome:onTrigger(aKey, lt.getTime())
end

return Red 