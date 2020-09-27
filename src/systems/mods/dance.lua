-- Dance System
--

local Base  = require 'src.systems.base'
local Dance = Base:extend()

-- New
--
function Dance:new(host, data)
	Base.new(self, host, { 'dance' })
end

return Dance