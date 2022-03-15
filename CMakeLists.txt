cmake_minimum_required(VERSION 3.18)

project(example-github-actions)

set(CMAKE_CXX_STANDARD 20)

include(GNUInstallDirs)

add_executable(calc)
target_sources(calc
  PRIVATE calc.cxx)
install(TARGETS
  calc
  RUNTIME)
