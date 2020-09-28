-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Maze I' })

	--
	-- properties
	self.path  = 'res/maps/06.lua'
	self.par   = 70
	self.audio = {
		path    = 'res/audio/music/Mission Plausible.ogg',
		bpm     = 114,
		pattern = {
			'B','-', 'A', '-', 'D', '-', 'C', '-',
			'D','-', 'C', '-', 'A', '-', 'B', '-',
		}
	}
end

return Room