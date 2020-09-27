-- Disco Mechanic
--
local MTrack = require 'src.toolbox.disco.track'

--
local Modern = require 'modern'
local Disco  = Modern:extend()

-- New
--
function Disco:new(data)
	--
	-- properties
	self.pattern = data.pattern
	self.track   = MTrack(self, data)
end

-- Teardown
--
function Disco:destroy()
	self.track:stop()
end

-- Update
--
function Disco:update(dt)
	self.track:update(dt)
	--

	if self.track.volume ~= _GAME.volume then
		self.track:setVolume(_GAME.volume)
	end
end

-- Play track
--
function Disco:play()
	self.track:play()
end

-- Stop track
--
function Disco:stop()
	self.track:stop()
end

-- Pause track
--
function Disco:pause()
	self.track:pause()
end

-- Event: onBeat
--
function Disco:onBeat(n, period)
	local dIdx = (n % #self.pattern) + 1
	local dKey = self.pattern[dIdx]

	if dKey ~= '-' then
		Gamestate.current():on('beat', Config.dance[dKey])
	end
end

return Disco