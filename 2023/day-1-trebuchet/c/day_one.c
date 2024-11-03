#include "day_one.h"

#define MAX_DOCS 100
#define MAX_DOC_LEN 100

int recover_and_sum(CalibrationDocument *calib_doc) {
  int sum = 0;

  for (int d = 0; d < calib_doc->document_count; d++) {
    char *doc = calib_doc->documents[d];
    char first = '\0', last = '\0';
    int l = strlen(doc);

    for (int i = 0, j = l - 1; i < l && j >= 0; i++, j--) {
      if (first != '\0' && last != '\0')
        break;
      if (isdigit(doc[i]) && first == '\0')
        first = doc[i];
      if (isdigit(doc[j]) && last == '\0')
        last = doc[j];
    }

    char combined_number[3] = {first, last, '\0'};
    sum += atoi(combined_number);
  }

  return sum;
}

int recover_and_sum_letters(CalibrationDocument *calib_doc) {
  int sum = 0;
  struct {
    char *key;
    int value;
  } letters[] = {
      {"one", 1}, {"two", 2},   {"three", 3}, {"four", 4}, {"five", 5},
      {"six", 6}, {"seven", 7}, {"eight", 8}, {"nine", 9},
  };
  int letters_count = sizeof(letters) / sizeof(letters[0]);

  for (int d = 0; d < calib_doc->document_count; d++) {
    // todo
    // printf("%s\n", calib_doc->documents[d]);
  }

  return sum;
}

void initialize_calibration_document(CalibrationDocument *calib_doc,
                                     const char *dir) {
  strncpy(calib_doc->puzzle_dir, dir, MAX_DOC_LEN - 1);
  calib_doc->puzzle_dir[MAX_DOC_LEN - 1] = '\0';
  calib_doc->document_count = 0;
  parse_puzzle_input(calib_doc, dir);
}

void parse_puzzle_input(CalibrationDocument *calib_doc, const char *dir) {
  FILE *example_input = fopen(dir, "r");
  if (example_input == NULL) {
    perror("could not read puzzle input :(");
    exit(EXIT_FAILURE);
  }

  calib_doc->document_count = 0;
  while (fgets(calib_doc->documents[calib_doc->document_count], MAX_DOC_LEN,
               example_input) != NULL) {
    calib_doc->documents[calib_doc->document_count][strcspn(
        calib_doc->documents[calib_doc->document_count], "\n")] = '\0';
    calib_doc->document_count++;
    if (calib_doc->document_count >= MAX_DOCS)
      break;
  }

  fclose(example_input);
}
