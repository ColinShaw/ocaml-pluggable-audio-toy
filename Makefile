C_LIBS        = -lao -lmpg123 -ldl -lm
C_OPTS        = -O3 -Wall
ML_OPT_STRING = -O3 -g

SOURCE_DIR    = src
BUILD_DIR     = _build

OCAML_FILEs   =
C_FILES       =
EXECUTABLES   = aolib mp3 ocaml


aolib:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && gcc -o aolib aolib.c $(C_LIBS) $(C_OPTS)
	cp $(BUILD_DIR)/aolib aolib

mp3:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && gcc -o mp3 mp3.c $(C_LIBS) $(C_OPTS)
	cp $(BUILD_DIR)/mp3 mp3

ocaml:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && ocamlfind ocamlopt -o ocaml -cclib $(C_LIBS) -ccopt $(C_OPTS) $(OCAML_FILES) $(C_FILES) 
	cp $(BUILD_DIR)/$(EX_OUT_FILE) $(EX_OUT_FILE)

clean:
	rm -rf $(BUILD_DIR)
	rm $(EXECUTABLES) 

