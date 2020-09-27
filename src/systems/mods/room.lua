-- Room System
--

local Base = require 'src.systems.base'
local Room = Base:extend()

-- New
--
function Room:new(host, data)
	Base.new(self, host, { 'score', 'blend', 'items' })
end

-- Event: onContact
--
function Room:onContact(con, other)
	--
	-- Collectable
	if other.isCollectable then
		Config.audio.pickup:play()
		--
		self.host:pickup(other)
		self.host:scoreUp(other.points)

	--
	-- Level exit
	elseif other.name == 'exit' then
		Gamestate.current():onCompleted()
	end
end

return Room