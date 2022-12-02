use std::fs;

fn main() {
    println!("{:?}", elf_with_most("./puzzle_input.txt"));
    println!("{:?}", top_three_elves("./puzzle_input.txt"));
}

pub fn elf_with_most(path: &str) -> i32 {
    let calories = parse(path);
    let mut max = 0;

    for inventory in calories {
        let elf_calory = inventory.iter().sum();

        if elf_calory > max {
            max = elf_calory
        }
    }

    max
}

pub fn top_three_elves(path: &str) -> i32 {
    let mut calories: Vec<i32> = parse(path)
        .into_iter()
        .map(|inventory| inventory.iter().sum())
        .collect();

    calories.sort();

    calories.iter().rev().take(3).sum()
}

fn parse(path: &str) -> Vec<Vec<i32>> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input
        .split("\n\n")
        .map(|i| i.split("\n").map(|c| c.parse::<i32>().unwrap()));

    let mut calories: Vec<Vec<i32>> = Vec::new();

    for i in puzzle_input {
        calories.push(i.collect());
    }

    return calories;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_max_elf_calories() {
        assert_eq!(elf_with_most("./example_input.txt"), 24000);
    }

    #[test]
    fn test_top_three_elves_calories() {
        assert_eq!(top_three_elves("./example_input.txt"), 45000);
    }
}
