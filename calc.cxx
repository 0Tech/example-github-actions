#include <iostream>
#include <string>
#include <unordered_map>
#include <functional>
#include <sstream>

using std::operator""s;

int main(int argc, char* argv[]) {
  auto constexpr num_args{1 + 3};
  if (argc < num_args) {
	throw "not enough arguments"s;
  }

  std::string const binary_operator{argv[2]};
  std::unordered_map<std::string, std::function<int(int, int)>> const handlers{
	{"+"s, [](auto l, auto r) { return l + r; }}
  };
  if (not handlers.contains(binary_operator)) {
	throw "operator not supported: "s + binary_operator;
  } else {
	auto const handler{handlers.at(binary_operator)};
	auto constexpr to_integer{[](std::string str) {
	  std::stringstream ss;
	  ss << str;
	  int res;
	  ss >> res;
	  return res;
	}};
	std::cout << handler(to_integer(argv[1]), to_integer(argv[3])) << std::endl;
  }

  return 0;
}
