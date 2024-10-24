#include <stdexcept>
#include <stdio.h>
#include <iostream>
#include <fstream>
#include <exception>
#include <string>
#include <vector>

/*
todo(readme): // https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#S-errors

int main() {
  std::ifstream example_input;

  try {
    std::ifstream example_input("../../example_input.txt");
    example_input.exceptions(std::ifstream::failbit);
  } catch (const std::ios_base::failure &fail) {
    std::clog << fail.what() << '\n';
  }

  std::string puzzle;

  while(example_input >> puzzle) {
    std::cout << puzzle;
  }

  std::cout << puzzle;
  std::cout << "answer is:" << '\n';

  return 0;
}
*/

int main(void) {
    std::ifstream example_input;

    example_input.open("../../example_input.txt");
    if (!example_input.is_open()) {
        throw "could not read puzzle input :(";
    }

    std::string document;
    std::vector<std::string> calibration_documents;

    while (example_input >> document) {
        calibration_documents.push_back(document);
    }

    example_input.close();

    for (auto document: calibration_documents) std::cout << document << "\n";

    return 0;
}
