-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Maze II' })

	--
	-- properties
	self.path  = 'res/maps/07.lua'
	self.par   = 60
	self.audio = {
		path    = 'res/audio/music/Swinging Pants.ogg',
		bpm     = 160,
		pattern = {
			'D','-', 'C', '-', 'A', '-', 'B', '-',
			'B','-', 'A', '-', 'D', '-', 'C', '-',
		}
	}
end

return Room