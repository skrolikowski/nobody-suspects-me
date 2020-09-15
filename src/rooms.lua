--
--
Action = {
	A = 'hop',
	B = 'spin',
	C = 'flatten',
	D = 'hat',
}

Score = {
    { img = lg.newImage('res/ui/MessagePerfect.png'), pts =  0.05  },
    { img = lg.newImage('res/ui/MessageGood.png'),    pts =  0.025 },
    { img = lg.newImage('res/ui/MessageEh.png'),      pts =  0     },
    { img = lg.newImage('res/ui/MessageHuh.png'),     pts = -0.05  },
    { img = lg.newImage('res/ui/MessageMiss.png'),    pts = -0.1   },
}

Room = {
	AA = {
		map   = 'res/maps/AA.lua',
        audio = {
        	-- path    = 'res/audio/Drumming Sticks.ogg',
        	-- path = 'res/audio/German Virtue.ogg',
         --        bpm  = 181,
                -- path = 'res/audio/Space Cadet.ogg',
                -- bpm  = 131,
        	-- path = 'res/audio/Sad Descent.ogg',
        	-- bpm  = 118,
        	path = 'res/audio/Sad Town.ogg',
        	bpm  = 105,
        	pattern = { 'A','-','-','B','-','-' }
        },
        enter = { col = 9, row = 3 }
	}
}