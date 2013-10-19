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
    else dates_in_month(l, hd m) @ dates_in_months(l, tl m)

fun get_nth (l : string list, n : int) = (*Task 6*)
    if n = 1
    then hd l
    else get_nth(tl l, n - 1)

fun date_to_string (d : int*int*int) = (*Task 7*)
    let
        val months = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 d) ^ " " ^
        Int.toString(#3 d) ^ ", " ^ Int.toString(#1 d)
    end

fun number_before_reaching_sum (sum : int, list : int list) = (*Task 8*)
    if hd list >= sum
    then 0
    else 1 + number_before_reaching_sum(sum - hd list, tl list)

fun what_month (day : int) = (*Task 9*)
    let
        val months_as_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        number_before_reaching_sum(day, months_as_days) + 1
    end

fun month_range (d1 : int, d2 :int) = (*Task 10*)
   if d1 > d2
   then []
   else what_month(d1) :: month_range(d1 + 1, d2)

fun oldest (list : (int*int*int) list) = (*Task 11*)
    if null list
    then NONE
    else
        let fun result (l : (int*int*int) list)  =
                if null (tl l)
                then hd l
                else
                    let val rtl = result(tl l)
                    in
                        if is_older(hd l, rtl)
                        then hd l
                        else rtl
                    end
        in
            SOME (result list)
        end