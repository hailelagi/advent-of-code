#include "day_one.h"
#include <cstdlib>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

int CalibrationDocument::recover_and_sum() {
  int sum = 0;

  for (auto doc : documents) {
    auto first = '\0', last = '\0';
    int l = doc.length();

    for (auto i = 0, j = l; i <= l && j >= 0; i++, j--) {
      if (first != '\0' && last != '\0')
        break;
      if (isdigit(doc[i]) && first == '\0')
        first = doc[i];
      if (isdigit(doc[j]) && last == '\0')
        last = doc[j];
    }

    string combined_number;

    combined_number.push_back(first);
    combined_number.push_back(last);

    sum += atoi(combined_number.c_str());
  }

  return sum;
};

int CalibrationDocument::recover_and_sum_letters() {
  int sum = 0;
  unordered_map<string, int> letters{
      {"one", 1}, {"two", 2},   {"three", 3}, {"four", 4}, {"five", 5},
      {"six", 6}, {"seven", 7}, {"eight", 8}, {"nine", 9},
  };

  for (auto doc : documents) {
    cout << doc << "\n";
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
