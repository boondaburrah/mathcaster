local Map = require "map"
local Line = require "line"
local Camera = require "camera"
local Vector = require "hump.vector"

function love.load(arg)
  if arg[#arg] == "-debug" then
    require("mobdebug").start()
  end

  love.window.setMode(960, 544)
  g_map = Map()
  g_camera = Camera(Vector.new(0, 0), math.pi / 2)

  -- test code/futzing around
  g_map:addBrush(Line(-1, -1, -1, 1))
  g_map:addBrush(Line(-1, -1, 1, -1))
  g_map:addBrush(Line(1, -1, 1, 1))
  g_map:addBrush(Line(1, 1, -1, 1))
end

function love.update(dt)
  g_camera:update(g_map)
  --g_camera.heading = g_camera.heading + 0.01
  --g_camera:move(Vector.new(0.01, 0))
  if love.keyboard.isDown('w') then
    g_camera:move(Vector.new(0, 0.01))
  elseif love.keyboard.isDown('s') then
    g_camera:move(Vector.new(0, -0.01))
  end
  if love.keyboard.isDown('a') then
    g_camera:move(Vector.new(0.01, 0))
  elseif love.keyboard.isDown('d') then
    g_camera:move(Vector.new(-0.01, 0))
  end
  if love.keyboard.isDown('j') then
    g_camera.heading = g_camera.heading + 0.01
  elseif love.keyboard.isDown('l') then
    g_camera.heading = g_camera.heading - 0.01
  end
end

function love.draw()
  g_camera:draw()
end
