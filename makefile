# define compiler
CXX=clang++

# define compiler flags
CXXFLAGS=-std=c++17 -pedantic -Wall -Wextra -fsanitize=address,undefined `sdl2-config --libs --cflags` -lSDL2_image

# define source files
SRCS=test.cpp

# define object files
OBJS=$(SRCS:%.cpp=%.o)

# define target executable
TARGET=test

# build rule for object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# build rule for target executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# phony target to clean up generated files
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)