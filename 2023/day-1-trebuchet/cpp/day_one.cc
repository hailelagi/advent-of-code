#include <cctype>
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
#include <stdlib.h>
#include <stdio.h>
#include "day_one.h"

using namespace std;

int CalibrationDocument::recover_and_sum() {
  int sum = 0;

  for (auto doc : documents) {
    auto first = '\0', last = '\0';
    int l = doc.length();
    
    for (auto i = 0, j = l; i <= l && j >= 0; i++, j--) {
      if (first != '\0' && last != '\0') break;
      if (isdigit(doc[i]) && first == '\0') first = doc[i];
      if (isdigit(doc[j]) && last == '\0') last = doc[j];
    }

    string combined_number;

    combined_number.push_back(first);
    combined_number.push_back(last);

    sum += atoi(combined_number.c_str());
  }

  return sum;
};

void CalibrationDocument::parse_puzzle_input(string dir) {
  ifstream example_input;
  example_input.open(dir);

  if (!example_input.is_open()) {
    throw runtime_error("could not read puzzle input :(");
  }

  string document;
  vector<string> calibration_documents;

  while (getline(example_input, document)) {
    calibration_documents.push_back(document);
  }

  example_input.close();
  documents = calibration_documents;
}

int main() {
  // todo(fixme): linker broken with cmake?
  // workaround temp: g++ -std=c++11 day_one.cc -g -o day_one && ./day_one
  // can add flags manually

  auto recovery = CalibrationDocument("../puzzle_input.txt");
  std::cout << "The sum is: " << recovery.recover_and_sum() << "\n";

  return 0;
}
