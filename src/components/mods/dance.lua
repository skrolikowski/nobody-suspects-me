-- Dance Component
--

local Base  = require 'modern'
local Dance = Base:extend()

-- New
--
function Dance:new(host, data)
	self.host = host

	--
	-- properties
	self._dance = nil

	-- flags
	self.isDancing = false
end

-- Event: onDance
--
function Dance:onDance(dance)
	self._dance    = dance
	self.isDancing = true
end

-- Event: onAnimationComplete
--
function Dance:onAnimationComplete(name)
	if name == self._dance then
		self.isDancing = false
	end
end

-- Get/set dance.
--
function Dance:dance(value)
	if value == nil then
		return self._dance
	end

	self._dance = value
end

return Dance