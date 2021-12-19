use std::fs;

fn main() {
    println!("{:?}", depth_measurement("../puzzle_input.txt"));
    // println!("{:?}", sum_depth_measurement("../puzzle_input.txt"));
}

// Part one: counts no. of measurement's larger than the previous measurement
pub fn depth_measurement(path: &str) -> u32 {
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
pub fn sum_depth_measurement(_path: &str) -> u32 {
    // todo
    return 0;
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
