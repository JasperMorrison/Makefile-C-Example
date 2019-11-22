SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJ_DIR := obj

dirs := $(OBJ_DIR) $(BIN_DIR)

CFLAGS += -I./include

include $(CONFIG_FILE)

.PHONY: all clean
all: $(dirs) $(OBJ_DIR)/$(OBJS)

$(dirs):
	mkdir $@ -p

$(OBJ_DIR)/$(OBJS):$(SRCS)
	$(CC) $(CFLAGS) -c $<  -o $@ 

clean:
	@rm -rf $(dirs)
