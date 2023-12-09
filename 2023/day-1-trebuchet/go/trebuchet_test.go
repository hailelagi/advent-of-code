package main

import (
	"testing"
)

func TestSumCalibrations(t *testing.T) {
	result := SumCalibrations("../example_input.txt")

	if result != 142 {
		t.Errorf("expected 142, got result: %d", result)
	}
}

func TestSumCalibrationLetters(t *testing.T) {
	result := SumCalibrationLetters("../example_input_two.txt")

	if result != 142 {
		t.Errorf("expected 281, got result: %d", result)
	}
}
