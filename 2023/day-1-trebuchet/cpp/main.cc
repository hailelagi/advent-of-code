#include "day_one.h"
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

int main() {
  auto recovery = CalibrationDocument("../puzzle_input.txt");
  std::cout << "The sum is: " << recovery.recover_and_sum() << "\n";

  return 0;
}
