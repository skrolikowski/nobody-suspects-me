-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'More Decisions' })

	--
	-- properties
	self.path  = 'res/maps/05.lua'
	self.par   = 18
	self.audio = {
		path    = 'res/audio/music/Mishief Stroll.ogg',
		bpm     = 120,
		pattern = { 'D','-','A','-','D','-', 'B', '-', 'D','-', 'C', '-' }
	}
end

return Room