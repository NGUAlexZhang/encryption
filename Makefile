.PHONY = clean
CC = g++
INCLUDE_DIR = ./include
OBJ_DIR = ./obj
BIN_DIR = ./bin
SRC_DIR = ./src
LIB_DIR = ./libs
TEST_DIR = ./tests
THIRD_PARTY_DIR = ./third_party
TARGET = $(BIN_DIR)/encryption
CFLAGS =  -Wall -g -std=c++17 -I $(INCLUDE_DIR)
DEBUGFLAGS = -O0 -D _DEBUG
MODE ?= debug

ifeq ($(MODE),release)
	DEBUGFLAGS = -O2 -D NODEBUG  -fwhole-program
endif

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, %.o, $(wildcard $(SRC_DIR)/*.cpp))
all: $(TARGET)
$(info $(OBJS))
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(patsubst %.o, $(OBJ_DIR)/%.o, $^)

%.o: $(SRC_DIR)/%.cpp
	@mkdir -p obj
	$(CC) $(CFLAGS) -c $< $(DEBUGFLAGS) -o $(OBJ_DIR)/$@
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) 