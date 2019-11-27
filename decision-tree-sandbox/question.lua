local Question = {}

function Question.new(text, answers)
   local self = {
      text = text,
      answers = answers,
   }
   return setmetatable(self, { __index = Question })
end

return Question