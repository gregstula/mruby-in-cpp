#########################################################
# makefile
#########################################################

cxx = clang++

# -std=c++0x specifies to use a certain language version.
cxxflags = -std=c++14

# mruby
cxxflags += -I../../mruby/include  

# Turn on all warnings.
cxxflags += -Wall

# Treat errors as warnings.
cxxflags += -Werror

# -pedantic-errors strictly enforces the standard
#cxxflags += -pedantic-errors

# -g turns on debug information
cxxflags += -g

prog1 = vigenere_plus_plus 
progs = $(prog1)

header_main = vigenere.hpp
src_main = vigenere.cpp

src1 = mruby_state.cpp
header1 = mruby_state.hpp

obj1 = mruby_state.o
objs = $(obj1)

mruby = ../../mruby/build/host/lib/libmruby.a

all: $(progs)

$(prog1): $(objs) $(src_main) $(header_main)
	$(cxx) $(cxxflags) $(objs) $(mruby) $(src_main) -o $(prog1)

$(obj1): $(src1) $(header1) 
	$(cxx) $(cxxflags) -c $(src1) 

clean:
	rm -f $(progs) $(objs)
