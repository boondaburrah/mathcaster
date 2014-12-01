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
  end,

  segmentToHOffset = function(self, segment)
    return math.abs((self.height / 2) / segment)
  end,

  segmentToLine = function(self, segment, x)
    return x, (self.height / 2) - self:segmentToHOffset(segment), x, (self.height / 2) + self:segmentToHOffset(segment)
  end,

  draw = function(self)
    for i = 1, self.width do
      love.graphics.line(self:segmentToLine(self.wallSegments[i] or 2, i))
    end
  end
}

return Camera
