-- Metronome Mechanic
--
local MBeat   = require 'src.toolbox.metronome.beat'
local MTrack  = require 'src.toolbox.metronome.track'
local MWindow = require 'src.toolbox.metronome.window'

--
local Modern    = require 'modern'
local Metronome = Modern:extend()

-- New
--
function Metronome:new(scene)
	--
	-- properties
	self.pattern = scene.room.audio.pattern
	self.track   = MTrack(self, scene.room.audio)
	self.beats   = {}
	self.window  = MWindow(0.8, 0.125)
end

-- Teardown
--
function Metronome:destroy()
	self.track:stop()
end

-- Update
--
function Metronome:update(dt)
	self.track:update(dt)
end

---- ---- ---- ----

-- Event: onTrigger
--
function Metronome:onTrigger(...)
	self.window:onTrigger(...)
end

-- Event: onBeat
--
function Metronome:onBeat(n, period)
	local aIdx = (n % #self.pattern) + 1
	local aKey = self.pattern[aIdx]
	local beat

	if aKey ~= '-' then
		beat = MBeat(n, aKey)

		-- spawn beat
		table.insert(self.beats, 1, beat)

		-- progress/expire..
		Timer.tween(period, beat, { pct = 1 }, 'linear',
			function()
				-- expire
				table.remove(self.beats, #self.beats)
			end)

		-- enter window
		Timer.after(period*self.window:left(),
			function() self.window:onEnter(beat) end)

		-- world synce
		Timer.after(period*self.window:center(),
			function() Gamestate.current():on('sync', beat) end)

		-- exit window
		Timer.after(period*self.window:right(),
			function() self.window:onExit(beat) end)
	end
end

return Metronome