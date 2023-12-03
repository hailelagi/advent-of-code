use std::fs;

fn main() {
    println!("{:?}", sum_calibration_values("../puzzle_input.txt"));
}

pub fn sum_calibration_values(path: &str) -> i32 {
    let calibrations = parse(path);
    let mut sum = 0;

    for calibration in calibrations {
        let result = first_or_last(calibration).parse::<i32>();

        match result {
            Ok(calibration_value) => sum += calibration_value,
            Err(_) => ()
        }
    }

    sum
}

fn first_or_last(calibration: String) -> String {
    let mut digits = calibration.chars().filter(|c| c.to_digit(10).is_some());
    let result = (digits.next(), digits.last());

    match result {
        (Some(first), Some(last)) => format!("{}{}", first, last),
        (Some(first), None) => format!("{}{}", first, first),
        (None, Some(last)) => format!("{}{}", last, last),
        (None, None) => format!("{}{}", 0, 0)
    }
}

fn parse(path: &str) -> Vec<String> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n").map(|c| c.to_owned()).collect();

    return puzzle_input;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_max_elf_calories() {
        assert_eq!(sum_calibration_values("../example_input.txt"), 142);
    }
}
