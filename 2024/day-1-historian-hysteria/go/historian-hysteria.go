package main

import (
	"bufio"
	_ "embed"
	"fmt"
	"log"
	"os"
)

func main() {
	fmt.Println(TotalPairDistance("../puzzle_input.txt"))
	fmt.Println(SimilarityScore("../puzzle_input.txt"))
}

func TotalPairDistance(path string) int64 {
	return 0
}

func SimilarityScore(path string) int64 {
	return 0
}

func parsePuzzleInput(path string) []string {
	input, err := os.Open(path)

	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	defer input.Close()

	scanner := bufio.NewScanner(input)
	var locations []string

	for scanner.Scan() {
		locations = append(locations, scanner.Text())
	}

	return locations

}
