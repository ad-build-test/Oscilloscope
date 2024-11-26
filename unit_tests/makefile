# Compiler and flags
CXX = g++                 # C++ compiler
CXXFLAGS = -std=c++11 -Wall # Compiler flags (e.g., C++11 standard and all warnings)

INCLUDES = -I.  # Look for header files in the tap++

# Source files
SRCS = tap++.cpp test.cpp     # List of source files (you can add more .cc files here)

# Object files (automatically derived from source files)
OBJS = $(SRCS:.cpp=.o)

# Target executable name
TARGET = my_program

# Libraries to link
# LIBS = -ltap++             # Example: link with tap++ library

# Library search paths (if libraries are in non-standard locations)
LIBPATHS = -L/usr/local/lib # Example: add custom library search path

# Default target to build the executable
all: $(TARGET)

# Rule to create the executable from object files
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) $(LIBPATHS) $(LIBS) -o $(TARGET)

# Rule to compile .cc files into .o object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean up object files and executable
clean:
	rm -f $(OBJS) $(TARGET)

# Run the program (optional)
run: $(TARGET)
	./$(TARGET)

