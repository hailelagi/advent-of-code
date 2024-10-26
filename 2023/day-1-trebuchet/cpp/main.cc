#include "day_one.h"
#include <cstdlib>
#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

int main() {
  auto recovery = CalibrationDocument("../puzzle_input.txt");
  std::cout << "The sum is: " << recovery.recover_and_sum() << "\n";
  std::cout << "The sum spelled out with letters is: "<< recovery.recover_and_sum_letters() << "\n";

  return 0;
}
