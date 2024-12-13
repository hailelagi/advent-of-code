package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

func main() {
	fmt.Println(xmasCount("../puzzle_input.txt"))
}

func xmasCount(path string) int {
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
	var words []string

	for scanner.Scan() {
		words = append(words, scanner.Text())
	}

	return words

}
