#include "secret_entrance.h"
#include <gtest/gtest.h>

TEST(Password, AnalyzeRotations) {
  auto password = aoc::Password("../example_input.txt");

  EXPECT_EQ(password.analyze_rotations(), 3);
}
