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

////////////////////////////////Declarations/////////////////////

char lookNext();
char getNext();
int cool_yylex();
int getDigit();
int getObjectID();
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

bool isEqual(const std::string& a, const std::string& b)
{
    unsigned int sz = a.size();
    if (b.size() != sz)
        return false;
    for (unsigned int i = 0; i < sz; ++i)
        if (tolower(a[i]) != tolower(b[i]))
            return false;
    return true;
}

int getTFKeyword(char x[])
{
  std::string str(x);
  if (isEqual(str,"class"))
    return CLASS;
  if (isEqual(str,"else"))
    return ELSE;
  if(isEqual(str,"false"))
  {
    cool_yylval.boolean = false;
    return BOOL_CONST; 
  }
  if(isEqual(str,"true"))
  {
    cool_yylval.boolean = true;
    return BOOL_CONST; 
  }
  if(isEqual(str,"fi"))
    return FI;
  if(isEqual(str,"if"))
    return IF;
  if(isEqual(str,"in"))
    return IN;
  if(isEqual(str,"inherits"))
    return INHERITS;
  if(isEqual(str,"isvoid"))
    return ISVOID;
  if(isEqual(str,"let"))
    return LET;
  if(isEqual(str,"loop"))
    return LOOP;
  if(isEqual(str,"pool"))
    return POOL;
  if(isEqual(str,"then"))
    return THEN;
  if(isEqual(str,"while"))
    return WHILE;
  if(isEqual(str,"case"))
    return CASE;
  if(isEqual(str,"esac"))
    return ESAC;
  if(isEqual(str,"new"))
    return NEW;
  if(isEqual(str,"of"))
    return OF;
  if(isEqual(str,"not"))
    return NOT;
  return 666;
}

int getKeyword(char x[])
{
  std::string str(x);
  if (isEqual(str,"class"))
    return CLASS;
  if (isEqual(str,"else"))
    return ELSE;
  if(isEqual(str,"fi"))
    return FI;
  if(isEqual(str,"if"))
    return IF;
  if(isEqual(str,"in"))
    return IN;
  if(isEqual(str,"inherits"))
    return INHERITS;
  if(isEqual(str,"isvoid"))
    return ISVOID;
  if(isEqual(str,"let"))
    return LET;
  if(isEqual(str,"loop"))
    return LOOP;
  if(isEqual(str,"pool"))
    return POOL;
  if(isEqual(str,"then"))
    return THEN;
  if(isEqual(str,"while"))
    return WHILE;
  if(isEqual(str,"case"))
    return CASE;
  if(isEqual(str,"esac"))
    return ESAC;
  if(isEqual(str,"new"))
    return NEW;
  if(isEqual(str,"of"))
    return OF;
  if(isEqual(str,"not"))
    return NOT;
  return 666;
}

bool checkTFKeyword(char x[])
{
  std::string str(x);
  if (isEqual(str,"class")
    || isEqual(str,"else")
    || isEqual(str,"false")
    || isEqual(str,"fi")
    || isEqual(str,"if")
    || isEqual(str,"in")
    || isEqual(str,"inherits")
    || isEqual(str,"isvoid")
    || isEqual(str,"let")
    || isEqual(str,"loop")
    || isEqual(str,"pool")
    || isEqual(str,"then")
    || isEqual(str,"while")
    || isEqual(str,"case")
    || isEqual(str,"esac")
    || isEqual(str,"new")
    || isEqual(str,"of")
    || isEqual(str,"not")
    || isEqual(str,"true"))
    return true;
  return false;
}

bool checkKeyword(char x[])
{
  std::string str(x);
  if (isEqual(str,"class")
    || isEqual(str,"else")
    || isEqual(str,"fi")
    || isEqual(str,"if")
    || isEqual(str,"in")
    || isEqual(str,"inherits")
    || isEqual(str,"isvoid")
    || isEqual(str,"let")
    || isEqual(str,"loop")
    || isEqual(str,"pool")
    || isEqual(str,"then")
    || isEqual(str,"while")
    || isEqual(str,"case")
    || isEqual(str,"esac")
    || isEqual(str,"new")
    || isEqual(str,"of")
    || isEqual(str,"not"))
    return true;
  return false;
}

int getObjectID()
{
  char buf[1024];
  int i = 0;
  while((lookNext() >= 'a' && lookNext() <= 'z') 
    || (lookNext() >= 'A' && lookNext() <= 'Z') 
    || lookNext() == '_' 
    || (lookNext() >= '0' && lookNext() <= '9'))
  {
    buf[i] = getNext();
    i++;
  }
  buf[i] = '\0';
  if (checkTFKeyword(buf))
    return getTFKeyword(buf);
  cool_yylval.symbol = idtable.add_string(buf);
  return OBJECTID; 
}

int getTypeID()
{
  char buf[1024];
  int i = 0;
  buf[i] = getNext();
  i++;
  while((lookNext() >= 'a' && lookNext() <= 'z') 
    || (lookNext() >= 'A' && lookNext() <= 'Z') 
    || lookNext() == '_' 
    || (lookNext() >= '0' && lookNext() <= '9'))
  {
    buf[i] = getNext();
    i++;
  }
  buf[i] = '\0';
  if (checkKeyword(buf))
    return getKeyword(buf);
  cool_yylval.symbol = idtable.add_string(buf);
  return TYPEID; 
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
        {
          getNext();
          return 0;
        }
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

//SOMETHING WRONG WITH THIS
int getString()
{
  char buf[1024];
  int i = 0;
  while(lookNext() != '"')
  {
    buf[i] = getNext();
    if(buf[i] == 00)
    {
      while((lookNext() != '\n') && (lookNext() != '"'))
        getNext();
      cool_yylval.error_msg = "Null in string constant";
      return ERROR;
    }
    if(buf[i] == EOF)
    {
      while((lookNext() != '\n') && (lookNext() != '"'))
        getNext();
      cool_yylval.error_msg = "EOF in string constant";
      return ERROR;
    }
    if (buf[i] == '\\')
    {
      if(lookNext() == 'b')
        buf[i] = '\b';
      else if(lookNext() == 't')
        buf[i] = '\t';
      else if(lookNext() == 'n')
        buf[i] = '\n';
      else if(lookNext() == 'f')
        buf[i] = '\f';
      else if(lookNext() == '\n')
      {
        buf[i] = '\n';
        curr_lineno++;
      }
      else
        buf[i] = lookNext();
      getNext();
    }
    if(lookNext() == '\n')
    {
      cool_yylval.error_msg = "Unterminated string constant";
      return ERROR; 
    }
    i++;
    if(i > 1024)
    {
      while((lookNext() != '\n') && (lookNext() != '"'))
        getNext();
      if(lookNext() == '\n')
        curr_lineno++;
      getNext();
      cool_yylval.error_msg = "String constant too long";
      return ERROR; 
    }
  }
  getNext();
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
          return getObjectID();
        if (nxt >='A' && nxt <= 'Z')
          return getTypeID();
        switch(nxt)
        {
            case EOF:
                getNext();
                return 0;
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
                  getNext();
                  int x= skipComment();
                  if(x != 0)
                    return x;
                  else
                    break;
                }
                return '(';
            case ',':
                getNext();
                return ',';
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
            case '-':
                getNext();
                return '-';
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
            case ';':
                getNext();
                return ';';
            case '<':
                getNext();
                if (lookNext() == '-')
                  {
                    getNext();
                    return ASSIGN;
                  }
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
            case ' ':
                getNext();
            break;
            default:
                char em[2];
                em[0] = getNext();
                em[1] = '\0';
                cool_yylval.error_msg = em;
                return ERROR;
        }
    }
}
