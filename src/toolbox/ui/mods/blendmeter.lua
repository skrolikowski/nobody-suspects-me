--
--
local Base         = require 'src.toolbox.ui.mods.base'
local UIBlendMeter = Base:extend()

-- New
--
function UIBlendMeter:new(data)
	Base.new(self, _:merge(data, {
		image = lg.newImage('res/ui/BlendMeter.png')
	}))

	--
	-- properties
	self.foreground = lg.newImage('res/ui/BlendBar.png')
end

-- Update
--
function UIBlendMeter:update(dt)
	--
end

-- Draw
--
function UIBlendMeter:draw()
	lg.push('all')
	lg.translate(self:position())
	lg.scale(2.5, 2.5)
	--
	local w, h = self:dimensions()

	-- background
	lg.setColor(Config.color.white)
	lg.draw(self.image)

	-- gradient
	if not self.gradient then
		self.gradient = Util:gradient('horizontal', {_:color('red-500')}, {_:color('blue-500')})
	end

	-- meter
	local mWidth  = w * 0.3
	local mHeight = h * 0.6
	local mLeft   = w * 0.5 - mWidth  * 0.5
	local mTop    = h * 0.5 - mHeight * 0.5
	local mSx     = mWidth / self.gradient:getWidth()
	local mSy     = mHeight * self.host:blend() /self.gradient:getHeight()

	-- border
	lg.setColor(Config.color.white)
	lg.draw(self.gradient, mLeft, mTop, 0, mSx, mSy)
	
	-- foreground
	lg.setColor(Config.color.white)
	lg.draw(self.foreground, 16)
	--
	lg.pop()
end

return UIBlendMeter