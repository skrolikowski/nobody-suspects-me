-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Easy Peasy' })

	--
	-- properties
	self.path  = 'res/maps/01.lua'
	self.par   = 5
	self.audio = {
		path    = 'res/audio/music/Farm Frolics.ogg',
		bpm     = 160,
		pattern = { 'A','-','B','-','A','-', 'C', '-', 'A','-', 'D', '-' }
	}
end

return Room