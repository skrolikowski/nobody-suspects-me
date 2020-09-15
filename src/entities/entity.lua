-- Base Entity
--

local Modern = require 'modern'
local Entity = Modern:extend()

function Entity:new(data)
	--
	-- properties
	self.id     = Util:uuid()
	self.name   = data.name or 'Entity'
	self.mixins = {}  -- aka, components

	-- components
	if data.mixins then
		self:addComponents(data.mixins)
	end

	-- systems
	if data.systems then
		self.sm = SM(self, data.systems)
	end

	-- add to world
	if data.world then
		data.world:add(self)
	end
end

-- Teardown
--
function Entity:destroy()
	if self.sm then
		self.sm:destroy()
	end

	--
	self.world:remove(self)
end

-- Dispatch event
--
function Entity:dispatch(event, ...)
	if self[event] then
		self[event](self, ...)
	end

	-- systems
	if self.sm then
		self.sm:dispatch(event, ...)
	end
end

-- Update
--
function Entity:update(dt)
	if self.sm then
		self.sm:update(dt)
	end
end

-- Draw
--
function Entity:draw()
	if self.sm then
		lg.push()
		lg.translate(self:center())
		lg.scale(self._sx, self._sy)
		--
		self.sm:draw()
		--
		lg.pop()
	end
end

---- ---- ---- ----

-- Add Components
--
function Entity:addComponents(components)
	local name, args

	for k, v in pairs(components) do

		if _:isNumber(k) then
			name, args = v, {}
		else
			name, args = k, v
		end

		assert(Components[name] ~= nil, "Component `"..name.."` does not exist.")
		
		-- require once..
		if self.mixins[name] == nil then
			self.mixins[name] = true
			--
			Entity.addMixin(self, Components[name](self, args))
		end
	end
end

return Entity