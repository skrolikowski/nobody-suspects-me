-- Disco Track
--

local Modern = require 'modern'
local Track  = Modern:extend()

function Track:new(host, data)
	self.track = LoveBPM.newTrack()

	-- config
	self.track:load(data.path)
	self.track:setBPM(data.bpm)
	self.track:setVolume(_GAME.volume or 1)
	self.track:setPitch(1)
	self.track:setLooping(true)
	self.track:play()

	-- calc lifetime
	local period = self.track.period *
	               self.track.pitch  *
	               (data.limit or 8)

	-- events
	self.track:on('beat', function(n)
		host:onBeat(n, period)
	end)
end

-- Set Volume
--
function Track:setVolume(value)
	self.track:setVolume(value)
end

-- Update
--
function Track:update(dt)
	self.track:update(dt)
end

-- Play Track
--
function Track:play()
	self.track:play()
end

-- Play Stop
--
function Track:stop()
	self.track:stop()
end

-- Pause Track
--
function Track:pause()
	self.track:pause()
end

return Track