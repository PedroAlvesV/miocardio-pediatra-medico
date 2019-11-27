local Node = require('Node')
local Edge = require('Edge')
local Graph = require('Graph')
local Question = require('Question')

local outputs = {
   {text="a"},
   {text="b"},
   {text="c"},
   {text="d"},
   {text="e"},
   {text="f"},
}
for _, o in ipairs(outputs) do
   o.score = 0
end

local answersQ1 = {
   {
      text = "Sim",
      scores = {
         2 = -10,
         3 = -5,
      }
   },
   {
      text = "Não",
      scores = {
         2 = 10,
         4 = 2,
      }
   },
   {
      text = "Não sei",
      scores = {
         1 = -1,
         3 = 5,
         4 = -2,
      }
   },
}

local answersQ2 = {
   {
      text = "Nunca",
      scores = {
         5 = 3,
      }
   },
   {
      text = "Raramente",
      scores = {
         5 = 1,
      }
   },
   {
      text = "Ocasionalmente",
      scores = {
         5 = -1,
      }
   },
      {
      text = "Frequentemente",
      scores = {
         5 = -3,
      }
   },
}

local no1 = Node.new(1, Question.new("PerguntaTeste1", answersQ1))
local no2 = Node.new(2, Question.new("PerguntaTeste2", answersQ2))
local e1 = Edge.new(no1, no2)

local g = Graph.new({no1, no2}, {e1})