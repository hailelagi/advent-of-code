mod sonar_sweep {
    pub fn depth_measurement(path: &str) -> u32 {
        // todo
        return 0
    }

    pub fn sum_depth_measurement(path: &str) -> u32 {
        // todo
        return 0
    }

    parse(path: &str) {
        // todo: read text file input, 
        // return an array
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_depth_measurement() {
        assert_eq!(sonar_sweep::depth_measurement("../example_input.txt"), 7);
    }

    #[test]
    fn test_sum_depth_measurement() {
        assert_eq!(sonar_sweep::sum_depth_measurement("../example_input.txt"), 5);
    }
}
