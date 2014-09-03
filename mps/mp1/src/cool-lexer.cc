/*
 *  The lexical analyzer for COOL.
 */

#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>
#include <strings.h>

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
