all: compile_unopt compile_opt 

run_opt: compile_opt
	./main_optimized

run_unopt: compile_unopt
	./main_unoptimized

compile_opt:
	swiftc -o main_optimized -O main.swift

compile_unopt:
	swiftc -o main_unoptimized main.swift

