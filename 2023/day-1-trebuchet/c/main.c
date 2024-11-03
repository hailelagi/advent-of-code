#include "day_one.h"
#include <stdio.h>

// init n load puzzle input
void initialize_calibration_document(CalibrationDocument *calib_doc,
                                     const char *file_path);

int main() {
  CalibrationDocument recovery;
  initialize_calibration_document(&recovery, "../puzzle_input.txt");

  int sum = recover_and_sum(&recovery);
  printf("The sum is: %d\n", sum);

/*
  int sum_letters = recover_and_sum_letters(&recovery);
  printf("The sum spelled out with letters is: %d\n", sum_letters);
*/
  return 0;
}
