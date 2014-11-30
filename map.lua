local Class = require "hump.class"

local Map = Class{
  init = function(self, mapFile)
    if love.filesystem.isFile(mapFile) then
      self.map_file = love.filesystem.read(mapFile)
    end
    self.brushes = {}
    self.type = "Map"
  end

  addBrush = function(self, brush)
    self.brushes[#self.brushes+1] = brush
  end
}

return Map
