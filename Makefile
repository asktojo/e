#############################################
#     MAKEFILE FOR A GENERIC C PROJECT      #
#############################################
#                                           #
# This is a simple Projectmanagement script #
#     written and maintained by asktobi     #
#                                           #
#                                           #
#                                           #
# Im writing this for everyone so pls feel  #
# free to edit, modify and change the whole #
#        Makefile as much as u like.        #
#                                           #
#            git-contributers :             #
#                                           #
#                                           #
#                                           #
#############################################


# The main git repository
 GITREPO  = https://github.com/asktobi/e.git

# The C compiler u wanna use
 COMPILER = gcc
 LINKER   = gcc

# General Optimization flags
 CCFLAGS  =
 LKFLAGS  =

# Library flags
 LIBS     = -lpthread -lncurses

# Different executeables you can build
 MAIN     = bin/e
 TESTS   := $(wildcard src/*.test)

# Source files
 SRC     := $(wildcard src/*.c)

# Header files
 HDR     := $(wildcard hdr/*.h)

# ast/* is for data thats loaded at runtime
 AST     := $(wildcard ast/*.img) $(wildcard ast/*.msk) $(wildcard ast/*.db) 

# Lets make know these are not meant to be files
.PHONY: all debug getdeps clean  

# first rule is the one executed when make has no Arguments
all: $(MAIN)

debug:
	$(COMPILER) $(DEBUG) $(CCFLAGS) $(LKFLAGS) -o bin/debug

# Compiling the main executable
$(MAIN): $(SRC) $(HDR)
	$(COMPILER) $(CCFLAGS) $(LKFLAGS) $(LIBS) -o $@ $(SRC)

# Tests
$(TESTS):
	$(CC) $(DEBUG) $(CCFLAGS) $(LKFLAGS) -o $@ 

# Some stuff that was usefull in the past and might be in the future
#
#$(SRC): %.o : %.c $(HDR) 
#	$(CC) $(CCFLAGS) -o $@ $<

getdeps: 
	echo "BIN: $(MAIN) $(TESTS)"
	echo "SRC: $(SRC)"
	echo "HDR: $(HDR)"
	echo "AST: $(AST)"

# Clean the project from any build and temporary files
clean:
	rm -rf $(MAIN)
