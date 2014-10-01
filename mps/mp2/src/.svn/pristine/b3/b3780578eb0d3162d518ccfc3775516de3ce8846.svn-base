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
int level = 0;
bool recurse = true;
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
YYSTYPE cool_expressions_semi();
YYSTYPE cool_expressions_comma();
YYSTYPE cool_expressions_cases();
YYSTYPE cool_expression();
YYSTYPE cool_formals();
YYSTYPE cool_formal();
int cool_yyparse();
int getNextLevel();
bool checkExpression();
bool checkForSecondExpression();
bool checkForThirdExpression();
bool checkForFourthExpression();
bool checkForFifthExpression();
bool checkAllExpression();
YYSTYPE handleExpression(YYSTYPE curr);
YYSTYPE handleSecondExpression(YYSTYPE curr);
YYSTYPE handleThirdExpression(YYSTYPE curr);
YYSTYPE handleFourthExpression(YYSTYPE curr);
YYSTYPE handleFifthExpression(YYSTYPE curr);
Expression handleConditional();

// SIMPLE FUNCTION - You will need to modify this (or remove it) to handle
// errors robustly
YYSTYPE handle_error();
/************************************************************************/

/* The main parse function */
int cool_yyparse(){
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
YYSTYPE handle_error(){
    yyerror();
    errorstate = true;
    YYSTYPE retval;
    retval.error_msg = "Parser error";
    return retval;
}

YYSTYPE cool_program(){
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

YYSTYPE cool_class(){
  //cout << "Generating Cool Class" << endl;
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
YYSTYPE cool_features(){
  //cout << "Generating Cool Features: feature;* " << endl;
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
YYSTYPE cool_feature(){
    // feature ::=  ID(formal,*):TYPE { expr }
    //            | ID : TYPE [ <- expr ]
    YYSTYPE retval;
    Symbol identifier;
    Formals formals;
    Symbol name;
    Expression expression;
    level = 0;
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

        //cout << "Generating Cool Feature: ID(formal,*):TYPE { expr }" << endl;

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
                              retval.feature = method(identifier, formals, name, expression);
                              consumeNextToken();
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
        //cout << "Generating Cool Feature: ID :  TYPE [ <- expr]" << endl;
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
YYSTYPE cool_formals(){
  /* Elements for features in AST */
  //cout << "Generating Cool Formals" << endl;
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

      if(lookNextToken() == ',') {
          consumeNextToken();
          YYSTYPE frml = cool_formal();
          if(!errorstate) {
              formals = append_Formals(formals, single_Formals(frml.formal));
          }
          else {
              err = true;
          }
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
YYSTYPE cool_formal(){
  // formal ::=  ID : TYPE
  //cout << "Generating Cool Forma: ID : TYPE" << endl;
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

//Gets all expressions ended with comma
YYSTYPE cool_expressions_comma(){
  //cout << "Generating Cool Expressions: expr,*" << endl;
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
      //THIS NEEDS A REWORK
      //Figure out how to make grammar (expr,)* so last no comma
      if(lookNextToken() == ',') {
          consumeNextToken();
          if(lookNextToken() == ')')
            return handle_error();
      }
    }
  //return expressions as expressions attribute of YYSTYPE
  retval.expressions = expressions;
  return retval;
}

//Gets all expressions ended with semi colon
YYSTYPE cool_expressions_semi(){
  //cout << "Generating Cool Expressions: expr;+" << endl;
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

//Gets all cases
YYSTYPE cool_expressions_cases(){
  YYSTYPE retval;
  Symbol identifier;
  Symbol name;
  Expression expression;
  Cases cases = nil_Cases();
  //cout << "Generating Cool Cases: [[ID : TYPE [ <- expr]]" << endl;
  do{
    if(lookNextToken() == OBJECTID) {
        identifier = cool_yylval.symbol;
        consumeNextToken();
        if(lookNextToken() == ':') {
            consumeNextToken();
            if(lookNextToken() == TYPEID) {
                name = cool_yylval.symbol;
                consumeNextToken();
                if(lookNextToken() == DARROW) {
                    consumeNextToken();

                    YYSTYPE expr = cool_expression();
                    if(!errorstate) {
                        expression = expr.expression;
                    }
                    else {
                        return expr;
                    }

                    if(lookNextToken() == ';') {
                        consumeNextToken();
                    } else {
                        return handle_error();
                    }
                }
            }
        } else {
            return handle_error();
        }
    }
    else {
        return handle_error();
    }
    cases = append_Cases(cases, single_Cases(branch(identifier, name, expression)));
  } while(lookNextToken() != ESAC);
  retval.cases = cases;
  return retval;
}

bool checkAllExpression(){
  if (checkExpression()
    || checkForSecondExpression()
    || checkForThirdExpression()
    || checkForFourthExpression()
    || checkForFifthExpression())
      return true;
  return false;
}

// | expr[@TYPE].ID(expr,*)
bool checkExpression(){
  if(lookNextToken() == '.')// && level > 1)
    return true;
  if(lookNextToken() == '@')// && level > 2)
    return true;
  if(lookNextToken() == '~')// && level > 3)
    return true;
  return false;
}

// | expr * expr | expr / expr
bool checkForSecondExpression(){
  if(lookNextToken() == ISVOID)// && level > 4)
    return true;
  if(lookNextToken() == '*')// && level > 5)
    return true;
  if(lookNextToken() == '/')// && level > 5)
    return true;
  return false;
}

// | expr + expr | expr - expr
bool checkForThirdExpression(){
  if(lookNextToken() == '+')// && level > 6)
    return true;
  if(lookNextToken() == '-')// && level > 6)
    return true;
  return false;
}

// | expr < expr | expr <= expr | expr = expr
bool checkForFourthExpression(){
  if(lookNextToken() == '<')// && level > 7)
    return true;
  if(lookNextToken() == LE)// && level > 7)
    return true;
  if(lookNextToken() == '=')// && level > 7)
    return true;
  return false;
}

// assign
bool checkForFifthExpression(){
  if(lookNextToken() == NOT)// && level > 8)
    return true;
  if(lookNextToken() == ASSIGN)// && level > 9)
    return true;
  return false;
}

/*Note Precendence is as follows:
  1 = .
  2 = @
  3 = ~
  4 = isvoid
  5 = * /
  6 = + -
  7 = <= < =
  8 = not
  9 = <-
*/
//returns the precendence of the next token
int getNextLevel(){
  if(lookNextToken() == '.')
    return 1;
  if(lookNextToken() == '@' )
    return 2;
  if(lookNextToken() == '~')
    return 3;
  if(lookNextToken() == ISVOID)
    return 4;
  if(lookNextToken() == '*' || lookNextToken() == '/')
    return 5;
  if(lookNextToken() == '+' || lookNextToken() == '-')
    return 6;
  if(lookNextToken() == LE || lookNextToken() == '<' || lookNextToken() == '=')
    return 7;
  if(lookNextToken() == NOT)
    return 8;
  if(lookNextToken() == ASSIGN)
    return 9;
  return 0;
}

//Loops through all expression checks
YYSTYPE multipleExpressionCheck(YYSTYPE current){
  YYSTYPE retval = current;
  //goes backword to set precendence
  while(checkAllExpression()){
    while(checkForFifthExpression()){
      retval.expression = handleFifthExpression(retval).expression;
    break;
    }
    while(checkForFourthExpression()){
      retval.expression = handleFourthExpression(retval).expression;
    break;
    }
    while(checkForThirdExpression()){
      retval.expression = handleThirdExpression(retval).expression;
    break;
    }
    while(checkForSecondExpression()){
      retval.expression = handleSecondExpression(retval).expression;
    break;
    }
    while(checkExpression()){
      retval.expression = handleExpression(retval).expression;
    break;
    }
  }
  return retval;
}

// | expr[@TYPE].ID(expr,*)
YYSTYPE handleExpression(YYSTYPE curr){
  Expression expression;
  Expressions expressions;
  YYSTYPE retval;
  Symbol name;
  Symbol identifier;
  bool staticDis = false;
  //cout << "Generating Cool Expression: expr[@TYPE].ID(expr,*)" << endl;
  if(lookNextToken() == '.' || lookNextToken() == '@') {
      level = 1;
      if(lookNextToken() == '@'){
          consumeNextToken();
          if(lookNextToken() == TYPEID) {
              name = cool_yylval.symbol;
              consumeNextToken();
              staticDis = true;
          }
      }
      if(lookNextToken() == '.'){
        consumeNextToken();
        if(lookNextToken() == OBJECTID) {
            identifier = cool_yylval.symbol;
            consumeNextToken();
            if(lookNextToken() == '(') {
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

        } else {
            return handle_error();
        }
      } else {
          return handle_error();
      }
      if(staticDis){
        retval.expression = static_dispatch(curr.expression, name, identifier, expressions);
        return retval;
      }
      retval.expression = dispatch(curr.expression, identifier, expressions);
      return retval;
    }
    return retval;
  }
  return curr;
}

// | expr * expr | expr / expr
// concats the second expression to the current
YYSTYPE handleSecondExpression(YYSTYPE curr){
  Expression expression;
  Expressions expressions;
  YYSTYPE retval;
  Symbol name;
  Symbol identifier;
  bool staticDis = false;
  level = 5;

  if(lookNextToken() == '*'){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr * expr" << endl;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = mul(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  else if(lookNextToken() == '/'){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr / expr" << endl;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = divide(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  return curr;
}

// | expr + expr | expr - expr
// concats the second expression to the current
YYSTYPE handleThirdExpression(YYSTYPE curr){
  Expression expression;
  Expressions expressions;
  YYSTYPE retval;
  Symbol name;
  Symbol identifier;

  if(lookNextToken() == '+'){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr + expr" << endl;
    level = 6;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = plus(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  else if(lookNextToken() == '-'){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr - expr" << endl;
    level = 6;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = sub(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  return curr;
}

// | expr < expr | expr <= expr | expr = expr
// concats the second expression to the current
YYSTYPE handleFourthExpression(YYSTYPE curr){
  Expression expression;
  Expressions expressions;
  YYSTYPE retval;
  Symbol name;
  Symbol identifier;
  bool staticDis = false;
  level = 7;
  if(lookNextToken() == LE){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr <= expr" << endl;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = leq(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  else if(lookNextToken() == '<'){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr < expr" << endl;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = lt(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  else if(lookNextToken() == '='){
    consumeNextToken();
    //cout << "Generating Cool Concatenated Expression: expr = expr" << endl;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = eq(curr.expression, expression);
    // if(getNextLevel() < level)
    //   recurse = true;
    // recurse = false;
    //level = getNextLevel();
    return retval;
  }
  return curr;
}

// assign
YYSTYPE handleFifthExpression(YYSTYPE curr){
  Expression expression;
  Expressions expressions;
  YYSTYPE retval;
  Symbol name;
  Symbol identifier;
  bool staticDis = false;
  //cout << "Generating Cool Concatenated Expression: expr <- expr" << endl;
  if(lookNextToken() == ASSIGN){
    consumeNextToken();
    level = 9;
    YYSTYPE expr = cool_expression();
    if(!errorstate)
        expression = expr.expression;
    else
        return expr;
    retval.expression = assign(curr.symbol, expression);
    return retval;
  }
  return curr;
}


//Gets individual expression
//TODO: ASK SWETA HOW TO DO ERROR HANDLING WHEN FIRST TOKEN MATCHES
//      BUT YOU NEED TO SKIP LATER TO FIND NEXT IE: BACKTRACKING
//      DO I NEED TO LEFT FACTOR THE GRAMMAR?
// TODO: add a before return method to check for the another expression
//        after the current expression
YYSTYPE cool_expression()
{
  /* Elements for features in AST */
  YYSTYPE retval;
  Boolean boolVal;
  Expressions expressions;
  Expressions bracketExpressions;
  Expression expression;
  Expression otherExpression;
  Expression otherExpression1;
  Expression otherExpression2;
  Expression letExpression;
  Expression letExpression1;
  Symbol identifier;
  Symbol letIdentifier;
  Symbol name;
  Symbol strVal;
  Symbol intVal;
  Symbol objVal;
  Symbol typeVal;
  Cases cases;

  /*
    expr ::=
        X  | ID <- expr
        X  | ID(expr,*)
        X  | ID
        X  | expr[@TYPE].ID(expr,*)
        X  | expr + expr | expr - expr
        X  | expr * expr | expr / expr
        X  | expr < expr | expr <= expr | expr = expr
        X  | isvoid expr
        X  | not expr
        X  | if expr then expr else expr fi
        X  | while expr loop expr pool
        X  | { expr;* }
        X  | let [ID : TYPE [ <- epr ]],* in expr
        X  | case expr of [ID : TYPE => expr;]+ esac
        X  | new TYPE
        X  | ~expr
        X  | (expr)
        X  | integer
        X  | string
        X  | true
        X  | false
  */

  // if(lookNextToken() == '.'
  //   || lookNextToken() == '@'
  //   || lookNextToken() == '~'
  //   || lookNextToken() == ISVOID
  //   || lookNextToken() == '*'
  //   || lookNextToken() == '/'
  //   || lookNextToken() == '+'
  //   || lookNextToken() == '-'
  //   || lookNextToken() == LE
  //   || lookNextToken() == '<'
  //   || lookNextToken() == '='
  //   || lookNextToken() == NOT
  //   || lookNextToken() == ASSIGN)
  //

  // | case expr of [ID : TYPE => expr;]+ esac
  if(lookNextToken() == CASE) {
      consumeNextToken();
      //cout << "Generating Cool Expression: case expr of [ID : TYPE => expr;]+ esac" << endl;
      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      if(lookNextToken() == OF) {
          consumeNextToken();

        cases = cool_expressions_cases().cases;
        if(lookNextToken() == ESAC) {
            consumeNextToken();
        } else {
            return handle_error();
        }
      }else {
          return handle_error();
      }
      retval.expression = typcase(expression, cases);
      return retval;
  }

  // | { expr;* }
  if(lookNextToken() == '{') {
      consumeNextToken();
      //cout << "Generating Cool Expression: { expr;* }" << endl;
      YYSTYPE expr = cool_expressions_semi();
      if(!errorstate)
          bracketExpressions = expr.expressions;
      else
          return expr;
      if(lookNextToken() == '}') {
          consumeNextToken();
      }
      retval.expressions = bracketExpressions;
      // if(!checkAllExpression())// || getNextLevel() > level)
      //   return retval;
      // else{
      //   retval = multipleExpressionCheck(retval);
      //   return retval;
      // }
      return retval;
  }

  // this function is broken
  // | let [ID : TYPE [ <- epr ]],* in expr
  if(lookNextToken() == LET) {
    //cout << "Generating Cool Expression: let [ID : TYPE [ <- epr ]],* in expr" << endl;
      bool assignment = false;
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
                        assignment = true;
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
        if(lookNextToken() == IN) {
            break;
          }
        if(lookNextToken() == ',') {
            consumeNextToken();
          }
      } while(lookNextToken() == IN);
      //do I need to consume the comma
      if(lookNextToken() == IN) {
          consumeNextToken();

          YYSTYPE expr = cool_expression();
          if(!errorstate)
              letExpression1 = expr.expression;
          else
              return expr;

        } else {
            return handle_error();
        }
      if(assignment){
        retval.expression = let(letIdentifier, name, letExpression, letExpression1);
      }
      else{
        retval.expression = let(letIdentifier, name, no_expr(), letExpression1);
      }
      if(!checkAllExpression())// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
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
          //cout << "Generating Cool Expression: ID <- expr" << endl;
          YYSTYPE expr = cool_expression();
          if(!errorstate)
              expression = expr.expression;
          else
              return expr;
          retval.expression = assign(identifier,expression);
          if(!checkAllExpression())// || getNextLevel() > level)
            return retval;
          else{

            retval = multipleExpressionCheck(retval);

            return retval;
          }
      }
      else if(lookNextToken() == '(') {
          consumeNextToken();
          //cout << "Generating Cool Expression: ID(expr,*)" << endl;
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
          typeVal = idtable.add_string("self");
          retval.expression = dispatch(object(typeVal), identifier, expressions);
          if(!checkAllExpression())// || getNextLevel() > level)
            return retval;
          else{

            retval = multipleExpressionCheck(retval);

            return retval;
          }
      }
      //cout << "Generating Cool Expression: ID" << endl;
      retval.expression = object(identifier);
      if(!checkAllExpression())// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | if expr then expr else expr fi
  if(lookNextToken() == IF) {
      consumeNextToken();
      //cout << "Generating Cool Expression: if expr then expr else expr fi" << endl;
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
                  if(!checkAllExpression())// || getNextLevel() > level)
                    return retval;
                  else{

                    retval = multipleExpressionCheck(retval);

                    return retval;
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

  // | while expr loop expr pool
  if(lookNextToken() == WHILE) {
      consumeNextToken();
      //cout << "Generating Cool Expression: while expr loop expr pool" << endl;
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
              if(!checkAllExpression())// || getNextLevel() > level)
                return retval;
              else{

                retval = multipleExpressionCheck(retval);

                return retval;
              }
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
      //cout << "Generating Cool Expression: new TYPE" << endl;
      if(lookNextToken() == TYPEID) {
          typeVal = cool_yylval.symbol;
          consumeNextToken();
          retval.expression = new_(typeVal);
          if(!checkAllExpression())
            return retval;
          else{
            retval = multipleExpressionCheck(retval);
            return retval;
          }
      } else {
          return handle_error();
      }
  }

  // | isvoid expr
  if(lookNextToken() == ISVOID) {
      consumeNextToken();
      //cout << "Generating Cool Expression: isvoid expr" << endl;
      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      retval.expression = isvoid(expression);
      if(!checkAllExpression())// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | ~expr
  if(lookNextToken() == '~') {
      consumeNextToken();
      level = 3;
      //cout << "Generating Cool Expression: ~expr" << endl;
      if(getNextLevel() <= level)
        recurse = false;
      else
        recurse = true;

      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;
      retval.expression = neg(expression);

      if(!checkAllExpression() || recurse == false)// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | not expr
  if(lookNextToken() == NOT) {
      consumeNextToken();
      //cout << "Generating Cool Expression: not expr" << endl;
      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;
      //try and find the not constructor
      retval.expression = comp(expression);
      if(!checkAllExpression())// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | (expr)
  if(lookNextToken() == '(') {
      consumeNextToken();
      //cout << "Generating Cool Expression: (expr)" << endl;
      YYSTYPE expr = cool_expression();
      if(!errorstate)
          expression = expr.expression;
      else
          return expr;

      if(lookNextToken() == ')') {
          consumeNextToken();
          retval.expression = expression;
          if(!checkAllExpression())// || getNextLevel() > level)
            return retval;
          else{
            retval = multipleExpressionCheck(retval);
            return retval;
          }
      } else {
          return handle_error();
      }
  }

  // | integer
  if(lookNextToken() == INT_CONST) {
      //cout << "Generating Cool Expression: integer" << endl;
      intVal = cool_yylval.symbol;
      retval.expression = int_const(intVal);
      consumeNextToken();
      //cout << "level: "<< level << endl;
      //cout << "nextlevel: "<< getNextLevel() << endl;
      if(getNextLevel() <= level)
        recurse = false;
      else
        recurse = true;
      //cout << "recurse: " << recurse << endl;
      if(!checkAllExpression() || recurse == false)// || getNextLevel() > level || recurse == false)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | string
  if(lookNextToken() == STR_CONST) {
      //cout << "Generating Cool Expression: string" << endl;
      strVal = cool_yylval.symbol;
      retval.expression = string_const(strVal);
      consumeNextToken();
      if(!checkAllExpression() || recurse == false)// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }

  // | true && | false
  if(lookNextToken() == BOOL_CONST) {
    //cout << "Generating Cool Expression: boolean" << endl;
      boolVal = cool_yylval.boolean;
      retval.expression = bool_const(boolVal);
      consumeNextToken();
      if(!checkAllExpression() || recurse == false)// || getNextLevel() > level)
        return retval;
      else{
        retval = multipleExpressionCheck(retval);
        return retval;
      }
  }else {
      return handle_error();
  }
}
