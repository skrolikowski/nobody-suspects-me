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
		path    = 'res/audio/music/Sad Town.ogg',
		bpm     = 105,
		pattern = { 'A','-','C','-','B','-', 'D', '-' }
	}
end

function Room:enter(from, ...)
	Base.enter(self, from, ...)
    
    --
    -- play intro
    Gamestate.push(Gamestates['intro'])
end

return Room