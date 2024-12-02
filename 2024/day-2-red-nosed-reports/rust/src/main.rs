use std::fs;

enum Level {
    Increasing,
    Decreasing,
}

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
                if !safe_level(Level::Increasing, window) {
                    increasing = false
                }

                if !safe_level(Level::Decreasing, window) {
                    decreasing = false
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
    let tolerance = &mut true;

    reports
        .iter()
        .filter(|level| {
            let (mut increasing, mut decreasing) = (true, true);

            for window in level.windows(2) {
                if !safe_level(Level::Increasing, window) {
                    increasing = false
                }

                if !safe_level(Level::Decreasing, window) {
                    decreasing = false
                }

                if !increasing && !decreasing {
                    let mut skip_increasing = true;
                    let mut skip_decreasing = true;

                    for i in 0..level.len() - 2 {
                        if !safe_level(Level::Increasing, &[level[i], level[i + 2]]) {
                            skip_increasing = false;
                        }

                        if !safe_level(Level::Decreasing, &[level[i], level[i + 2]]) {
                            skip_decreasing = false;
                        }

                        if !skip_increasing && !skip_decreasing {
                            return false;
                        }
                    }
                }
            }

            true
        })
        .count() as i32
}

fn safe_level(level: Level, window: &[i32]) -> bool {
    let (a, b) = (window[0], window[1]);
    match level {
        Level::Increasing => (1..=3).contains(&(b - a)),
        Level::Decreasing => (1..=3).contains(&(a - b)),
    }
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
