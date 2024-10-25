#include <cctype>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <vector>

class CalibrationDocument {
  std::string puzzle_dir;
  std::vector<std::string> documents;

  public:
    CalibrationDocument(std::string dir){{parse_puzzle_input(dir);}};
    int recover_and_sum();
    void parse_puzzle_input(std::string dir);
};
