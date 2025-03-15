use std::fs;

enum Level {
    Increasing,
    Decreasing,
}

fn main() {
    println!("{:?}", safe_reports("../puzzle_input.txt"));
    println!("{:?}", tolerant_safe_reports("../puzzle_input.txt"));
}

fn safe_reports(path: &str) -> i32 {
    let reports = parse(path);

    reports
        .iter()
        .filter(|level| {
            let (mut incr, mut decr) = (true, true);
            safety_predicate(level, |first, second| {
                if !safe_level(Level::Increasing, first, second) {
                    incr = false;
                }

                if !safe_level(Level::Decreasing, first, second) {
                    decr = false;
                }

                !incr && !decr
            })
        })
        .count() as i32
}

fn tolerant_safe_reports(path: &str) -> i32 {
    let reports = parse(path);

    reports
        .iter()
        .filter(|level| {
            for skip_idx in 0..level.len() {
                if is_safe_report(level, Some(skip_idx)) {
                    return true;
                }
            }

            false
        })
        .count() as i32
}

fn safety_predicate<F>(level: &[i32], mut predicate: F) -> bool
where
    F: FnMut(i32, i32) -> bool,
{
    for window in level.windows(2) {
        let (a, b) = (window[0], window[1]);
        if predicate(a, b) {
            return false;
        }
    }

    true
}

fn is_safe_report(level: &[i32], skip_idx: Option<usize>) -> bool {
    let mut is_increasing_safe = true;
    let mut is_decreasing_safe = true;
    let mut prev_val: Option<i32> = None;

    for (idx, &val) in level.iter().enumerate() {
        if skip_idx.is_some() && skip_idx.unwrap() == idx {
            continue;
        }

        if let Some(prev) = prev_val {
            if !safe_level(Level::Increasing, prev, val) {
                is_increasing_safe = false;
            }

            if !safe_level(Level::Decreasing, prev, val) {
                is_decreasing_safe = false;
            }

            if !is_increasing_safe && !is_decreasing_safe {
                return false;
            }
        }

        prev_val = Some(val);
    }
    is_increasing_safe || is_decreasing_safe
}

fn safe_level(level: Level, a: i32, b: i32) -> bool {
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
    fn test_tolerant_safe_reports() {
        assert_eq!(tolerant_safe_reports("../example_input.txt"), 4)
    }
}
