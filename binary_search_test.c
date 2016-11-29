/* ********************************
 * CSE 30 - HW 4
 * ********************************/

#include <stdio.h>
#include "binary_search.h"
#include <assert.h>

int main(int argc, char ** argv) {
  /* tester for binary_search_ARM */
  int data[] = {1,2,3,4,5,6,7,8,9,10};

  /* -1 cases */
  assert(binary_search(data,4,0,0) == binary_search_ARM(data,4,0,0));
  assert(binary_search(data,4,0,11) == binary_search_ARM(data,4,0,11));

  /* list element cases */
  assert(binary_search(data,4,0,1) == binary_search_ARM(data,4,0,1));
  assert(binary_search(data,4,0,2) == binary_search_ARM(data,4,0,2));
  assert(binary_search(data,4,0,3) == binary_search_ARM(data,4,0,3));
  assert(binary_search(data,4,0,4) == binary_search_ARM(data,4,0,4));
  assert(binary_search(data,4,0,5) == binary_search_ARM(data,4,0,5));
  assert(binary_search(data,4,0,6) == binary_search_ARM(data,4,0,6));
  assert(binary_search(data,4,0,7) == binary_search_ARM(data,4,0,7));
  assert(binary_search(data,4,0,8) == binary_search_ARM(data,4,0,8));
  assert(binary_search(data,4,0,9) == binary_search_ARM(data,4,0,9));
  assert(binary_search(data,4,0,10) == binary_search_ARM(data,4,0,10));

  puts("Passed All Test Cases for binary_search_ARM");
  return 0;
}
