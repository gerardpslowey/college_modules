-- We define the type PDA as follows:
-- It consists of a tripple
-- Integer gives the start state
-- [Integer] gives the accepting (or final) states
-- [Transition] gives the transitions of the pushdown (PDA instructions)
type PDA = (Integer,[Integer],[Transition])

-- Describing the PDA transitions
-- Each transistion has a pair (a tuple)
-- In the first tuple:
-- Integer gives the current state
-- The first string gives the next character of the input
-- The second string gives the character at the top of the stack

-- Defining instructions of the PDA
-- In the second tuple:
-- The Integer gives the new state
-- String gives the new character to be pushed onto the stack
type Transition = ((Integer,String,String),(Integer,String))

-- Represents the computation steps to solve the PDA
-- Configuartion of the PDA as follows:
-- The Integer is the current state (starting configuartion)
-- First string is the remaining input
-- Second string is the contents of the stack (empty at the start)
type Configuration = (Integer,String,String)

-- The result produced by the PDA follows:
-- Indicates whether or not the initial input string is accepted or rejected
-- Adding deriving Show allows the resulst to be printed
data Result = Accept | Reject deriving Show

-- used to test if a PDA accepts or rejects a string
-- takes a PDA as an input (start and final state with instructions)
-- a string to test for acceptance
-- outputs a representation of result (Accept or Reject)
-- String is already in the prelude
-- We have to define PDA and Result
run :: PDA -> String -> Result
run (start, finish, transition) "" = Accept
run (start, finish, transition) input = run_next (start, finish, transition) [(start, input, "")]


run_next :: PDA -> [Configuration] -> Result
run_next (start, final, transition) (head:input) = 
  if accept head final == True 
    then Accept
  else run_next (start, final, transition) (input ++ (steps head transition []))

run_next (start, final, transition) [] = Reject


-- applies a transition to a configuration
step :: Configuration -> Transition -> [Configuration] 
-- c: input stack
-- e: transition string
-- f: stack on the LHS
-- h: stack on the RHS

-- 1
step (a,b,"") ((d,"",""),(g,""))
  |a == d = [(g,b,"")]
  |otherwise = []

-- 2
step (a,b,"") ((d,"",""),(g,[h]))
  |a==d = [(g,b,[h])]
  |otherwise = []

-- 3
step (a, (b:bs), "") ((d, "", [f]), (g, "")) = []

-- 4
step (a, (b:bs), "") ((d, "", [f]), (g, [h])) = []

-- 5
step (a,(b:bs),"") ((d,[e],""),(g,""))
  |a==d && b==e = [(g,bs,"")]
  |otherwise = []

-- 6
step (a,(b:bs),"") ((d,[e],""),(g,[h]))
  |a==d && b==e = [(g,bs,[h])]
  |otherwise = []

-- 7
step (a, (b:bs), "") ((d, [e], [f]), (g, "")) = []

-- 8
step (a, (b:bs), "") ((d, [e], [f]), (g, [h])) = []

-- 9
step (a,b,c) ((d,"",""),(g,""))
  |a==d = [(g,b,c)]
  |otherwise = []

-- 10
step (a,b,c) ((d,"",""),(g,[h]))
  |a==d = [(g,b,(h:c))]
  |otherwise = []

-- 11
step (a,b,(c:cs)) ((d,"",[f]),(g,""))
  |a==d && c==f = [(g,b,cs)]
  |otherwise = []

-- 12
step (a,b,(c:cs)) ((d,"",[f]),(g,[h]))
  |a==d && c==f = [(g,b,(h:cs))]
  |otherwise = []

-- 13
step (a,(b:bs),c) ((d,[e],""),(g,""))
  |a==d && b==e = [(g,bs,c)]
  |otherwise = []

-- 14
step (a,(b:bs),c) ((d,[e],""),(g,[h]))
  |a==d && b==e = [(g,bs,h:c)]
  |otherwise = []

-- 15
step (a,(b:bs),(c:cs)) ((d,[e],[f]),(g,""))
    | a==d && b==e && c==f = [(g,bs,cs)]
    | otherwise = []

-- 16
step (a,(b:bs),(c:cs)) ((d,[e],[f]), (g,[h]))
    | a==d && b==e && c==f = [(g,bs,(h:cs))]
    | otherwise = []


steps :: Configuration -> [Transition] -> [Configuration] -> [Configuration]
-- output the list of next step configurations
steps (start, input, part) [] configuration = configuration
steps (start, "", part) transition configuration = configuration
steps (start, input, part) (headt:transition) configuration = steps (start, input, part) transition (configuration ++ (step (start, input, part) headt))

-- Check if a list of configurations includes at least one state that means we can accept the string
-- start is start state
-- input is string
accept :: Configuration -> [Integer] -> Bool
-- check if a list of configurations includes at least one state that means we can accept the string
-- if there is no state return false
accept (start, input, part) (headf:final) =
  if input == "" && start == headf && part == ""  
    then True
  else accept (start, input, part) final

accept (start, input, part) [] = False


-- -- all testing
-- -- pushdown automaton which accepts the language {w ∈ {a,b}*|w=wR}
-- pal = (1,[2],[((1,"a",""),(1,"a")),
--               ((1,"b",""),(1,"b")),
--               ((1,"a",""),(2,"")),
--               ((1,"b",""),(2,"")),
--               ((1,"",""),(2,"")),
--               ((2,"a","a"),(2,"")),
--               ((2,"b","b"),(2,""))])

-- -- running some test cases
-- test :: Result
-- test = run pal "abba"