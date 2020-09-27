-- Items Component
--
local Base  = require 'modern'
local Items = Base:extend()

-- New
--
function Items:new(host, data)
	self.host = host

	--
	-- proprties
	self._items = {}
end

-- Collect item
--
function Items:pickup(item)
	if not self._items[item.name] then
		self._items[item.name] = {
			qty  = 0,
			item = item
		}
	end
	
	self._items[item.name].qty =
		self._items[item.name].qty + (qty or 1)
end

-- Get items
--
function Items:items()
	return self._items
end

return Items