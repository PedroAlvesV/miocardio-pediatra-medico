local Node = {}

function Node.new(question)
   local self = {
      question = question,
   }
   return setmetatable(self, { __index = Node })
end

return Node