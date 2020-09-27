--
--
local Base         = require 'src.toolbox.ui.mods.base'
local UIBlendMeter = Base:extend()

-- New
--
function UIBlendMeter:new(data)
	Base.new(self, _:merge(data, {
		image = lg.newImage('res/ui/Blend.png')
	}))

	--
	-- properties
	self.foreground = lg.newImage('res/ui/BlendBar.png')
end

-- Draw
--
function UIBlendMeter:draw()
	lg.push('all')
	lg.translate(self:position())
	lg.scale(3 ,3)
	--
	local w, h = self:dimensions()

	-- background
	lg.setColor(Config.color.white)
	lg.draw(self.image)

	-- gradient
	if not self.gradient then
		self.gradient = Util:gradient('vertical', Config.color.pink[1], Config.color.pink[10])
	end

	-- meter
	local mWidth  = w * 0.4
	local mHeight = h * 0.5
	local mLeft   = w * 0.16
	local mTop    = h * 0.5 - mHeight * 0.5
	local mSx     = mWidth * self.host:blend() / self.gradient:getWidth()
	local mSy     = mHeight /self.gradient:getHeight()

	-- gradient
	lg.setColor(Config.color.white)
	lg.draw(self.gradient, mLeft, mTop, 0, mSx, mSy)
	
	-- foreground
	lg.setColor(Config.color.white)
	lg.draw(self.foreground)

	--
	lg.pop()
end

return UIBlendMeter