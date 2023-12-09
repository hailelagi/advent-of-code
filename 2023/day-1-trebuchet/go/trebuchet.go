package main

import (
	"bufio"
	_ "embed"
	"fmt"
	"log"
	"os"
	"strconv"
)

func main() {
	// Part One
	fmt.Println(SumCalibrations("../puzzle_input.txt"))

	// Part Two
	fmt.Println(SumCalibrationLetters("../puzzle_input.txt"))
}

func SumCalibrations(path string) int64 {
	var sum int64

	calibrations := parsePuzzleInput(path)

	for _, calibration := range calibrations {
		var first string
		var last string
		var calibrationLength = len(calibration)

		for i := 0; i < calibrationLength; i++ {
			character := calibration[i : i+1]

			if _, err := strconv.Atoi(character); err == nil {
				first = character
				break
			}
		}

		for i := calibrationLength; i >= 0; i-- {
			character := calibration[i-1 : i]

			if _, err := strconv.Atoi(character); err == nil {
				last = character
				break
			}
		}
		if value, err := strconv.ParseInt(first+last, 10, 0); err == nil {
			sum += value
		}
	}

	return sum
}

func SumCalibrationLetters(path string) int64 {
	var sum int64

	return sum
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
