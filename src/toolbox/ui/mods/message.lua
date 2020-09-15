--
--
local Base      = require 'src.toolbox.ui.mods.base'
local UIMessage = Base:extend()

-- New
--
function UIMessage:new(data)
	Base.new(self, _:merge(data, {
		image = lg.newImage('res/ui/Message.png')
	}))

	--
	-- properties
	self.message = false
end

-- Update
--
function UIMessage:update(dt)
	--
end

-- Draw
--
function UIMessage:draw()
	lg.push('all')
	lg.translate(self:position())
	lg.scale(2.5)
	--
	local w, h = self:dimensions()

	-- bg
	lg.setColor(Config.color.white)
	lg.draw(self.image)

	-- message
	if self.message then
		lg.draw(self.message)
	end
	--
	lg.pop()
end

---- ---- ---- ----

-- Event: onScore
--
function UIMessage:onScore(score)
	--
	self.message = score.img

	-- expire
	Timer.after(1,
		function() self.message = false end)
end

return UIMessage