#include <cctype>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>

class LocationReport {
  std::string puzzle_dir;
  std::vector<std::string> locations;

  std::vector<int64_t> first;
  std::vector<int64_t> second;

public:
  LocationReport(std::string dir){{parse_puzzle_input(dir);}};
    int total_pair_distance();
    int similarity_score();
    void parse_puzzle_input(std::string dir);
};
