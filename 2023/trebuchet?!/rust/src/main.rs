use std::fs;

fn main() {
    println!("{:?}", sum_calibration_values("../puzzle_input.txt"));
    println!("{:?}", sum_all_calibration_values("../puzzle_input.txt"));
}

// Part One
pub fn sum_calibration_values(path: &str) -> i64 {
    let calibrations = parse(path);
    let mut sum = 0;

    for calibration in calibrations {
        let result = first_or_last(&calibration).parse::<i64>();

        match result {
            Ok(calibration_value) => sum += calibration_value,
            Err(_) => (),
        }
    }

    sum
}

// Part Two
// What a horrible monstrosity 
pub fn sum_all_calibration_values(path: &str) -> i64 {
    let calibrations = parse(path);

    return calibrations
        .iter()
        .map(|calibration| first_or_last_letter(&calibration))
        .fold(0, |acc, c| acc + c.parse::<i64>().unwrap());
}

fn first_or_last(calibration: &String) -> String {
    let mut digits = calibration.chars().filter(|c| c.to_digit(10).is_some());
    let result = (digits.next(), digits.last());

    match result {
        (Some(first), Some(last)) => format!("{}{}", first, last),
        (Some(first), None) => format!("{}{}", first, first),
        (None, Some(last)) => format!("{}{}", last, last),
        (None, None) => format!("{}{}", 0, 0),
    }
}

fn first_or_last_letter(calibration: &String) -> String {
    let mut first = 0;
    let mut last = 0;
    let mut sub_string = String::new();

    for c in calibration.chars() {
        if let Some(d) = c.to_digit(10) {
            first = d;
            break;
        } else {
            sub_string.push(c);
            match parse_letter_digit(&mut sub_string) {
                Some(digit) => {
                    first = digit;
                    break;
                }
                None => (),
            }
        }
    }

    let mut sub_string = String::new();
    
    for c in calibration.chars().rev() {
        if let Some(d) = c.to_digit(10) {
            last = d;
            break;
        } else {
            sub_string.push(c);
            match parse_letter_digit(&mut sub_string) {
                Some(digit) => {
                    last = digit;
                    break;
                }
                None => (),
            }
        }
    }

    format!("{}{}", first, last)
}

fn parse_letter_digit(letter: &mut String) -> Option<u32> {
    if letter.contains("one") || letter.contains("eno") {
        Some(1)
    } else if letter.contains("two") || letter.contains("owt") {
        Some(2)
    } else if letter.contains("three") || letter.contains("eerht") {
        Some(3)
    } else if letter.contains("four") || letter.contains("ruof") {
        Some(4)
    } else if letter.contains("five") || letter.contains("evif") {
        Some(5)
    } else if letter.contains("six") || letter.contains("xis") {
        Some(6)
    } else if letter.contains("seven") || letter.contains("neves") {
        Some(7)
    } else if letter.contains("eight") || letter.contains("thgie") {
        Some(8)
    } else if letter.contains("nine") || letter.contains("enin") {
        Some(9)
    } else {
        None
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
    fn test_sum_calibration_values() {
        assert_eq!(sum_calibration_values("../example_input.txt"), 142);
    }

    #[test]
    fn test_sum_all_calibration_values() {
        assert_eq!(sum_all_calibration_values("../example_input_two.txt"), 281);
    }
}
