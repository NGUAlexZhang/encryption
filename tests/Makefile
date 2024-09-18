TEST_DIR = ./tests
TEST = $(wildcard $(TEST_DIR)/*.cpp)
$(info $(wildcard $(SRC_DIR)/des/*.cpp))
test_%: %/*.cpp $(TEST_DIR)/test_%.cpp
	make $(patsubst %.cpp, %.o, $^)
	mkdir -p $(BIN_DIR) 
	$(CC) $(CFLAGS) $(DEBUGFLAGS) -o $(BIN_DIR)/$@ $(patsubst %.cpp, $(OBJ_DIR)/%.o, $^) 