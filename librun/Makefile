TARGET := libdream.so

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

$(OBJ_DIR)/%.o:%.c
	$(CC) -fPIC $(CFLAGS) -c $<  -o $@ 

$(BIN_DIR)/$(TARGET):$(OBJ_DIR)/$(OBJS)
	$(LD) -shared $<  -o $@ 

clean:
	@rm -rf $(dirs)
