CC = clang
CFLAGS = -Wall -g
SRC_DIR = src
BIN_DIR = bin
OBJ_DIR = obj
INC_DIR = include
TEMP_DIRS = $(BIN_DIR) $(OBJ_DIR)
SRCS = $(wildcard $(SRC_DIR)/*.c)
BINS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%, $(SRCS))
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

all:$(OBJS) $(BINS)

$(BIN_DIR)/%: $(OBJ_DIR)/%.o | $(TEMP_DIRS)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INC_DIR)/%.h | $(TEMP_DIRS)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -r $(BIN_DIR)/ $(OBJ_DIR)/

$(TEMP_DIRS):
	mkdir -p $(TEMP_DIRS)
