#include "historian_hysteria.h"
#include <gtest/gtest.h>

TEST(LocationReport, TotalDistance) {
  auto report = LocationReport("../example_input.txt");

  EXPECT_EQ(report.total_pair_distance(), 11);
}
