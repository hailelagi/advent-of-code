#include "historian_hysteria.h"
#include <gtest/gtest.h>

TEST(LocationReport, TotalDistance) {
  auto report = aoc::LocationReport("../example_input.txt");

  EXPECT_EQ(report.total_pair_distance(), 11);
}

TEST(LocationReport, SimilarityScore) {
  auto report = aoc::LocationReport("../example_input.txt");

  EXPECT_EQ(report.similarity_score(), 31);
}
