NAME_A = trabalho03_Q01_a
NAME_B = trabalho03_Q01_b
NAME_C = trabalho03_Q01_c

SRC_DIR = src
INC_DIR = include
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin
MAIN_DIR = programs

TARGET_A = $(BIN_DIR)/$(NAME_A)
TARGET_B = $(BIN_DIR)/$(NAME_B)
TARGET_C = $(BIN_DIR)/$(NAME_C)

CC = gcc
CFLAGS = -Wall -g 
CFLAGS2 = -Wall -g -lprimo

LIBRARY_NAME = libprimo

SRC = ${wildcard $(SRC_DIR)/*.c}
OBJ = ${addprefix $(OBJ_DIR)/, ${notdir ${SRC:.c=.o}}}

CREATE_STATIC_LIBRARY = ar cr $(LIB_DIR)/libprimo.a $(OBJ)

CREATE_DYNAMIC_LIBRARY = $(CC) -shared -fPIC -o $(LIB_DIR)/libprimo.so $(OBJ)

MAIN_A_OBJ = $(CC) -c $(CFLAGS) -I$(INC_DIR) $(PROGRAM_A) -o $(OBJ_DIR)/$(PROGRAM_A:.c=.o)
MAIN_B_OBJ = $(CC) -c $(CFLAGS) -I$(INC_DIR) $(PROGRAM_B) -o $(OBJ_DIR)/$(PROGRAM_B:.c=.o)

# Main Codes
PROGRAM_A = q01a.c
PROGRAM_B = q01b.c
PROGRAM_C = q01c.c

.PHONY: clean dist-clean

all:
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)

a: 
	@echo criando diretórios...
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)
	$(MAIN_A_OBJ)
	$(MAKE) $(OBJ)_static
	@echo criando biblioteca
	$(CREATE_STATIC_LIBRARY)
	@echo Criando executável com a. Carregando bibliotecas estaticamente...
	$(CC) $(OBJ) $(OBJ_DIR)/$(PROGRAM_A:.c=.o) -L$(LIB_DIR) $(CFLAGS2) -o $(TARGET_A)
	@echo terminado

b:
	@echo criando diretórios...
	@mkdir -p $(OBJ_DIR) $(BIN_DIR) $(LIB_DIR)
	$(MAIN_B_OBJ)
	$(MAKE) $(OBJ)_dynamic
	@echo criando biblioteca
	$(CREATE_DYNAMIC_LIBRARY)
	@echo Criando executável com b. Carregando bibliotecas dinamicamente...
	$(CC) $(OBJ) $(OBJ_DIR)/$(PROGRAM_B:.c=.o) -L$(LIB_DIR) $(CFLAGS2) -o $(TARGET_B)
	@echo terminado

$(OBJ_DIR)/%.o_static: $(SRC_DIR)/%.c 
	@echo construindo o objeto $(@:_static=)
	$(CC) -c $(CFLAGS) -I$(INC_DIR) $< -o $(@:_static=)

$(OBJ_DIR)/%.o_dynamic: $(SRC_DIR)/%.c 
	@echo construindo o objeto $(@:_dynamic=)
	$(CC) -c $(CFLAGS) -fPIC -I$(INC_DIR) $< -o $(@:_dynamic=)

clean:
	@echo Limpando....
	@find . -name *.o -exec rm {} \;
	@rm -rf *~ *.o prog out.txt

dist-clean: clean
	@echo Limpando com dist-clean...
	@rm -f $(TARGET_A)/$(NAME)
	@rm -rf $(BIN_DIR) $(OBJ_DIR) $(LIB_DIR)
