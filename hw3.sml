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

val longest_string3 = longest_string_helper (fn (x, y)  => x > y) (*Task Four*)
val longest_string4 = longest_string_helper (fn (x, y)  => x >= y) (*Task Four*)

fun longest_capitalized sl = let val lc = longest_string1 o only_capitals in lc sl end (*Task Five*)

fun rev_string str = let val rs = String.implode o List.rev o String.explode in rs str end (*Task Six*)

fun first_answer f sl = (*Task Seven*)
  case sl of
    [] => raise NoAnswer
   |h::t => case f h of
            NONE => first_answer f t
           |SOME v => v

fun all_answers f sl = (*Task Eight*)
  let fun hf (sl', acc) =
    case sl' of
    [] => SOME acc
   |h::t => case f h of
              NONE => NONE
             |SOME v => hf (t, v @ acc)
  in hf (sl, [])
  end

fun count_wildcards p = g (fn () => 1) (fn x => 0) p (*Task Nine a*)

fun count_wild_and_variable_lengths p = g (fn () => 1) (fn x => String.size x) p (*Task Nine b*)

fun count_some_var (s, p) = g (fn () => 0) (fn x => if s = x then 1 else 0) p (*Task Nine c*)


fun check_pat p =
  let fun hf1 p =
    case p of
      Variable x => [x]
      | TupleP ps => foldl (fn (x, y) => case x of
                                          Variable s => s::y
                                         |TupleP ps' => hf1(TupleP ps') @ y
                                         |_ => y)  []  ps
      |_ => []
  in let fun hf2 l =
      case l of
      [] => true
      | h::t => if List.exists (fn x => x = h) t
                then false
                else hf2 t
     in hf2 (hf1 p)
     end
  end

fun match (v, p) =
  case (v, p) of
    (_, Wildcard) => SOME []
    |(v, Variable s) => SOME [(s, v)]
    |(Unit, UnitP) => SOME []
    |(Const x, ConstP y) => if x = y then SOME [] else NONE
    |(Tuple vs, TupleP ps) => (all_answers match (ListPair.zipEq (vs, ps)) handle UnequalLengths => NONE)
    |(Constructor(s2,v), ConstructorP(s1,p)) => if s1 = s2
                                                  then match (v, p)
                                                  else NONE
    |_ => NONE

fun first_match v lp =
  case lp of
    [] => NONE
    | h::t => SOME (first_answer match [(v, h)]) handle NoAnswer => first_match v t
