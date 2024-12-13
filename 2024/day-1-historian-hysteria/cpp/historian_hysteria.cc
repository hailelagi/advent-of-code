#include "historian_hysteria.h"
#include <cstdint>
#include <cstdlib>
#include <sstream>
#include <stdio.h>
#include <stdlib.h>
#include <vector>

using namespace std;

int LocationReport::total_pair_distance() {
  int64_t total = 0;

  sort(first.begin(), first.end());
  sort(second.begin(), second.end());

  for (size_t i = 0; i < first.size(); ++i) {
    total += abs(second[i] - first[i]);
  }

  return total;
}

int LocationReport::similarity_score() {
  return 0;
}

void LocationReport::parse_puzzle_input(string dir) {
  ifstream input;

  input.open(dir);
  if (!input.is_open()) {
    throw runtime_error("could not read puzzle input :(");
  }

  string line;
  while (getline(input, line)) {
    istringstream iss(line);
    int f, s;
    iss >> f >> s;

    first.push_back(f);
    second.push_back(s);
  }
  input.close();
}
