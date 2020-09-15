-- Base Screen
--

local Modern    = require 'modern'
local Gamestate = Modern:extend()

function Gamestate:init(data)
	self.id       = data.id   or Util:uuid()
	self.name     = data.name or 'scene'
	self.controls = Control(data.controls or {})
end

-- Update
--
function Gamestate:update(dt)
	self.controls:update(dt)
end

-- Draw
--
function Gamestate:draw()
	--
end

-- Tear down
--
function Gamestate:destroy()
	self.controls:destroy()
end

---- ---- ---- ----

-- Event: onEnter
--
function Gamestate:enter(from, ...)
	self.from     = from -- previous screen
	self.settings = ...
	--

end

-- Event: onResume
--
function Gamestate:resume()

end

-- Event: onLeave
--
function Gamestate:leave()
	--
end

---- ---- ---- ----

-- Event: on request
--
function Gamestate:on(name, ...)
	--
end

-- Event: off request
--
function Gamestate:off(name, ...)
	--
end

-- Event: onBeat
--
function Gamestate:onBeat(...)
	--
end

-- Event: onPressed
--
function Gamestate:onPressed(...)
	self.controls:onPressed(...)
end

-- Event: onReleased
--
function Gamestate:onReleased(...)
	self.controls:onReleased(...)
end

-- Event: onControl (callbacks)
--
function Gamestate:onControl(name, ...)
	pcall(self.controls[name], ...)
end

-- Event: quit game
--
function Gamestate:onQuit()
	love.event.quit()
end

return Gamestate