use std::fs;

fn main() {
    println!("{:?}", sum_game_ids("../puzzle_input.txt"));
}

// [(R), (.G), (B)]
// load bag with cubes
// random selection
// reveal and return
// Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green

// Part One
pub fn sum_game_ids(path: &str) -> u32 {
    let games = parse(path);
    let mut sum = 0;

    sum
}

fn parse(path: &str) -> Vec<String> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.split("\n").map(|i| i.to_string()).collect();

    return puzzle_input;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        assert_eq!(sum_game_ids("../example_input.txt"), 8);
    }
}
