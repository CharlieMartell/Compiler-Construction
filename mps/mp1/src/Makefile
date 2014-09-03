SUPPORTDIR= ../cool-support
LIB= 
FLEXGEN= cool-lexer.cc
COMMON_CSRC= stringtab.cc handle_flags.cc utilities.cc
FLEX_CSRC= lextest.cc   
FLEX_CFILES= ${FLEX_CSRC} ${FLEXGEN} ${COMMON_CSRC} 
FLEX_OBJS= ${FLEX_CFILES:.cc=.o} 
CFLAGS= -g -Wall -Wno-unused -Wno-deprecated -DDEBUG ${CPPINCLUDE}
CPPINCLUDE= -I. -I${SUPPORTDIR}/include 
CC= g++

all: lexer
lexer: ${FLEX_OBJS}
	${CC} ${CFLAGS} ${FLEX_OBJS} ${LIB} -o lexer

.cc.o:
	${CC} ${CFLAGS} -c $<

${FLEXGEN:.cc.o}: ${FLEXGEN}
	${CC} ${CFLAGS} -c $<

${FLEX_CSRC} ${BISON_CSRC} ${COMMON_CSRC}:
	-ln -s ${SUPPORTDIR}/src/$@ $@

clean :
	-rm -f core ${FLEX_OBJS} \
        lexer *~ *.output

realclean: clean
	-rm -f ${FLEX_CSRC} ${COMMON_CSRC}
