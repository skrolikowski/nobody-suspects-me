-- Blend Component
--

local Base  = require 'modern'
local Blend = Base:extend()

-- New
--
function Blend:new(host, data)
	self.host = host

	--
	-- properties
	self._blend = 1
end

---- ---- ---- ----

-- Event: onBlend
--
function Blend:onBlend(qty)
	self._blend = _.__min(1, self._blend + qty)
end

-- Event: offBlend
--
function Blend:offBlend(qty)
	self._blend = _.__max(0, self._blend + qty)
end

---- ---- ---- ----

-- Get/set action
--
function Blend:blend(value)
	if value == nil then
		return self._blend
	end

	self._blend = value
end

return Blend