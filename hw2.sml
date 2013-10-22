(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option(s, ls) = (*Task 1 - a)*)
  case ls of
    [] => NONE
  | s'::ls' => if same_string(s, s')
               then SOME (ls')
               else case all_except_option(s, ls') of
                 NONE => NONE
                |SOME i => SOME(s'::i)

fun get_substitutions1(lol, s) = (*Task 1 - b) *)
  case lol of
    [] => []
   |h::t => case all_except_option(s, h) of
              NONE => get_substitutions1(t, s)
             |SOME i => i @ get_substitutions1(t, s)

fun get_substitutions2(lol, s) = (*Task 1 - c) *)
  let fun f(lol, acc) =
    case lol of
      [] => acc
     |h::t => case all_except_option(s, h) of
              NONE => f(t, acc)
             |SOME i => f(t, acc @ i)
  in f(lol, [])
  end

fun similar_names(los, fullname) =
  case fullname of
    {first = f, middle = m , last = l} => let fun subs lt =
                                          case lt of
                                          [] => []
                                          |h::t => {first = h, middle = m, last = l}::subs t
                                          in {first = f, middle = m, last = l} :: subs (get_substitutions2(los, f))
                                          end


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)
fun card_color (suit, rank) =
  case suit of
    Clubs => Black
   |Spades => Black
   |_ => Red

fun card_value(suit, rank) =
  case rank of
    Num i => i
   |Ace => 11
   |_ => 10

fun remove_card(cs, c, e) =
  case cs of
    [] => []
   |h::t => if h = c
            then case t of
              _::[] => raise e
              |_ => t
            else h::remove_card(t, c, e)

fun all_same_color lc =
case lc of
[] => true
| _::[] => true
| head::(neck::rest) => (card_color(head) = card_color(neck) andalso all_same_color (neck::rest))

fun sum_cards lc =
  let fun f(lc, acc) =
   case lc of
    [] => acc
    |h::t => f(t, acc + card_value(h))
  in f(lc, 0)
  end


;
