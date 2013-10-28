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

(*val test7 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4

val test8 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE

val test9a = count_wildcards Wildcard = 1

val test9b = count_wild_and_variable_lengths (Variable("a")) = 1

val test9c = count_some_var ("x", Variable("x")) = 1;

val test10 = check_pat (Variable("x")) = true

val test11 = match (Const(1), UnitP) = NONE

val test12 = first_match Unit [UnitP] = SOME []*)

