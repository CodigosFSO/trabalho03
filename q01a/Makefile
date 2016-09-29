NAME_A = trabalho03_Q01_a

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

TARGET_A = $(BIN_DIR)/$(NAME_A)

CC = gcc
CFLAGS = -Wall -g 
CFLAGS_STATIC = -Wall -g -lprimo

LIBRARY_NAME = libprimo

SRC = ${wildcard $(SRC_DIR)/*.c}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.c=.o}}}

CREATE_STATIC_LIBRARY = ar cr $(LIB_DIR)/libprimo.a $(OBJ)

.PHONY: clean dist-clean

all:
	@echo criando diretórios...
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)
	$(MAKE) $(OBJ)
	@echo criando biblioteca estatica
	$(CREATE_STATIC_LIBRARY)
	@echo Criando executável com a. Carregando bibliotecas estaticamente...
	$(CC) -static $(OBJ) -L$(LIB_DIR) $(CFLAGS_STATIC) -o $(TARGET_A)
	@echo terminado

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c 
	@echo construindo o objeto $@
	$(CC) -c $(CFLAGS) -I$(INC_DIR) $< -o $@

clean:
	@echo Limpando....
	@find . -name *.o -exec rm {} \;
	@rm -rf *~ *.o prog out.txt

dist-clean: clean
	@echo Limpando com dist-clean...
	@rm -f $(TARGET_A)/$(NAME)
	@rm -rf $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)
