package main

import (
	"bufio"
	_ "embed"
	"fmt"
	"log"
	"os"
)

func main() {
	// Part One
	fmt.Println(("../puzzle_input.txt"))
}

func SumCalibrations(path string) int32 {
	// calibrations := parsePuzzleInput(path)

	// for _, calibration := range calibrations {
	// 	// for _, _ := range calibration {
	// 	// 	// fmt.Println(char)
	// 	// }
	// }

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
	var calibrations []string

	for scanner.Scan() {
		calibrations = append(calibrations, scanner.Text())
	}

	return calibrations

}
