/* ********************************
 * CSE 30 - HW 3
 * ********************************/

#include <stdio.h>
#include "substring.h"
#include <assert.h>

int main() {
  /* test the ARM implementation of substring() */
  char * str0 = NULL;
  char * str1 = "";
  char * str2 = "3";
  char * str3 = "cse";
  char * str4 = "eecsce";
  char * str5 = "cse30";
  char * str6 = "cs26cse";

  /* NULL cases */
  assert(substring(str0, str0) == 0);
  assert(substring(str0, str1) == 0);
  assert(substring(str1, str0) == 0);
  assert(substring(str0, str2) == 0);
  assert(substring(str2, str0) == 0);
  assert(substring(str0, str3) == 0);
  assert(substring(str3, str0) == 0);

  /* empty string cases */
  assert(substring(str1, str1) == 1);
  assert(substring(str1, str2) == 1);
  assert(substring(str2, str1) == 1);
  assert(substring(str1, str3) == 1);
  assert(substring(str3, str1) == 1);

  /* single character string cases*/
  assert(substring(str2, str2) == 1);
  assert(substring(str2, str3) == 0);
  assert(substring(str3, str2) == 0);
  assert(substring(str2, str5) == 1);
  assert(substring(str5, str2) == 1);

  /* random cases */
  assert(substring(str3, str3) == 1);
  assert(substring(str3, str4) == 0);
  assert(substring(str4, str3) == 0);
  assert(substring(str3, str5) == 1);
  assert(substring(str5, str3) == 1);
  assert(substring(str3, str6) == 1);
  assert(substring(str6, str3) == 1);

  /* random cases */
  assert(substring(str4, str4) == 1);
  assert(substring(str4, str5) == 0);
  assert(substring(str5, str4) == 0);

  puts("Passed All Test Cases for substring");

  return 0;
}
