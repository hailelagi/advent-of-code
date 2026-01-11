#include "secret_entrance.h"
#include <algorithm>
#include <cstdint>
#include <sstream>

namespace aoc {
int Password::analyze_rotations() {
  return 0;
}

void Password::parse_puzzle_input(const std::string &path) {
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
  }
  input.close();
}
} // namespace aoc
