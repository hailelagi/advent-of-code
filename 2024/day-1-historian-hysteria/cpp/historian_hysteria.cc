#include "historian_hysteria.h"
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>

using namespace std;

int LocationReport::total_pair_distance() {
  return 0;
};

void LocationReport::parse_puzzle_input(string dir) {
  ifstream example_input;
  example_input.open(dir);
  if (!example_input.is_open()) {
    throw runtime_error("could not read puzzle input :(");
  }
}
