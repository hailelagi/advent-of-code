use std::fs;

fn main() {
    println!("{:?}", elf_with_most("./puzzle_input.txt"));
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
    fn test_depth_measurement() {
        assert_eq!(elf_with_most("./example_input.txt"), 24000);
    }
}
