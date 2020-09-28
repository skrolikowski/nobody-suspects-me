-- Menu Screen
--

local Base = require 'src.gamestates.gamestate'
local Menu = Base:extend()

-- Init
--
function Menu:init(data)
	Base.init(self, {
		name     = data.name     or 'menu',
		controls = data.controls or _Control['menu'] 
	})
end

-- Enter Complete Screen
--
function Menu:enter(from, ...)
	Base.enter(self, from, ...)
	
	--
	-- properties
	self.c1 = {1,1,1,0}
	self.c2 = {1,1,1,0}
	self.c3 = {1,1,1,0}
	self.c4 = {1,1,1,0}

	-- flags
	self.isReady = false
end

-- Event: onContinue
--
function Menu:onContinue()
	Timer.clear()
	--

	if not self.isReady then
		-- skip fade
		self:onSkip()
	else
		-- load next room
		if _GAME.level < #Gamestates.rooms+1 then
			Gamestate.switch(Gamestates.rooms[_GAME.level])
		else
			Gamestate.switch(Gamestates['gameover'])
		end
	end
end

-- Event: onSkip
--
function Menu:onSkip()
	self.isReady = true
	--
	self.c1 = {1,1,1,1}
	self.c2 = {1,1,1,1}
	self.c3 = {1,1,1,1}
	self.c4 = {1,1,1,1}
end

-- Calculate level score
--
function Menu:calcScore(data)
	self.score      = data.score
	self.itemScore  = 0
	self.blendScore = 0
	self.timeScore  = 0
	--
	local scoreMod = Config.difficulty[_GAME.difficulty].scoreMod

	-- tally item score..
	for name, item in pairs(data.items) do
		self.itemScore = self.itemScore + (item.qty * item.item.points)
	end

	-- tally blend score..
	self.blendScore = Config.score.blend.base * data.blend
	self.blendScore = _.__floor(self.blendScore)

	-- calculate time score..
	self.timeScore = scoreMod ^ (data.time - self.from.par)
	self.timeScore = Config.score.time.base * self.timeScore
	self.timeScore = _.__floor(self.timeScore)

	-- save previous
	self.prevScore     = self.score - self.itemScore
	self.prevHighScore = _GAME.highScore

	-- update score
	self.score = self.score + self.blendScore + self.timeScore
	self.score = _.__floor(self.score)

	-- new high score?
	if self.score > _GAME.highScore then
		saveGame({ highScore = self.score })
	end
end

return Menu