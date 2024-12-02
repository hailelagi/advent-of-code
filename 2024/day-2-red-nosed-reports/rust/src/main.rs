use std::fs;

fn main() {
    println!("{:?}", safe_reports("../puzzle_input.txt"));
    println!("{:?}", tolerance_safe_reports("../puzzle_input.txt"));
}

fn safe_reports(path: &str) -> i32 {
    let reports = parse(path);

    reports
        .iter()
        .filter(|level| {
            let (mut increasing, mut decreasing) = (true, true);

            for window in level.windows(2) {
                if let [a, b] = window {
                    if !(1..=3).contains(&(b - a)) {
                        increasing = false;
                    }
                    if !(1..=3).contains(&(a - b)) {
                        decreasing = false;
                    }
                }

                if !increasing && !decreasing {
                    return false;
                }
            }

            true
        })
        .count() as i32
}

fn tolerance_safe_reports(path: &str) -> i32 {
    let reports = parse(path);

    todo!()
}

fn parse(path: &str) -> Vec<Vec<i32>> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let reports = puzzle_input.lines().map(|l| {
        l.split_ascii_whitespace()
            .map(|d| d.parse::<i32>().unwrap())
            .collect()
    });

    reports.collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_safe_reports() {
        assert_eq!(safe_reports("../example_input.txt"), 2)
    }

    #[test]
    fn test_tolerance_safe_reports() {
        assert_eq!(tolerance_safe_reports("../example_input.txt"), 4)
    }
}
