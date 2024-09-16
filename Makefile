.PHONY = clean
CC = g++
INCLUDE_DIR = ./include
OBJ_DIR = obj
BIN_DIR = bin
SRC_DIR = src
LIB_DIR = libs
TEST_DIR = tests
THIRD_PARTY_DIR = third_party
TARGET = $(BIN_DIR)/encryption
CFLAGS =  -Wall -g -std=c++17 -I $(INCLUDE_DIR)
DEBUGFLAGS = -O0 -D _DEBUG
MODE ?= debug

ifeq ($(MODE),release)
	DEBUGFLAGS = -O2 -D NODEBUG  -fwhole-program
endif

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))
$(info $(OBJS))
all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)