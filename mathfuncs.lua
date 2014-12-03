local Mathfuncs = {}
local Vector = require "hump.vector"

Mathfuncs.__index = Mathfuncs

function Mathfuncs:polarPoint(x, y)
  return math.sqrt(x*x + y*y), math.atan2(y, x)
end

function Mathfuncs:regPoint(d, r)
  return d * math.cos(r), d * math.sin(r)
end

function Mathfuncs:rotPoint(x, y, r)
  local d, t = self:polarPoint(x, y)
  return self:regPoint(d, t + r)
end

function Mathfuncs:testLine(line, rad)
  local ray = Vector.new(Mathfuncs:regPoint(1, rad))
  local pray = Vector.new(0 - ray.y, ray.x)
  local seg = line.to - line.from
  local t = line.from:cross(seg) / ray:cross(seg)
  local u = line.from:cross(ray) / ray:cross(seg)
  local check = ray * t
  local check2 = line.from + (u * seg)
  --if check == check2 and check.y > 0 then
  if check.y > 0 and seg * (check - line.from) <= line.from:dist2(line.to) and seg * (check - line.from) >= 0 then
    return check
  else
    return nil
  end
end

return Mathfuncs
