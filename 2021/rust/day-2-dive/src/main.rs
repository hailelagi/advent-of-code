use std::fs;

#[derive(Debug)]
struct Command {
    position: u32,
    direction: String,
}

fn main() {
    println!("{:?}", course_path("./puzzle_input.txt"));
    println!("{:?}", corrected_course_path("./puzzle_input.txt"));
}

// Part One: Calculates the horizontal position and depth of the course
fn course_path(path: &str) -> u32 {
    let commands = parse(path);
    let mut horizontal = 0;
    let mut depth = 0;

    for command in commands {
        match command.direction.as_str() {
            "forward" => horizontal += command.position,
            "down" => depth += command.position,
            "up" => depth -= command.position,
            _ => (),
        }
    }

    return horizontal * depth;
}

// Part Two: Calculates the horizontal position and depth, using new interpretation of the commands
fn corrected_course_path(path: &str) -> u32 {
    let commands = parse(path);
    let mut horizontal = 0;
    let mut depth = 0;
    let mut aim = 0;

    for command in commands {
        match command.direction.as_str() {
            "forward" => {
                horizontal += command.position;
                depth += aim * command.position
            },
            "down" => aim += command.position,
            "up" => aim -= command.position,
            _ => ()
        }
    }

    return horizontal * depth;
}

fn parse(path: &str) -> Vec<Command> {
    let puzzle_input = fs::read_to_string(path).expect("err reading puzzle input!");
    let puzzle_input = puzzle_input.lines();

    let mut commands: Vec<Command> = Vec::new();

    for input in puzzle_input {
        let command: Vec<&str> = input.split(" ").collect();
        let direction = command[0].to_string();
        let position = command[1].parse().unwrap();

        commands.push(Command {
            direction,
            position,
        })
    }

    return commands;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_course_path() {
        assert_eq!(course_path("./example_input.txt"), 150);
    }

    #[test]
    fn test_corrected_course_path() {
        assert_eq!(corrected_course_path("./example_input.txt"), 900);
    }
}
