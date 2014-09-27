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
    cout << "Look: " << cool_token_to_string(next_token) << endl;
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
YYSTYPE cool_expressions_semi();
YYSTYPE cool_expressions_comma();
YYSTYPE cool_expression();
YYSTYPE cool_formals();
YYSTYPE cool_formal();
int cool_yyparse();

Expression handleConditional();

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
    while(lookNextToken() != '}'){
        YYSTYPE ft = cool_feature();
        if(!errorstate) {
            features = append_Features(features, single_Features(ft.feature));
        }
        else {
            return ft;
        }

        if(lookNextToken() == ';') {
            consumeNextToken();
        } else {
            return handle_error();
        }
    }

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
        identifier = cool_yylval.symbol;
        consumeNextToken();
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
                      name = cool_yylval.symbol;
                      consumeNextToken();
                      if(lookNextToken() == '{') {
                          consumeNextToken();
                          
                          YYSTYPE expr = cool_expression();
                          if(!errorstate)
                              expression = expr.expression;
                          else
                              return expr;

                          if(lookNextToken() == '}') {
                              consumeNextToken();
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
            name = cool_yylval.symbol;
            consumeNextToken();
              if(lookNextToken() == ASSIGN) {
                  consumeNextToken();

                  YYSTYPE expr = cool_expression();
                  if(!errorstate)
                      expression = expr.expression;
                  else
                      return expr;

                  retval.feature = attr(identifier, name, expression);
                  return retval;
              }
              retval.feature = attr(identifier, name, no_expr());
              return retval;
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
  bool err = false;
  // (formal,*)
  while(lookNextToken() != ')'){
      YYSTYPE frml = cool_formal();
      if(!errorstate) {
          formals = append_Formals(formals, single_Formals(frml.formal));
      }
      else {
          return frml;
      }

      //ASK SWETA IF THIS PART IS NEEDED
      if(lookNextToken() == ',') {
          consumeNextToken();
          YYSTYPE frmlTest = cool_formal();
          if(errorstate)
            err = true;
      }
      else if(err){
          return handle_error();
      }
  }

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

    if(lookNextToken() == OBJECTID) {
        identifier = cool_yylval.symbol;
        consumeNextToken();
    } else {
        return handle_error();
    }

    if(lookNextToken() == ':') {
        consumeNextToken();
    } else {
        return handle_error();
    }

    if(lookNextToken() == TYPEID) {
        name = cool_yylval.symbol;
        consumeNextToken();
        //ASK SWETA WHY THIS DOESNT WORK
        retval.formal = formal(identifier, name);
        return retval;
    } else {
        return handle_error();
    }
}

//Gets all expressions recursively
YYSTYPE cool_expressions_comma()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Expressions expressions = nil_Expressions();

  while(lookNextToken() != ')'){
      YYSTYPE expr = cool_expression();
      if(!errorstate) {
          expressions = append_Expressions(expressions, single_Expressions(expr.expression));
      }
      else {
          return expr;
      }
      //Figure out how to make grammar (expr,)* so last no comma
      if(lookNextToken() != ',') {
          consumeNextToken();
          if(lookNextToken() == ')')
            return handle_error();
      }
    }
  //return expressions as expressions attribute of YYSTYPE
  retval.expressions = expressions;
  return retval;
}

//Gets all expressions recursively
YYSTYPE cool_expressions_semi()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Expressions expressions = nil_Expressions();

  do {
      YYSTYPE expr = cool_expression();
      if(!errorstate) {
          expressions = append_Expressions(expressions, single_Expressions(expr.expression));
      }
      else {
          return expr;
      }

      if(lookNextToken() == ';') {
          consumeNextToken();
      } else {
          return handle_error();
      }
  } while(lookNextToken() != '}');

  //return expressions as expressions attribute of YYSTYPE
  retval.expressions = expressions;
  return retval;
}

//Gets individual expression
//TODO: GRAMMAR NEEDS TO BE IN TOP DOWN ORDER
//TODO: ASK SWETA HOW TO DO ERROR HANDLING WHEN FIRST TOKEN MATCHES
//      BUT YOU NEED TO SKIP LATER TO FIND NEXT IE: BACKTRACKING
//      DO I NEED TO LEFT FACTOR THE GRAMMAR?
YYSTYPE cool_expression()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Boolean boolVal;
  Expressions expressions;
  Expression expression;
  Expression otherExpression;
  Expression otherExpression1;
  Expression otherExpression2;
  Expression letExpression;
  Symbol identifier;
  Symbol letIdentifier;
  Symbol name;
  Symbol strVal;
  Symbol intVal;
  Symbol objVal;
  Symbol typeVal;

  /*
    expr ::=
        X  | ID <- expr
        X  | ID(expr,*)
        X  | ID
           | expr[@TYPE].ID(expr,*)
           | expr + expr | expr - expr
           | expr * expr | expr / expr
           | expr < expr | expr <= expr | expr = expr
        X  | isvoid expr
        X  | not expr
        X  | if expr then expr else expr fi
        X  | while expr loop expr pool
           | { expr;* }
        X  | let [ID : TYPE [ <- epr ]],* in expr
           | case expr of [ID : TYPE => expr;]+ esac
        X  | new TYPE
        X  | ~expr
        X  | (expr)
        X  | integer
        X  | string
        X  | true
        X  | false
  */

  // | expr[@TYPE].ID(expr,*)
  // | expr + expr | expr - expr
  // | expr * expr | expr / expr
  // | expr < expr | expr <= expr | expr = expr
  if(lookNextToken() == 999999) {
      /* fill this in with identifying a proper expressions*/
  }

  // | let [ID : TYPE [ <- epr ]],* in expr
  if(lookNextToken() == LET) {
      consumeNextToken();
      do{
        if(lookNextToken() == OBJECTID) {
            letIdentifier = cool_yylval.symbol;
            consumeNextToken();
            if(lookNextToken() == ':') {
                consumeNextToken();
                if(lookNextToken() == TYPEID) {
                    name = cool_yylval.symbol;
                    consumeNextToken();
                    if(lookNextToken() == ASSIGN) {
                        consumeNextToken();
                        YYSTYPE expr = cool_expression();
                        if(!errorstate)
                            letExpression = expr.expression;
                        else
                            return expr;
                    }
                }
            } else {
                return handle_error();
            }
        }
      } while(lookNextToken() == ',');
      if(lookNextToken() == IN) {
          consumeNextToken();

          YYSTYPE expr = cool_expression();
          if(!errorstate)
              expression = expr.expression;
          else
              return expr;

          } else {
              return handle_error();
          }
  }

  // | ID
  // | ID(expr,*)
  // ID <- expr
  if(lookNextToken() == OBJECTID) {
      identifier = cool_yylval.symbol;
      consumeNextToken();
      if(lookNextToken() == ASSIGN) {
          consumeNextToken();
          YYSTYPE expr = cool_expression();
          if(!errorstate)
              expression = expr.expression;
          else
              return expr;
          retval.expression = assign(identifier,expression);
          return retval;
      }
      else if(lookNextToken() == '(') {
          consumeNextToken();
          YYSTYPE expr = cool_expressions_comma();
          if(!errorstate)
              expressions = expr.expressions;
          else
              return expr;
          if(lookNextToken() == ')') {
              consumeNextToken();
          }else {
            return handle_error();
          }
          //wait for piazza
          retval.expression = dispatch(no_expr(), identifier, expressions);
          return retval;
      }
      objVal = cool_yylval.symbol;
      retval.expression = object(objVal);
      return retval;
  }

  // | if expr then expr else expr fi
  if(lookNextToken() == IF) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          otherExpression = expr.expression;
      else
          return expr;

      if(lookNextToken() == THEN) {
          consumeNextToken();

          YYSTYPE expr1 = cool_expression();
          if(!errorstate)
              otherExpression1 = expr1.expression;
          else
              return expr1;

          if(lookNextToken() == ELSE) {
              consumeNextToken();

              YYSTYPE expr2 = cool_expression();
              if(!errorstate)
                  otherExpression2 = expr2.expression;
              else
                  return expr2;

              if(lookNextToken() == FI) {
                  consumeNextToken();
                  retval.expression = cond(otherExpression, otherExpression1, otherExpression2);
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
  }

  // | while expr loop expr pool
  if(lookNextToken() == WHILE) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          otherExpression = expr.expression;
      else
          return expr;

      if(lookNextToken() == LOOP) {
          consumeNextToken();

          YYSTYPE expr1 = cool_expression();
          if(!errorstate)
              otherExpression1 = expr1.expression;
          else
              return expr1;

          if(lookNextToken() == POOL) {
              consumeNextToken();
              retval.expression = loop(otherExpression, otherExpression1);
              return retval;
          } else {
              return handle_error();
          }

      } else {
          return handle_error();
      }
  }

  // | new TYPE
  if(lookNextToken() == NEW) {
      consumeNextToken();
      if(lookNextToken() == TYPEID) {
          typeVal = cool_yylval.symbol;
          consumeNextToken();
          retval.expression = new_(typeVal);
          return retval;
      } else {
          return handle_error();
      }
  }

  // | isvoid expr
  if(lookNextToken() == ISVOID) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      retval.expression = isvoid(expression);
      return retval;
  }

  // | expr + expr
  // if(lookNextToken() == ISVOID) {
  //     consumeNextToken();
  //
  //     YYSTYPE expr = cool_expression();
  //     if(!errorstate)
  //         expression = expr.expression;
  //     else
  //         return expr;
  //
  //     retval.expression = isvoid(expression);
  //     return retval;
  // }

  // | ~expr
  if(lookNextToken() == '~') {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      //this one is neg
      retval.expression = NULL;/*NO CLUE WHAT TO PUT HERE*/
      return retval;
  }

  // | not expr
  if(lookNextToken() == NOT) {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;
      //try and find the not constructor
      retval.expression = neg(expression);
      return retval;
  }

  // | (expr)
  if(lookNextToken() == '(') {
      consumeNextToken();

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      if(lookNextToken() == ')') {
          consumeNextToken();
          retval.expression = expression;
          return retval;
      } else {
          return handle_error();
      }
  }

  // | integer
  if(lookNextToken() == INT_CONST) {
      intVal = cool_yylval.symbol;
      consumeNextToken();
      retval.expression = int_const(intVal);
      return retval;
  }

  // | string
  if(lookNextToken() == STR_CONST) {
      strVal = cool_yylval.symbol;
      consumeNextToken();
      retval.expression = string_const(strVal);
      return retval;
  }

  // | true && | false
  if(lookNextToken() == BOOL_CONST) {
      boolVal = cool_yylval.boolean;consumeNextToken();
      retval.expression = bool_const(boolVal);
      return retval;
  }else {
      return handle_error();
  }
}
