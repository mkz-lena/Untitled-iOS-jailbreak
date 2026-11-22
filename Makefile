.PHONY: core-build core-test clean
core-build:
	cmake -S Core -B build/core -DCMAKE_BUILD_TYPE=Release
	cmake --build build/core --parallel
core-test: core-build
	cc -std=c11 -Wall -Wextra -Werror -ICore/include Tests/test_core.c Core/src/arijb_core.c -o build/test_core
	./build/test_core
clean:
	rm -rf build
