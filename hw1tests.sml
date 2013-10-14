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
   			dates_in_month([(5, 5, 5)] , 5)));


run();
