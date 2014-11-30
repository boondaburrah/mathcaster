local Class = require "hump.class"

local Camera = Class{
  init = function(self, startPoint, rotation)
    self.location = startPoint
    self.heading = rotation
    self.width = 960
    self.height = 544
    self.fov = 90
    self.wallSegments = {}
    self.stepsize = self.fov / self.width
  end
}

return Camera
