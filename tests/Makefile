TEST_DIR = ./tests
TEST = $(wildcard $(TEST_DIR)/*.cpp)
test_%: $(SRC_DIR)/%.cpp $(TEST_DIR)/test_%.cpp
	make $(patsubst %.cpp, %.o, $<) && \
	make $(TEST_DIR)/$@.o && \
	mkdir -p $(BIN_DIR) && \
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -o $(BIN_DIR)/$@ $(patsubst %.cpp, $(OBJ_DIR)/%.o, $^) 