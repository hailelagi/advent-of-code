use std::fs;

fn main() {
    println!("{:?}", depth_measurement("./puzzle_input.txt"));
    println!("{:?}", sum_depth_measurement("./puzzle_input.txt"));
}

// Part one: counts no. of measurement's larger than the previous measurement
pub fn depth_measurement(path: &str) -> i32 {
    let measurements = parse(path);
    let measurement_cap = measurements.len() - 1;
    let mut depth_increase = 0;

    for (i, measurement) in measurements.iter().enumerate() {
        if i == measurement_cap {
            return depth_increase
        }
        else if &measurements[i+1] > measurement { 
            depth_increase += 1 
        }
    }

    return depth_increase;
}

// Part two: counts sums of a three-measurement sliding window of measurements
pub fn sum_depth_measurement(path: &str) -> i32 {
    let measurements = parse(path);

    // forward index up to three elements at most
    let measurement_cap = measurements.len() - 3;
    let mut i = 0;
    let mut depth_increase = 0;

    while i < measurement_cap {
        let window: i32 = measurements[i..i+3].iter().sum::<i32>();
        let next_window: i32 = measurements[i+1..i+4].iter().sum::<i32>();
        i += 1;

        if next_window > window { depth_increase += 1 }
    }

    return depth_increase
}

fn parse(path: &str) -> Vec<i32> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n");

    let mut measurements: Vec<i32> = Vec::new();

    for i in puzzle_input {
        measurements.push(i.parse().unwrap());
    }

    return measurements;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_depth_measurement() {
        assert_eq!(depth_measurement("./example_input.txt"), 7);
    }

    #[test]
    fn test_sum_depth_measurement() {
        assert_eq!(sum_depth_measurement("./example_input.txt"), 5);
    }
}
