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

  for (auto i = 0; i < first.size(); ++i) {
    total += abs(second[i] - first[i]);
  }

  return total;
}

int LocationReport::similarity_score() {
  int64_t score = 0;
  unordered_map<int, int> similarity;

  for (auto id : second) {
    similarity[id]++;
  }

  for (auto id : first) {
    if (similarity.find(id) != similarity.end()) {
      score += static_cast<int64_t>(similarity[id]) * id;
    }
  }

  return score;
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
