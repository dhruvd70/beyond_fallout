CC=gcc
DB=gdb
CFLAGS=-g
BUILD_DIR=build/
BIN_DIR=bin/
BUILD_DIRS=dir
OBJS= 	$(BUILD_DIR)beyond_fallout.o	\
		${BUILD_DIR}parse_exec.o		\

all: $(BUILD_DIRS) beyond_fallout

beyond_fallout:$(OBJS)
	${CC} ${CFLAGS} ${OBJS} -o $(BIN_DIR)beyond_fallout
	@echo
	@echo BUILD COMPLETE!!

$(BUILD_DIR)beyond_fallout.o:beyond_fallout.c
	${CC} ${CFLAGS} -c beyond_fallout.c -o ${BUILD_DIR}beyond_fallout.o

${BUILD_DIR}parse_exec.o:parse_exec/parse_exec.c
	${CC} ${CFLAGS} -c parse_exec/parse_exec.c -o ${BUILD_DIR}parse_exec.o

$(BUILD_DIRS):
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

clean:
	rm -rf build bin

debug: $(BUILD_DIRS) beyond_fallout
	${DB} ./bin/beyond_fallout

run: $(BUILD_DIRS) beyond_fallout
	./bin/beyond_fallout