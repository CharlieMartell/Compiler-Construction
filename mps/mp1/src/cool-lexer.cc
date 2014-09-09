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

// std::string totalTokens;

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

// bool isBlank(char check)
// {
//     if(check == 10 
//         || check == 32 
//         || check == 12 
//         || check == 13 
//         || check == 9 
//         || check == 11)
//         return true;
//     return false;
// }

// //checks if a string starts with another
// bool starts_with(const std::string s1, const std::string s2) 
// {
//     return s2.size() <= s1.size() && s1.compare(0, s2.size(), s2) == 0;
// }

// std::string getString()
// {
//     char nxt = lookNext();
//     std::string curStr= "";
//     //check if nxt char is blank
//     while(isBlank(nxt))
//     {
//         nxt = getNext();
//     }
//     //now that its not blank, add to string till blank
//     while(!(isBlank(nxt)))
//     {
//         nxt = getNext();
//         curStr += nxt;
//     }
//     return curStr;
// }


// std::string ignoreComment(std::string check)
// {
//     //handles comments after each other
//     while (starts_with(check, "(*") || starts_with(check, "--"))
//     {
//         if (starts_with(check, "(*"))
//         {
//             //keeps getting strings until the close string operator
//             while(!(check = getString().find("*)") != std::string::npos)) {}
//             check = getString();
//         }
//         if (starts_with(check, "--"))
//         {}
//     }
//     return check;
// }

// //analyzes the passed string and returns token id
// int token_analyzer(std::string stringToken)
// {
//     //this function breaks
//     //stringToken = ignoreComment(stringToken);
//     if (stringToken == "class")
//         return 121;
//     else if (stringToken == "else")
//         return 259;
//     //std::cout << stringToken << endl;
//     return 666;
// }

//nothing
//TODO: redo all this shit using chars lol
//and write out the automata
int cool_yylex()
{
    while(true) {
        char nxt = lookNext();
        switch(nxt)
        {
            case EOF:
                getNext(); 
                cout << "You Reached the end!" << endl;
                return 0;

            /* everything else */
            default:
                //get the string of the token to analyze
                // std::string toAnalyze = getString();

                // //get the token from the string(identify comments etc)
                // int ret_token = token_analyzer(toAnalyze);
                
                //return the found token 
                return 34534;
        }
    }
}
