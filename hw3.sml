(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
     | Variable of string
     | UnitP
     | ConstP of int
     | TupleP of pattern list
     | ConstructorP of string * pattern

datatype valu = Const of int
        | Unit
        | Tuple of valu list
        | Constructor of string * valu

fun g f1 f2 p =
    let
  val r = g f1 f2
    in
  case p of
      Wildcard          => f1 ()
    | Variable x        => f2 x
    | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
    | ConstructorP(_,p) => r p
    | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
       | UnitT
       | IntT
       | TupleT of typ list
       | Datatype of string

(**** you can put all your code here ****)

fun only_capitals sl = List.filter (fn x => Char.isUpper (String.sub(x, 0))) sl (*Task One*)

fun longest_string1 sl = foldl (fn (x, y) => if String.size x > String.size y then x else y) "" sl (*Task Two*)

fun longest_string2 sl = foldl (fn (x, y) => if String.size x >= String.size y then x else y) "" sl (*Task Three*)

fun longest_string_helper f sl = foldl (fn (x,y) => if f (String.size x, String.size y) then x else y) "" sl (*Task Four*)

val longest_string3 = logest_string_helper (fn (x, y)  => x > y) (*Task Four*)
val longest_string4 = logest_string_helper (fn (x, y)  => x >= y) (*Task Four*)

fun longest_capitalized sl = let val lc = longest_string1 o only_capitals in lc sl end (*Task Five*)

fun rev_string str = let val rs = String.implode o List.rev o String.explode in rs str end (*Task Six*)