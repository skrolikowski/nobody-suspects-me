-- Nobody Suspects Me
-- https://github.com/skrolikowski/nobody-suspects-me
--
require 'src.config'
require 'src.control'

-- pixels please..
lg.setDefaultFilter('nearest', 'nearest')
lg.setBackgroundColor(Config.color.bg)

-- load gamepad mappings
-- lj.loadGamepadMappings('vendor/gamecontrollerdb.txt')

-- vendor packages
pprint    = require 'vendor.pprint.pprint'
Binser    = require 'vendor.binser.binser'
Camera    = require 'vendor.hump.camera'
Gamestate = require 'vendor.hump.gamestate'
Timer     = require 'vendor.hump.timer'
LoveBPM   = require 'vendor.lovebpm.lovebpm'

-- local packages
require 'src.gamestates'
require 'src.toolbox'
require 'src.entities'
require 'src.components'
require 'src.systems'
require 'src.world'

-- load
--
function love.load()
	loadGame()
    --

    Gamestate.registerEvents()
    Gamestate.switch(Gamestates['title'])
end

-- Update
--
function love.update(dt)
    Timer.update(dt)
end

---- ---- ---- ----

-- Controls:
-- Key Pressed
--
function love.keypressed(key)
    Gamestate.current():onPressed(_.__lower('key_'..key))
end

-- Controls:
-- Key Released
--
function love.keyreleased(key)
    Gamestate.current():onReleased(_.__lower('key_'..key))
end

-- Controls:
-- Button Pressed
--
function love.gamepadaxis(joystick, axis, value)
	--
	-- analog sticks
	if axis == 'leftx' then
		Gamestate.current():onPressed('btn_al', { x = value })
	elseif axis == 'lefty' then
		Gamestate.current():onPressed('btn_al', { y = value })
	elseif axis == 'rightx' then
		Gamestate.current():onPressed('btn_ar', { x = value })
	elseif axis == 'righty' then
		Gamestate.current():onPressed('btn_ar', { y = value })
	--
	-- triggers
	elseif axis == 'triggerleft' and value == 1 then
		Gamestate.current():onPressed(_.__lower('btn_l2'))
	elseif axis == 'triggerleft' and value == 0 then
		Gamestate.current():onReleased(_.__lower('btn_l2'))
	elseif axis == 'triggerright' and value == 1 then
		Gamestate.current():onPressed(_.__lower('btn_r2'))
	elseif axis == 'triggerright' and value == 0 then
		Gamestate.current():onReleased(_.__lower('btn_r2'))
	end
end

-- Controls:
-- Button Pressed
--
function love.gamepadpressed(joystick, button)
	--
	if button == 'leftshoulder' then
		Gamestate.current():onPressed('btn_l1')
	elseif button == 'rightshoulder' then
		Gamestate.current():onPressed('btn_r1')
	else
		Gamestate.current():onPressed(_.__lower('btn_'..button))
	end
end

-- Controls:
-- Button Released
--
function love.gamepadreleased(joystick, button)
    -- 
    if button == 'leftshoulder' then
		Gamestate.current():onReleased('btn_l1')
	elseif button == 'rightshoulder' then
		Gamestate.current():onReleased('btn_r1')
	else
		Gamestate.current():onReleased(_.__lower('btn_'..button))
	end
end

---- ---- ---- ----

-- Load Game
--
function loadGame()
	if Saver:exists('nobody-suspects-me') then
		_GAME = Saver:load('nobody-suspects-me')
    end
    --
    resetGame()
end

-- Reset Game
--
function resetGame()
	_GAME = Saver:save('nobody-suspects-me', {
		level      = 1,
		score      = 0,
		volume     = 1,
		difficulty = 3,
		highScore  = _GAME.highScore or 0,
	})
end

-- Save Game
--
function saveGame(data)
	_GAME = Saver:save('nobody-suspects-me', _:merge(_GAME, data))
end

---- ---- ---- ----

-- Event: onVolumeUp
--
function onVolumeUp()
	saveGame({ volume = _.__min(1, _GAME.volume + 0.2) })
	--
	for __, audio in pairs(Config.audio) do
		audio:setVolume(_GAME.volume)
	end
	--
	Config.audio.toggle:play()
	Config.color.volume.up = {1,1,1,1}
end

-- Event: onVolumeDown
--
function onVolumeDown()
	if _GAME.volume - 0.2 > 0 then
		saveGame({ volume = _GAME.volume - 0.2 })
	else
		saveGame({ volume = 0 })
	end
	--
	for __, audio in pairs(Config.audio) do
		audio:setVolume(_GAME.volume)
	end
	--
	Config.audio.toggle:play()
	Config.color.volume.down = {1,1,1,1}
end

-- Event: offVolumeUp
--
function offVolumeUp()
	Config.color.volume.up = {1,1,1,0.5}
end

-- Event: offVolumeDown
--
function offVolumeDown()
	Config.color.volume.down = {1,1,1,0.5}
end

---- ---- ---- ----

-- Event: onDifficultyUp
--
function onDifficultyUp()
	saveGame({ difficulty = _.__min(#Config.difficulty, _GAME.difficulty + 1) })
	--
	Config.audio.toggle:play()
	Config.color.difficulty.up = {1,1,1,1}
end

-- Event: onDifficultyDown
--
function onDifficultyDown()
	saveGame({ difficulty = _.__max(1, _GAME.difficulty - 1) })
	--
	Config.audio.toggle:play()
	Config.color.difficulty.down = {1,1,1,1}
end

-- Event: offDifficultyUp
--
function offDifficultyUp()
	Config.color.difficulty.up = {1,1,1,0.5}
end

-- Event: offDifficultyDown
--
function offDifficultyDown()
	Config.color.difficulty.down = {1,1,1,0.5}
end