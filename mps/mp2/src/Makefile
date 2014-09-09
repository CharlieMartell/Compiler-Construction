SUPPORTDIR= ../cool-support
LIB= 
PARSERCGEN= cool-parser.cc
COMMON_CSRC= stringtab.cc handle_flags.cc utilities.cc
PARSER_CSRC= parser-phase.cc dumptype.cc tree.cc cool-tree.cc tokens-lex.cc 
PARSER_CFILES= $(PARSER_CSRC) ${PARSERCGEN} ${COMMON_CSRC}
PARSER_OBJS= ${PARSER_CFILES:.cc=.o} 
CFLAGS= -g -Wall -Wno-unused -Wno-deprecated -DDEBUG ${CPPINCLUDE}
CPPINCLUDE= -I. -I${SUPPORTDIR}/include 
CC= g++

all: parser
parser: ${PARSER_OBJS}
	${CC} ${CFLAGS} ${PARSER_OBJS} ${LIB} -o parser

.cc.o:
	${CC} ${CFLAGS} -c $<

${PARSER_CSRC} ${COMMON_CSRC}:
	-ln -s ${SUPPORTDIR}/src/$@ $@

clean :
	-rm -f core ${PARSER_OBJS} \
        parser *~ *.output

realclean: clean
	-rm -f ${PARSER_CSRC} ${COMMON_CSRC}
