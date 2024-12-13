#include "historian_hysteria.h"
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

int main() {
  auto report = LocationReport("../puzzle_input.txt");

  std::cout << "The total distance is: " << report.total_pair_distance()
            << "\n";
  std::cout << "The similarity : " << report.similarity_score() << "\n";
  return 0;
}
