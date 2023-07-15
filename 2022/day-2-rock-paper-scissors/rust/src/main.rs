use std::fs;

fn main() {
    println!("{:?}", "hello world!");
}

pub fn total_score(path: &str) -> i32 {
    let strategy = parse(path);

    println!("{:?}", strategy);
    0
}

pub fn correct_total_score(path: &str) -> i32 {
    0
}

#[derive(Debug)]
struct Round(String);

fn parse(path: &str) -> Vec<Round> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n");

    let mut strategy_guide: Vec<Round> = Vec::new();

    for i in puzzle_input {
        strategy_guide.push(Round(String::from(i)));
    }

    return strategy_guide;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_total_score() {
        assert_eq!(total_score("../example_input.txt"), 15);
    }

    // #[test]
    // fn test_correct_total_score() {
    //     assert_eq!(correct_total_score("./example_input.txt"), 12);
    // }
}
