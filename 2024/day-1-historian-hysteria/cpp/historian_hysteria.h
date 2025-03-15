#pragma once

#include <string>
#include <vector>
#include <fstream>

namespace aoc {
class LocationReport {
  std::string puzzle_dir;
  std::vector<std::string> locations;

  std::vector<int64_t> first;
  std::vector<int64_t> second;

public:
  LocationReport(const std::string &path){{parse_puzzle_input(path);}};
  ~LocationReport() {};

    int total_pair_distance();
    int similarity_score();
    void parse_puzzle_input(const std::string&);
};
} // namespace aoc
