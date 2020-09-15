-- Act Component
--

local Base = require 'modern'
local Act  = Base:extend()

-- New
--
function Act:new(host, data)
	self.host = host

	--
	-- properties
	self._actionKey = nil

	-- flags
	self.isActReq = false
	self.isActing = false
end

-- Update
--
function Act:update(dt)
	--
end

---- ---- ---- ----

-- Event: onRqAct
--
function Act:onRqAct(actionKey)
	self._actionKey = actionKey
	self.isActReq   = true
end

-- Event: onAction
--
function Act:onAct(actionKey)
	self._since   = lt.getTime()
	self.isActing = true
	self.isActReq = false  -- reset
end

-- Event: offAction
--
function Act:offAct()
	self._since   = nil
	self.isActing = false
end

---- ---- ---- ----

-- Get/set action
--
function Act:act(value)
	if value == nil then
		return self._actionKey
	end

	self._actionKey = value
end

-- Get/set since
--
function Act:since(value)
	if value == nil then
		return self._since
	end

	self._since = value
end

return Act