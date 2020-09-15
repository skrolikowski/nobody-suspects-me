-- Move System
--

local Base = require 'src.systems.base'
local Move = Base:extend()

-- New
--
function Move:new(host, data)
	Base.new(self, host, { 'axis', 'velocity' })
	
	--
	-- set component values..
	host:spd(data.spd or host._spd)
	host:spdMax(data.spdMax or host._spdMax)
end

-- Update
--
function Move:update(dt)
	--
	local ax, ay = self.host:axis():unpack()
	local vx, vy = self.host:vel():unpack()
	local spdMax = self.host:spdMax()

	-- apply axis
	vx = self:byAxis(ax, vx)
	vy = self:byAxis(ay, vy)

	-- limit speed
	vx = _:clamp(vx, -spdMax, spdMax)
	vy = _:clamp(vy, -spdMax, spdMax)

	-- set
	self.host:vel({ x = vx, y = vy })

	--
	self.host.world:move(
		self.host,
		self.host:pos() + self.host:vel() * dt
	)
end

-- Event: onContact
--
function Move:onContact(con, other)
	if con.norm.y ~= 0 and other.name == 'bounds' then
		self.host:vy(other.vel and other.host:vy() or 0)
	elseif con.norm.x ~= 0 and other.name == 'bounds' then
		self.host:vx(other.vel and other.host:vx() or 0)
	end
end

---- ---- ---- ----

-- VX - axis
--
function Move:byAxis(axis, vel)
	if axis == 0 then
		-- slow-down
		vel = _.__abs(vel) > 1 and vel * 0.35 or 0
	else
		-- full speed
		vel = axis * self.host:spd()
	end

	return vel
end

return Move