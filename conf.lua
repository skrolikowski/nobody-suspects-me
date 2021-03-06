-- package.path = package.path .. ";vendor/?.lua;vendor/?/init.lua"
require 'lua-lander'
--

function love.conf(t)
    io.stdout:setvbuf('no')

    t.identity = 'nobody-suspects-me'
    t.version  = '11.2'
    t.console  = false

    t.window.title      = 'Nobody Suspects Me'
    t.window.x          = 200
    t.window.y          = 50
    t.window.width      = 1200
    t.window.height     = 800
    t.window.fullscreen = false
    t.window.highdpi    = true
    t.window.vsync      = true

    t.modules.touch   = false
    t.modules.thread  = false
    t.modules.video   = false
end