-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Dead Ends' })

	--
	-- properties
	self.path  = 'res/maps/03.lua'
	self.par   = 20
	self.audio = {
		path    = 'res/audio/music/Infinite Descent.ogg',
		bpm     = 120,
		pattern = { 'C','-','A','-','C','-', 'B', '-', 'C','-', 'D', '-' }
	}
end

return Room