NAME_B = trabalho03_Q01_b

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

TARGET_B = $(BIN_DIR)/$(NAME_B)

CC = gcc
CFLAGS = -Wall -g 
CFLAGS_DYNAMIC = -Wall -g -lprimo -Wl,-rpath,./lib

LIBRARY_NAME = libprimo

SRC = ${wildcard $(SRC_DIR)/*.c}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.c=.o}}}

CREATE_DYNAMIC_LIBRARY = $(CC) -shared -fPIC -o $(LIB_DIR)/libprimo.so $(OBJ)

# Main Codes
PROGRAM_B = q01b.c

.PHONY: clean dist-clean

all:
	@echo criando diretórios...
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)
	$(MAKE) $(OBJ)
	@echo criando biblioteca dinâmica
	$(CREATE_DYNAMIC_LIBRARY)
	@echo Criando executável com b. Carregando bibliotecas dinamicamente...
	$(CC) $(OBJ_DIR)/$(PROGRAM_B:.c=.o) -L$(LIB_DIR) $(CFLAGS_DYNAMIC) -o $(TARGET_B)
	@echo terminado

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c 
	@echo construindo o objeto $@
	$(CC) -c $(CFLAGS) -fPIC -I$(INC_DIR) $< -o $@

clean:
	@echo Limpando....
	@find . -name *.o -exec rm {} \;
	@rm -rf *~ *.o prog out.txt

dist-clean: clean
	@echo Limpando com dist-clean...
	@rm -f $(TARGET_B)/$(NAME)
	@rm -rf $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)
