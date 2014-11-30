local Class = require "hump.class"
local Vector = require "hump.vector"

local Line = Class{
  init = function(self, x1, y1, x2, y2)
    self.from = Vector.new(x1, y1)
    self.to = Vector.new(x2, y2)
    self.type = "Line"
  end
}

return Line
