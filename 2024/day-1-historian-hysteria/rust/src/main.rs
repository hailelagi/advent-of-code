use std::fs;

fn main() {
    println!("{:?}", total_distance("../puzzle_input.txt"));
}

fn total_distance(path: &str) -> i64 {
    let [mut first, mut second] = parse(path);

    first.sort();
    second.sort();

    first.iter().zip(second).map(|(x, y)| (y-x).abs()).sum::<i64>()
}

fn parse(path: &str) -> [Vec<i64>; 2] {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let (first, second): (Vec<_>, Vec<_>) = puzzle_input
        .lines()
        .map(|line| {
            let parts: Vec<_> = line.split_whitespace().collect();
            (
                parts[0].parse::<i64>().unwrap(),
                parts[1].parse::<i64>().unwrap(),
            )
        })
        .unzip();

    [first, second]
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_total_pair_distance() {
        assert_eq!(total_distance("../example_input.txt"), 11)
    }
}
