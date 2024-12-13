package main

import (
	"bufio"
	_ "embed"
	"fmt"
	"log"
	"math"
	"os"
	"sort"
	"strconv"
	"strings"
)

func main() {
	fmt.Println(TotalPairDistance("../puzzle_input.txt"))
	fmt.Println(SimilarityScore("../puzzle_input.txt"))
}

func TotalPairDistance(path string) int64 {
	first, second := parsePuzzleInput(path)
	var total int64

	sort.Slice(first, func(i, j int) bool { return first[i] < first[j] })
	sort.Slice(second, func(i, j int) bool { return second[i] < second[j] })

	for i := range first {
		total += int64(math.Abs(float64(second[i] - first[i])))
	}

	return total
}

func SimilarityScore(path string) int64 {
	first, second := parsePuzzleInput(path)
	var score int64

	similarity := make(map[int64]int)
	for _, id := range second {
		similarity[id]++
	}

	for _, id := range first {
		if mult, found := similarity[id]; found {
			score += int64(mult) * id
		}
	}

	return score
}

func parsePuzzleInput(path string) ([]int64, []int64) {
	input, err := os.Open(path)

	if err != nil {
		log.Fatal(err)
		panic(err)
	}

	defer input.Close()

	var first, second []int64
	scanner := bufio.NewScanner(input)

	for scanner.Scan() {
		parts := strings.Fields(scanner.Text())
		f, _ := strconv.ParseInt(parts[0], 10, 64)
		s, _ := strconv.ParseInt(parts[1], 10, 64)
		first = append(first, f)
		second = append(second, s)
	}

	return first, second
}
