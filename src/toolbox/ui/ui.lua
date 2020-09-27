--
--

local Modern = require 'modern'
local UI     = Modern:extend()

-- New
--
function UI:new(items)
	self.items = items
end

-- Teardown
--
function UI:destroy()
	for __, item in pairs(self.items) do
		item:destroy()
	end
end

-- Dispatch
--
function UI:dispatch(event, ...)
	for __, item in pairs(self.items) do
		if item[event] then
			item[event](item, ...)
		end
	end
end

-- Update
--
function UI:update(dt)
	for __, item in pairs(self.items) do
		item:update(dt)
	end
end

-- Draw
--
function UI:draw()
	for __, item in pairs(self.items) do
		item:draw()
	end
end

return UI