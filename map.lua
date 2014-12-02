local Class = require "hump.class"
local Vector = require "hump.vector"

local Map = Class{
  init = function(self, mapFile)
    if love.filesystem.isFile(mapFile or "") then
      self.map_file = love.filesystem.read(mapFile)
    end
    self.brushes = {}
    self.type = "Map"
  end,

  addBrush = function(self, brush)
    self.brushes[#self.brushes+1] = brush
  end,
  
  move = function(self, offsetVector)
    for i = 1, #self.brushes do
      self.brushes[i].from = self.brushes[i].from - offsetVector
      if self.brushes[i].type = "Line" then
        self.brushes[i].to = self.brushes[i].to - offsetVector
      end
    end
  end,
  
  rotate = function(self, rad)
    for i = 1, #self.brushes do
      self.brushes[i].from = self.brushes[i].from.rotated(rad)
      if self.brushes[i].type = "Line" then
        self.brushes[i].to = self.brushes[i].to.rotated(rad)
      end
    end
  end
}

return Map
