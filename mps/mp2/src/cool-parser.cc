#include <iostream>
#include "cool-tree.h"
#include "stringtab.h"
#include "cool-parse.h"
#include "utilities.h"

/************************************************************************/
/* Definitions and declarations */

extern char *curr_filename;

void yyerror();        /*  defined below; called for each parse error */
void printerr(const char *s);       /*  called for errors in addition to parse errors */
extern int VERBOSE_ERRORS;
int cool_yydebug;

Program ast_root;             /* the result of the parse  */
Classes parse_results;        /* for use in semantic analysis */
int omerrs = 0;               /* number of errors in lexing and parsing */
bool errorstate = false;

int next_token;
bool isfirst = true;

extern YYSTYPE cool_yylval;
extern int curr_lineno;

int lookNextToken();                /*  returns the next token */
void consumeNextToken();            /*  consumes the next token */

extern int cool_yylex();

/************************************************************************/
/* Implementations of utility functions */
void yyerror()
{
  cerr << "\"" << curr_filename << "\", line " << curr_lineno << ": " \
    << "syntax error at or near ";
  print_cool_token(lookNextToken());
  cerr << endl;
  omerrs++;

  if(omerrs>20) {fprintf(stdout, "More than 20 errors\n"); exit(1);}
}

void printerr(const char *s)
{
    if(VERBOSE_ERRORS)
        cerr << "line " << curr_lineno << s << endl;
}

int lookNextToken()
{
    if(isfirst) {
        consumeNextToken();
        isfirst = false;
    }
    return next_token;
}

void consumeNextToken()
{
    next_token = cool_yylex();
}
/************************************************************************/
/************************************************************************/
/* Declarations of recursive descent parser functions */
// ADD YOUR DECLARATIONS HERE
YYSTYPE cool_program();
YYSTYPE cool_class();
YYSTYPE cool_features();
YYSTYPE cool_feature();
YYSTYPE cool_expressions();
YYSTYPE cool_expression();
YYSTYPE cool_formals();
YYSTYPE cool_formal();
int cool_yyparse();

// SIMPLE FUNCTION - You will need to modify this (or remove it) to handle
// errors robustly
YYSTYPE handle_error();
/************************************************************************/

/* The main parse function */
int cool_yyparse()
{
    YYSTYPE pr = cool_program();
    if(!errorstate) {
        ast_root = pr.program;
        return 0;
    }
    else {
        return 1;
    }
    //ASK SWETA HOW TO RETURN FROM FUNCTION PROPERLY
    //ast_root = pr;
    return 0; //ast_root;
}

/* You need to modify this function! */
YYSTYPE handle_error()
{
    yyerror();
    errorstate = true;
    YYSTYPE retval;
    retval.error_msg = "Parser error";
    return retval;
}

YYSTYPE cool_program()
{
    /* Elements for program in AST */
    YYSTYPE retval;
    Classes classes = nil_Classes();

    /* program := [class;]+ */
    do {
        YYSTYPE cl = cool_class();
        if(!errorstate) {
            classes = append_Classes(classes, single_Classes(cl.class_));
        }
        else {
            return cl;
        }

        if(lookNextToken() == ';') {
            consumeNextToken();
        } else {
            return handle_error();
        }
    } while(lookNextToken() != 0);

    parse_results = classes;
    retval.program = program(classes);
    return retval;
}

YYSTYPE cool_class()
{
    /* Elements for class in AST */
    YYSTYPE retval;
    Symbol name;
    Symbol parent;
    Features features;
    Symbol filename;

    /* class := CLASS TYPEID [INHERITS TYPEID] { [features;]* } */
    if(lookNextToken() == CLASS) {
        consumeNextToken();
    } else {
        return handle_error();
    }

    if(lookNextToken() == TYPEID) {
        name = cool_yylval.symbol;
        consumeNextToken();
    } else {
        return handle_error();
    }

    if(lookNextToken() == INHERITS) {
        consumeNextToken();
        if(lookNextToken() == TYPEID) {
            parent = cool_yylval.symbol;
            consumeNextToken();
        } else {
            return handle_error();
        }
    } else {
        parent = idtable.add_string("Object");
    }

    if(lookNextToken() == '{') {
        consumeNextToken();
    } else {
        return handle_error();
    }

    YYSTYPE ft = cool_features();
    if(!errorstate)
        features = ft.features;
    else
        return ft;

    if(lookNextToken() == '}') {
        consumeNextToken();
    } else {
        return handle_error();
    }


    filename = stringtable.add_string(curr_filename);
    retval.class_ = class_(name, parent, features, filename);
    return retval;
}

//Gets all feautures if repeating
YYSTYPE cool_features()
{
    /* Elements for features in AST */
    YYSTYPE retval;
    Features features = nil_Features();

    // feature;*
    do {
        YYSTYPE ft = cool_feature();
        if(!errorstate) {
            features = append_Features(features, single_Features(ft.feature));
        }
        else {
            return ft;
        }

        //ASK SWETA IF THIS PART IS NEEDED
        if(lookNextToken() == ';') {
            consumeNextToken();
        } else {
            return handle_error();
        }
    } while(lookNextToken() != 0);

    //return features as features attribute of YYSTYPE
    retval.features = features;
    return retval;
}

//Gets each invidual feature
YYSTYPE cool_feature()
{
    // feature ::=  ID(formal,*):TYPE { expr }
    //            | ID : TYPE [ <- expr ]
    YYSTYPE retval;
    Symbol identifier;
    Formals formals;
    Symbol name;
    Expression expression;

    Feature feature = NULL;

    if(lookNextToken() == OBJECTID) {
        consumeNextToken();
        identifier = cool_yylval.symbol;
    } else {
        return handle_error();
    }

    // feature ::=  ID(formal,*):TYPE { expr }
    if(lookNextToken() == '(') {
        consumeNextToken();

        YYSTYPE frml = cool_formals();
        if(!errorstate)
            formals = frml.formals;
        else
            return frml;

          if(lookNextToken() == ')') {
              consumeNextToken();
              if(lookNextToken() == ':') {
                  consumeNextToken();
                  if(lookNextToken() == TYPEID) {
                      consumeNextToken();
                      name = cool_yylval.symbol;
                      if(lookNextToken() == '{') {
                          consumeNextToken();

                          //Make sure this is how I get expressions
                          YYSTYPE expr = cool_expression();
                          if(!errorstate)
                              expression = expr.expression;
                          else
                              return expr;

                          if(lookNextToken() == '}') {
                              consumeNextToken();

                              //Ask if I should be returning here
                              retval.feature = method(identifier, formals, name, expression);
                              return retval;
                          } else {
                              return handle_error();
                          }
                      } else {
                          return handle_error();
                      }
                  } else {
                      return handle_error();
                  }
              } else {
                  return handle_error();
              }
          } else {
              return handle_error();
          }
    }

    // feature ::=  ID : TYPE [ <- expr ]
    else if(lookNextToken() == ':') {
        consumeNextToken();
        if(lookNextToken() == TYPEID) {
            consumeNextToken();
            name = cool_yylval.symbol;
            if(lookNextToken() == '[') {
                consumeNextToken();
                if(lookNextToken() == DARROW) {
                    consumeNextToken();

                    //Make sure this is how I get expressions
                    YYSTYPE expr = cool_expression();
                    if(!errorstate)
                        expression = expr.expression;
                    else
                        return expr;

                    if(lookNextToken() == ']') {
                        consumeNextToken();

                        //Ask if I should be returning here
                        retval.feature = attr(identifier, name, expression);
                        return retval;
                    } else {
                        return handle_error();
                    }
                } else {
                    return handle_error();
                }
            } else {
                return handle_error();
            }
        } else {
            return handle_error();
        }
    }
    else {
        return handle_error();
    }
}

//Gets the formals repeating
YYSTYPE cool_formals()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Formals formals = nil_Formals();

  // formal;*
  do {
      YYSTYPE frml = cool_formal();
      if(!errorstate) {
          formals = append_Formals(formals, single_Formals(frml.formal));
      }
      else {
          return frml;
      }

      //ASK SWETA IF THIS PART IS NEEDED
      if(lookNextToken() == ';') {
          consumeNextToken();
      } else {
          return handle_error();
      }
  } while(lookNextToken() != 0);

  //return features as features attribute of YYSTYPE
  retval.formals = formals;
  return retval;
}

//Gets the individual formal
YYSTYPE cool_formal()
{
  // formal ::=  ID : TYPE
  YYSTYPE retval;
  Symbol identifier;
  Symbol name;

  Formal formal = NULL;

    if(lookNextToken() == OBJECTID) {
        consumeNextToken();
        identifier = cool_yylval.symbol;
    } else {
        return handle_error();
    }

    if(lookNextToken() == ':') {
        consumeNextToken();
    } else {
        return handle_error();
    }

    if(lookNextToken() == TYPEID) {
        consumeNextToken();
        name = cool_yylval.symbol;
        retval.formal = formal(identifier, name);
        return retval;
    } else {
        return handle_error();
    }
}

//Gets all expressions recursively
YYSTYPE cool_expressions()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Expressions expressions = nil_Expressions();

  /*
    expr ::= ID <- expr
          | expr[@TYPE].ID(expr,*)
          | ID(expr,*)
          | if expr then expr else expr fi
          | while expr loop expr pool
          | { expr;* }
          | let [ID : TYPE [ <- epr ]],* in expr
          | case expr of [ID : TYPE => expr;]+ esac
          | new TYPE
          | isvoid expr
          | expr + expr
          | expr - expr
          | expr * expr
          | expr / expr
          | ~expr
          | expr < expr
          | expr < expr
          | expr = expr
          | not expr
          | (expr)
          | ID
          | integer
          | string
          | true
          | false
  */

  do {
      YYSTYPE expr = cool_expression();
      if(!errorstate) {
          expressions = append_Expressions(expressions, single_Expressions(expr.expression));
      }
      else {
          return expr;
      }

      //ASK SWETA IF THIS PART IS NEEDED
      if(lookNextToken() == ';') {
          consumeNextToken();
      } else {
          return handle_error();
      }
  } while(lookNextToken() != 0);

  //return features as features attribute of YYSTYPE
  retval.expressions = expressions;
  return retval;
}

//Gets individual expression
YYSTYPE cool_expression()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Boolean boolVal;
  Symbol strVal;
  Symbol intVal;
  Symbol objVal;
  Symbol typeVal;

  /*
    expr ::= ID <- expr
          | expr[@TYPE].ID(expr,*)
          | ID(expr,*)
          | if expr then expr else expr fi
          | while expr loop expr pool
          | { expr;* }
          | let [ID : TYPE [ <- epr ]],* in expr
          | case expr of [ID : TYPE => expr;]+ esac
          | new TYPE
          | isvoid expr
          | expr + expr
          | expr - expr
          | expr * expr
          | expr / expr
          | ~expr
          | expr < expr
          | expr < expr
          | expr = expr
          | not expr
        X  | (expr)
        X  | ID
        X  | integer
        X  | string
        X  | true
        X  | false
  */
  if(lookNextToken() == BOOL_CONST) {
      consumeNextToken();
      boolVal = cool_yylval.boolean;
      retval.expression = bool_const(boolVal);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == STR_CONST) {
      consumeNextToken();
      strVal = cool_yylval.symbol;
      retval.expression = string_const(strVal);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == INT_CONST) {
      consumeNextToken();
      intVal = cool_yylval.symbol;
      retval.expression = int_const(intVal);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == OBJECTID) {
      consumeNextToken();
      objVal = cool_yylval.symbol;
      retval.expression = object(objVal);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == '(') {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      if(lookNextToken() == ')') {
          consumeNextToken();
          //ASK SWETA HOW TO RETURN THIS CASE
          //NOT SURE IF THIS IS CORRECT ASSIGNMENT
          retval.expression = comp(expr);
          return retval;
      } else {
          return handle_error();
      }
  } else {
      return handle_error();
  }
  if(lookNextToken() == NOT) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      retval.expression = neg(expr);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == ISVOID) {
      consumeNextToken();
      //ASK SWETA ABOUT WHAT EXPRESSION GOES IN isvoid()
      retval.expression = isvoid(/*NOT SURE WHAT TO PUT IN HERE*/);
      return retval;
  } else {
      return handle_error();
  }
  if(lookNextToken() == NEW) {
      consumeNextToken();
      if(lookNextToken() == TYPEID) {
          consumeNextToken();
          typeVal = cool_yylval.symbol;
          retval.expression = new_(typeVal);
          return retval;
      } else {
          return handle_error();
      }
  } else {
      return handle_error();
  }
  if(lookNextToken() == IF) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      if(lookNextToken() == THEN) {
          consumeNextToken();

          YYSTYPE expr1 = cool_expression();
          if(!errorstate)
              expression = expr1.expression;
          else
              return expr1;

          if(lookNextToken() == ELSE) {
              consumeNextToken();

              YYSTYPE expr2 = cool_expression();
              if(!errorstate)
                  expression = expr2.expression;
              else
                  return expr2;

              if(lookNextToken() == FI) {
                  consumeNextToken();
                  retval.expression = cond(expr, expr1, expr2);
                  return retval;
              } else {
                  return handle_error();
              }

          } else {
              return handle_error();
          }

      } else {
          return handle_error();
      }


  } else {
      return handle_error();
  }
}
