.PHONY = clean
CC = g++
INCLUDE_DIR = ./include
OBJ_DIR = ./obj
BIN_DIR = ./bin
SRC_DIR = ./src
LIB_DIR = ./libs
THIRD_PARTY_DIR = ./third_party
TARGET = encryption
CFLAGS =  -Wall -g -std=c++17 -I $(INCLUDE_DIR)
DEBUGFLAGS = -O0 -D _DEBUG
MODE ?= debug

ifeq ($(MODE),release)
	DEBUGFLAGS = -O2 -D NODEBUG  -fwhole-program
endif

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(SRC_DIR)/%.o, $(wildcard $(SRC_DIR)/*.cpp))
all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/$@ $(patsubst %.o, $(OBJ_DIR)/%.o, $^)

%.o: %.cpp
	@mkdir -p $(OBJ_DIR)/$(dir $<)
	$(CC) $(CFLAGS) -c $< $(DEBUGFLAGS) -o $(OBJ_DIR)/$@

include ./tests/Makefile

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR) 