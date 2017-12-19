C_LIBS        = -lao -lmpg123 -ldl -lm
C_OPTS        = -O3 -Wall
ML_OPT_STRING = -O3 -g

SOURCE_DIR    = src
BUILD_DIR     = _build

OCAML_FILEs   =
C_FILES       =
EXECUTABLES   = 


ao:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && gcc -o prog libao_test.c $(C_LIBS) $(C_OPTS)
	cp $(BUILD_DIR)/prog prog

mp3:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && gcc -o prog libmpg123_test.c $(C_LIBS) $(C_OPTS)
	cp $(BUILD_DIR)/prog prog

ocaml:
	rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	cp $(SOURCE_DIR)/* $(BUILD_DIR)
	cd $(BUILD_DIR) && ocamlfind ocamlopt -o prog -cclib $(C_LIBS) -ccopt $(C_OPTS) $(OCAML_FILES) $(C_FILES) 
	cp $(BUILD_DIR)/prog prog

clean:
	rm -rf $(BUILD_DIR)
	rm prog

