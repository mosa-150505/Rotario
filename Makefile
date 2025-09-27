CC = gcc
CFLAGS = -O3 -std=c99 -Wall -Wextra -pedantic -I. -Wno-overlength-strings
LIBS = -lm

TARGET = ascii3d
SRC = src/main.c
HEADER = ascii.h
CONVERTER = src/image_2_ascii.py


GREEN = \033[0;32m
NC = \033[0m

.PHONY: all build run clean example help

all: build

# Binary compilation
build: $(SRC)
	@printf "\n$(GREEN)... Compiling $(TARGET)...$(NC)\n"
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LIBS)
	@printf "\n$(GREEN):) Ready !! You can run with 'make run'$(NC)\n"

# Starting animation
run: $(TARGET)
	./$(TARGET)

# Generate aschii.h from a given PNG image
rotario: examples/github.png
	@printf "\n$(GREEN)... Converting your image ...$(NC)\n"
	python3 $(CONVERTER) $<
	@printf "\n$(GREEN) file successfully generated$(NC)\n"

# Cleaning data
clean:
	rm -f $(TARGET) $(HEADER)
	@printf "\n(^-^)$(GREEN) Successfully cleaned$(NC)\n"

# Aide
help:
	@printf "🔧 Help commands :\n"
	@printf "  make          → to compile rotario\n"
	@printf "  make run      → to lauch animation\n"
	@printf "  make example  → generate ascii.h from examples/github.png\n"
	@printf "  make clean    → delete compiled files\n"
	@printf "  make help     → to display help\n"
