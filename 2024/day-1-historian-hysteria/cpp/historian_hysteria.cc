#include "historian_hysteria.h"
#include <algorithm>
#include <cstdint>
#include <sstream>

namespace aoc {
int LocationReport::total_pair_distance() {
  int64_t total = 0;

  std::sort(first.begin(), first.end());
  std::sort(second.begin(), second.end());

  for (auto i = 0; i < first.size(); ++i) {
    total += abs(second[i] - first[i]);
  }

  return total;
}

int LocationReport::similarity_score() {
  int64_t score = 0;
  std::unordered_map<int, int> similarity;

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

void LocationReport::parse_puzzle_input(const std::string &path) {
  std::ifstream input;

  input.open(path);
  if (!input.is_open()) {
    throw std::runtime_error("could not read puzzle input :(");
  }

  std::string line;
  while (getline(input, line)) {
    std::istringstream iss(line);
    int f, s;
    iss >> f >> s;

    first.push_back(f);
    second.push_back(s);
  }
  input.close();
}
} // namespace aoc
