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
    else number_in_month(l, hd m) + number_in_months(l, tl m)
        
