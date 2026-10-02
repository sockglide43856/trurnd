OUTPUT ?= build

SRC_DIR   := src
BUILD_DIR := build
BIN_DIR   := bin
SRC       := $(SRC_DIR)/main.py
CY_C      := $(BUILD_DIR)/main.c
OBJ       := $(BUILD_DIR)/main.o
TARGET    := $(BIN_DIR)/$(OUTPUT)
CC        := gcc
PYTHON_CONFIG := python3-config
CFLAGS    := $(shell $(PYTHON_CONFIG) --cflags) -DCYTHON_COMPRESS_STRINGS=0 -I$(SRC_DIR)
LDFLAGS   := -mconsole -municode $(shell $(PYTHON_CONFIG) --ldflags --embed)

all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) $(OBJ) $(LDFLAGS) -o $(TARGET)
	@echo "Created binary successfully at $(TARGET)"

$(OBJ): $(CY_C)
	@mkdir -p $(BUILD_DIR)
	$(CC) -c $(CY_C) $(CFLAGS) -o $(OBJ)

$(CY_C): $(SRC)
	@mkdir -p $(BUILD_DIR)
	cython --embed -o $(CY_C) $(SRC)

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
	@echo "Cleaned up $(BUILD_DIR) and $(BIN_DIR)"

about:
	@echo "V1 of Makefile for trurnd - (c) 2026 sockglide43856, MIT license"
.PHONY: clean about
