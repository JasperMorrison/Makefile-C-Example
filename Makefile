TARGET := build_dream

CONFIG_FILE := $(wildcard $(shell pwd)/config.mk)
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJ_DIR := obj
BIN_DIR := out

dirs := $(OBJ_DIR) $(BIN_DIR)
src_sub := dream_first
subs := dream_first libstatic libbuild librun

LDFLAGS += -L./libbuild/out -ldream
LDFLAGS += -L./libstatic/out -lstatic
LDFLAGS += -Wl,-rpath=./librun/out
CFLAGS += -I./include
CFLAGS += -DDEBUG

zipfile := build_dream.zip

include $(CONFIG_FILE)

.PHONY: all clean release
all: subs $(dirs) $(BIN_DIR)/$(TARGET)

$(dirs):
	mkdir $@ -p

subs:
	@for sub in $(subs); do \
		make -C $$sub CONFIG_FILE=$(CONFIG_FILE); \
	done

$(OBJ_DIR)/%.o:%.c
	 $(CC) $(CFLAGS) -c $<  -o $@ 

$(BIN_DIR)/$(TARGET): $(OBJ_DIR)/$(OBJS)
	 $(CC) -o $@ $(OBJ_DIR)/$(OBJS) $(shell for it in $(src_sub);do echo $$it/obj/*.o; done) $(CFLAGS) $(LDFLAGS)

release:zip

zip:$(zipfile)
	@zip $(zipfile) -r readme out lib_run > /dev/null

clean:
	@for sub in $(subs); do \
		make clean -C $$sub; \
	done
	@rm -rf $(dirs)
	@rm -f $(zipfile)
