-- Animation System
--

local Base      = require 'src.systems.base'
local Animation = Base:extend()

-- New
--
function Animation:new(host, data)
	Base.new(self, host, { 'axis' })

	--
	-- properties
	self.sprite = data.sprite
	self.color  = data.color or Config.color.white

	-- set up post-callback
	self.sprite:each(function(anim, name)
		anim:after(function()
			host:dispatch('onAnimationComplete', name)
		end)
	end)

	--
	self.sprite:set('idle')
end

-- Event: onStateChange
--
function Animation:onStateChange(state)
	self.sprite:set(state)
end

-- Event: onStateColor
--
function Animation:onStateColor(color)
	self.color = color
end

-- Update
--
function Animation:update(dt)
	self.sprite:update(dt)
end

-- Draw
--
function Animation:draw()
	lg.setColor(self.color)

	self.sprite:draw()
end

return Animation