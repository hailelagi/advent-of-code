package main

import (
	"testing"
)

func TestTotalPairDistance(t *testing.T) {
	result := TotalPairDistance("../example_input.txt")

	if result != 11 {
		t.Fail()
	}
}

func TestSimilarityScore(t *testing.T) {
	result := SimilarityScore("../example_input.txt")

	if result != 31 {
		t.Fail()
	}
}
