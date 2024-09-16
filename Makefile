include ./src/des/Makefile
include ./tests/Makefile
.PHONY = clean
CC = g++
INCLUDE_DIR = ./include
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = libs
TEST_DIR = tests
THIRD_PARTY_DIR = third_party
CFLAGS =  -Wall -g -std=c++17 -I $(INCLUDE_DIR)
DEBUGFLAGS = -O0 -D _DEBUG
MODE ?= debug

ifeq ($(MODE),release)
	DEBUGFLAGS = -O2 -D NODEBUG  -fwhole-program
endif

clean:
	rm -f buid/*