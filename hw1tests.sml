use "testing.sml";
open SmlTests;

use "hw1.sml";

(*Tests for task 1*)
test("t1 - year",
   assert_equals_bool(true, is_older((2010, 11, 15), (2012, 10, 5))));

test("t1 - same",
   assert_equals_bool(false, is_older((2013, 10, 13), (2013, 10, 13))));

test("t1 - month",
   assert_equals_bool(true, is_older((2013, 09, 10), (2013, 10, 5))));

test("t1 - date",
   assert_equals_bool(false, is_older((2013, 10, 5), (2012, 9, 12))));

test("t1 - all",
   assert_equals_bool(false, is_older((2013, 10, 12), (2012, 07, 05))));

(*Tests for task 2*)

test("t2 - 2 dates in month",
   assert_equals_int(2, number_in_month([(2010, 10, 12), (2013, 10, 14)], 10)));

test("t2 - 1 date in month",
   assert_equals_int(1, number_in_month([(2000, 09, 12), (2013, 10, 14)], 10)));

test("t2 - 0 dates in month",
   assert_equals_int(0, number_in_month([(2010, 1, 12), (2014, 10, 14)], 9)));

test("t2 - empty list",
   assert_equals_int(0, number_in_month([], 3)));

(*Tests for task 3*)

test("t3 - no dates",
   assert_equals_int(0, number_in_months([(1, 1, 1), (2, 2, 2)], [3, 4])));

test("t3 - empty list - months",
   assert_equals_int(0, number_in_months([(1, 1, 1), (2, 2, 2)
   										, (1, 3, 4), (100, 2, 30)]
   										, [])));

test("t3 - empty list - months",
   assert_equals_int(0, number_in_months([(1, 1, 1), (2, 2, 2)
   										, (1, 3, 4), (100, 2, 30)]
   										, [])));

test("t3 - empty list - dates",
   assert_equals_int(0, number_in_months([], [1, 2])));

test("t3 - empty list - months",
   assert_equals_int(60, number_in_months([(1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)
   										, (1, 1, 1), (2, 2, 2)]
   										, [1, 2])));

(*Tests Task 4*)

test("t4- 2 dates",
   assert_true([(1, 1, 1), (2, 1, 2)] = 
   			dates_in_month([(1, 1, 1), (3, 3, 3), (2, 1, 2)] , 1)));

test("t4- 0 dates",
   assert_true([] = 
   			dates_in_month([(1, 1, 1), (3, 3, 3), (2, 3, 2)] , 4)));

test("t4- 1 date",
   assert_true([(5, 5, 5)] = 
   			dates_in_month([(5, 5, 5)], 5)));

(*Tests Task 5*)

test("t5- 3 dates",
   assert_true([(5, 5, 5), (1, 2, 3), (1, 1, 1)] = 
   			dates_in_months([(5, 5, 5), (1, 2, 3), (4, 4, 4), (1, 1, 1)], [1, 2, 5])));

test("t5- 0 dates",
   assert_true([] = 
   			dates_in_months([(5, 5, 5), (1, 2, 3), (4, 4, 4), (1, 1, 1)], [6, 10, 7])));

test("t5- 0 dates",
   assert_true([] = 
   			dates_in_months([], [])));

(*Tests Task 6*)
test("t6 - 3rd element",
   assert_equals_string("Ivan", get_nth(["Pesho", "Gosho", "Ivan"], 3)));

test("t6 - 3rd element",
   assert_equals_string("2", get_nth(["1", "2", "3", "4"], 2)));

(*Tests Task 7*)
test("t7 - January 20, 2013",
   assert_equals_string("January 20, 2013", date_to_string(2013, 1, 20)));

test("t7 - July 5, 1985",
   assert_equals_string("July 5, 1985", date_to_string(1985, 07, 05)));

(*Tests Task 8*)
test("t8 - 2 elements",
   assert_equals_int(2, number_before_reaching_sum(3, [1, 1, 3])));

test("t8 - 5 elements",
   assert_equals_int(5, number_before_reaching_sum(20, [1, 1, 3, 5, 9, 1])));

test("t8 - 0 elements",
   assert_equals_int(0, number_before_reaching_sum(3, [3, 1, 3])));

(*Tests Task 9*)
test("t9 - 5th of July",
   assert_equals_int(7, what_month(186)));

test("t9 - 31st of January",
   assert_equals_int(1, what_month(31)));

test("t9 - 1st of December",
   assert_equals_int(12, what_month(335)));

(*Tests Task 10*)
test("t10 - 31 to 34",
   assert_true([1,2,2,2] = month_range(31, 34)));

test("t10 - 31 to 1",
   assert_true([] = month_range(31, 1)));

test("t10 - 31 to 31",
   assert_true([1] = month_range(31, 31)));

run();
