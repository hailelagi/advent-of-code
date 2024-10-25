#include "day_one.h"
#include <gtest/gtest.h>

// Demonstrate some basic assertions.
TEST(CalibrationDocument, RecoverCalibration) {
  auto recovery = CalibrationDocument("../example_input.txt");

  EXPECT_EQ(recovery.recover_and_sum(), 142);
}
