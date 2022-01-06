use std::collections::HashMap;
use std::fs;

fn main() {
    println!("{:?}", power_consumption("./puzzle_input.txt"));
    println!("{:?}", life_support_rating("./puzzle_input.txt"));
}

// Part one: Find the power consumption of a submarine
pub fn power_consumption(path: &str) -> u32 {
    let diagnostic_report = parse(path);
    let limit = diagnostic_report[0].len();
    let report_length = diagnostic_report.len();

    let mut positions = HashMap::<u32, u32>::new();

    for report in diagnostic_report {
        for (i, c) in report.chars().enumerate() {
            if String::from(c) == "1" {
                *positions.entry(i.try_into().unwrap()).or_insert(0) += 1;
            }
        }
    }

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
// yes yes this is a terrible terrible solution. Believe me I know.
// I have been stuck on this for several days. I suck so bad @ rust.
//  ----------------/// -----------
//  * I tried scan, reduce(rust has fold) no luck.
//  * I tried mutating the Vector while iterating. The compiler got mad.
//    reasonable, but annoying nonetheless.
//  * When I have a better grasp on rust perhaps I can better express this problem
//   in some idomatic manner rather than copy pasta my elixir solution with bad modifications.
//  * I know, recursion on unbounded inputs is a terrible idea in rust... I just don't know what to do.
pub fn life_support_rating(path: &str) -> u32 {
    let diagnostic_report = parse(path);

    let oxygen_generator_rating = find_rating(0, diagnostic_report.clone(), "oxygen");
    let co2_scrubber_rating = find_rating(0, diagnostic_report.clone(), "co2");

    return to_decimal(&oxygen_generator_rating) * to_decimal(&co2_scrubber_rating)
}

fn find_rating(index: usize, diagnostic_report: Vec<String>, rating_type: &str) -> String {
    let mut one_count = 0;
    let mut zero_count = 0;
    let mut bit = "0";

    for report in &diagnostic_report {
        if report.chars().nth(index).unwrap().to_string() == "1" {
            one_count += 1;
        } else {
            zero_count += 1;
        }
    }

    if one_count >= zero_count && rating_type == "oxygen" { bit = "1"; }
    if one_count < zero_count && rating_type == "co2" { bit = "1"; }

    let new_report: Vec<String> = diagnostic_report
        .into_iter()
        .filter(|report| report.chars().nth(index).unwrap().to_string() == bit)
        .collect();

    if new_report.len() == 1 {
        return new_report[0].clone();
    } else {
        find_rating(index + 1, new_report, rating_type)
    }
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
