# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jpalves/Trabalho/Álgebra/novo/NumCpp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build

# Include any dependencies generated for this target.
include examples/teste/CMakeFiles/teste.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/teste/CMakeFiles/teste.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/teste/CMakeFiles/teste.dir/progress.make

# Include the compile flags for this target's objects.
include examples/teste/CMakeFiles/teste.dir/flags.make

examples/teste/CMakeFiles/teste.dir/teste.cpp.o: examples/teste/CMakeFiles/teste.dir/flags.make
examples/teste/CMakeFiles/teste.dir/teste.cpp.o: ../examples/teste/teste.cpp
examples/teste/CMakeFiles/teste.dir/teste.cpp.o: examples/teste/CMakeFiles/teste.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/teste/CMakeFiles/teste.dir/teste.cpp.o"
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/teste/CMakeFiles/teste.dir/teste.cpp.o -MF CMakeFiles/teste.dir/teste.cpp.o.d -o CMakeFiles/teste.dir/teste.cpp.o -c /home/jpalves/Trabalho/Álgebra/novo/NumCpp/examples/teste/teste.cpp

examples/teste/CMakeFiles/teste.dir/teste.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teste.dir/teste.cpp.i"
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jpalves/Trabalho/Álgebra/novo/NumCpp/examples/teste/teste.cpp > CMakeFiles/teste.dir/teste.cpp.i

examples/teste/CMakeFiles/teste.dir/teste.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teste.dir/teste.cpp.s"
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jpalves/Trabalho/Álgebra/novo/NumCpp/examples/teste/teste.cpp -o CMakeFiles/teste.dir/teste.cpp.s

# Object files for target teste
teste_OBJECTS = \
"CMakeFiles/teste.dir/teste.cpp.o"

# External object files for target teste
teste_EXTERNAL_OBJECTS =

../examples/teste/bin/teste: examples/teste/CMakeFiles/teste.dir/teste.cpp.o
../examples/teste/bin/teste: examples/teste/CMakeFiles/teste.dir/build.make
../examples/teste/bin/teste: /usr/lib/x86_64-linux-gnu/libboost_system.a
../examples/teste/bin/teste: /usr/lib/x86_64-linux-gnu/libboost_filesystem.a
../examples/teste/bin/teste: examples/teste/CMakeFiles/teste.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../examples/teste/bin/teste"
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/teste.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/teste/CMakeFiles/teste.dir/build: ../examples/teste/bin/teste
.PHONY : examples/teste/CMakeFiles/teste.dir/build

examples/teste/CMakeFiles/teste.dir/clean:
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste && $(CMAKE_COMMAND) -P CMakeFiles/teste.dir/cmake_clean.cmake
.PHONY : examples/teste/CMakeFiles/teste.dir/clean

examples/teste/CMakeFiles/teste.dir/depend:
	cd /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jpalves/Trabalho/Álgebra/novo/NumCpp /home/jpalves/Trabalho/Álgebra/novo/NumCpp/examples/teste /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste /home/jpalves/Trabalho/Álgebra/novo/NumCpp/build/examples/teste/CMakeFiles/teste.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/teste/CMakeFiles/teste.dir/depend

