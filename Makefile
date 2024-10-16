# Enter the libs you need
CLIBS = 
CFLAGS = -Wall -Wextra -Wconversion -pedantic -std=c99
SRC_FOLDER = src
OUTPUT_FOLDER = $(SRC_FOLDER)/output
OUTPUT_FILE = $(OUTPUT_FOLDER)/app

# OS detection (if Windows, append .exe to output)
OS := $(shell uname -s)
ifeq ($(OS), Windows_NT)
    OUTPUT_FILE := $(OUTPUT_FOLDER)/app.exe
endif

# Find all source files in the src folder
SRC_FILES = $(wildcard $(SRC_FOLDER)/*.c)

# Object files will be placed in the output folder
OBJ_FILES = $(patsubst $(SRC_FOLDER)/%.c, $(OUTPUT_FOLDER)/%.o, $(SRC_FILES))

# Target to build object files and link them
build: $(OUTPUT_FOLDER) $(OUTPUT_FILE)

# Compile each .c file into .o in the output folder
$(OUTPUT_FOLDER)/%.o: $(SRC_FOLDER)/%.c
	gcc $(CFLAGS) -c $< -o $@

# Link the object files into the final executable
$(OUTPUT_FILE): $(OBJ_FILES)
	gcc $(CFLAGS) -o $@ $(OBJ_FILES) $(CLIBS)

# Create the output folder if it doesn't exist
$(OUTPUT_FOLDER):
	@if not exist $(OUTPUT_FOLDER) mkdir $(OUTPUT_FOLDER)

# Run the program from the output folder
run: $(OUTPUT_FILE)
	./$(OUTPUT_FILE)

# Clean up the output folder
clean:
	rm -f $(OUTPUT_FOLDER)/*
ifeq ($(OS), Windows_NT)
	del /Q $(OUTPUT_FOLDER)\*
endif

