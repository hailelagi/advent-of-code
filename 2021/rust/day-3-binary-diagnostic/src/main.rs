use std::collections::HashMap;
use std::fs;

fn main() {
    println!("{:?}", power_consumption("./puzzle_input.txt"));
    // println!("{:?}", life_support_rating("./puzzle_input.txt"));
}

// Part one: Find the power consumption of a submarine
pub fn power_consumption(path: &str) -> u32 {
    let diagnostic_report = parse(path);
    let mut positions = HashMap::<u32, u32>::new();
    let limit = diagnostic_report[0].len();
    let report_length = diagnostic_report.len();

    for report in diagnostic_report {
        for (i, c) in report.chars().enumerate() {
            if String::from(c) == "1" {
                *positions.entry(i.try_into().unwrap()).or_insert(0) += 1;
            }
        }
    };

    let mut gamma_rate = String::new();
    let mut epsilon_rate = String::new();
    let bit_size = (report_length / 2).try_into().unwrap();

    for i in 0..limit {
        let position = positions.get(&i.try_into().unwrap());

        if position > Some(&bit_size) {
            gamma_rate.push_str("1");
            epsilon_rate.push_str("0");
        } else {
            gamma_rate.push_str("0");
            epsilon_rate.push_str("1");
        }
    }

    return to_decimal(&gamma_rate) * to_decimal(&epsilon_rate);
}

// Part two: Find the life support rating
pub fn life_support_rating(path: &str) -> u32 {
    let diagnostic_report = parse(path);
    let oxygen_generator_rating = 0;
    let co2_scrubber_rating = 0;

    // println!("{:?}", diagnostic_report);
    return oxygen_generator_rating * co2_scrubber_rating
}

fn to_decimal(binary: &str) -> u32 {
    return isize::from_str_radix(binary, 2).unwrap() as u32;
}

fn parse(path: &str) -> Vec<String> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n");

    let mut measurements: Vec<String> = Vec::new();

    for input in puzzle_input {
        measurements.push(String::from(input));
    }

    return measurements;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_part_one() {
        assert_eq!(power_consumption("./example_input.txt"), 198);
    }

    #[test]
    fn test_part_two() {
        assert_eq!(life_support_rating("./example_input.txt"), 230);
    }
}
