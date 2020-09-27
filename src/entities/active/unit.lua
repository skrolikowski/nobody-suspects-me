-- Base Unit Entity
--

local Base = require 'src.entities.entity'
local Unit = Base:extend()

-- New
--
function Unit:new(data)
	Base.new(self, _:merge(data, {
		name   = data.name or 'unit',
		mixins = {
			transform = {
				x  = data.x,
				y  = data.y,
				w  = 16,
				h  = 16,
				sx = 0.5,
				sy = 0.5,
			},
			'proximity'
		},
		systems = { 'move' }
	}))

	--
	-- properties
	self._state  = data.state or 'idle'
end

-- Update
--
function Unit:update(dt)
	Base.update(self, dt)

	--
	-- state
	if self.isDancing then
		-- dancing
		self:state(self:dance())
	elseif _.__abs(self:vx()) > 1 then
		-- walking
		self:state('walk')
	else
		-- idling
		self:state('idle')
	end
end

---- ---- ---- ----

-- Get/set `state` value.
--
function Unit:state(value)
	if value == nil then
		return self._state
	end

	if self._state ~= value then
		self._state = value
		--
		self:dispatch('onStateChange', value)
	end
end

return Unit