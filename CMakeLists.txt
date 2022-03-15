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
  COMMAND sh -c "[ 3 = $($<TARGET_FILE:calc> 2 + 1) ]")
