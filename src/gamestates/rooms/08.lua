-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Maze III' })

	--
	-- properties
	self.path  = 'res/maps/08.lua'
	self.par   = 80
	self.audio = {
		path    = 'res/audio/music/Cheerful Annoyance.ogg',
		bpm     = 113,
		pattern = {
			'A','-', '-', 'C', '-', '-', 'D', '-', '-',
			'B','-', '-', 'A', '-', '-', 'B', '-', '-',
		}
	}
end

return Room