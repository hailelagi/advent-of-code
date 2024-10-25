cmake_minimum_required(VERSION 3.14)
project(aoc)

# GoogleTest requires at least C++14
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
)

FetchContent_MakeAvailable(googletest)

file(GLOB_RECURSE SOURCES LIST_DIRECTORIES true *.h *.cpp *.cc)

enable_testing()

add_executable(main main.cc)

add_executable(day_one_test day_one_test.cc)

add_library(day_one day_one.cc)

# todo: why is this broken?
target_link_libraries(
  day_one_test
  GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(day_one_test)
