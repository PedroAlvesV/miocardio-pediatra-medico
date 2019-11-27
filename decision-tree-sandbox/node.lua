local Node = {}

function Node.new(id, question)
   local self = {
      id = id,
      question = question,
   }
   return setmetatable(self, { __index = Node })
end

return Node