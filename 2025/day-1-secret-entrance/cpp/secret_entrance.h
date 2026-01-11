#pragma once

#include <string>
#include <vector>
#include <fstream>

namespace aoc {
class Password {
  std::string puzzle_dir;

public:
  Password(const std::string &path){{parse_puzzle_input(path);}};
  ~Password() {};
  
  int analyze_rotations();
  void parse_puzzle_input(const std::string&);
};
} // namespace aoc
