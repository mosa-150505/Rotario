CC = gcc
CFLAGS = -O3 -std=c99 -Wall -Wextra -pedantic -I. -Wno-overlength-strings
LIBS = -lm

TARGET = ascii3d
SRC = src/main.c
HEADER = ascii.h
CONVERTER = src/image_2_ascii.py

GREEN = \033[0;32m
NC = \033[0m

.PHONY: all build run rotario clean help check-pydeps

all: $(HEADER) build

build: $(SRC) $(HEADER)
	@printf "\n$(GREEN)... Compiling $(TARGET)...$(NC)\n"
#	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LIBS)
	@printf "\n$(GREEN)... Ready ...$(NC)\n"

$(HEADER): examples/github.png
	@printf "\n$(GREEN)Generating ...$@\n"
	@[ -f "$(CONVERTER)" ] || { echo "Cannot find $(CONVERTER)"; exit 1; }
	@python3 -c "import PIL" >/dev/null 2>&1 || { echo "Need to install Pillow lib"; exit 1; }
	@cd src && python3 image_2_ascii.py ../$< && mv ascii.h ..
	@printf "$(GREEN)✓ $(HEADER) généré$(NC)\n"

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET) $(HEADER) core
	@printf "\n$(GREEN)Cleaned ...$(NC)\n"

help:
	@printf "🔧 Commandes :\n"
	@printf "  make        → generate ascii.h then compile\n"
	@printf "  make run    → launch 3D animation\n"
	@printf "  make clean  → clean some garbage\n"
	@printf "  make help   → display help\n"
