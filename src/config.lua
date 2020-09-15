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

Config = {
	width  = lg.getWidth(),
	height = lg.getHeight(),
	camera = { scale = 3  },
	world  = {
		tileSize = 16,
	},
	color = {
	    debug   = { _:color('red-800') },
		white   = { _:color('white') },
		black   = { _:color('black') },
	    overlay = { 0, 0, 0, 0.65 },
	    p1 = { _:color('#fafdff') },
	    p2 = { _:color('#cbe3f1') },
	    p3 = { _:color('#68aed4') },
	    p4 = { _:color('#305881') },
	    p5 = { _:color('#15263a') },
	    --
	    A = { _:color('red-500')    },
		B = { _:color('yellow-500') },
		C = { _:color('green-500')  },
		D = { _:color('blue-500')   },
		--
	},
	ui = {
		font = {
			xs = lg.newFont('res/fonts/Kenney Future.ttf', 10),
			sm = lg.newFont('res/fonts/Kenney Future.ttf', 12),
			md = lg.newFont('res/fonts/Kenney Future.ttf', 24),
			lg = lg.newFont('res/fonts/Kenney Future.ttf', 32),
			xl = lg.newFont('res/fonts/Kenney Future.ttf', 48)
		}
	},
}