local Edge = {}

function Edge.new(n1, n2)
   local self = {
      nodes = {n1, n2},
   }
   return setmetatable(self, { __index = Edge })
end

return Edge