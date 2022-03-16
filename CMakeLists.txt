cmake_minimum_required(VERSION 3.18)

project(example-github-actions)
enable_testing()

set(CMAKE_CXX_STANDARD 20)

include(GNUInstallDirs)

add_executable(calc)
target_sources(calc
  PRIVATE calc.cxx)
install(TARGETS
  calc
  RUNTIME)
add_test(NAME test_add
  COMMAND sh -c "[ 3 -eq $($<TARGET_FILE:calc> 2 + 1) ]")
add_test(NAME test_subtract
  COMMAND sh -c "[ 1 -eq $($<TARGET_FILE:calc> 2 - 1) ]")
add_test(NAME test_multiply
  COMMAND sh -c "[ 8 -eq $($<TARGET_FILE:calc> 4 \\* 2) ]")
add_test(NAME test_divide
  COMMAND sh -c "[ 2 -eq $($<TARGET_FILE:calc> 4 / 2) ]")
