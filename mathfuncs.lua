local Mathfuncs = {}
  
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

return Mathfuncs