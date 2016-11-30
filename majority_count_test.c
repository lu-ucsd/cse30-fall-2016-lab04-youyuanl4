/* ********************************
 * CSE 30 - HW 4
 * ********************************/

#include <stdio.h>
#include "majority_count.h"
#include <assert.h>

int main(int argc, char ** argv) {
  /* tester for majority_count_ARM */
  int data[] = {0, 1, 0, 0, 2, 1, 1, 2, 1, 1, 1};
  int c_majority, arm_majority, c_count, arm_count;

  /* null cases */
  c_count = majority_count(data, 5, NULL);
  arm_count = majority_count_ARM(data, 5, NULL);
  assert(c_count == arm_count);

  /* empty array cases */
  c_count = majority_count(data, 0, &c_majority);
  arm_count = majority_count_ARM(data, 0, &arm_majority);
  assert(c_count == arm_count);

  /* single element array cases */
  c_count = majority_count(data, 1, &c_majority);
  arm_count = majority_count_ARM(data, 1, &arm_majority);
  assert(c_majority == arm_majority);
  assert(c_count == arm_count);

  /* random cases */
  c_count = majority_count(data, 4, &c_majority);
  arm_count = majority_count_ARM(data, 4, &arm_majority);
  assert(c_majority == arm_majority);
  assert(c_count == arm_count);

  c_count = majority_count(data, 11, &c_majority);
  arm_count = majority_count_ARM(data, 11, &arm_majority);
  assert(c_majority == arm_majority);
  assert(c_count == arm_count);

  puts("Passed All Test Cases for majority_count_ARM");
  return 0;
}
