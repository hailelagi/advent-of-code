## Building

Expects google test in  `PATH`, maybe auto detect brew version?
```zsh
git clone https://github.com/google/googletest.git  
```

## Formatting
```
brew install clang-format
```

finally banishing cmake:
```zsh
zig build
zig build test
zig build run
```
