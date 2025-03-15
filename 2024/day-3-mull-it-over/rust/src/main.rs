use nom::{
    bytes::complete::tag,
    character::complete::i32,
    sequence::{delimited, separated_pair},
    IResult,
};
use std::fs;

#[derive(Debug, PartialEq)]
pub struct Mult {
    pub x: i32,
    pub y: i32,
}

// https://github.com/rust-bakery/nom/blob/main/doc/choosing_a_combinator.md
fn main() {
    println!("{:?}", mul_corrupted("../puzzle_input.txt"));
    println!("{:?}", enabled_mul_corrupted("../puzzle_input.txt"));
}

fn parse_integer_pair(input: &str) -> IResult<&str, (i32, i32)> {
    separated_pair(i32, tag(","), i32)(input)
}

fn parse_mul(input: &str) -> IResult<&str, Mult> {
    let (remaining, (x, y)) = delimited(tag("mul("), parse_integer_pair, tag(")"))(input)?;

    Ok((remaining, Mult { x, y }))
}

fn parse_do(input: &str) -> IResult<&str, &str> {
    tag("do()")(input)
}

fn parse_dont(input: &str) -> IResult<&str, &str> {
    tag("don't()")(input)
}

fn mul_corrupted(path: &str) -> i32 {
    let memory = parse(path);
    let mut muls = Vec::new();
    let mut i = 0;

    while i < memory.len() {
        if let Ok((remaining, mul)) = parse_mul(&memory[i..]) {
            muls.push(mul);
            i = memory.len() - remaining.len();
        } else {
            i += 1;
        }
    }

    muls.iter().map(|m| m.x * m.y).sum()
}

fn enabled_mul_corrupted(path: &str) -> i32 {
    let memory = parse(path);
    let mut muls = Vec::new();
    let mut disabled = false;
    let mut i = 0;

    while i < memory.len() {
        if let Ok((remaining, _)) = parse_dont(&memory[i..]) {
            i = memory.len() - remaining.len();
            disabled = true;
        } else if let Ok((remaining, _)) = parse_do(&memory[i..]) {
            i = memory.len() - remaining.len();
            disabled = false
        } else if let Ok((remaining, mul)) = parse_mul(&memory[i..]) {
            i = memory.len() - remaining.len();
            if disabled {
                continue;
            } else {
                muls.push(mul);
            }
        } else {
            i += 1;
        }
    }

    muls.iter().map(|m| m.x * m.y).sum()
}

fn parse(path: &str) -> String {
    fs::read_to_string(path)
        .expect("err reading puzzle input!")
        .chars()
        .filter(|c| !c.is_whitespace())
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_multiplications() {
        assert_eq!(mul_corrupted("../example_input.txt"), 161)
    }

    #[test]
    fn test_enabled_multiplications() {
        assert_eq!(enabled_mul_corrupted("../example_input_two.txt"), 48)
    }
}
