########################### BASE ###########################

NAME = ft_turing

SRC_PATH = ./src
OBJ_PATH = ./obj

SRC_FILES = main.ml
SOURCES = $(addprefix $(SRC_PATH)/, $(SRC_FILES))

CAMLC = ocamlc
CAMLOPT = ocamlopt

opt = $(NAME).opt
byt = $(NAME).byt

########################### RULES ###########################

all : $(NAME)

$(NAME): $(opt) $(byt)
	rm -f $(NAME)
	ln -s $(byt) $(NAME)

$(OBJ_PATH):
	mkdir -p $(OBJ_PATH)

OBJS = $(patsubst $(SRC_PATH)/%, $(OBJ_PATH)/%, $(SOURCES:.ml=.cmo))
OPTOBJS = $(patsubst $(SRC_PATH)/%, $(OBJ_PATH)/%, $(SOURCES:.ml=.cmx))

########################### LINK ###########################

$(byt):	$(OBJ_PATH) $(OBJS)
	$(CAMLC) -o $(byt) $(OBJS)

$(opt): $(OBJ_PATH) $(OPTOBJS)
	$(CAMLOPT) -o $(opt) $(OPTOBJS)

########################### COMPILATION ###########################

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx

$(OBJ_PATH)/%.cmo: $(SRC_PATH)/%.ml
	$(CAMLC) -c $^ -o $@

$(OBJ_PATH)/%.cmi: $(SRC_PATH)/%.mli
	$(CAMLC) -c $^ -o $@

$(OBJ_PATH)/%.cmx: $(SRC_PATH)/%.ml
	$(CAMLOPT) -c $^ -o $@

########################### CLEAN ###########################

clean:
	rm -rf $(OBJ_PATH)
	rm -f $(SOURCES:.ml=.cmi) $(SOURCES:.ml=.o) $(NAME).o

fclean:	clean
	rm -f $(NAME) $(byt) $(opt)

re:	fclean all

.PHONY = all clean fclean re
