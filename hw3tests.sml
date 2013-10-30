(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw3.sml";

val test1_1 = only_capitals ["A","B","C"] = ["A","B","C"]
val test1_2= only_capitals ["aa","B","Cb"] = ["B","Cb"]
val test1_3 = only_capitals ["aA","vV","vB"] = []

val test2_1 = longest_string1 ["A","bc","C"] = "bc"
val test2_2 = longest_string1 ["Aa","bc","C"] = "Aa"
val test2_3 = longest_string1 [] = ""

val test3_1 = longest_string2 ["A","bc","C"] = "bc"
val test3_2 = longest_string2 ["Aa","bc","Cc"] = "Cc"
val test3_3 = longest_string2 ["A","bc","C", "dd"] = "dd"

val test4a= longest_string3 ["A","bc","C"] = "bc"

val test4b= longest_string4 ["A","B","C"] = "C"

val test4a_1 = longest_string3 ["A","bc","C"] = "bc"
val test4a_2 = longest_string3 ["Aa","bc","C"] = "Aa"
val test4a_3 = longest_string3 [] = ""

val test4b_1 = longest_string4 ["A","bc","C"] = "bc"
val test4b_2 = longest_string4 ["Aa","bc","Cc"] = "Cc"
val test4b_3 = longest_string4 ["A","bc","C", "dd"] = "dd"

val test5_1 = longest_capitalized ["A","bc","C"] = "A";
val test5_2 = longest_capitalized ["s","bc","a"] = "";
val test5_3 = longest_capitalized ["aa","AA","BB","CC"] = "AA";

val test6_1 = rev_string "abc" = "cba";
val test6_2 = rev_string "Aba" = "abA";
val test6_3 = rev_string "" = "";

val test7_1 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test7_2 = (first_answer (fn x => if x > 6 then SOME x else NONE) [1,2,3,4,5] handle NoAnswer => 5) =  5
val test7_3 = (first_answer (fn x => if x > 3 then SOME x else NONE) [] handle NoAnswer => 4) = 4


val test8_1 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test8_2 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []
val test8_3 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,1] = NONE
val test8_4 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3] = SOME [2,3]

val test9a_1 = count_wildcards Wildcard = 1
val test9a_2 = count_wildcards (TupleP [Wildcard, Wildcard, UnitP, Wildcard, Variable "qwerty", Wildcard]) = 4

val test9b_1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b_2 = count_wild_and_variable_lengths (TupleP [Wildcard, Wildcard, UnitP, Wildcard, Variable "qwerty", Wildcard]) = 10

val test9c_1 = count_some_var ("x", Variable("x")) = 1;
val test9c_2 = count_some_var ("my_var", TupleP [Variable "my_var", TupleP[Variable "my_var", Variable "my_var", Variable "other_var"]] ) = 3

val test10_1 = check_pat (Variable("x")) = true
val test10_2 = check_pat (TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var"]) = true
val test10_3 = check_pat (TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var", TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var"]]) = false

val test11_1 = match (Const(1), UnitP) = NONE
val test11_2 = match(Const(42), Wildcard) =  SOME []
val test11_3 = match(Const(42),ConstructorP("answer", Variable("the_answer"))) = NONE
val test11_4 = match( Tuple[Const 7, Const 6, Unit, Const 7], TupleP[ConstP 7, Variable "ba", Wildcard, ConstP 8] ) = NONE
val test11_5 = match( Tuple[Const 7, Const 6, Unit, Const 7], TupleP[Variable "a", Variable "ba", Variable "bba", Variable "bbba"]) = SOME [("bbba",Const 7),("bba",Unit),("ba",Const 6),("a",Const 7)]

val test12_1 = first_match Unit [UnitP] = SOME []
val test12_2 = first_match (Const 7) [ConstP 1, UnitP, TupleP [UnitP, UnitP]] = NONE
val test12_3 = first_match (Const 7) [ConstP 1, UnitP, ConstP 7, Variable "aa"] = SOME []

