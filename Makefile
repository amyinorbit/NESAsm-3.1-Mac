CXX = clang
CXXFLAGS = -c -O3 -std=c99 -arch x86_64
LDFLAGS = -arch x86_64 -mmacosx-version-min=10.14
DIR = .
OBJECTS_DIR = $(DIR)/obj/
OUTPUT_DIR = $(DIR)/build/
SOURCE_DIR = $(DIR)/src/
FILES = $(OBJECTS_DIR)assemble.o \
	$(OBJECTS_DIR)code.o \
	$(OBJECTS_DIR)command.o \
	$(OBJECTS_DIR)crc.o \
	$(OBJECTS_DIR)expr.o \
	$(OBJECTS_DIR)func.o \
	$(OBJECTS_DIR)input.o \
	$(OBJECTS_DIR)macro.o \
	$(OBJECTS_DIR)main.o \
  1
	$(OBJECTS_DIR)map.o \
	$(OBJECTS_DIR)mml.o \
	$(OBJECTS_DIR)nes.o \
	$(OBJECTS_DIR)output.o \
	$(OBJECTS_DIR)pce.o \
	$(OBJECTS_DIR)pcx.o \
	$(OBJECTS_DIR)proc.o \
	$(OBJECTS_DIR)symbol.o
EXE = nesasm

$(EXE): $(FILES)
	mkdir -p $(OUTPUT_DIR)
	$(CXX) $(LDFLAGS) $(FILES) -o $(OUTPUT_DIR)$@

$(OBJECTS_DIR)%.o: $(SOURCE_DIR)%.c
	mkdir -p $(OBJECTS_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

install: $(EXE)
	cp $(OUTPUT_DIR)$(EXE) ~/Dropbox/bin/$(EXE)

clean:
	rm -rf $(OBJECTS_DIR)*.o
	rm -rf $(OUTPUT_DIR)$(EXE)
