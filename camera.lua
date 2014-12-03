local Class = require "hump.class"
local Vector = require "hump.vector"
local mfunc = require "mathfuncs"

local Camera = Class{
  init = function(self, startPoint, rotation)
    self.location = startPoint
    self.heading = rotation
    self.width = 960
    self.height = 544
    self.fov = math.pi / 2
    self.wallSegments = {}
    self.refMap = {}
    self.stepsize = self.fov / self.width
    self.startSweep = 0 - (self.fov / 2)
  end,

  updateMapLoc = function(self)
    self.refMap:move(self.location)
  end,

  updateMapRot = function(self)
    self.refMap:rotate(self.heading)
  end,

  createRefMap = function(self, map)
    self.refMap = map:clone()
  end,

  checkMapForRay = function(self, rad)
    local distance = nil
    for i = 1, #self.refMap.brushes do
      local intersect = mfunc:testLine(self.refMap.brushes[i], rad)
      if intersect ~= nil then
        if distance == nil or (Vector.new(0,0):dist(intersect) < distance) then
          distance = Vector.new(0,0):dist(intersect)
        end
      end
    end
    if distance ~= nil then return distance end
  end,

  checkRays = function(self)
    for i = 1, self.width do
      self.wallSegments[i] = self:checkMapForRay((i * self.stepsize) + self.startSweep)
    end
  end,

  update = function(self, map)
    self:createRefMap(map)
    self:updateMapLoc()
    self:updateMapRot()
    -- self:checkMapForRay(math.pi / 2)
    self:checkRays()
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
