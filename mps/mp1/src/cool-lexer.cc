/*
 *  The lexical analyzer for COOL.
 */

#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>
#include <strings.h>
#include <regex>

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

////////////////////////////////Declarations/////////////////////

char lookNext();
char getNext();
int cool_yylex();
int getDigit();
int getID();
int skipComment();

/////////////////////////////End Declarations//////////////////// 

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

int getDigit()
{
  char buf[1024];
  int i = 0;
  while(lookNext() >= '0' && lookNext() <= '9')
  {
    buf[i] = getNext();
    i++;
  }
  buf[i] = '\0';
  cool_yylval.symbol = inttable.add_string(buf);
  return INT_CONST; 
}

int getID()
{
  char buf[1024];
  int i = 0;
  while((lookNext() >= 'a' && lookNext() <= 'z') || (lookNext() >= 'A' && lookNext() <= 'Z') || lookNext() == '_' || (lookNext() >= '0' && lookNext() <= '9'))
  {
    buf[i] = getNext();
    i++;
  }
  buf[i] = '\0';
  cool_yylval.symbol = idtable.add_string(buf);
  return OBJECTID; 
}

int skipComment()
{
  while(true)
  {
    switch(lookNext())
    {
      case EOF:
          cool_yylval.error_msg = "EOF in comment";
          return ERROR;
      case '\n':
        curr_lineno++;
        getNext();
        break;
      case '*':
        getNext();
        if (lookNext() == ')')
          return 0;
        else
          break;
      case '(':
        getNext();
        if (lookNext() == '*')
        {
          int x = skipComment();
          if(x != 0)
            return x;
          else
            break;
        }
      default:
        getNext();
    }
  }
}

int getString()
{
  char buf[1024];
  int i = 0;
  while(lookNext() != '"')
  {
    buf[i] = getNext();
    if(buf[i] == 00)
      {
      cool_yylval.error_msg = "Null in string constant";
      return ERROR;
    }
    if(buf[i] == -1)
    {
      cool_yylval.error_msg = "EOF in string constant";
      return ERROR;
    }
    if(buf[i] == '\n' && buf[i-1] != 92)
    {
      cool_yylval.error_msg = "Unterminated string constant";
      return ERROR;
    }
    i++;
  }
  if (buf[i] != '"')
  {
    cool_yylval.error_msg = "String constant too long";
    return ERROR;
  }

  buf[i] = '\0';
  cool_yylval.symbol = idtable.add_string(buf);
  return STR_CONST; 
}

// Returns the next token
// Modify this function to
// return the correct tokens
int cool_yylex()
{
    while(true) {
        char nxt = lookNext();
        if (nxt >= '0' && nxt <= '9')
          return getDigit();
        if (nxt >='a' && nxt <= 'z')
          return getID();
        switch(nxt)
        {
            case EOF:
                getNext();
                return 0;
            case ' ':
                getNext();
            break;
            case '\n':
                curr_lineno++;
                getNext();
            break;
            case '\t':
                getNext();
            break;
            case '\f':
                getNext();
            break;
            case '\r':
                getNext();
            break;
            case '\v':
                getNext();
            break;
            /* everything else */
            case '"':
                getNext();
                return getString();
            case '(':
                getNext();
                if (lookNext() == '*')
                {
                  int x= skipComment();
                  if(x != 0)
                    return x;
                  else
                    break;
                }
                return '(';
            case '.':
                getNext();
                return '.';
            case '@':
                getNext();
                return '@';
            case '~':
                getNext();
                return '~';
            case '+':
                getNext();
                return '+';
            case '}':
                getNext();
                return '}';
            case '{':
                getNext();
                return '{';
            case ')':
                getNext();
                return ')';
            case ':':
                getNext();
                return ':';
            case '<':
                getNext();
                if (lookNext() == '=')
                  {
                    getNext();
                    return LE;
                  }
                return '<';
            case '=':
                getNext();
                if (lookNext() == '>')
                  {
                    getNext();
                    return DARROW;
                  }
                return '=';
            case '/':
                getNext();
                return '/';
            case '*':
                getNext();
                if (lookNext() == ')')
                  {
                    getNext();
                    cool_yylval.error_msg = "Unmatched *)";
                    return ERROR;
                  }
                return '*';
            default:
                char em[2];
                em[0] = getNext();
                em[1] = '\0';
                cool_yylval.error_msg = em;
                return ERROR;
        }
    }
}
