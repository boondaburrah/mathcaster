local Class = require "hump.class"
local Vector = require "hump.vector"

local Circle = Class{
  init = function(self, x1, y1, r)
    self.origin = Vector.new(x1, y1)
    self.radius = r
    self.type = "Circle"
  end
}

return Circle
