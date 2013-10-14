fun is_older (d1 :int*int*int, d2: int*int*int) = (* Task 1*)
    #1 d1 < #1 d2 orelse
    if #1 d1 = #1 d2
    then #2 d1 < #2 d2 orelse
         if #2 d1 = #2 d2
         then #3 d1 < #3 d2             
         else false
    else false
       
fun number_in_month (l : (int*int*int) list, m : int) = (* Task 2*)
    if null l
    then 0
    else 
    	if #2 (hd l) = m          
        then 1 + number_in_month(tl l, m)
        else number_in_month(tl l, m)

fun number_in_months (l : (int*int*int) list, m : int list) = (* Task 3*)
    if null m
    then 0
    else number_in_month(l, hd m) + number_in_months(l, tl m);

fun dates_in_month(l : (int*int*int) list, m : int) = (*Task 4*)
    if null l
    then []
    else
        if #2 (hd l) = m
        then hd l :: dates_in_month(tl l, m) 
        else dates_in_month(tl l, m)

fun dates_in_months (l : (int*int*int) list, m : int list) = (* Task 5*)
    if null m
    then []
    else dates_in_months(l, tl m) @ dates_in_month(l, hd m)

fun get_nth (l : string list, n : int) = (*Task 6*)
    if n = 1 
    then hd l 
    else get_nth(tl l, n - 1)

val months = 
["January", "February", "March", "April", "May", "June", 
"July", "August", "September", "October", "November", "December"];

fun date_to_string (d : int*int*int) = (*Task 7*)
    get_nth(months, #2 d) ^ " " ^ 
    Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d)
