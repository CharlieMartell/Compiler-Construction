#include "coolrt.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <string.h>

/* This file provides the runtime library for cool. It implements
   the functions of the cool classes in C
   */

/* Class name strings */
const char Object_string[] 	= "Object";
const char String_string[] 	= "String";
const char Int_string[] 	= "Int";
const char Bool_string[] 	= "Bool";
const char IO_string[] 		= "IO";

const char default_string[]	= "";

/* Class vtable prototypes */
/*
%Object_vtable = type {
  i32,
  i32,
  i8*,
  %Object* () *,
  %Object* (%Object*) *,
  %String* (%Object*) *,
  %Object* (%Object*) *
}

@Object_vtable_prototype = constant %Object_vtable {
  i32 0,
  i32 ptrtoint (%Object* getelementptr (%Object* null, i32 1) to i32),
  i8* getelementptr ([7 x i8]* @str.Object, i32 0, i32 0),
  %Object* () * @Object_new,
  %Object* (%Object*) * @Object_abort,
  %String* (%Object*) * @Object_type_name,
  %Object* (%Object*) * @Object_copy
}
*/
//const Object_vtable Object_vtable_prototype = {
//    .ID = 0,
//    .address = 0, /*i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32)*/
//    .name = (char*)Object_string,
//    .Object_new = Object_new,
//    .Object_abort = (Object* (*) (Object*)) Object_abort,
//    .Object_type_name = (const String* (*) (Object*)) Object_type_name,
//    .Object_copy = (Object* (*) (Object*)) Object_copy
//};

/*
%Int_vtable = type {
  i32,
  i32,
  i8*,
  %Int* () *,
  %Object* (%Int*) *,
  %String* (%Int*) *,
  %Int* (%Int*) *
}

@Int_vtable_prototype = constant %Int_vtable {
  i32 1,
  i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32),
  i8* getelementptr ([4 x i8]* @str.Int, i32 0, i32 0),
  %Int* () * @Int_new,
  %Object* (%Int*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Int*) *),
  %String* (%Int*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Int*) *),
  %Int* (%Int*) * bitcast (%Object* (%Object*) * @Object_copy to %Int* (%Int*) *)
}

*/
//const Int_vtable Int_vtable_prototype = {
//    .ID = 1,
//    .address = 0, /*i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32)*/
//    .name = (char*)Int_string,
//    .Int_new = Int_new,
//    .Object_abort = (Object* (*) (Int*)) Object_abort,
//    .Object_type_name = (const String* (*) (Int*)) Object_type_name,
//    .Object_copy = (Int* (*) (Int*)) Object_copy
//};

/*
%IO_vtable = type {
  i32,
  i32,
  i8*,
  %IO* () *,
  %Object* (%IO*) *,
  %String* (%IO*) *,
  %IO* (%IO*) *,
  %IO* (%IO*,%String*) *,
  %IO* (%IO*,i32) *,
  %String* (%IO*) *,
  i32 (%IO*) *
}

@IO_vtable_prototype = constant %IO_vtable {
  i32 4,
  i32 ptrtoint (%IO* getelementptr (%IO* null, i32 1) to i32),
  i8* getelementptr ([3 x i8]* @str.IO, i32 0, i32 0),
  %IO* () * @IO_new,
  %Object* (%IO*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%IO*) *),
  %String* (%IO*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%IO*) *),
  %IO* (%IO*) * bitcast (%Object* (%Object*) * @Object_copy to %IO* (%IO*) *),
  %IO* (%IO*,%String*) * @IO_out_string,
  %IO* (%IO*,i32) * @IO_out_int,
  %String* (%IO*) * @IO_in_string,
  i32 (%IO*) * @IO_in_int
}
*/
//const IO_vtable IO_vtable_prototype = {
//    .ID = 4,
//    .address = 0, /*i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32)*/
//    .name = (char*)IO_string,
//    .IO_new = IO_new,
//    .Object_abort = (Object* (*) (IO*)) Object_abort,
//    .Object_type_name = (const String* (*) (IO*)) Object_type_name,
//    .Object_copy = (IO* (*) (IO*)) Object_copy,
//    .IO_out_string = IO_out_string,
//    .IO_out_int = IO_out_int,
//    .IO_in_string = IO_in_string,
//    .IO_in_int= IO_in_int
//};

/*
%Bool_vtable = type {
  i32,
  i32,
  i8*,
  %Bool* () *,
  %Object* (%Bool*) *,
  %String* (%Bool*) *,
  %Bool* (%Bool*) *
}

@Bool_vtable_prototype = constant %Bool_vtable {
  i32 2,
  i32 ptrtoint (%Bool* getelementptr (%Bool* null, i32 1) to i32),
  i8* getelementptr ([5 x i8]* @str.Bool, i32 0, i32 0),
  %Bool* () * @Bool_new,
  %Object* (%Bool*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%Bool*) *),
  %String* (%Bool*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%Bool*) *),
  %Bool* (%Bool*) * bitcast (%Object* (%Object*) * @Object_copy to %Bool* (%Bool*) *)
}
*/
//const Bool_vtable Bool_vtable_prototype = {
//    .ID = 2,
//    .address = 0, /*i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32)*/
//    .name = (char*)Bool_string,
//    .Bool_new = Bool_new,
//    .Object_abort = (Object* (*) (Bool*)) Object_abort,
//    .Object_type_name = (const String* (*) (Bool*)) Object_type_name,
//    .Object_copy = (Bool* (*) (Bool*)) Object_copy
//};

/*
%String_vtable = type {
  i32,
  i32,
  i8*,
  %String* () *,
  %Object* (%String*) *,
  %String* (%String*) *,
  %String* (%String*) *,
  i32 (%String*) *,
  %String* (%String*,%String*) *,
  %String* (%String*,i32,i32) *
}

@String_vtable_prototype = constant %String_vtable {
  i32 3,
  i32 ptrtoint (%String* getelementptr (%String* null, i32 1) to i32),
  i8* getelementptr ([7 x i8]* @str.String, i32 0, i32 0),
  %String* () * @String_new,
  %Object* (%String*) * bitcast (%Object* (%Object*) * @Object_abort to %Object* (%String*) *),
  %String* (%String*) * bitcast (%String* (%Object*) * @Object_type_name to %String* (%String*) *),
  %String* (%String*) * bitcast (%Object* (%Object*) * @Object_copy to %String* (%String*) *),
  i32 (%String*) * @String_length,
  %String* (%String*,%String*) * @String_concat,
  %String* (%String*,i32,i32) * @String_substr
}
*/
//const String_vtable String_vtable_prototype = {
//    .ID = 3,
//    .address = 0, /*i32 ptrtoint (%Int* getelementptr (%Int* null, i32 1) to i32)*/
//    .name = (char*)String_string,
//    .String_new = String_new,
//    .Object_abort = (Object* (*) (String*)) Object_abort,
//    .Object_type_name = (const String* (*) (String*)) Object_type_name,
//    .Object_copy = (String* (*) (String*)) Object_copy,
//    .String_length = String_length,
//    .String_concat = String_concat,
//    .String_substr = String_substr
//};

extern const Object_vtable Object_vtable_prototype;
extern const String_vtable String_vtable_prototype;
extern const IO_vtable IO_vtable_prototype;
extern const Int_vtable Int_vtable_prototype;
extern const Bool_vtable Bool_vtable_prototype;

/*
// Methods in class object (only some are provided to you)
*/
Object* Object_abort(Object *self)
{
    printf("Abort called from class %s\n",
           !self? "Unknown" : self->type->name);
    exit(1);
    return self;
}

const String* Object_type_name(Object *self)
{
    if (self == 0) {
      fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
      abort();
    }
    String *s = String_new();
    s->val = self->type->name;
    return s;
}


/* ADD CODE HERE FOR MORE METHODS OF CLASS OBJECT */


/*
// Methods in class IO (only some are provided to you)
*/

IO* IO_out_string(IO *self, String* x)
{
    if (self == 0 || x == 0) {
      fprintf(stderr, "At __FILE__(line __LINE__): NULL object\n");
      abort();
    }
     printf("%s",x->val);
     return self;
}

IO* IO_out_int(IO *self, Int* x)
{
    if (self == 0 || x == 0) {
      fprintf(stderr, "At __FILE__(line __LINE__): NULL object\n");
      abort();
    }
     printf("%d",x->val);
     return self;
}


/*
 * Get one line from stream using get_line(), then discard newline character.
 * Allocate string *in_string_p and store result there.
 * Return number of chars read.
 */
static int get_one_line(char** in_string_p, FILE* stream)
{
  /* Get one line worth of input */
  size_t len = 0;
  ssize_t num_chars_read;
  num_chars_read = getline(in_string_p, &len, stdin);
  if (*in_string_p == 0) {
    fprintf(stderr, "At __FILE__(line __LINE__):\n   ");
    fprintf(stderr, "    allocation failed in IO::in_string()\n");
    exit(1);
  }

  /* Discard the newline char, if any.  It may not exist if EOF reached. */
  if (num_chars_read > 0 && (*in_string_p)[num_chars_read-1] == '\n') {
    (*in_string_p)[num_chars_read-1] = '\0';
    --len;
  }

  return len;
}

/*
 * The method IO::in_string(): String reads a string from
 * the standard input, up to but not including a newline character.
 */
String* IO_in_string(IO *self)
{
  if (self == 0) {
    fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
    abort();
  }

  /* Get one line worth of input with the newline, if any, discarded */
  char* in_string = 0;
  ssize_t len = get_one_line(&in_string, stdin);
  assert(in_string);

  /* We can take advantage of knowing the internal layout of String objects */
  String *str = String_new();
  str->val = in_string;
  return str;
}

/*
 * The method IO::in_int(): Int reads a single integer, which may be preceded
 * by whitespace.
 * Any characters following the integer, up to and including the next newline,
 * are discarded by in_int.
 */
Int* IO_in_int(IO *self)
{
  if (self == 0) {
    fprintf(stderr, "At __FILE__(line __LINE__): self is NULL\n");
    abort();
  }

  /* Get one line worth of input with the newline, if any, discarded */
  char* in_string = 0;
  ssize_t len = get_one_line(&in_string, stdin);
  assert(in_string);

  /* Now extract initial int and ignore the rest of the line */
  Int *x = Int_new();
  int num_ints = 0;
  if (len)
    num_ints = sscanf(in_string, " %d", &(x->val)); /* Discards initial spaces*/

  /* If no text found, abort. */
  if (num_ints == 0) {
      fprintf(stderr, "At __FILE__(line __LINE__):\n   ");
      fprintf(stderr, "    Invalid integer on input in IO::in_int()");
      Object_abort((Object*) self);
  }
  return x;
}

//Create new objects!
//Not sure if this works
Object* create_object() {
  Object result;
//  result.type = Object_vtable;
//  Object* o = malloc(sizeof(Object));
//  memcpy(o, &result, sizeof(Object));
//  return o;
  return Object_new();
}

Object* Object_copy(Object *self){
	Object *copied = Object_new();
	copied->type = self->type;
	return copied;
}

Object* Object_new(void){
  Object result;
  //result.type = Object_string;
  Object* o = malloc(sizeof(Object));
  memcpy(o, &result, sizeof(Object));
  return o;
}

IO* IO_new(void){
  IO result;
  //result.type = IO_string;
  IO* o = malloc(sizeof(IO));
  memcpy(o, &result, sizeof(IO));
  return o;
}

Int* Int_new(void){
  Int result;
  //result.type = Int_string;
  Int* o = malloc(sizeof(Int));
  memcpy(o, &result, sizeof(Int));
  return o;
}

Bool* Bool_new(void){
  Bool result;
  //result.type = Bool_string;
  Bool* o = malloc(sizeof(Bool));
  memcpy(o, &result, sizeof(Bool));
  return o;
}

String* String_new(void){
  String result;
  //result.type = String_string;
  String* o = malloc(sizeof(String));
  memcpy(o, &result, sizeof(String));
  return o;
}

int String_length(String* s) {
    return (int)strlen(s->val);
}

String* String_concat(String* x, String* s){
  char* self = x->val;
  int selfLen = strlen(self);
  char* self_2 = s->val;
  int sLen = strlen(self_2);
  char* result = malloc(selfLen + sLen + 1);
  memcpy(result, self, selfLen);
  memcpy(result + selfLen, s, sLen);
  result[selfLen + sLen] = '\0';
  String* boxed = String_new();
    boxed->type = x->type;
    boxed->val = result;
    return boxed;
}

String* String_substr(String* x, int i, int l){
  char* self = x->val;
  size_t selfLen = strlen(self);
  if(selfLen < (i + l))
      error("Index out of range");
  char* result = malloc(l+1);
  memcpy(result, self+i, l);
  result[l] = '\0';
  String* boxed = String_new();
  boxed->type = x->type;
  boxed->val = result;
  return boxed;
}
