(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2.sml";

val test1_1 = all_except_option("string", ["string"]) = SOME []
val test1_2 = valOf (all_except_option(" ", ["str", "strr", "strrr", " "])) =  ["str", "strr", "strrr"]
val test1_3 = valOf (all_except_option("str", ["str", "strr", "strrr", " "])) =  ["strr", "strrr", " "]
val test1_4 = all_except_option("do", ["not", "here"]) = NONE

val test2_1 = get_substitutions1([["foo"],["there"]], "foo") = []
val test2_2 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") =  ["Fredrick","Freddie","F"]
val test2_3 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") =  ["Jeffrey","Geoff","Jeffrey"]

val test3_1 = get_substitutions1([["foo"],["there"]], "foo") = []
val test3_2 = get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") =  ["Fredrick","Freddie","F"]
val test3_3 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") =  ["Jeffrey","Geoff","Jeffrey"]

val test4_1 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
      [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
       {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith", middle="W"}]

val test4_2 = similar_names([["Fredd","Fredrick"],["Elizabeth","Betty"],["Freddie","Fredd","F"]], {first="Fred", middle="W", last="Smith"}) =
      [{first="Fred", last="Smith", middle="W"}]

val test4_3 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Elizabeth", middle="W", last="Smith"}) =
      [{first="Elizabeth", last="Smith", middle="W"}, {first="Betty", last="Smith", middle="W"}]

val test5_1 = card_color((Clubs, Num 2)) = Black
val test5_2 = card_color((Spades, Num 5)) = Black
val test5_3 = card_color((Diamonds, Num 8)) = Red
val test5_4 = card_color((Hearts, Num 9)) = Red

val test6_1 = card_value((Clubs, Num 5)) = 5
val test6_2 = card_value((Clubs, Ace)) = 11
val test6_3 = card_value((Clubs, King)) = 10

val test7_1 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test7_2 = (remove_card([(Clubs, Ace)], (Hearts, Ace), IllegalMove) handle IllegalMove => [(Spades, Ace)]) = [(Spades, Ace)]
val test7_3 = (remove_card([(Hearts, Num 3), (Spades, Jack)], (Hearts, Ace), IllegalMove) handle IllegalMove => [(Spades, Ace)]) = [(Spades, Ace)]
val test7_4 = remove_card([(Diamonds, Num 5),(Hearts, Ace), (Hearts, King), (Hearts, Ace)], (Hearts, Ace), IllegalMove) = [(Diamonds, Num 5), (Hearts, King), (Hearts, Ace)]

val test8_1 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test8_2 = all_same_color([(Clubs, Ace), (Hearts, Ace)]) = false
val test8_3 = all_same_color([(Clubs, Ace)]) = true

val test9_1 = sum_cards([(Clubs, Num 2),(Clubs, Num 2)]) = 4
val test9_2 = sum_cards([(Clubs, Num 10),(Clubs, King)]) = 20
val test9_3 = sum_cards([(Clubs, Num 3),(Clubs, Ace)]) = 14

val test10_1 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10_2 = score([(Hearts, King),(Clubs, Num 4)],10) = 12
val test10_3 = score([(Hearts, King),(Hearts, Num 4)],10) = 6
val test10_4 = score([],10) = 5


val test11_1 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test11_2 = officiate([(Hearts, Num 2),(Spades, Ace)],[], 15) = 7
val test11_3 = (officiate([(Hearts, Num 2),(Spades, Ace)],[Discard (Diamonds, Num 5)], 15) handle IllegalMove => 5) = 5
val test11_4 = officiate([(Diamonds, King),(Diamonds, Ace)],[Draw], 1) = 13
val test11_5 = officiate([(Diamonds, King),(Diamonds, Ace)],[Draw, Discard (Diamonds, King), Draw], 10) = 1


(*val test12 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)
*)
;
