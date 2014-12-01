local Map = require "map"
local Line = require "line"
local Camera = require "camera"
local Vector = require "hump.vector"

function love.load()
  love.window.setMode(960, 544)
  g_map = Map()
  g_camera = Camera(Vector.new(0, 0), 90)

  -- test code/futzing around
  g_map:addBrush(Line(-1, -1, -1, 1))
  g_map:addBrush(Line(-1, -1, 1, -1))
  g_map:addBrush(Line(1, -1, 1, 1))
  g_map:addBrush(Line(1, 1, -1, 1))
end

function love.update(dt)
  -- pass
end

function love.draw()
  g_camera:draw()
end
