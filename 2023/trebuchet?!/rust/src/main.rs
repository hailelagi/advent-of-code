use std::fs;

fn main() {
    println!("{:?}", sum_calibration_values("../puzzle_input.txt"));
}

pub fn sum_calibration_values(path: &str) -> i32 {
    let calibrations = parse(path);

    println!("{:?}", calibrations);
    14
}


fn parse(path: &str) -> Vec<String> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n\n").map(|i| i.to_owned()).collect();

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
