-- Metronome Window
--

local Modern = require 'modern'
local Window = Modern:extend()

function Window:new(pct, err)
	--	
	-- properties
	self.pct   = pct
	self.err   = err
	self.beats = {}
end

---- ---- ---- ----

-- Calculate window box
--
function Window:box(w, h)
	return w * self:left(),
	       h * 0.2,
	       w * self.err,
	       h * 0.6
end

-- Left edge
--
function Window:left()
	return self.pct - self.err / 2
end

-- Left edge
--
function Window:center()
	return self.pct
end

-- Right edge
--
function Window:right()
	return self.pct + self.err / 2
end

-- Event: onTrigger
--
function Window:onTrigger(aKey, time)
	local beat = self:search('aKey', aKey)
	local score

	if beat then
		if self.beats['n'..beat.n] then
			self.beats['n'..beat.n] = nil
			--
			score = _.__abs(self.pct - beat.pct)

			if self.err/10-score > 0 then
				Gamestate.current():on('score', Score[1])
			elseif self.err/6-score > 0 then
				Gamestate.current():on('score', Score[2])
			elseif self.err/4-score > 0 then
				Gamestate.current():on('score', Score[3])
			else
				Gamestate.current():on('score', Score[4])
			end
		end
	else
		-- TODO: misfire.. count against?
		-- Gamestate.current():on('score', 'fail')
	end
end

-- Event: onEnter
--
function Window:onEnter(beat)
	self.beats['n'..beat.n] = beat
end

-- Event: onEnter
--
function Window:onExit(beat)
	if self.beats['n'..beat.n] then
		self.beats['n'..beat.n] = nil
		--
		-- failed to satisfy
		Gamestate.current():on('score', Score[5])
	end
end

-- Search for beat
--
function Window:search(key, value)
	for __, beat in pairs(self.beats) do
		if beat[key] and beat[key] == value then
			return beat
		end
	end

	return false
end

return Window