#include "day_one.h"
#include <gtest/gtest.h>

TEST(CalibrationDocument, RecoverCalibration) {
  auto recovery = CalibrationDocument("../example_input.txt");

  EXPECT_EQ(recovery.recover_and_sum(), 142);
}

TEST(CalibrationDocument, RecoverLetterCalibration) {
  auto recovery = CalibrationDocument("../example_input_two.txt");

  EXPECT_EQ(recovery.recover_and_sum_letters(), 281);
}
