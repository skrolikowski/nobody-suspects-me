-- Configurations
--
la = love.audio
lf = love.filesystem
lg = love.graphics
li = love.image
lj = love.joystick
lm = love.mouse
ls = love.sound
lt = love.timer
lx = love.math
--
Config = {

	--------------------
	-- World Constants
	--
	width  = lg.getWidth(),
	height = lg.getHeight(),
	world  = {
		tileSize = 16,
		scale    = 4,
		blendMin = 0.05
	},

	--------------------
	-- Difficulty Parameters
	--
	difficulty = {
		{ dropRate = 2.0, dropQty = 0.05, scoreMod = 0.98 },
		{ dropRate = 1.5, dropQty = 0.05, scoreMod = 0.96 },
		{ dropRate = 1.5, dropQty = 0.06, scoreMod = 0.94 },
		{ dropRate = 1.0, dropQty = 0.07, scoreMod = 0.92 },
		{ dropRate = 1.0, dropQty = 0.08, scoreMod = 0.90 },
	},

	--------------------
	-- Score Modifiers
	--
	score = {
		blend = { base = 1000 },
		time  = { base = 100  }
	},

	--------------------
	-- Sound FX
	--
	audio = {
		complete  = la.newSource('res/audio/sfx/confirmation_002.ogg', 'static'),
		gameover  = la.newSource('res/audio/sfx/confirmation_004.ogg', 'static'),
		intro     = la.newSource('res/audio/sfx/confirmation_003.ogg', 'static'),
		pause     = la.newSource('res/audio/sfx/confirmation_001.ogg', 'static'),
		pickup    = la.newSource('res/audio/sfx/drop_002.ogg', 'static'),
		suspected = la.newSource('res/audio/sfx/error_006.ogg', 'static'),
		toggle    = la.newSource('res/audio/sfx/confirmation_001.ogg', 'static'),
	},

	--------------------
	-- Dance moves
	--
	dance = {
		A = 'hop',
		B = 'spin',
		C = 'wink',
		D = 'kiss',
	},

	--------------------
	-- Common Colors
	--
	color = {
	    bg      = { _:color('#fafdff') },
		white   = { _:color('white') },
		black   = { _:color('black') },
	    overlay = { 0, 0, 0, 0.75 },
	    volume = {
	    	up   = {1,1,1,0.5},
	    	down = {1,1,1,0.5},
	    },
	    difficulty = {
	    	up   = {1,1,1,0.5},
	    	down = {1,1,1,0.5},
	    },
	    pink = {
	    	{ _:color('#d86ba5') },
	    	{ _:color('#c66ba6') },
	    	{ _:color('#b36ca7') },
	    	{ _:color('#816eab') },
	    	{ _:color('#6c6fad') },
	    	{ _:color('#5770af') },
	    	{ _:color('#4171b1') },
	    	{ _:color('#3671b2') },
	    	{ _:color('#3271b2') },
	    	{ _:color('#2e72b3') },
	    },
	    blue = { _:color('#2e72b3') },
	},

	--------------------
	-- UI Configurations
	--
	ui = {
		font = {
			xs = lg.newFont('res/fonts/Kenney Pixel.ttf', 30),
			sm = lg.newFont('res/fonts/Kenney Pixel.ttf', 40),
			md = lg.newFont('res/fonts/Kenney Pixel.ttf', 50),
			lg = lg.newFont('res/fonts/Kenney Pixel.ttf', 60),
			xl = lg.newFont('res/fonts/Kenney Pixel.ttf', 80)
		}
	}
}