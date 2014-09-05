/*
 *  The lexical analyzer for COOL.
 *  cool-lexer.cc: a skeleton lexer that you will need to change completely to write your lexical analyzer.
 */

/*
cool-lexer.cc
    This file contains a skeleton lexical analyzer for cool. Right now, it does not do much. It returns
    an error string for each character it encounters till it reaches EOF (end of file).
    The function cool yylex() should return the next token. You are free to design your lexer using
    any suitable method. However, you may not use a tool to generate the lexer.
    Functions getNext() and lookNext() return the next character from the file, the former moves
    the pointer to the next character, while the latter does not. You can use the functions as provided.
    Feel free to modify anything in this file, but make sure it works as expected with other provided
    files.
*/

#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>
#include <strings.h>
#include <errno.h>
#include <stdlib.h>

/* Max size of string constants */
#define MAX_STR_CONST 1025

extern FILE *fin; /* we read from this file */

extern int curr_lineno;
extern int verbose_flag;

int yy_flex_debug;

extern YYSTYPE cool_yylval;

/* read file character by character */
char next;
bool nread;

// Returns the next character
// without moving the file pointer
char lookNext()
{
    if(!nread)
    {
        next = fgetc(fin);
        nread = true;
    }

    return next;
}

// Returns the next character
// and moves the file pointer ahead
char getNext()
{
    char cur = lookNext();
    if(cur != EOF)
        next = fgetc(fin);
    else
        nread = false;
    return cur;
}

// Returns the next token
// Modify this function to
// return the correct tokens
int cool_yylex()
{
    while(true) {
        char nxt = lookNext();
        switch(nxt)
        {
            case EOF:
                getNext();
                return 0;

            /* everything else */
            default:
                char em[2];
                em[0] = getNext();
                em[1] = '\0';
                cool_yylval.error_msg = em;
                return ERROR;
        }
    }
}
