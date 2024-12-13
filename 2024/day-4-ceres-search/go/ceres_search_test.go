package main

import (
	"testing"
)

func TestXmasCount(t *testing.T) {
	result := xmasCount("../example_input.txt")

	if result != 18 {
		t.Fail()
	}
}
