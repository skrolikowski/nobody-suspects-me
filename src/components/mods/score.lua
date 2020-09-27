-- Score Component
--
local Base  = require 'modern'
local Score = Base:extend()

-- New
--
function Score:new(host, data)
	self.host = host

	--
	self._score = _GAME.score
end

-- Increase score value
--
function Score:scoreUp(qty)
	self._score = self._score + (qty or 1)
end

-- Decrease score value
--
function Score:scoreDown(qty)
	self._score = _.__max(0, self._score - (qty or 0.1))
end

-- Get/set score
--
function Score:score(value)
	if value == nil then
		return self._score
	end
end

return Score