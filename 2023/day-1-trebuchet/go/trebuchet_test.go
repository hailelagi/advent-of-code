package main

import (
	"fmt"
	"testing"
)

func TestSumCalibrations(t *testing.T) {
	result := SumCalibrations("../example_input.txt")
	fmt.Println(result)

	if result != 142 {
		t.Errorf("expected 142, got result: %d", result)
	}
}
