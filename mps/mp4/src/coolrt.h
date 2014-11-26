/*
 * This file provides the runtime library for cool. It implements
 * the cool classes in C.  Feel free to change it to match the structure
 * of your code generator.
*/

#include <stdbool.h>

typedef struct Object Object;
typedef struct String String;
typedef struct IO IO;
typedef struct Int Int;
typedef struct Bool Bool;

typedef struct Object_vtable Object_vtable;
typedef struct String_vtable String_vtable;
typedef struct IO_vtable IO_vtable;
typedef struct Int_vtable Int_vtable;
typedef struct Bool_vtable Bool_vtable;

struct Object {
    Object_vtable* type;
};

struct Int {
    Int_vtable* type;
    int val;
};

struct Bool {
    Bool_vtable* type;
    bool val;
};

struct String {
    String_vtable* type;
    char* val;
};

struct IO {
     IO_vtable* type;
};

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
/* vtable type definitions */
struct Object_vtable {
  int ID;
  int address; //TBD
  char* name;
  Object* (*Object_new)(void);
  Object* (*Object_abort)(Object*);
  const String* (*Object_type_name)(Object*);
  Object* (*Object_copy)(Object*);
};

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
struct IO_vtable {
    int ID;
    int address; //TBD
    char* name;
    IO* (*IO_new)(void);
    Object* (*Object_abort)(IO*);
    String* (*Object_type_name)(IO*);
    IO* (*Object_copy)(IO*);
    IO* (*IO_out_string)(IO*, String*);
    IO* (*IO_out_int)(IO*, Int*);
    String* (*IO_in_string)(IO*);
    Int* (*IO_in_int)(IO*);
};

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
struct Int_vtable {
  int ID;
  int address; //TBD
  char* name;
  Int* (*Int_new)(void);
  Object* (*Object_abort)(Int*);
  String* (*Object_type_name)(Int*);
  Int* (*Object_copy)(Int*);
};

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

struct Bool_vtable {
  int ID;
  int address; //TBD
  char* name;
  Bool* (*Bool_new)(void);
  Object* (*Object_abort)(Bool*);
  String* (*Object_type_name)(Bool*);
  Bool* (*Object_copy)(Bool*);
};

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

struct String_vtable {
  int ID;
  int address; //TBD
  char* name;
  String* (*String_new)(void);
  Object* (*Object_abort)(String*);
  String* (*Object_type_name)(String*);
  String* (*Object_copy)(String*);
  Int* (*String_length)(String*);
  String* (*String_concat)(String*, String*);
  String* (*String_substr)(String*);
};

/* methods in class Object */
Object* Object_abort(Object *self);
const String* Object_type_name(Object *self);
Object* create_object();
Object* Object_copy(Object *self);
Object* Object_new(void);


/* methods in class IO */
IO* IO_new(void);
void IO_init(IO *self);
IO* IO_out_string(IO *self, String *x);
IO* IO_out_int(IO *self, Int *x);
String* IO_in_string(IO *self);
Int* IO_in_int(IO *self);

/* methods in class Int */
Int* Int_new(void);

/* methods in class Bool */
Bool* Bool_new(void);

/* methods in class String */
String* String_new(void);
int String_length(String* x);
String* String_concat(String* x, String* s);
String* String_substr(String*, int i, int l);

//Boxing/Unboxing Methods
//Int* boxInt(int value);
//Bool* boxBool(bool value);
