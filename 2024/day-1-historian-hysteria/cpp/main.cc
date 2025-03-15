#include "historian_hysteria.h"
#include <iostream>

int main() {
  auto report = aoc::LocationReport("../puzzle_input.txt");

  std::cout << "The total distance is: " << report.total_pair_distance()
            << "\n";
  std::cout << "The similarity : " << report.similarity_score() << "\n";
  return 0;
}
