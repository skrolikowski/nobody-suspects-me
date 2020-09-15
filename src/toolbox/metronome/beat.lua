-- Metronome Beat
--
local Modern = require 'modern'
local Beat   = Modern:extend()

-- New
--
function Beat:new(n, aKey)
	--	
	-- properties
	self.n     = n
	self.aKey  = aKey
	self.pct   = 0

	-- image
	self.image = lg.newImage('res/ui/Beat'..aKey..'.png')
	self.sx    = 1.5
	self.sy    = 1.5
	self.ox    = self.image:getWidth()  * 0.5
	self.oy    = self.image:getHeight() * 0.5
end

return Beat