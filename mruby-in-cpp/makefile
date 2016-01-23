#########################################################
# makefile
#########################################################

cxx = clang++

# -std=c++0x specifies to use a certain language version.
cxxflags = -std=c++14

# mruby
cxxflags +=-Imruby/include  

# Turn on all warnings.
cxxflags += -Wall

# Treat errors as warnings.
cxxflags += -Werror

# -pedantic-errors strictly enforces the standard
cxxflags += -pedantic-errors

# -g turns on debug information
cxxflags += -g

prog1 = vigenere_plus_plus 
progs = $(prog1)

src1 = vigenere.cpp
srcs = $(src2)
src_main = main.cpp 

obj1 = vigenere.o
objs = $(obj1)

mruby = mruby/build/host/lib/libmruby.a

all: $(progs)

$(prog1): $(objs) $(src_main)
	$(cxx) $(cxxflags) $(objs) $(mruby) $(src_main) -o $(prog1)

$(obj2): $(src2) $(header2) 
	$(cxx) $(cxxflags) -c $(src2) 

clean:
	rm -f $(progs) $(objs)
