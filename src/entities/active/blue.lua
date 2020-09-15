-- Blue - NPC
--

local Base = require 'src.entities.active.unit'
local Blue = Base:extend()

-- New
--
function Blue:new(data)
	Base.new(self, _:merge(data, { name = 'blue' }))
end

-- Update
--
function Blue:update(dt)
	Base.update(self, dt)
end

---- ---- ---- ----

-- Event: onSync
-- ----
-- perform action
--
function Blue:onSync(beat)
	self:onRqAct(beat.aKey)
end

return Blue 