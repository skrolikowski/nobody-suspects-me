_Control = {

	------------------
	-- Title Screens
	--
	title = {
		--
		-- Menu
		SPACE = function() Gamestate.current():onPlay() end,
		ESC   = function() Gamestate.current():onExit() end,

		-- Volume
		U = {
			on  = function() onVolumeUp()  end,
			off = function() offVolumeUp() end,
		},
		D = {
			on  = function() onVolumeDown()  end,
			off = function() offVolumeDown() end,
		},

		-- Difficulty
		L = {
			on  = function() onDifficultyDown()  end,
			off = function() offDifficultyDown() end,
		},
		R = {
			on  = function() onDifficultyUp()  end,
			off = function() offDifficultyUp() end,
		}
	},

	------------------
	-- Room Screen
	--
	room = {
		--
		-- Pause
		ESC = function() Gamestate.current():onPause() end,

		-- Movement
		U = {
			on  = function() Gamestate.current():onRq('axis', { y = -1 }) end,
			off = function() Gamestate.current():onRq('axis', { y =  0 }) end,
		},
		D = {
			on  = function() Gamestate.current():onRq('axis', { y =  1 }) end,
			off = function() Gamestate.current():onRq('axis', { y =  0 }) end,
		},
		L = {
			on  = function() Gamestate.current():onRq('axis', { x = -1 }) end,
			off = function() Gamestate.current():onRq('axis', { x =  0 }) end,
		},
		R = {
			on  = function() Gamestate.current():onRq('axis', { x =  1 }) end,
			off = function() Gamestate.current():onRq('axis', { x =  0 }) end,
		},
	},

	------------------
	-- Overlay Screens
	--
	overlay = {
		SPACE = function() Gamestate.current():onEsc() end,
		ESC   = function() Gamestate.current():onEsc()     end,
	},

	------------------
	-- Pause Screens
	--
	pause = {
		SPACE = function() Gamestate.current():onRestart() end,
		ESC   = function() Gamestate.current():onEsc()     end,

		-- Volume
		U = {
			on  = function() onVolumeUp()  end,
			off = function() offVolumeUp() end,
		},
		D = {
			on  = function() onVolumeDown()  end,
			off = function() offVolumeDown() end,
		}
	},

	------------------
	-- Suspected Screen
	--
	suspected = {
		SPACE = function() Gamestate.current():onRetry()    end,
		ESC   = function() Gamestate.current():onMainMenu() end,
	},

	------------------
	-- Menu Screen
	--
	menu = {
		SPACE = function() Gamestate.current():onContinue() end,
		ESC   = function() Gamestate.current():onExit()     end,
	}
}
