local Graph = {}

function Graph.new(nodes, edges)
   local self = {
      nodes = nodes,
      edges = edges,
   }
   return setmetatable(self, { __index = Graph })
end

return Graph