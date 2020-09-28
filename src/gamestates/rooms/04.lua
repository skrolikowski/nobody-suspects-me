-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Decisions' })

	--
	-- properties
	self.path  = 'res/maps/04.lua'
	self.par   = 18
	self.audio = {
		path    = 'res/audio/music/Flowing Rocks.ogg',
		bpm     = 125,
		pattern = { 'B','-','A','-','B','-', 'C', '-', 'B','-', 'D', '-' }
	}
end

return Room