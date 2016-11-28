#include <stdio.h>

int str_to_int(char * s, int * dest) {
  /* convert a string of digis to an integer */
  char * arr_ptr = s;
  char ch;
  int result = 0;  // used to store the resulting integer

  if (s == NULL || dest == NULL || *s == '\0')
    return 0;  // invalid arguments

  if (*s == '-' && *(s + 1) != '\0') {
    while ((ch = *(++arr_ptr)) != '\0')  // examine all characters
      if (ch < '0' || ch > '9')
        return 0;  // invalid characters
      else
        result = result * 10 + ch - '0';  // update the integer value
    result *= -1;  // get the true negative value
  } else {
    while ((ch = *arr_ptr++) != '\0')  // examine all characters
      if (ch < '0' || ch > '9')
        return 0;  // invalid characters
      else
        result = result * 10 + ch - '0';  // update the integer value
  }

  *dest = result;
  return 1;
}
