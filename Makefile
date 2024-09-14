.PHONY = clean

INCLUDE_DIR = ./include
CFLAGS = -I $(INCLUDE_DIR) -Wall -g
clean:
	rm -f buid/*

encryption: ./src/main.cpp ./include/boxes.hpp
	g++ $(CFLAGS) -o build/encryption ./src/main.cpp

test: ./tests/*
