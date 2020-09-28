-- Base Screen
--

local Modern    = require 'modern'
local BaseState = Modern:extend()

function BaseState:init(data)
	self.id       = data.id   or Util:uuid()
	self.name     = data.name or 'scene'
	self.controls = Control(data.controls or {})
end

-- Update
--
function BaseState:update(dt)
	self.controls:update(dt)
end

---- ---- ---- ----

-- Event: onEnter
--
function BaseState:enter(from, ...)
	self.from     = from -- previous screen
	self.settings = ...
end

-- Event: onResume
--
function BaseState:resume()
	--
end

-- Event: onLeave
--
function BaseState:leave()
	self.controls:destroy()
end

---- ---- ---- ----

-- Event: on request
--
function BaseState:on(name, ...)
	--
end

-- Event: off request
--
function BaseState:off(name, ...)
	--
end

-- Event: onPressed
--
function BaseState:onPressed(...)
	self.controls:onPressed(...)
end

-- Event: onReleased
--
function BaseState:onReleased(...)
	self.controls:onReleased(...)
end

-- Event: onControl (callbacks)
--
function BaseState:onControl(name, ...)
	pcall(self.controls[name], ...)
end


-- Event: Go to Main Menu
--
function BaseState:onMainMenu()
	Gamestate.switch(Gamestates['title'])
end

-- Event: Quit Game
--
function BaseState:onExit()
	love.event.quit()
end

return BaseState