/* ********************************
 * CSE 30 - HW 4
 *
 * This file is merely designed to give you an idea how to compile/test your own
 * code. You may modify it as you like.
 *
 * ********************************/

#include <stdio.h>
#include <assert.h>

int str_to_int(char * str, int * dest);

int main(void) {
  /* tester for str_to_int */
  int x;

  /* null cases */
  assert(str_to_int(NULL, &x) == 0);
  assert(str_to_int("123", NULL) == 0);
  assert(str_to_int(NULL, NULL) == 0);

  /* invalid string cases */
  assert(str_to_int("", &x) == 0);
  assert(str_to_int("-", &x) == 0);

  assert(str_to_int("&", &x) == 0);
  assert(str_to_int("-&", &x) == 0);

  assert(str_to_int("abc", &x) == 0);
  assert(str_to_int("-abc", &x) == 0);

  assert(str_to_int("123abc", &x) == 0);
  assert(str_to_int("-123abc", &x) == 0);

  assert(str_to_int("a123bc", &x) == 0);
  assert(str_to_int("-a123bc", &x) == 0);

  /* valid string cases */
  assert(str_to_int("0", &x) == 1);
  assert(x == 0);
  assert(str_to_int("-0", &x) == 1);
  assert(x == 0);

  assert(str_to_int("3", &x) == 1);
  assert(x == 3);
  assert(str_to_int("-3", &x) == 1);
  assert(x == -3);

  assert(str_to_int("123", &x) == 1);
  assert(x == 123);
  assert(str_to_int("-123", &x) == 1);
  assert(x == -123);

  puts("Passed All Test Cases for str_to_int");
  return 0;
}
