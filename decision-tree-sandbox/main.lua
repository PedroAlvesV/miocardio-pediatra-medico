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
      scores = {nil, -10, -3}
   },
   {
      text = "Não",
      scores = {nil, 10, nil, 2}
   },
   {
      text = "Não sei",
      scores = {-1, nil, 5, -2}
   },
}

local answersQ2 = {
   {
      text = "Nunca",
      scores = {nil, nil, nil, nil, 3}
   },
   {
      text = "Raramente",
      scores = {nil, nil, nil, nil, 1}
   },
   {
      text = "Ocasionalmente",
      scores = {nil, nil, nil, nil, -1}
   },
      {
      text = "Frequentemente",
      scores = {nil, nil, nil, nil, -3}
   },
}

local no1 = Node.new(Question.new("PerguntaTeste1", answersQ1))
local no2 = Node.new(Question.new("PerguntaTeste2", answersQ2))
local e1 = Edge.new(no1, no2)

local g = Graph.new({no1, no2}, {e1})

function start(g, nodeIndex)
   local firstNode = g.getNode(nodeIndex)
   
end
