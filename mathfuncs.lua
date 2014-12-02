local Mathfuncs = {
  polarPoint = function(x, y)
    return math.sqrt(x*x + y*y), math.atan2(y, x)
  end,
  
  regPoint = function(d, r)
    return d * math.cos(r), d * math.sin(r)
  end
}

return Mathfuncs