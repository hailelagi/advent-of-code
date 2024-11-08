#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_DOCS 1000
#define MAX_DOC_LEN 1000

typedef struct {
  char puzzle_dir[MAX_DOC_LEN];
  char documents[MAX_DOCS][MAX_DOC_LEN];
  int document_count;
} CalibrationDocument;

void parse_puzzle_input(CalibrationDocument *calib_doc, const char *dir);
int recover_and_sum(CalibrationDocument *calib_doc);
int recover_and_sum_letters(CalibrationDocument *calib_doc);
