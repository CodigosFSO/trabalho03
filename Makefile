NAME = trabalho03_Q01

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
BIN_DIR = bin

TARGET = $(BIN_DIR)/$(NAME)

CC = gcc
CFLAGS = -Wall -g

SRC = ${wildcard $(SRC_DIR)/*.c}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.c=.o}}}

# Main Code
PROGRAM_A = q01a.c

.PHONY: clean dist-clean

all:
	@mkdir -p $(OBJ_DIR) $(BIN_DIR)
	$(MAKE) $(TARGET)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@echo construindo o objeto $@
	@$(CC) -c $(CFLAGS) -I$(INC_DIR) $< -o $@
	@echo debug: $< $@

$(TARGET): $(OBJ)
	@echo criando executável...
	$(CC) $(OBJ) $(CFLAGS) -I$(INC_DIR) $(PROGRAM_A) -o $@
	@echo terminado

clean:
	@echo Limpando....
	@find . -name *.o -exec rm {} \;
	@rm -rf *~ *.o prog out.txt

dist-clean: clean
	@echo Limpando com dist-clean...
	@rm -f $(TARGET)/$(NAME)
	@rm -rf $(BIN_DIR)