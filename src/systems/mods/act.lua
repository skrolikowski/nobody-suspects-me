-- Act System
--

local Base = require 'src.systems.base'
local Act  = Base:extend()

-- New
--
function Act:new(host, data)
	Base.new(self, host, { 'act' })
end

-- Update
--
function Act:update(dt)
	if self:actRequested() and self:canAct() then
		self.host:dispatch('onAct', self.host:act())
		--
		Timer.after(0.25, function()
			self.host:dispatch('offAct')
		end)
	end
end

---- ---- ---- ----

-- -- Event: onAnimationComplete
-- --
-- function Act:onAnimationComplete(name)
-- 	if name == Action[self.host:act()] then
-- 		self.host:dispatch('offAct')
-- 	end
-- end

---- ---- ---- ----

-- Has action been requested?
--
function Act:actRequested()
	return self.host.isActReq
end

-- Can entity act?
--
function Act:canAct()
	return not self.host.isActing
end

return Act