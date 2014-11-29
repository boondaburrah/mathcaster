local Class = require "hump.class"

local Map = Class{
  init = function(self, mapFile)
    if love.filesystem.isFile(mapFile) then
      self.map_file = love.filesystem.read(mapFile)
    end
  end
}

return Map
