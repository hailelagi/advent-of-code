use std::{collections::HashMap, fs};

fn main() {
    println!("{:?}", total_distance("../puzzle_input.txt"));
    println!("{:?}", similarity_score("../puzzle_input.txt"));
}

fn total_distance(path: &str) -> i64 {
    let [mut first, mut second] = parse(path);

    first.sort();
    second.sort();

    first
        .iter()
        .zip(second)
        .map(|(x, y)| (y - x).abs())
        .sum::<i64>()
}

fn similarity_score(path: &str) -> i64 {
    let mut score = 0;
    let mut similarity = HashMap::new();
    let [first, second] = parse(path);

    for id in &second {
        *similarity.entry(id).or_insert(0) += 1;
    }

    for id in &first {
        if let Some(mult) = similarity.get(id) {
            score += *mult * *id
        }
    }

    score
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

    #[test]
    fn test_similarity_score() {
        assert_eq!(similarity_score("../example_input.txt"), 31)
    }
}
