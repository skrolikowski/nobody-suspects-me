-- Blend System
--

local Base  = require 'src.systems.base'
local Blend = Base:extend()

-- New
--
function Blend:new(host, data)
	Base.new(self, host, { 'blend' })
end

-- Update
--
function Blend:update(dt)
	if not self:isBlending() then
		print('onGameOver')
	end
end

---- ---- ---- ----

-- Is entity blending?
--
function Blend:isBlending()
	return self.host:blend() > 0.25
end

return Blend