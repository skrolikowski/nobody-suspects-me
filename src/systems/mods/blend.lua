-- Blend System
--

local Base  = require 'src.systems.base'
local Blend = Base:extend()

-- New
--
function Blend:new(host, data)
	Base.new(self, host, { 'blend' })
	
	--
	-- properties
	self.dropRate = Config.difficulty[_GAME.difficulty].dropRate
	self.dropQty  = Config.difficulty[_GAME.difficulty].dropQty
	self.blendMin = Config.world.blendMin

	--
	self.timer = Timer.new()
	self.timer:every(self.dropRate, function()
		self.host:blendDown(self.dropQty)
	end)
end

-- Update
--
function Blend:update(dt)
	self.timer:update(dt)
	--
	if not self:isBlending() then
		Gamestate.current():onSuspected()
	end
end

---- ---- ---- ----

-- Event: onContact
--
function Blend:onContact(con, other)
	if other.name == 'bottle' then
		self.host:blendUp(other.pickup)
		--
		other:destroy()
	end
end

---- ---- ---- ----

-- Is entity blending?
--
function Blend:isBlending()
	return self.host:blend() > self.blendMin
end

return Blend