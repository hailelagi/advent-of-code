package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
)

var directions = [][2]int{
	{0, 1}, {0, -1}, {1, 0}, {-1, 0},
	{1, 1}, {-1, -1}, {1, -1}, {-1, 1},
}

func main() {
	fmt.Println(xmasCount("../puzzle_input.txt"))
}

func xmasCount(path string) int {
	grid := parsePuzzleInput(path)
	word := "XMAS"
	rows := len(grid)
	cols := len(grid[0])
	count := 0

	for i := range rows {
		for j := range cols {
			for _, d := range directions {
				match := true
				for k := 0; k < 4; k++ {
					x := i + k*d[0]
					y := j + k*d[1]
					if x < 0 || x >= rows || y < 0 || y >= cols || grid[x][y] != word[k] {
						match = false
						break
					}
				}
				if match {
					count++
				}
			}
		}
	}

	return count
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
