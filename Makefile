# Compilateur et options
CC = gcc
CFLAGS = -O3 -std=c99 -Wall -Wextra -pedantic
LIBS = -lm

# Fichiers
TARGET = ascii3d
SRC = src/main.c
HEADER = ascii.h
CONVERTER = src/image_2_ascii.py

# Couleurs pour les messages (optionnel mais joli)
GREEN = \033[0;32m
NC = \033[0m

.PHONY: all build run clean example help

# Construction par défaut
all: build

# Compiler le binaire
build: $(SRC)
	@echo "$(GREEN)📦 Compilation de $(TARGET)...$(NC)"
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LIBS)
	@echo "$(GREEN)✅ Prêt ! Lance avec 'make run'$(NC)"

# Lancer l'animation
run: $(TARGET)
	./$(TARGET)

# Générer ascii.h à partir d'une image d'exemple
example: examples/github.png
	@echo "$(GREEN)🎨 Conversion de l'image exemple...$(NC)"
	python3 $(CONVERTER) $<
	@echo "$(GREEN)✅ Fichier $(HEADER) généré.$(NC)"

# Nettoyer les fichiers générés
clean:
	rm -f $(TARGET) $(HEADER)
	@echo "$(GREEN)🧹 Nettoyage terminé.$(NC)"

# Aide
help:
	@echo "🔧 Commandes disponibles :"
	@echo "  make          → compiler le projet"
	@echo "  make run      → lancer l'animation"
	@echo "  make example  → générer ascii.h depuis examples/logo.png"
	@echo "  make clean    → supprimer les fichiers compilés et ascii.h"
	@echo "  make help     → afficher cette aide"

# Dépendance : ne pas recompiler si rien n'a changé
$(TARGET): $(SRC)

