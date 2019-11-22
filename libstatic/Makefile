TARGET := libstatic.a

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJ_DIR := obj
BIN_DIR := out

dirs := $(OBJ_DIR) $(BIN_DIR)

CFLAGS += -I./include

include $(CONFIG_FILE)

.PHONY: all clean
all: $(dirs) $(BIN_DIR)/$(TARGET)

$(dirs):
	mkdir $@ -p

objs: $(OBJ_DIR)/$(OBJS)
$(OBJ_DIR)/%.o:%.c
	$(CC) $(CFLAGS) -c $<  -o $@ 

$(BIN_DIR)/$(TARGET): $(OBJ_DIR)/$(OBJS)
	$(AR) -rcs -o $@ $(OBJ_DIR)/$(OBJS)

clean:
	@rm -rf $(dirs)
