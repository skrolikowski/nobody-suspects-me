-- Base UI
--

local Modern = require 'modern'
local UIBase = Modern:extend()

-- New
--
function UIBase:new(data)
	--
	-- image
	if data.image then
		self.image  = data.image
		self.width  = self.image:getWidth()
		self.height = self.image:getHeight()
	else
		self.width  = data.w or Config.world.tileSize
		self.height = data.h or Config.world.tileSize
	end

	--
	-- properties
	self.host = data.host
	self.pos  = Vec2(
		data.x + self.width  * 0.5,
		data.y + self.height * 0.5
	)

	-- flags
	self.isRemove = false
end

-- Tear down
function UIBase:destroy()
	self.isRemove = true
end

-- AABB
--
function UIBase:aabb()
	return AABB:fromContainer(self:container())
end

-- Top/left position
--
function UIBase:position()
	local cx, cy = self:center()
	local w, h   = self:dimensions()
	local x      = cx - w * 0.5
	local y      = cy - h * 0.5

	return x, y
end

-- Center position
--
function UIBase:center()
	return self.pos:unpack()
end

-- Containing box
--
function UIBase:container()
	local x, y = self:position()
	local w, h = self:dimensions()

	return x, y, w, h
end

-- Dimensions
--
function UIBase:dimensions()
	return self.width, self.height
end

return UIBase