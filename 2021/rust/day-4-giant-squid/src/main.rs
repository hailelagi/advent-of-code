fn main() {
    println!("Hello, world!");
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
    fn test() {
        assert_eq!(test("./example_input.txt"), 0);
    }

    #[test]
    fn test_two() {
        assert_eq!(test("./example_input.txt"), 0);
    }
}
