Gamestates = {
	title     = require 'src.gamestates.menus.title',
	suspected = require 'src.gamestates.menus.suspected',
	complete  = require 'src.gamestates.menus.complete',
	gameover  = require 'src.gamestates.menus.gameover',

	-- overlays
	intro = require 'src.gamestates.overlays.intro',
	pause = require 'src.gamestates.overlays.pause',

	-- rooms
	rooms = {
		[1] = require 'src.gamestates.rooms.01',
		[2] = require 'src.gamestates.rooms.02',
		[3] = require 'src.gamestates.rooms.03',
		[4] = require 'src.gamestates.rooms.04',
		[5] = require 'src.gamestates.rooms.05',
		[6] = require 'src.gamestates.rooms.06',
		[7] = require 'src.gamestates.rooms.07',
		[8] = require 'src.gamestates.rooms.08',
	}
}