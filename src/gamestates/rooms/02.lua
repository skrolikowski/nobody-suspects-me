-- Room 01
--

local Base = require 'src.gamestates.rooms.room'
local Room = Base:extend()

function Room:init()
	Base.init(self, { name  = 'Zig Zag' })

	--
	-- properties
	self.path  = 'res/maps/02.lua'
	self.par   = 15
	self.audio = {
		path    = 'res/audio/music/Sad Town.ogg',
		bpm     = 105,
		pattern = { 'B','-','A','-','B','-', 'C', '-', 'B','-', 'D', '-' }
	}
end

return Room