--
--
_Control = {
	scene = {
		--
		-- Escape
		ESC = function() Gamestate.current():onQuit() end,
	
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

		-- Actions
		L1 = { on = function() Gamestate.current():onRq('act', 'A') end },
		L2 = { on = function() Gamestate.current():onRq('act', 'B') end },
		R1 = { on = function() Gamestate.current():onRq('act', 'C') end },
		R2 = { on = function() Gamestate.current():onRq('act', 'D') end },
	}
}
