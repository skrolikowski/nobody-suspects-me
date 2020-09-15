-- Proximity Component
--

local Base      = require 'modern'
local Proximity = Base:extend()

-- New
--
function Proximity:new(host, data)
	self.host = host

	--
	-- properties
	self._touch      = {}
	self._touchCount = 0

	--
	-- flags
	self.isTouching = false
end

-- Update
--
function Proximity:update(dt)
	--
	-- check if still on wall
	for id, con in pairs(self._touch) do
		if not self:stillTouching(con.other, self.host) then
			self:offTouch(con, id)
		end
	end
end

---- ---- ---- ----

-- Event: onContact
--
function Proximity:onContact(con, other)
	if self:isTouch(con, other) then
		if self._touch[other.id] == nil then
			self:onTouch(con, other.id)
		end
	end
end

-- Event: onTouch
--
function Proximity:onTouch(con, id)
	self._touch[id]  = con
	self._touchCount = self._touchCount + 1
	self.isTouching  = true
end

-- Event: offTouch
--
function Proximity:offTouch(con, id)
	self._touch[id]  = nil
	self._touchCount = self._touchCount - 1
	self.isTouching  = self._touchCount > 0
end

---- ---- ---- ----

-- Is touching?
--
function Proximity:stillTouching(A, B)
	return A:aabb():contains(B:aabb())
end

-- Is `other` a touchable entity?
--
function Proximity:isTouch(con, other)
	return other.name == 'bounds'
end

return Proximity