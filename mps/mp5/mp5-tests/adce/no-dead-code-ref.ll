; ModuleID = '<stdin>'

%struct.Object_vtable = type { %struct.Object_vtable*, i32, [7 x i8]*, %Object* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)* }
%Object = type { %struct.Object_vtable* }
%struct.String = type { %struct.String_vtable*, i8* }
%struct.String_vtable = type { %struct.Object_vtable*, i32, [7 x i8]*, %String* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, %struct.Int* (%struct.String*)*, %struct.String* (%struct.String*, %struct.String*)*, %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)* }
%String = type { %struct.String_vtable*, i8* }
%struct.Int = type { %struct.Int_vtable*, i32 }
%struct.Int_vtable = type { %struct.Object_vtable*, i32, [4 x i8]*, %Int* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)* }
%Int = type { %struct.Int_vtable*, i32 }
%struct.Object = type { %struct.Object_vtable* }
%struct.Bool_vtable = type { %struct.Object_vtable*, i32, [5 x i8]*, %Bool* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)* }
%Bool = type { %struct.Bool_vtable*, i1 }
%struct.IO_vtable = type { %struct.Object_vtable*, i32, [3 x i8]*, %IO* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, %struct.IO* (%struct.IO*, %struct.String*)*, %struct.IO* (%struct.IO*, %struct.Int*)*, %struct.String* (%struct.IO*)*, %struct.Int* (%struct.IO*)* }
%IO = type { %struct.IO_vtable* }
%struct.IO = type { %struct.IO_vtable* }
%struct.Main_vtable = type { %struct.IO_vtable*, i32, [5 x i8]*, %Main* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, %struct.IO* (%struct.IO*, %struct.String*)*, %struct.IO* (%struct.IO*, %struct.Int*)*, %struct.String* (%struct.IO*)*, %struct.Int* (%struct.IO*)*, %String* (%Main*)*, %String* (%Main*)*, i32 (%Main*)*, i1 (%Main*, i32)*, %Main* (%Main*, %A*)*, %Main* (%Main*, %A*)*, %Object* (%Main*)* }
%Main = type { %struct.Main_vtable*, %String*, %A*, %A*, i1 }
%A = type { %struct.A_vtable*, i32 }
%struct.A_vtable = type { %struct.Object_vtable*, i32, [2 x i8]*, %A* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A*)*, %A* (%A*, i32)*, %A* (%A*, i32)*, %B* (%A*, i32, i32)*, %C* (%A*, i32)*, %D* (%A*, i32, i32)*, %E* (%A*, i32)* }
%B = type { %struct.B_vtable*, i32 }
%struct.B_vtable = type { %struct.A_vtable*, i32, [2 x i8]*, %B* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A*)*, %A* (%A*, i32)*, %A* (%A*, i32)*, %B* (%A*, i32, i32)*, %C* (%A*, i32)*, %D* (%A*, i32, i32)*, %E* (%B*, i32)* }
%E = type { %struct.E_vtable*, i32 }
%struct.E_vtable = type { %struct.D_vtable*, i32, [2 x i8]*, %E* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A*)*, %A* (%A*, i32)*, %A* (%A*, i32)*, %B* (%A*, i32, i32)*, %C* (%A*, i32)*, %D* (%A*, i32, i32)*, %E* (%B*, i32)*, i1 (%D*, i32)*, %A* (%E*, i32)* }
%struct.D_vtable = type { %struct.B_vtable*, i32, [2 x i8]*, %D* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A*)*, %A* (%A*, i32)*, %A* (%A*, i32)*, %B* (%A*, i32, i32)*, %C* (%A*, i32)*, %D* (%A*, i32, i32)*, %E* (%B*, i32)*, i1 (%D*, i32)* }
%D = type { %struct.D_vtable*, i32 }
%C = type { %struct.C_vtable*, i32 }
%struct.C_vtable = type { %struct.B_vtable*, i32, [2 x i8]*, %C* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A*)*, %A* (%A*, i32)*, %A* (%A*, i32)*, %B* (%A*, i32, i32)*, %C* (%A*, i32)*, %D* (%A*, i32, i32)*, %E* (%C*, i32)*, %A* (%C*, i32)* }
%struct.A2I_vtable = type { %struct.Object_vtable*, i32, [4 x i8]*, %A2I* ()*, %struct.Object* (%struct.Object*)*, %struct.String* (%struct.Object*)*, %struct.Object* (%struct.Object*)*, i32 (%A2I*, %String*)*, %String* (%A2I*, i32)*, i32 (%A2I*, %String*)*, i32 (%A2I*, %String*)*, %String* (%A2I*, i32)*, %String* (%A2I*, i32)* }
%A2I = type { %struct.A2I_vtable* }

@.Object_name = constant [7 x i8] c"Object\00"
@struct.Object_vtable_prototype = global %struct.Object_vtable { %struct.Object_vtable* null, i32 0, [7 x i8]* @.Object_name, %Object* ()* @Object_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy }
@.Int_name = constant [4 x i8] c"Int\00"
@struct.Int_vtable_prototype = global %struct.Int_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 1, [4 x i8]* @.Int_name, %Int* ()* @Int_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy }
@.Bool_name = constant [5 x i8] c"Bool\00"
@struct.Bool_vtable_prototype = global %struct.Bool_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 2, [5 x i8]* @.Bool_name, %Bool* ()* @Bool_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy }
@.String_name = constant [7 x i8] c"String\00"
@struct.String_vtable_prototype = global %struct.String_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 3, [7 x i8]* @.String_name, %String* ()* @String_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, %struct.Int* (%struct.String*)* @String_length, %struct.String* (%struct.String*, %struct.String*)* @String_concat, %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)* @String_substr }
@.IO_name = constant [3 x i8] c"IO\00"
@struct.IO_vtable_prototype = global %struct.IO_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 4, [3 x i8]* @.IO_name, %IO* ()* @IO_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, %struct.IO* (%struct.IO*, %struct.String*)* @IO_out_string, %struct.IO* (%struct.IO*, %struct.Int*)* @IO_out_int, %struct.String* (%struct.IO*)* @IO_in_string, %struct.Int* (%struct.IO*)* @IO_in_int }
@.Main_name = constant [5 x i8] c"Main\00"
@struct.Main_vtable_prototype = global %struct.Main_vtable { %struct.IO_vtable* @struct.IO_vtable_prototype, i32 5, [5 x i8]* @.Main_name, %Main* ()* @Main_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, %struct.IO* (%struct.IO*, %struct.String*)* @IO_out_string, %struct.IO* (%struct.IO*, %struct.Int*)* @IO_out_int, %struct.String* (%struct.IO*)* @IO_in_string, %struct.Int* (%struct.IO*)* @IO_in_int, %String* (%Main*)* @Main_menu, %String* (%Main*)* @Main_prompt, i32 (%Main*)* @Main_get_int, i1 (%Main*, i32)* @Main_is_even, %Main* (%Main*, %A*)* @Main_class_type, %Main* (%Main*, %A*)* @Main_print, %Object* (%Main*)* @Main_main }
@.A_name = constant [2 x i8] c"A\00"
@struct.A_vtable_prototype = global %struct.A_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 6, [2 x i8]* @.A_name, %A* ()* @A_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A*)* @A_value, %A* (%A*, i32)* @A_set_var, %A* (%A*, i32)* @A_method1, %B* (%A*, i32, i32)* @A_method2, %C* (%A*, i32)* @A_method3, %D* (%A*, i32, i32)* @A_method4, %E* (%A*, i32)* @A_method5 }
@.B_name = constant [2 x i8] c"B\00"
@struct.B_vtable_prototype = global %struct.B_vtable { %struct.A_vtable* @struct.A_vtable_prototype, i32 7, [2 x i8]* @.B_name, %B* ()* @B_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A*)* @A_value, %A* (%A*, i32)* @A_set_var, %A* (%A*, i32)* @A_method1, %B* (%A*, i32, i32)* @A_method2, %C* (%A*, i32)* @A_method3, %D* (%A*, i32, i32)* @A_method4, %E* (%B*, i32)* @B_method5 }
@.C_name = constant [2 x i8] c"C\00"
@struct.C_vtable_prototype = global %struct.C_vtable { %struct.B_vtable* @struct.B_vtable_prototype, i32 8, [2 x i8]* @.C_name, %C* ()* @C_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A*)* @A_value, %A* (%A*, i32)* @A_set_var, %A* (%A*, i32)* @A_method1, %B* (%A*, i32, i32)* @A_method2, %C* (%A*, i32)* @A_method3, %D* (%A*, i32, i32)* @A_method4, %E* (%C*, i32)* @C_method5, %A* (%C*, i32)* @C_method6 }
@.D_name = constant [2 x i8] c"D\00"
@struct.D_vtable_prototype = global %struct.D_vtable { %struct.B_vtable* @struct.B_vtable_prototype, i32 9, [2 x i8]* @.D_name, %D* ()* @D_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A*)* @A_value, %A* (%A*, i32)* @A_set_var, %A* (%A*, i32)* @A_method1, %B* (%A*, i32, i32)* @A_method2, %C* (%A*, i32)* @A_method3, %D* (%A*, i32, i32)* @A_method4, %E* (%B*, i32)* @B_method5, i1 (%D*, i32)* @D_method7 }
@.E_name = constant [2 x i8] c"E\00"
@struct.E_vtable_prototype = global %struct.E_vtable { %struct.D_vtable* @struct.D_vtable_prototype, i32 10, [2 x i8]* @.E_name, %E* ()* @E_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A*)* @A_value, %A* (%A*, i32)* @A_set_var, %A* (%A*, i32)* @A_method1, %B* (%A*, i32, i32)* @A_method2, %C* (%A*, i32)* @A_method3, %D* (%A*, i32, i32)* @A_method4, %E* (%B*, i32)* @B_method5, i1 (%D*, i32)* @D_method7, %A* (%E*, i32)* @E_method6 }
@.A2I_name = constant [4 x i8] c"A2I\00"
@struct.A2I_vtable_prototype = global %struct.A2I_vtable { %struct.Object_vtable* @struct.Object_vtable_prototype, i32 11, [4 x i8]* @.A2I_name, %A2I* ()* @A2I_new, %struct.Object* (%struct.Object*)* @Object_abort, %struct.String* (%struct.Object*)* @Object_type_name, %struct.Object* (%struct.Object*)* @Object_copy, i32 (%A2I*, %String*)* @A2I_c2i, %String* (%A2I*, i32)* @A2I_i2c, i32 (%A2I*, %String*)* @A2I_a2i, i32 (%A2I*, %String*)* @A2I_a2i_aux, %String* (%A2I*, i32)* @A2I_i2a, %String* (%A2I*, i32)* @A2I_i2a_aux }
@.str58 = constant [14 x i8] c"<basic class>\00"
@.str57 = constant [2 x i8] c"q\00"
@.str56 = constant [2 x i8] c"j\00"
@.str55 = constant [29 x i8] c"times 8 with a remainder of \00"
@.str54 = constant [13 x i8] c"is equal to \00"
@.str53 = constant [2 x i8] c"h\00"
@.str52 = constant [24 x i8] c"is not divisible by 3.\0A\00"
@.str51 = constant [20 x i8] c"is divisible by 3.\0A\00"
@.str50 = constant [2 x i8] c"g\00"
@.str49 = constant [2 x i8] c"f\00"
@.str48 = constant [2 x i8] c"e\00"
@.str47 = constant [2 x i8] c"d\00"
@.str46 = constant [2 x i8] c"c\00"
@.str45 = constant [2 x i8] c"b\00"
@.str44 = constant [2 x i8] c"a\00"
@.str43 = constant [9 x i8] c"is odd!\0A\00"
@.str42 = constant [10 x i8] c"is even!\0A\00"
@.str41 = constant [8 x i8] c"number \00"
@.str40 = constant [2 x i8] c" \00"
@.str39 = constant [8 x i8] c"Oooops\0A\00"
@.str38 = constant [21 x i8] c"Class type is now E\0A\00"
@.str37 = constant [21 x i8] c"Class type is now D\0A\00"
@.str36 = constant [21 x i8] c"Class type is now C\0A\00"
@.str35 = constant [21 x i8] c"Class type is now B\0A\00"
@.str34 = constant [21 x i8] c"Class type is now A\0A\00"
@.str33 = constant [27 x i8] c"Please enter a number...  \00"
@.str32 = constant [2 x i8] c"\0A\00"
@.str31 = constant [22 x i8] c"\09To quit...enter q:\0A\0A\00"
@.str30 = constant [33 x i8] c"\09To get a new number...enter j:\0A\00"
@.str29 = constant [17 x i8] c"by 8...enter h:\0A\00"
@.str28 = constant [12 x i8] c"\09To divide \00"
@.str27 = constant [31 x i8] c"is a multiple of 3...enter g:\0A\00"
@.str26 = constant [17 x i8] c"\09To find out if \00"
@.str25 = constant [13 x i8] c"...enter f:\0A\00"
@.str24 = constant [10 x i8] c"\09To cube \00"
@.str23 = constant [13 x i8] c"...enter e:\0A\00"
@.str22 = constant [12 x i8] c"\09To square \00"
@.str21 = constant [13 x i8] c"...enter d:\0A\00"
@.str20 = constant [27 x i8] c"\09To find the factorial of \00"
@.str19 = constant [31 x i8] c"and another number...enter c:\0A\00"
@.str18 = constant [33 x i8] c"\09To find the difference between \00"
@.str17 = constant [13 x i8] c"...enter b:\0A\00"
@.str16 = constant [12 x i8] c"\09To negate \00"
@.str15 = constant [13 x i8] c"...enter a:\0A\00"
@.str14 = constant [22 x i8] c"\0A\09To add a number to \00"
@.str13 = constant [2 x i8] c"+\00"
@.str12 = constant [2 x i8] c"-\00"
@.str11 = constant [1 x i8] zeroinitializer
@.str10 = constant [2 x i8] c"9\00"
@.str9 = constant [2 x i8] c"8\00"
@.str8 = constant [2 x i8] c"7\00"
@.str7 = constant [2 x i8] c"6\00"
@.str6 = constant [2 x i8] c"5\00"
@.str5 = constant [2 x i8] c"4\00"
@.str4 = constant [2 x i8] c"3\00"
@.str3 = constant [2 x i8] c"2\00"
@.str2 = constant [2 x i8] c"1\00"
@.str1 = constant [2 x i8] c"0\00"
@.str0 = constant [9 x i8] c"arith.cl\00"

declare i32 @strcmp(i8*, i8*)

declare i32 @printf(i8*, ...)

declare void @abort()

declare i8* @malloc(i32)

declare %Bool* @Bool_new()

declare %Int* @Int_new()

declare %String* @String_new()

declare %IO* @IO_new()

declare %Object* @Object_new()

declare %struct.Object* @Object_abort(%struct.Object*)

declare %struct.String* @Object_type_name(%struct.Object*)

declare %struct.Object* @Object_copy(%struct.Object*)

declare %struct.Int* @String_length(%struct.String*)

declare %struct.String* @String_concat(%struct.String*, %struct.String*)

declare %struct.String* @String_substr(%struct.String*, %struct.Int*, %struct.Int*)

declare %struct.IO* @IO_out_string(%struct.IO*, %struct.String*)

declare %struct.IO* @IO_out_int(%struct.IO*, %struct.Int*)

declare %struct.String* @IO_in_string(%struct.IO*)

declare %struct.Int* @IO_in_int(%struct.IO*)

define i32 @main() {
entry:
  %tmp.0 = call %Main* @Main_new()
  %Main_result = call %Object* @Main_main(%Main* %tmp.0)
  ret i32 0
}

define %Main* @Main_new() {
entry:
  %tmp.2 = getelementptr %Main* null, i32 1
  %tmp.3 = ptrtoint %Main* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %Main*
  %tmp.1 = alloca %Main*
  store %Main* %tmp.0, %Main** %tmp.1
  %tmp.7 = load %Main** %tmp.1
  %tmp.8 = getelementptr %Main* %tmp.7, i32 0, i32 0
  store %struct.Main_vtable* @struct.Main_vtable_prototype, %struct.Main_vtable** %tmp.8
  %tmp.13 = getelementptr %String* null, i32 1
  %tmp.14 = ptrtoint %String* %tmp.13 to i32
  %tmp.15 = call i8* @malloc(i32 %tmp.14)
  %tmp.16 = icmp eq i8* null, %tmp.15
  br i1 %tmp.16, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %malloc_normal0
  %tmp.11 = bitcast i8* %tmp.15 to %String*
  %tmp.12 = alloca %String*
  store %String* %tmp.11, %String** %tmp.12
  %tmp.18 = load %String** %tmp.12
  %tmp.19 = getelementptr %String* %tmp.18, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.19
  %tmp.21 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.22 = getelementptr %String* %tmp.18, i32 0, i32 1
  store i8* %tmp.21, i8** %tmp.22
  %tmp.23 = alloca %String*
  store %String* %tmp.18, %String** %tmp.23
  %tmp.24 = load %String** %tmp.23
  %tmp.25 = getelementptr %Main* %tmp.7, i32 0, i32 1
  store %String* %tmp.24, %String** %tmp.25
  %tmp.27 = alloca %A*
  store %A* null, %A** %tmp.27
  %tmp.29 = load %A** %tmp.27
  %tmp.30 = getelementptr %Main* %tmp.7, i32 0, i32 2
  store %A* %tmp.29, %A** %tmp.30
  %tmp.32 = alloca %A*
  store %A* null, %A** %tmp.32
  %tmp.34 = load %A** %tmp.32
  %tmp.35 = getelementptr %Main* %tmp.7, i32 0, i32 3
  store %A* %tmp.34, %A** %tmp.35
  %tmp.37 = alloca i1
  store i1 true, i1* %tmp.37
  %tmp.38 = load i1* %tmp.37
  %tmp.40 = getelementptr %Main* %tmp.7, i32 0, i32 4
  store i1 %tmp.38, i1* %tmp.40
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %malloc_normal0, %entry
  call void @abort()
  %tmp.44 = getelementptr %Int* null, i32 1
  %tmp.45 = ptrtoint %Int* %tmp.44 to i32
  %tmp.46 = call i8* @malloc(i32 %tmp.45)
  %tmp.47 = icmp eq i8* null, %tmp.46
  br i1 %tmp.47, label %abort, label %malloc_normal2

malloc_normal2:                                   ; preds = %abort
  %tmp.42 = bitcast i8* %tmp.46 to %Int*
  %tmp.43 = alloca %Int*
  store %Int* %tmp.42, %Int** %tmp.43
  %tmp.49 = load %Int** %tmp.43
  %tmp.50 = getelementptr %Int* %tmp.49, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.50
  %tmp.52 = getelementptr %Int* %tmp.49, i32 0, i32 1
  store i32 0, i32* %tmp.52
  %tmp.53 = getelementptr %Int* %tmp.49, i32 0, i32 1
  store i32 -1, i32* %tmp.53
  %tmp.54 = bitcast %Int* %tmp.49 to %Main*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal2, %malloc_normal1
  %UnifiedRetVal = phi %Main* [ %tmp.7, %malloc_normal1 ], [ %tmp.54, %malloc_normal2 ]
  ret %Main* %UnifiedRetVal
}

define %String* @Main_menu(%Main* %self) {
entry:
  %tmp.55 = alloca %Main*
  store %Main* %self, %Main** %tmp.55
  %tmp.58 = getelementptr %String* null, i32 1
  %tmp.59 = ptrtoint %String* %tmp.58 to i32
  %tmp.60 = call i8* @malloc(i32 %tmp.59)
  %tmp.61 = icmp eq i8* null, %tmp.60
  br i1 %tmp.61, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %entry
  %tmp.56 = bitcast i8* %tmp.60 to %String*
  %tmp.57 = alloca %String*
  store %String* %tmp.56, %String** %tmp.57
  %tmp.63 = load %String** %tmp.57
  %tmp.64 = getelementptr %String* %tmp.63, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.64
  %tmp.66 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.67 = getelementptr %String* %tmp.63, i32 0, i32 1
  store i8* %tmp.66, i8** %tmp.67
  %tmp.68 = getelementptr [22 x i8]* @.str14, i32 0, i32 0
  %tmp.69 = getelementptr %String* %tmp.63, i32 0, i32 1
  store i8* %tmp.68, i8** %tmp.69
  %tmp.71 = bitcast %String* %tmp.63 to %struct.String*
  %tmp.72 = load %Main** %tmp.55
  %tmp.73 = icmp eq %Main* null, %tmp.72
  br i1 %tmp.73, label %abort, label %normal4

normal4:                                          ; preds = %malloc_normal3
  %tmp.74 = getelementptr %Main* %tmp.72, i32 0, i32 0
  %tmp.75 = load %struct.Main_vtable** %tmp.74
  %tmp.76 = getelementptr %struct.Main_vtable* %tmp.75, i32 0, i32 7
  %tmp.77 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.76
  %tmp.79 = bitcast %Main* %tmp.72 to %struct.IO*
  %tmp.78 = call %struct.IO* %tmp.77(%struct.IO* %tmp.79, %struct.String* %tmp.71)
  %tmp.81 = load %Main** %tmp.55
  %tmp.83 = getelementptr %Main* %tmp.81, i32 0, i32 2
  %tmp.82 = load %A** %tmp.83
  %tmp.84 = load %Main** %tmp.55
  %tmp.85 = icmp eq %Main* null, %tmp.84
  br i1 %tmp.85, label %abort, label %normal5

normal5:                                          ; preds = %normal4
  %tmp.86 = getelementptr %Main* %tmp.84, i32 0, i32 0
  %tmp.87 = load %struct.Main_vtable** %tmp.86
  %tmp.88 = getelementptr %struct.Main_vtable* %tmp.87, i32 0, i32 16
  %tmp.89 = load %Main* (%Main*, %A*)** %tmp.88
  %tmp.90 = call %Main* %tmp.89(%Main* %tmp.84, %A* %tmp.82)
  %tmp.94 = getelementptr %String* null, i32 1
  %tmp.95 = ptrtoint %String* %tmp.94 to i32
  %tmp.96 = call i8* @malloc(i32 %tmp.95)
  %tmp.97 = icmp eq i8* null, %tmp.96
  br i1 %tmp.97, label %abort, label %malloc_normal6

malloc_normal6:                                   ; preds = %normal5
  %tmp.92 = bitcast i8* %tmp.96 to %String*
  %tmp.93 = alloca %String*
  store %String* %tmp.92, %String** %tmp.93
  %tmp.99 = load %String** %tmp.93
  %tmp.100 = getelementptr %String* %tmp.99, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.100
  %tmp.102 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.103 = getelementptr %String* %tmp.99, i32 0, i32 1
  store i8* %tmp.102, i8** %tmp.103
  %tmp.104 = getelementptr [13 x i8]* @.str15, i32 0, i32 0
  %tmp.105 = getelementptr %String* %tmp.99, i32 0, i32 1
  store i8* %tmp.104, i8** %tmp.105
  %tmp.107 = bitcast %String* %tmp.99 to %struct.String*
  %tmp.108 = load %Main** %tmp.55
  %tmp.109 = icmp eq %Main* null, %tmp.108
  br i1 %tmp.109, label %abort, label %normal7

normal7:                                          ; preds = %malloc_normal6
  %tmp.110 = getelementptr %Main* %tmp.108, i32 0, i32 0
  %tmp.111 = load %struct.Main_vtable** %tmp.110
  %tmp.112 = getelementptr %struct.Main_vtable* %tmp.111, i32 0, i32 7
  %tmp.113 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.112
  %tmp.115 = bitcast %Main* %tmp.108 to %struct.IO*
  %tmp.114 = call %struct.IO* %tmp.113(%struct.IO* %tmp.115, %struct.String* %tmp.107)
  %tmp.119 = getelementptr %String* null, i32 1
  %tmp.120 = ptrtoint %String* %tmp.119 to i32
  %tmp.121 = call i8* @malloc(i32 %tmp.120)
  %tmp.122 = icmp eq i8* null, %tmp.121
  br i1 %tmp.122, label %abort, label %malloc_normal8

malloc_normal8:                                   ; preds = %normal7
  %tmp.117 = bitcast i8* %tmp.121 to %String*
  %tmp.118 = alloca %String*
  store %String* %tmp.117, %String** %tmp.118
  %tmp.124 = load %String** %tmp.118
  %tmp.125 = getelementptr %String* %tmp.124, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.125
  %tmp.127 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.128 = getelementptr %String* %tmp.124, i32 0, i32 1
  store i8* %tmp.127, i8** %tmp.128
  %tmp.129 = getelementptr [12 x i8]* @.str16, i32 0, i32 0
  %tmp.130 = getelementptr %String* %tmp.124, i32 0, i32 1
  store i8* %tmp.129, i8** %tmp.130
  %tmp.132 = bitcast %String* %tmp.124 to %struct.String*
  %tmp.133 = load %Main** %tmp.55
  %tmp.134 = icmp eq %Main* null, %tmp.133
  br i1 %tmp.134, label %abort, label %normal9

normal9:                                          ; preds = %malloc_normal8
  %tmp.135 = getelementptr %Main* %tmp.133, i32 0, i32 0
  %tmp.136 = load %struct.Main_vtable** %tmp.135
  %tmp.137 = getelementptr %struct.Main_vtable* %tmp.136, i32 0, i32 7
  %tmp.138 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.137
  %tmp.140 = bitcast %Main* %tmp.133 to %struct.IO*
  %tmp.139 = call %struct.IO* %tmp.138(%struct.IO* %tmp.140, %struct.String* %tmp.132)
  %tmp.142 = load %Main** %tmp.55
  %tmp.144 = getelementptr %Main* %tmp.142, i32 0, i32 2
  %tmp.143 = load %A** %tmp.144
  %tmp.145 = load %Main** %tmp.55
  %tmp.146 = icmp eq %Main* null, %tmp.145
  br i1 %tmp.146, label %abort, label %normal10

normal10:                                         ; preds = %normal9
  %tmp.147 = getelementptr %Main* %tmp.145, i32 0, i32 0
  %tmp.148 = load %struct.Main_vtable** %tmp.147
  %tmp.149 = getelementptr %struct.Main_vtable* %tmp.148, i32 0, i32 16
  %tmp.150 = load %Main* (%Main*, %A*)** %tmp.149
  %tmp.151 = call %Main* %tmp.150(%Main* %tmp.145, %A* %tmp.143)
  %tmp.155 = getelementptr %String* null, i32 1
  %tmp.156 = ptrtoint %String* %tmp.155 to i32
  %tmp.157 = call i8* @malloc(i32 %tmp.156)
  %tmp.158 = icmp eq i8* null, %tmp.157
  br i1 %tmp.158, label %abort, label %malloc_normal11

malloc_normal11:                                  ; preds = %normal10
  %tmp.153 = bitcast i8* %tmp.157 to %String*
  %tmp.154 = alloca %String*
  store %String* %tmp.153, %String** %tmp.154
  %tmp.160 = load %String** %tmp.154
  %tmp.161 = getelementptr %String* %tmp.160, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.161
  %tmp.163 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.164 = getelementptr %String* %tmp.160, i32 0, i32 1
  store i8* %tmp.163, i8** %tmp.164
  %tmp.165 = getelementptr [13 x i8]* @.str17, i32 0, i32 0
  %tmp.166 = getelementptr %String* %tmp.160, i32 0, i32 1
  store i8* %tmp.165, i8** %tmp.166
  %tmp.168 = bitcast %String* %tmp.160 to %struct.String*
  %tmp.169 = load %Main** %tmp.55
  %tmp.170 = icmp eq %Main* null, %tmp.169
  br i1 %tmp.170, label %abort, label %normal12

normal12:                                         ; preds = %malloc_normal11
  %tmp.171 = getelementptr %Main* %tmp.169, i32 0, i32 0
  %tmp.172 = load %struct.Main_vtable** %tmp.171
  %tmp.173 = getelementptr %struct.Main_vtable* %tmp.172, i32 0, i32 7
  %tmp.174 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.173
  %tmp.176 = bitcast %Main* %tmp.169 to %struct.IO*
  %tmp.175 = call %struct.IO* %tmp.174(%struct.IO* %tmp.176, %struct.String* %tmp.168)
  %tmp.180 = getelementptr %String* null, i32 1
  %tmp.181 = ptrtoint %String* %tmp.180 to i32
  %tmp.182 = call i8* @malloc(i32 %tmp.181)
  %tmp.183 = icmp eq i8* null, %tmp.182
  br i1 %tmp.183, label %abort, label %malloc_normal13

malloc_normal13:                                  ; preds = %normal12
  %tmp.178 = bitcast i8* %tmp.182 to %String*
  %tmp.179 = alloca %String*
  store %String* %tmp.178, %String** %tmp.179
  %tmp.185 = load %String** %tmp.179
  %tmp.186 = getelementptr %String* %tmp.185, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.186
  %tmp.188 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.189 = getelementptr %String* %tmp.185, i32 0, i32 1
  store i8* %tmp.188, i8** %tmp.189
  %tmp.190 = getelementptr [33 x i8]* @.str18, i32 0, i32 0
  %tmp.191 = getelementptr %String* %tmp.185, i32 0, i32 1
  store i8* %tmp.190, i8** %tmp.191
  %tmp.193 = bitcast %String* %tmp.185 to %struct.String*
  %tmp.194 = load %Main** %tmp.55
  %tmp.195 = icmp eq %Main* null, %tmp.194
  br i1 %tmp.195, label %abort, label %normal14

normal14:                                         ; preds = %malloc_normal13
  %tmp.196 = getelementptr %Main* %tmp.194, i32 0, i32 0
  %tmp.197 = load %struct.Main_vtable** %tmp.196
  %tmp.198 = getelementptr %struct.Main_vtable* %tmp.197, i32 0, i32 7
  %tmp.199 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.198
  %tmp.201 = bitcast %Main* %tmp.194 to %struct.IO*
  %tmp.200 = call %struct.IO* %tmp.199(%struct.IO* %tmp.201, %struct.String* %tmp.193)
  %tmp.203 = load %Main** %tmp.55
  %tmp.205 = getelementptr %Main* %tmp.203, i32 0, i32 2
  %tmp.204 = load %A** %tmp.205
  %tmp.206 = load %Main** %tmp.55
  %tmp.207 = icmp eq %Main* null, %tmp.206
  br i1 %tmp.207, label %abort, label %normal15

normal15:                                         ; preds = %normal14
  %tmp.208 = getelementptr %Main* %tmp.206, i32 0, i32 0
  %tmp.209 = load %struct.Main_vtable** %tmp.208
  %tmp.210 = getelementptr %struct.Main_vtable* %tmp.209, i32 0, i32 16
  %tmp.211 = load %Main* (%Main*, %A*)** %tmp.210
  %tmp.212 = call %Main* %tmp.211(%Main* %tmp.206, %A* %tmp.204)
  %tmp.216 = getelementptr %String* null, i32 1
  %tmp.217 = ptrtoint %String* %tmp.216 to i32
  %tmp.218 = call i8* @malloc(i32 %tmp.217)
  %tmp.219 = icmp eq i8* null, %tmp.218
  br i1 %tmp.219, label %abort, label %malloc_normal16

malloc_normal16:                                  ; preds = %normal15
  %tmp.214 = bitcast i8* %tmp.218 to %String*
  %tmp.215 = alloca %String*
  store %String* %tmp.214, %String** %tmp.215
  %tmp.221 = load %String** %tmp.215
  %tmp.222 = getelementptr %String* %tmp.221, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.222
  %tmp.224 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.225 = getelementptr %String* %tmp.221, i32 0, i32 1
  store i8* %tmp.224, i8** %tmp.225
  %tmp.226 = getelementptr [31 x i8]* @.str19, i32 0, i32 0
  %tmp.227 = getelementptr %String* %tmp.221, i32 0, i32 1
  store i8* %tmp.226, i8** %tmp.227
  %tmp.229 = bitcast %String* %tmp.221 to %struct.String*
  %tmp.230 = load %Main** %tmp.55
  %tmp.231 = icmp eq %Main* null, %tmp.230
  br i1 %tmp.231, label %abort, label %normal17

normal17:                                         ; preds = %malloc_normal16
  %tmp.232 = getelementptr %Main* %tmp.230, i32 0, i32 0
  %tmp.233 = load %struct.Main_vtable** %tmp.232
  %tmp.234 = getelementptr %struct.Main_vtable* %tmp.233, i32 0, i32 7
  %tmp.235 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.234
  %tmp.237 = bitcast %Main* %tmp.230 to %struct.IO*
  %tmp.236 = call %struct.IO* %tmp.235(%struct.IO* %tmp.237, %struct.String* %tmp.229)
  %tmp.241 = getelementptr %String* null, i32 1
  %tmp.242 = ptrtoint %String* %tmp.241 to i32
  %tmp.243 = call i8* @malloc(i32 %tmp.242)
  %tmp.244 = icmp eq i8* null, %tmp.243
  br i1 %tmp.244, label %abort, label %malloc_normal18

malloc_normal18:                                  ; preds = %normal17
  %tmp.239 = bitcast i8* %tmp.243 to %String*
  %tmp.240 = alloca %String*
  store %String* %tmp.239, %String** %tmp.240
  %tmp.246 = load %String** %tmp.240
  %tmp.247 = getelementptr %String* %tmp.246, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.247
  %tmp.249 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.250 = getelementptr %String* %tmp.246, i32 0, i32 1
  store i8* %tmp.249, i8** %tmp.250
  %tmp.251 = getelementptr [27 x i8]* @.str20, i32 0, i32 0
  %tmp.252 = getelementptr %String* %tmp.246, i32 0, i32 1
  store i8* %tmp.251, i8** %tmp.252
  %tmp.254 = bitcast %String* %tmp.246 to %struct.String*
  %tmp.255 = load %Main** %tmp.55
  %tmp.256 = icmp eq %Main* null, %tmp.255
  br i1 %tmp.256, label %abort, label %normal19

normal19:                                         ; preds = %malloc_normal18
  %tmp.257 = getelementptr %Main* %tmp.255, i32 0, i32 0
  %tmp.258 = load %struct.Main_vtable** %tmp.257
  %tmp.259 = getelementptr %struct.Main_vtable* %tmp.258, i32 0, i32 7
  %tmp.260 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.259
  %tmp.262 = bitcast %Main* %tmp.255 to %struct.IO*
  %tmp.261 = call %struct.IO* %tmp.260(%struct.IO* %tmp.262, %struct.String* %tmp.254)
  %tmp.264 = load %Main** %tmp.55
  %tmp.266 = getelementptr %Main* %tmp.264, i32 0, i32 2
  %tmp.265 = load %A** %tmp.266
  %tmp.267 = load %Main** %tmp.55
  %tmp.268 = icmp eq %Main* null, %tmp.267
  br i1 %tmp.268, label %abort, label %normal20

normal20:                                         ; preds = %normal19
  %tmp.269 = getelementptr %Main* %tmp.267, i32 0, i32 0
  %tmp.270 = load %struct.Main_vtable** %tmp.269
  %tmp.271 = getelementptr %struct.Main_vtable* %tmp.270, i32 0, i32 16
  %tmp.272 = load %Main* (%Main*, %A*)** %tmp.271
  %tmp.273 = call %Main* %tmp.272(%Main* %tmp.267, %A* %tmp.265)
  %tmp.277 = getelementptr %String* null, i32 1
  %tmp.278 = ptrtoint %String* %tmp.277 to i32
  %tmp.279 = call i8* @malloc(i32 %tmp.278)
  %tmp.280 = icmp eq i8* null, %tmp.279
  br i1 %tmp.280, label %abort, label %malloc_normal21

malloc_normal21:                                  ; preds = %normal20
  %tmp.275 = bitcast i8* %tmp.279 to %String*
  %tmp.276 = alloca %String*
  store %String* %tmp.275, %String** %tmp.276
  %tmp.282 = load %String** %tmp.276
  %tmp.283 = getelementptr %String* %tmp.282, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.283
  %tmp.285 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.286 = getelementptr %String* %tmp.282, i32 0, i32 1
  store i8* %tmp.285, i8** %tmp.286
  %tmp.287 = getelementptr [13 x i8]* @.str21, i32 0, i32 0
  %tmp.288 = getelementptr %String* %tmp.282, i32 0, i32 1
  store i8* %tmp.287, i8** %tmp.288
  %tmp.290 = bitcast %String* %tmp.282 to %struct.String*
  %tmp.291 = load %Main** %tmp.55
  %tmp.292 = icmp eq %Main* null, %tmp.291
  br i1 %tmp.292, label %abort, label %normal22

normal22:                                         ; preds = %malloc_normal21
  %tmp.293 = getelementptr %Main* %tmp.291, i32 0, i32 0
  %tmp.294 = load %struct.Main_vtable** %tmp.293
  %tmp.295 = getelementptr %struct.Main_vtable* %tmp.294, i32 0, i32 7
  %tmp.296 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.295
  %tmp.298 = bitcast %Main* %tmp.291 to %struct.IO*
  %tmp.297 = call %struct.IO* %tmp.296(%struct.IO* %tmp.298, %struct.String* %tmp.290)
  %tmp.302 = getelementptr %String* null, i32 1
  %tmp.303 = ptrtoint %String* %tmp.302 to i32
  %tmp.304 = call i8* @malloc(i32 %tmp.303)
  %tmp.305 = icmp eq i8* null, %tmp.304
  br i1 %tmp.305, label %abort, label %malloc_normal23

malloc_normal23:                                  ; preds = %normal22
  %tmp.300 = bitcast i8* %tmp.304 to %String*
  %tmp.301 = alloca %String*
  store %String* %tmp.300, %String** %tmp.301
  %tmp.307 = load %String** %tmp.301
  %tmp.308 = getelementptr %String* %tmp.307, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.308
  %tmp.310 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.311 = getelementptr %String* %tmp.307, i32 0, i32 1
  store i8* %tmp.310, i8** %tmp.311
  %tmp.312 = getelementptr [12 x i8]* @.str22, i32 0, i32 0
  %tmp.313 = getelementptr %String* %tmp.307, i32 0, i32 1
  store i8* %tmp.312, i8** %tmp.313
  %tmp.315 = bitcast %String* %tmp.307 to %struct.String*
  %tmp.316 = load %Main** %tmp.55
  %tmp.317 = icmp eq %Main* null, %tmp.316
  br i1 %tmp.317, label %abort, label %normal24

normal24:                                         ; preds = %malloc_normal23
  %tmp.318 = getelementptr %Main* %tmp.316, i32 0, i32 0
  %tmp.319 = load %struct.Main_vtable** %tmp.318
  %tmp.320 = getelementptr %struct.Main_vtable* %tmp.319, i32 0, i32 7
  %tmp.321 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.320
  %tmp.323 = bitcast %Main* %tmp.316 to %struct.IO*
  %tmp.322 = call %struct.IO* %tmp.321(%struct.IO* %tmp.323, %struct.String* %tmp.315)
  %tmp.325 = load %Main** %tmp.55
  %tmp.327 = getelementptr %Main* %tmp.325, i32 0, i32 2
  %tmp.326 = load %A** %tmp.327
  %tmp.328 = load %Main** %tmp.55
  %tmp.329 = icmp eq %Main* null, %tmp.328
  br i1 %tmp.329, label %abort, label %normal25

normal25:                                         ; preds = %normal24
  %tmp.330 = getelementptr %Main* %tmp.328, i32 0, i32 0
  %tmp.331 = load %struct.Main_vtable** %tmp.330
  %tmp.332 = getelementptr %struct.Main_vtable* %tmp.331, i32 0, i32 16
  %tmp.333 = load %Main* (%Main*, %A*)** %tmp.332
  %tmp.334 = call %Main* %tmp.333(%Main* %tmp.328, %A* %tmp.326)
  %tmp.338 = getelementptr %String* null, i32 1
  %tmp.339 = ptrtoint %String* %tmp.338 to i32
  %tmp.340 = call i8* @malloc(i32 %tmp.339)
  %tmp.341 = icmp eq i8* null, %tmp.340
  br i1 %tmp.341, label %abort, label %malloc_normal26

malloc_normal26:                                  ; preds = %normal25
  %tmp.336 = bitcast i8* %tmp.340 to %String*
  %tmp.337 = alloca %String*
  store %String* %tmp.336, %String** %tmp.337
  %tmp.343 = load %String** %tmp.337
  %tmp.344 = getelementptr %String* %tmp.343, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.344
  %tmp.346 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.347 = getelementptr %String* %tmp.343, i32 0, i32 1
  store i8* %tmp.346, i8** %tmp.347
  %tmp.348 = getelementptr [13 x i8]* @.str23, i32 0, i32 0
  %tmp.349 = getelementptr %String* %tmp.343, i32 0, i32 1
  store i8* %tmp.348, i8** %tmp.349
  %tmp.351 = bitcast %String* %tmp.343 to %struct.String*
  %tmp.352 = load %Main** %tmp.55
  %tmp.353 = icmp eq %Main* null, %tmp.352
  br i1 %tmp.353, label %abort, label %normal27

normal27:                                         ; preds = %malloc_normal26
  %tmp.354 = getelementptr %Main* %tmp.352, i32 0, i32 0
  %tmp.355 = load %struct.Main_vtable** %tmp.354
  %tmp.356 = getelementptr %struct.Main_vtable* %tmp.355, i32 0, i32 7
  %tmp.357 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.356
  %tmp.359 = bitcast %Main* %tmp.352 to %struct.IO*
  %tmp.358 = call %struct.IO* %tmp.357(%struct.IO* %tmp.359, %struct.String* %tmp.351)
  %tmp.363 = getelementptr %String* null, i32 1
  %tmp.364 = ptrtoint %String* %tmp.363 to i32
  %tmp.365 = call i8* @malloc(i32 %tmp.364)
  %tmp.366 = icmp eq i8* null, %tmp.365
  br i1 %tmp.366, label %abort, label %malloc_normal28

malloc_normal28:                                  ; preds = %normal27
  %tmp.361 = bitcast i8* %tmp.365 to %String*
  %tmp.362 = alloca %String*
  store %String* %tmp.361, %String** %tmp.362
  %tmp.368 = load %String** %tmp.362
  %tmp.369 = getelementptr %String* %tmp.368, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.369
  %tmp.371 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.372 = getelementptr %String* %tmp.368, i32 0, i32 1
  store i8* %tmp.371, i8** %tmp.372
  %tmp.373 = getelementptr [10 x i8]* @.str24, i32 0, i32 0
  %tmp.374 = getelementptr %String* %tmp.368, i32 0, i32 1
  store i8* %tmp.373, i8** %tmp.374
  %tmp.376 = bitcast %String* %tmp.368 to %struct.String*
  %tmp.377 = load %Main** %tmp.55
  %tmp.378 = icmp eq %Main* null, %tmp.377
  br i1 %tmp.378, label %abort, label %normal29

normal29:                                         ; preds = %malloc_normal28
  %tmp.379 = getelementptr %Main* %tmp.377, i32 0, i32 0
  %tmp.380 = load %struct.Main_vtable** %tmp.379
  %tmp.381 = getelementptr %struct.Main_vtable* %tmp.380, i32 0, i32 7
  %tmp.382 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.381
  %tmp.384 = bitcast %Main* %tmp.377 to %struct.IO*
  %tmp.383 = call %struct.IO* %tmp.382(%struct.IO* %tmp.384, %struct.String* %tmp.376)
  %tmp.386 = load %Main** %tmp.55
  %tmp.388 = getelementptr %Main* %tmp.386, i32 0, i32 2
  %tmp.387 = load %A** %tmp.388
  %tmp.389 = load %Main** %tmp.55
  %tmp.390 = icmp eq %Main* null, %tmp.389
  br i1 %tmp.390, label %abort, label %normal30

normal30:                                         ; preds = %normal29
  %tmp.391 = getelementptr %Main* %tmp.389, i32 0, i32 0
  %tmp.392 = load %struct.Main_vtable** %tmp.391
  %tmp.393 = getelementptr %struct.Main_vtable* %tmp.392, i32 0, i32 16
  %tmp.394 = load %Main* (%Main*, %A*)** %tmp.393
  %tmp.395 = call %Main* %tmp.394(%Main* %tmp.389, %A* %tmp.387)
  %tmp.399 = getelementptr %String* null, i32 1
  %tmp.400 = ptrtoint %String* %tmp.399 to i32
  %tmp.401 = call i8* @malloc(i32 %tmp.400)
  %tmp.402 = icmp eq i8* null, %tmp.401
  br i1 %tmp.402, label %abort, label %malloc_normal31

malloc_normal31:                                  ; preds = %normal30
  %tmp.397 = bitcast i8* %tmp.401 to %String*
  %tmp.398 = alloca %String*
  store %String* %tmp.397, %String** %tmp.398
  %tmp.404 = load %String** %tmp.398
  %tmp.405 = getelementptr %String* %tmp.404, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.405
  %tmp.407 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.408 = getelementptr %String* %tmp.404, i32 0, i32 1
  store i8* %tmp.407, i8** %tmp.408
  %tmp.409 = getelementptr [13 x i8]* @.str25, i32 0, i32 0
  %tmp.410 = getelementptr %String* %tmp.404, i32 0, i32 1
  store i8* %tmp.409, i8** %tmp.410
  %tmp.412 = bitcast %String* %tmp.404 to %struct.String*
  %tmp.413 = load %Main** %tmp.55
  %tmp.414 = icmp eq %Main* null, %tmp.413
  br i1 %tmp.414, label %abort, label %normal32

normal32:                                         ; preds = %malloc_normal31
  %tmp.415 = getelementptr %Main* %tmp.413, i32 0, i32 0
  %tmp.416 = load %struct.Main_vtable** %tmp.415
  %tmp.417 = getelementptr %struct.Main_vtable* %tmp.416, i32 0, i32 7
  %tmp.418 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.417
  %tmp.420 = bitcast %Main* %tmp.413 to %struct.IO*
  %tmp.419 = call %struct.IO* %tmp.418(%struct.IO* %tmp.420, %struct.String* %tmp.412)
  %tmp.424 = getelementptr %String* null, i32 1
  %tmp.425 = ptrtoint %String* %tmp.424 to i32
  %tmp.426 = call i8* @malloc(i32 %tmp.425)
  %tmp.427 = icmp eq i8* null, %tmp.426
  br i1 %tmp.427, label %abort, label %malloc_normal33

malloc_normal33:                                  ; preds = %normal32
  %tmp.422 = bitcast i8* %tmp.426 to %String*
  %tmp.423 = alloca %String*
  store %String* %tmp.422, %String** %tmp.423
  %tmp.429 = load %String** %tmp.423
  %tmp.430 = getelementptr %String* %tmp.429, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.430
  %tmp.432 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.433 = getelementptr %String* %tmp.429, i32 0, i32 1
  store i8* %tmp.432, i8** %tmp.433
  %tmp.434 = getelementptr [17 x i8]* @.str26, i32 0, i32 0
  %tmp.435 = getelementptr %String* %tmp.429, i32 0, i32 1
  store i8* %tmp.434, i8** %tmp.435
  %tmp.437 = bitcast %String* %tmp.429 to %struct.String*
  %tmp.438 = load %Main** %tmp.55
  %tmp.439 = icmp eq %Main* null, %tmp.438
  br i1 %tmp.439, label %abort, label %normal34

normal34:                                         ; preds = %malloc_normal33
  %tmp.440 = getelementptr %Main* %tmp.438, i32 0, i32 0
  %tmp.441 = load %struct.Main_vtable** %tmp.440
  %tmp.442 = getelementptr %struct.Main_vtable* %tmp.441, i32 0, i32 7
  %tmp.443 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.442
  %tmp.445 = bitcast %Main* %tmp.438 to %struct.IO*
  %tmp.444 = call %struct.IO* %tmp.443(%struct.IO* %tmp.445, %struct.String* %tmp.437)
  %tmp.447 = load %Main** %tmp.55
  %tmp.449 = getelementptr %Main* %tmp.447, i32 0, i32 2
  %tmp.448 = load %A** %tmp.449
  %tmp.450 = load %Main** %tmp.55
  %tmp.451 = icmp eq %Main* null, %tmp.450
  br i1 %tmp.451, label %abort, label %normal35

normal35:                                         ; preds = %normal34
  %tmp.452 = getelementptr %Main* %tmp.450, i32 0, i32 0
  %tmp.453 = load %struct.Main_vtable** %tmp.452
  %tmp.454 = getelementptr %struct.Main_vtable* %tmp.453, i32 0, i32 16
  %tmp.455 = load %Main* (%Main*, %A*)** %tmp.454
  %tmp.456 = call %Main* %tmp.455(%Main* %tmp.450, %A* %tmp.448)
  %tmp.460 = getelementptr %String* null, i32 1
  %tmp.461 = ptrtoint %String* %tmp.460 to i32
  %tmp.462 = call i8* @malloc(i32 %tmp.461)
  %tmp.463 = icmp eq i8* null, %tmp.462
  br i1 %tmp.463, label %abort, label %malloc_normal36

malloc_normal36:                                  ; preds = %normal35
  %tmp.458 = bitcast i8* %tmp.462 to %String*
  %tmp.459 = alloca %String*
  store %String* %tmp.458, %String** %tmp.459
  %tmp.465 = load %String** %tmp.459
  %tmp.466 = getelementptr %String* %tmp.465, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.466
  %tmp.468 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.469 = getelementptr %String* %tmp.465, i32 0, i32 1
  store i8* %tmp.468, i8** %tmp.469
  %tmp.470 = getelementptr [31 x i8]* @.str27, i32 0, i32 0
  %tmp.471 = getelementptr %String* %tmp.465, i32 0, i32 1
  store i8* %tmp.470, i8** %tmp.471
  %tmp.473 = bitcast %String* %tmp.465 to %struct.String*
  %tmp.474 = load %Main** %tmp.55
  %tmp.475 = icmp eq %Main* null, %tmp.474
  br i1 %tmp.475, label %abort, label %normal37

normal37:                                         ; preds = %malloc_normal36
  %tmp.476 = getelementptr %Main* %tmp.474, i32 0, i32 0
  %tmp.477 = load %struct.Main_vtable** %tmp.476
  %tmp.478 = getelementptr %struct.Main_vtable* %tmp.477, i32 0, i32 7
  %tmp.479 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.478
  %tmp.481 = bitcast %Main* %tmp.474 to %struct.IO*
  %tmp.480 = call %struct.IO* %tmp.479(%struct.IO* %tmp.481, %struct.String* %tmp.473)
  %tmp.485 = getelementptr %String* null, i32 1
  %tmp.486 = ptrtoint %String* %tmp.485 to i32
  %tmp.487 = call i8* @malloc(i32 %tmp.486)
  %tmp.488 = icmp eq i8* null, %tmp.487
  br i1 %tmp.488, label %abort, label %malloc_normal38

malloc_normal38:                                  ; preds = %normal37
  %tmp.483 = bitcast i8* %tmp.487 to %String*
  %tmp.484 = alloca %String*
  store %String* %tmp.483, %String** %tmp.484
  %tmp.490 = load %String** %tmp.484
  %tmp.491 = getelementptr %String* %tmp.490, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.491
  %tmp.493 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.494 = getelementptr %String* %tmp.490, i32 0, i32 1
  store i8* %tmp.493, i8** %tmp.494
  %tmp.495 = getelementptr [12 x i8]* @.str28, i32 0, i32 0
  %tmp.496 = getelementptr %String* %tmp.490, i32 0, i32 1
  store i8* %tmp.495, i8** %tmp.496
  %tmp.498 = bitcast %String* %tmp.490 to %struct.String*
  %tmp.499 = load %Main** %tmp.55
  %tmp.500 = icmp eq %Main* null, %tmp.499
  br i1 %tmp.500, label %abort, label %normal39

normal39:                                         ; preds = %malloc_normal38
  %tmp.501 = getelementptr %Main* %tmp.499, i32 0, i32 0
  %tmp.502 = load %struct.Main_vtable** %tmp.501
  %tmp.503 = getelementptr %struct.Main_vtable* %tmp.502, i32 0, i32 7
  %tmp.504 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.503
  %tmp.506 = bitcast %Main* %tmp.499 to %struct.IO*
  %tmp.505 = call %struct.IO* %tmp.504(%struct.IO* %tmp.506, %struct.String* %tmp.498)
  %tmp.508 = load %Main** %tmp.55
  %tmp.510 = getelementptr %Main* %tmp.508, i32 0, i32 2
  %tmp.509 = load %A** %tmp.510
  %tmp.511 = load %Main** %tmp.55
  %tmp.512 = icmp eq %Main* null, %tmp.511
  br i1 %tmp.512, label %abort, label %normal40

normal40:                                         ; preds = %normal39
  %tmp.513 = getelementptr %Main* %tmp.511, i32 0, i32 0
  %tmp.514 = load %struct.Main_vtable** %tmp.513
  %tmp.515 = getelementptr %struct.Main_vtable* %tmp.514, i32 0, i32 16
  %tmp.516 = load %Main* (%Main*, %A*)** %tmp.515
  %tmp.517 = call %Main* %tmp.516(%Main* %tmp.511, %A* %tmp.509)
  %tmp.521 = getelementptr %String* null, i32 1
  %tmp.522 = ptrtoint %String* %tmp.521 to i32
  %tmp.523 = call i8* @malloc(i32 %tmp.522)
  %tmp.524 = icmp eq i8* null, %tmp.523
  br i1 %tmp.524, label %abort, label %malloc_normal41

malloc_normal41:                                  ; preds = %normal40
  %tmp.519 = bitcast i8* %tmp.523 to %String*
  %tmp.520 = alloca %String*
  store %String* %tmp.519, %String** %tmp.520
  %tmp.526 = load %String** %tmp.520
  %tmp.527 = getelementptr %String* %tmp.526, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.527
  %tmp.529 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.530 = getelementptr %String* %tmp.526, i32 0, i32 1
  store i8* %tmp.529, i8** %tmp.530
  %tmp.531 = getelementptr [17 x i8]* @.str29, i32 0, i32 0
  %tmp.532 = getelementptr %String* %tmp.526, i32 0, i32 1
  store i8* %tmp.531, i8** %tmp.532
  %tmp.534 = bitcast %String* %tmp.526 to %struct.String*
  %tmp.535 = load %Main** %tmp.55
  %tmp.536 = icmp eq %Main* null, %tmp.535
  br i1 %tmp.536, label %abort, label %normal42

normal42:                                         ; preds = %malloc_normal41
  %tmp.537 = getelementptr %Main* %tmp.535, i32 0, i32 0
  %tmp.538 = load %struct.Main_vtable** %tmp.537
  %tmp.539 = getelementptr %struct.Main_vtable* %tmp.538, i32 0, i32 7
  %tmp.540 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.539
  %tmp.542 = bitcast %Main* %tmp.535 to %struct.IO*
  %tmp.541 = call %struct.IO* %tmp.540(%struct.IO* %tmp.542, %struct.String* %tmp.534)
  %tmp.546 = getelementptr %String* null, i32 1
  %tmp.547 = ptrtoint %String* %tmp.546 to i32
  %tmp.548 = call i8* @malloc(i32 %tmp.547)
  %tmp.549 = icmp eq i8* null, %tmp.548
  br i1 %tmp.549, label %abort, label %malloc_normal43

malloc_normal43:                                  ; preds = %normal42
  %tmp.544 = bitcast i8* %tmp.548 to %String*
  %tmp.545 = alloca %String*
  store %String* %tmp.544, %String** %tmp.545
  %tmp.551 = load %String** %tmp.545
  %tmp.552 = getelementptr %String* %tmp.551, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.552
  %tmp.554 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.555 = getelementptr %String* %tmp.551, i32 0, i32 1
  store i8* %tmp.554, i8** %tmp.555
  %tmp.556 = getelementptr [33 x i8]* @.str30, i32 0, i32 0
  %tmp.557 = getelementptr %String* %tmp.551, i32 0, i32 1
  store i8* %tmp.556, i8** %tmp.557
  %tmp.559 = bitcast %String* %tmp.551 to %struct.String*
  %tmp.560 = load %Main** %tmp.55
  %tmp.561 = icmp eq %Main* null, %tmp.560
  br i1 %tmp.561, label %abort, label %normal44

normal44:                                         ; preds = %malloc_normal43
  %tmp.562 = getelementptr %Main* %tmp.560, i32 0, i32 0
  %tmp.563 = load %struct.Main_vtable** %tmp.562
  %tmp.564 = getelementptr %struct.Main_vtable* %tmp.563, i32 0, i32 7
  %tmp.565 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.564
  %tmp.567 = bitcast %Main* %tmp.560 to %struct.IO*
  %tmp.566 = call %struct.IO* %tmp.565(%struct.IO* %tmp.567, %struct.String* %tmp.559)
  %tmp.571 = getelementptr %String* null, i32 1
  %tmp.572 = ptrtoint %String* %tmp.571 to i32
  %tmp.573 = call i8* @malloc(i32 %tmp.572)
  %tmp.574 = icmp eq i8* null, %tmp.573
  br i1 %tmp.574, label %abort, label %malloc_normal45

malloc_normal45:                                  ; preds = %normal44
  %tmp.569 = bitcast i8* %tmp.573 to %String*
  %tmp.570 = alloca %String*
  store %String* %tmp.569, %String** %tmp.570
  %tmp.576 = load %String** %tmp.570
  %tmp.577 = getelementptr %String* %tmp.576, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.577
  %tmp.579 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.580 = getelementptr %String* %tmp.576, i32 0, i32 1
  store i8* %tmp.579, i8** %tmp.580
  %tmp.581 = getelementptr [22 x i8]* @.str31, i32 0, i32 0
  %tmp.582 = getelementptr %String* %tmp.576, i32 0, i32 1
  store i8* %tmp.581, i8** %tmp.582
  %tmp.584 = bitcast %String* %tmp.576 to %struct.String*
  %tmp.585 = load %Main** %tmp.55
  %tmp.586 = icmp eq %Main* null, %tmp.585
  br i1 %tmp.586, label %abort, label %normal46

normal46:                                         ; preds = %malloc_normal45
  %tmp.587 = getelementptr %Main* %tmp.585, i32 0, i32 0
  %tmp.588 = load %struct.Main_vtable** %tmp.587
  %tmp.589 = getelementptr %struct.Main_vtable* %tmp.588, i32 0, i32 7
  %tmp.590 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.589
  %tmp.592 = bitcast %Main* %tmp.585 to %struct.IO*
  %tmp.591 = call %struct.IO* %tmp.590(%struct.IO* %tmp.592, %struct.String* %tmp.584)
  %tmp.594 = load %Main** %tmp.55
  %tmp.595 = icmp eq %Main* null, %tmp.594
  br i1 %tmp.595, label %abort, label %normal47

normal47:                                         ; preds = %normal46
  %tmp.596 = getelementptr %Main* %tmp.594, i32 0, i32 0
  %tmp.597 = load %struct.Main_vtable** %tmp.596
  %tmp.598 = getelementptr %struct.Main_vtable* %tmp.597, i32 0, i32 9
  %tmp.599 = load %struct.String* (%struct.IO*)** %tmp.598
  %tmp.601 = bitcast %Main* %tmp.594 to %struct.IO*
  %tmp.600 = call %struct.String* %tmp.599(%struct.IO* %tmp.601)
  %tmp.602 = bitcast %struct.String* %tmp.600 to %String*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal46, %malloc_normal45, %normal44, %malloc_normal43, %normal42, %malloc_normal41, %normal40, %normal39, %malloc_normal38, %normal37, %malloc_normal36, %normal35, %normal34, %malloc_normal33, %normal32, %malloc_normal31, %normal30, %normal29, %malloc_normal28, %normal27, %malloc_normal26, %normal25, %normal24, %malloc_normal23, %normal22, %malloc_normal21, %normal20, %normal19, %malloc_normal18, %normal17, %malloc_normal16, %normal15, %normal14, %malloc_normal13, %normal12, %malloc_normal11, %normal10, %normal9, %malloc_normal8, %normal7, %malloc_normal6, %normal5, %normal4, %malloc_normal3, %entry
  call void @abort()
  %tmp.606 = getelementptr %Int* null, i32 1
  %tmp.607 = ptrtoint %Int* %tmp.606 to i32
  %tmp.608 = call i8* @malloc(i32 %tmp.607)
  %tmp.609 = icmp eq i8* null, %tmp.608
  br i1 %tmp.609, label %abort, label %malloc_normal48

malloc_normal48:                                  ; preds = %abort
  %tmp.604 = bitcast i8* %tmp.608 to %Int*
  %tmp.605 = alloca %Int*
  store %Int* %tmp.604, %Int** %tmp.605
  %tmp.611 = load %Int** %tmp.605
  %tmp.612 = getelementptr %Int* %tmp.611, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.612
  %tmp.614 = getelementptr %Int* %tmp.611, i32 0, i32 1
  store i32 0, i32* %tmp.614
  %tmp.615 = getelementptr %Int* %tmp.611, i32 0, i32 1
  store i32 -1, i32* %tmp.615
  %tmp.616 = bitcast %Int* %tmp.611 to %String*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal48, %normal47
  %UnifiedRetVal = phi %String* [ %tmp.602, %normal47 ], [ %tmp.616, %malloc_normal48 ]
  ret %String* %UnifiedRetVal
}

define %String* @Main_prompt(%Main* %self) {
entry:
  %tmp.617 = alloca %Main*
  store %Main* %self, %Main** %tmp.617
  %tmp.620 = getelementptr %String* null, i32 1
  %tmp.621 = ptrtoint %String* %tmp.620 to i32
  %tmp.622 = call i8* @malloc(i32 %tmp.621)
  %tmp.623 = icmp eq i8* null, %tmp.622
  br i1 %tmp.623, label %abort, label %malloc_normal49

malloc_normal49:                                  ; preds = %entry
  %tmp.618 = bitcast i8* %tmp.622 to %String*
  %tmp.619 = alloca %String*
  store %String* %tmp.618, %String** %tmp.619
  %tmp.625 = load %String** %tmp.619
  %tmp.626 = getelementptr %String* %tmp.625, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.626
  %tmp.628 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.629 = getelementptr %String* %tmp.625, i32 0, i32 1
  store i8* %tmp.628, i8** %tmp.629
  %tmp.630 = getelementptr [2 x i8]* @.str32, i32 0, i32 0
  %tmp.631 = getelementptr %String* %tmp.625, i32 0, i32 1
  store i8* %tmp.630, i8** %tmp.631
  %tmp.633 = bitcast %String* %tmp.625 to %struct.String*
  %tmp.634 = load %Main** %tmp.617
  %tmp.635 = icmp eq %Main* null, %tmp.634
  br i1 %tmp.635, label %abort, label %normal50

normal50:                                         ; preds = %malloc_normal49
  %tmp.636 = getelementptr %Main* %tmp.634, i32 0, i32 0
  %tmp.637 = load %struct.Main_vtable** %tmp.636
  %tmp.638 = getelementptr %struct.Main_vtable* %tmp.637, i32 0, i32 7
  %tmp.639 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.638
  %tmp.641 = bitcast %Main* %tmp.634 to %struct.IO*
  %tmp.640 = call %struct.IO* %tmp.639(%struct.IO* %tmp.641, %struct.String* %tmp.633)
  %tmp.645 = getelementptr %String* null, i32 1
  %tmp.646 = ptrtoint %String* %tmp.645 to i32
  %tmp.647 = call i8* @malloc(i32 %tmp.646)
  %tmp.648 = icmp eq i8* null, %tmp.647
  br i1 %tmp.648, label %abort, label %malloc_normal51

malloc_normal51:                                  ; preds = %normal50
  %tmp.643 = bitcast i8* %tmp.647 to %String*
  %tmp.644 = alloca %String*
  store %String* %tmp.643, %String** %tmp.644
  %tmp.650 = load %String** %tmp.644
  %tmp.651 = getelementptr %String* %tmp.650, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.651
  %tmp.653 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.654 = getelementptr %String* %tmp.650, i32 0, i32 1
  store i8* %tmp.653, i8** %tmp.654
  %tmp.655 = getelementptr [27 x i8]* @.str33, i32 0, i32 0
  %tmp.656 = getelementptr %String* %tmp.650, i32 0, i32 1
  store i8* %tmp.655, i8** %tmp.656
  %tmp.658 = bitcast %String* %tmp.650 to %struct.String*
  %tmp.659 = load %Main** %tmp.617
  %tmp.660 = icmp eq %Main* null, %tmp.659
  br i1 %tmp.660, label %abort, label %normal52

normal52:                                         ; preds = %malloc_normal51
  %tmp.661 = getelementptr %Main* %tmp.659, i32 0, i32 0
  %tmp.662 = load %struct.Main_vtable** %tmp.661
  %tmp.663 = getelementptr %struct.Main_vtable* %tmp.662, i32 0, i32 7
  %tmp.664 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.663
  %tmp.666 = bitcast %Main* %tmp.659 to %struct.IO*
  %tmp.665 = call %struct.IO* %tmp.664(%struct.IO* %tmp.666, %struct.String* %tmp.658)
  %tmp.668 = load %Main** %tmp.617
  %tmp.669 = icmp eq %Main* null, %tmp.668
  br i1 %tmp.669, label %abort, label %normal53

normal53:                                         ; preds = %normal52
  %tmp.670 = getelementptr %Main* %tmp.668, i32 0, i32 0
  %tmp.671 = load %struct.Main_vtable** %tmp.670
  %tmp.672 = getelementptr %struct.Main_vtable* %tmp.671, i32 0, i32 9
  %tmp.673 = load %struct.String* (%struct.IO*)** %tmp.672
  %tmp.675 = bitcast %Main* %tmp.668 to %struct.IO*
  %tmp.674 = call %struct.String* %tmp.673(%struct.IO* %tmp.675)
  %tmp.676 = bitcast %struct.String* %tmp.674 to %String*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal52, %malloc_normal51, %normal50, %malloc_normal49, %entry
  call void @abort()
  %tmp.680 = getelementptr %Int* null, i32 1
  %tmp.681 = ptrtoint %Int* %tmp.680 to i32
  %tmp.682 = call i8* @malloc(i32 %tmp.681)
  %tmp.683 = icmp eq i8* null, %tmp.682
  br i1 %tmp.683, label %abort, label %malloc_normal54

malloc_normal54:                                  ; preds = %abort
  %tmp.678 = bitcast i8* %tmp.682 to %Int*
  %tmp.679 = alloca %Int*
  store %Int* %tmp.678, %Int** %tmp.679
  %tmp.685 = load %Int** %tmp.679
  %tmp.686 = getelementptr %Int* %tmp.685, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.686
  %tmp.688 = getelementptr %Int* %tmp.685, i32 0, i32 1
  store i32 0, i32* %tmp.688
  %tmp.689 = getelementptr %Int* %tmp.685, i32 0, i32 1
  store i32 -1, i32* %tmp.689
  %tmp.690 = bitcast %Int* %tmp.685 to %String*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal54, %normal53
  %UnifiedRetVal = phi %String* [ %tmp.676, %normal53 ], [ %tmp.690, %malloc_normal54 ]
  ret %String* %UnifiedRetVal
}

define i32 @Main_get_int(%Main* %self) {
entry:
  %tmp.691 = alloca %Main*
  store %Main* %self, %Main** %tmp.691
  %tmp.692 = call %A2I* @A2I_new()
  %tmp.694 = alloca %A2I*
  store %A2I* %tmp.692, %A2I** %tmp.694
  %tmp.695 = load %A2I** %tmp.694
  %tmp.696 = bitcast %A2I** %tmp.694 to %A2I**
  store %A2I* %tmp.695, %A2I** %tmp.696
  %tmp.697 = load %Main** %tmp.691
  %tmp.698 = icmp eq %Main* null, %tmp.697
  br i1 %tmp.698, label %abort, label %normal55

normal55:                                         ; preds = %entry
  %tmp.699 = getelementptr %Main* %tmp.697, i32 0, i32 0
  %tmp.700 = load %struct.Main_vtable** %tmp.699
  %tmp.701 = getelementptr %struct.Main_vtable* %tmp.700, i32 0, i32 12
  %tmp.702 = load %String* (%Main*)** %tmp.701
  %tmp.703 = call %String* %tmp.702(%Main* %tmp.697)
  %tmp.705 = alloca %String*
  store %String* %tmp.703, %String** %tmp.705
  %tmp.706 = load %String** %tmp.705
  %tmp.707 = bitcast %String** %tmp.705 to %String**
  store %String* %tmp.706, %String** %tmp.707
  %tmp.708 = load %String** %tmp.707
  %tmp.709 = load %A2I** %tmp.696
  %tmp.710 = icmp eq %A2I* null, %tmp.709
  br i1 %tmp.710, label %abort, label %normal56

normal56:                                         ; preds = %normal55
  %tmp.711 = getelementptr %A2I* %tmp.709, i32 0, i32 0
  %tmp.712 = load %struct.A2I_vtable** %tmp.711
  %tmp.713 = getelementptr %struct.A2I_vtable* %tmp.712, i32 0, i32 9
  %tmp.714 = load i32 (%A2I*, %String*)** %tmp.713
  %tmp.715 = call i32 %tmp.714(%A2I* %tmp.709, %String* %tmp.708)
  br label %UnifiedReturnBlock

abort:                                            ; preds = %normal55, %entry
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %normal56
  %UnifiedRetVal = phi i32 [ %tmp.715, %normal56 ], [ -1, %abort ]
  ret i32 %UnifiedRetVal
}

define i1 @Main_is_even(%Main* %self, i32 %num) {
entry:
  %tmp.717 = alloca %Main*
  store %Main* %self, %Main** %tmp.717
  %tmp.718 = alloca i32
  store i32 %num, i32* %tmp.718
  %tmp.719 = load i32* %tmp.718
  %tmp.720 = alloca i32
  store i32 %tmp.719, i32* %tmp.720
  %tmp.721 = alloca i1
  %tmp.722 = load i32* %tmp.720
  %tmp.723 = icmp slt i32 %tmp.722, 0
  br i1 %tmp.723, label %then0, label %else0

then0:                                            ; preds = %entry
  %tmp.724 = load i32* %tmp.720
  %tmp.725 = mul i32 %tmp.724, -1
  %tmp.726 = load %Main** %tmp.717
  %tmp.727 = icmp eq %Main* null, %tmp.726
  br i1 %tmp.727, label %abort, label %normal57

normal57:                                         ; preds = %then0
  %tmp.728 = getelementptr %Main* %tmp.726, i32 0, i32 0
  %tmp.729 = load %struct.Main_vtable** %tmp.728
  %tmp.730 = getelementptr %struct.Main_vtable* %tmp.729, i32 0, i32 14
  %tmp.731 = load i1 (%Main*, i32)** %tmp.730
  %tmp.732 = call i1 %tmp.731(%Main* %tmp.726, i32 %tmp.725)
  store i1 %tmp.732, i1* %tmp.721
  br label %after0

else0:                                            ; preds = %entry
  %tmp.733 = alloca i1
  %tmp.734 = load i32* %tmp.720
  %tmp.735 = icmp eq i32 0, %tmp.734
  br i1 %tmp.735, label %then1, label %else1

then1:                                            ; preds = %else0
  store i1 true, i1* %tmp.733
  br label %after1

else1:                                            ; preds = %else0
  %tmp.736 = alloca i1
  %tmp.737 = load i32* %tmp.720
  %tmp.738 = icmp eq i32 1, %tmp.737
  br i1 %tmp.738, label %then2, label %else2

then2:                                            ; preds = %else1
  store i1 false, i1* %tmp.736
  br label %after2

else2:                                            ; preds = %else1
  %tmp.739 = load i32* %tmp.720
  %tmp.740 = sub i32 %tmp.739, 2
  %tmp.741 = load %Main** %tmp.717
  %tmp.742 = icmp eq %Main* null, %tmp.741
  br i1 %tmp.742, label %abort, label %normal58

normal58:                                         ; preds = %else2
  %tmp.743 = getelementptr %Main* %tmp.741, i32 0, i32 0
  %tmp.744 = load %struct.Main_vtable** %tmp.743
  %tmp.745 = getelementptr %struct.Main_vtable* %tmp.744, i32 0, i32 14
  %tmp.746 = load i1 (%Main*, i32)** %tmp.745
  %tmp.747 = call i1 %tmp.746(%Main* %tmp.741, i32 %tmp.740)
  store i1 %tmp.747, i1* %tmp.736
  br label %after2

after2:                                           ; preds = %normal58, %then2
  %tmp.748 = load i1* %tmp.736
  store i1 %tmp.748, i1* %tmp.733
  br label %after1

after1:                                           ; preds = %after2, %then1
  %tmp.749 = load i1* %tmp.733
  store i1 %tmp.749, i1* %tmp.721
  br label %after0

after0:                                           ; preds = %after1, %normal57
  %tmp.750 = load i1* %tmp.721
  br label %UnifiedReturnBlock

abort:                                            ; preds = %else2, %then0
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %after0
  %UnifiedRetVal = phi i1 [ %tmp.750, %after0 ], [ false, %abort ]
  ret i1 %UnifiedRetVal
}

define %Main* @Main_class_type(%Main* %self, %A* %var) {
entry:
  %tmp.752 = alloca %Main*
  store %Main* %self, %Main** %tmp.752
  %tmp.753 = alloca %A*
  store %A* %var, %A** %tmp.753
  %tmp.754 = load %A** %tmp.753
  %tmp.755 = icmp eq %A* null, %tmp.754
  br i1 %tmp.755, label %abort, label %case_normal59

case_normal59:                                    ; preds = %entry
  %tmp.756 = getelementptr %A* %tmp.754, i32 0, i32 0
  %tmp.757 = load %struct.A_vtable** %tmp.756
  %tmp.758 = getelementptr %struct.A_vtable* %tmp.757, i32 0, i32 1
  %tmp.759 = load i32* %tmp.758
  br label %case.hdr.59

case.hdr.59:                                      ; preds = %case_normal59
  %tmp.760 = alloca %Main*
  br label %case.10.60

case.10.60:                                       ; preds = %case.hdr.59
  %vtpm.0 = icmp slt i32 %tmp.759, 10
  br i1 %vtpm.0, label %br_exit.10.60, label %src_gte_br.10.60

src_gte_br.10.60:                                 ; preds = %case.10.60
  %vtpm.1 = icmp sgt i32 %tmp.759, 10
  br i1 %vtpm.1, label %br_exit.10.60, label %src_lte_mc.10.60

src_lte_mc.10.60:                                 ; preds = %src_gte_br.10.60
  %vtpm.2 = alloca %E*
  %tmp.761 = bitcast %A* %tmp.754 to %E*
  store %E* %tmp.761, %E** %vtpm.2
  %tmp.764 = getelementptr %String* null, i32 1
  %tmp.765 = ptrtoint %String* %tmp.764 to i32
  %tmp.766 = call i8* @malloc(i32 %tmp.765)
  %tmp.767 = icmp eq i8* null, %tmp.766
  br i1 %tmp.767, label %abort, label %malloc_normal60

malloc_normal60:                                  ; preds = %src_lte_mc.10.60
  %tmp.762 = bitcast i8* %tmp.766 to %String*
  %tmp.763 = alloca %String*
  store %String* %tmp.762, %String** %tmp.763
  %tmp.769 = load %String** %tmp.763
  %tmp.770 = getelementptr %String* %tmp.769, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.770
  %tmp.772 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.773 = getelementptr %String* %tmp.769, i32 0, i32 1
  store i8* %tmp.772, i8** %tmp.773
  %tmp.774 = getelementptr [21 x i8]* @.str38, i32 0, i32 0
  %tmp.775 = getelementptr %String* %tmp.769, i32 0, i32 1
  store i8* %tmp.774, i8** %tmp.775
  %tmp.777 = bitcast %String* %tmp.769 to %struct.String*
  %tmp.778 = load %Main** %tmp.752
  %tmp.779 = icmp eq %Main* null, %tmp.778
  br i1 %tmp.779, label %abort, label %normal61

normal61:                                         ; preds = %malloc_normal60
  %tmp.780 = getelementptr %Main* %tmp.778, i32 0, i32 0
  %tmp.781 = load %struct.Main_vtable** %tmp.780
  %tmp.782 = getelementptr %struct.Main_vtable* %tmp.781, i32 0, i32 7
  %tmp.783 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.782
  %tmp.785 = bitcast %Main* %tmp.778 to %struct.IO*
  %tmp.784 = call %struct.IO* %tmp.783(%struct.IO* %tmp.785, %struct.String* %tmp.777)
  %tmp.786 = bitcast %struct.IO* %tmp.784 to %Main*
  store %Main* %tmp.786, %Main** %tmp.760
  br label %case.exit.59

br_exit.10.60:                                    ; preds = %src_gte_br.10.60, %case.10.60
  br label %case.9.62

case.9.62:                                        ; preds = %br_exit.10.60
  %vtpm.3 = icmp slt i32 %tmp.759, 9
  br i1 %vtpm.3, label %br_exit.9.62, label %src_gte_br.9.62

src_gte_br.9.62:                                  ; preds = %case.9.62
  %vtpm.4 = icmp sgt i32 %tmp.759, 10
  br i1 %vtpm.4, label %br_exit.9.62, label %src_lte_mc.9.62

src_lte_mc.9.62:                                  ; preds = %src_gte_br.9.62
  %vtpm.5 = alloca %D*
  %tmp.787 = bitcast %A* %tmp.754 to %D*
  store %D* %tmp.787, %D** %vtpm.5
  %tmp.790 = getelementptr %String* null, i32 1
  %tmp.791 = ptrtoint %String* %tmp.790 to i32
  %tmp.792 = call i8* @malloc(i32 %tmp.791)
  %tmp.793 = icmp eq i8* null, %tmp.792
  br i1 %tmp.793, label %abort, label %malloc_normal62

malloc_normal62:                                  ; preds = %src_lte_mc.9.62
  %tmp.788 = bitcast i8* %tmp.792 to %String*
  %tmp.789 = alloca %String*
  store %String* %tmp.788, %String** %tmp.789
  %tmp.795 = load %String** %tmp.789
  %tmp.796 = getelementptr %String* %tmp.795, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.796
  %tmp.798 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.799 = getelementptr %String* %tmp.795, i32 0, i32 1
  store i8* %tmp.798, i8** %tmp.799
  %tmp.800 = getelementptr [21 x i8]* @.str37, i32 0, i32 0
  %tmp.801 = getelementptr %String* %tmp.795, i32 0, i32 1
  store i8* %tmp.800, i8** %tmp.801
  %tmp.803 = bitcast %String* %tmp.795 to %struct.String*
  %tmp.804 = load %Main** %tmp.752
  %tmp.805 = icmp eq %Main* null, %tmp.804
  br i1 %tmp.805, label %abort, label %normal63

normal63:                                         ; preds = %malloc_normal62
  %tmp.806 = getelementptr %Main* %tmp.804, i32 0, i32 0
  %tmp.807 = load %struct.Main_vtable** %tmp.806
  %tmp.808 = getelementptr %struct.Main_vtable* %tmp.807, i32 0, i32 7
  %tmp.809 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.808
  %tmp.811 = bitcast %Main* %tmp.804 to %struct.IO*
  %tmp.810 = call %struct.IO* %tmp.809(%struct.IO* %tmp.811, %struct.String* %tmp.803)
  %tmp.812 = bitcast %struct.IO* %tmp.810 to %Main*
  store %Main* %tmp.812, %Main** %tmp.760
  br label %case.exit.59

br_exit.9.62:                                     ; preds = %src_gte_br.9.62, %case.9.62
  br label %case.8.64

case.8.64:                                        ; preds = %br_exit.9.62
  %vtpm.6 = icmp slt i32 %tmp.759, 8
  br i1 %vtpm.6, label %br_exit.8.64, label %src_gte_br.8.64

src_gte_br.8.64:                                  ; preds = %case.8.64
  %vtpm.7 = icmp sgt i32 %tmp.759, 8
  br i1 %vtpm.7, label %br_exit.8.64, label %src_lte_mc.8.64

src_lte_mc.8.64:                                  ; preds = %src_gte_br.8.64
  %vtpm.8 = alloca %C*
  %tmp.813 = bitcast %A* %tmp.754 to %C*
  store %C* %tmp.813, %C** %vtpm.8
  %tmp.816 = getelementptr %String* null, i32 1
  %tmp.817 = ptrtoint %String* %tmp.816 to i32
  %tmp.818 = call i8* @malloc(i32 %tmp.817)
  %tmp.819 = icmp eq i8* null, %tmp.818
  br i1 %tmp.819, label %abort, label %malloc_normal64

malloc_normal64:                                  ; preds = %src_lte_mc.8.64
  %tmp.814 = bitcast i8* %tmp.818 to %String*
  %tmp.815 = alloca %String*
  store %String* %tmp.814, %String** %tmp.815
  %tmp.821 = load %String** %tmp.815
  %tmp.822 = getelementptr %String* %tmp.821, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.822
  %tmp.824 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.825 = getelementptr %String* %tmp.821, i32 0, i32 1
  store i8* %tmp.824, i8** %tmp.825
  %tmp.826 = getelementptr [21 x i8]* @.str36, i32 0, i32 0
  %tmp.827 = getelementptr %String* %tmp.821, i32 0, i32 1
  store i8* %tmp.826, i8** %tmp.827
  %tmp.829 = bitcast %String* %tmp.821 to %struct.String*
  %tmp.830 = load %Main** %tmp.752
  %tmp.831 = icmp eq %Main* null, %tmp.830
  br i1 %tmp.831, label %abort, label %normal65

normal65:                                         ; preds = %malloc_normal64
  %tmp.832 = getelementptr %Main* %tmp.830, i32 0, i32 0
  %tmp.833 = load %struct.Main_vtable** %tmp.832
  %tmp.834 = getelementptr %struct.Main_vtable* %tmp.833, i32 0, i32 7
  %tmp.835 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.834
  %tmp.837 = bitcast %Main* %tmp.830 to %struct.IO*
  %tmp.836 = call %struct.IO* %tmp.835(%struct.IO* %tmp.837, %struct.String* %tmp.829)
  %tmp.838 = bitcast %struct.IO* %tmp.836 to %Main*
  store %Main* %tmp.838, %Main** %tmp.760
  br label %case.exit.59

br_exit.8.64:                                     ; preds = %src_gte_br.8.64, %case.8.64
  br label %case.7.66

case.7.66:                                        ; preds = %br_exit.8.64
  %vtpm.9 = icmp slt i32 %tmp.759, 7
  br i1 %vtpm.9, label %br_exit.7.66, label %src_gte_br.7.66

src_gte_br.7.66:                                  ; preds = %case.7.66
  %vtpm.10 = icmp sgt i32 %tmp.759, 10
  br i1 %vtpm.10, label %br_exit.7.66, label %src_lte_mc.7.66

src_lte_mc.7.66:                                  ; preds = %src_gte_br.7.66
  %vtpm.11 = alloca %B*
  %tmp.839 = bitcast %A* %tmp.754 to %B*
  store %B* %tmp.839, %B** %vtpm.11
  %tmp.842 = getelementptr %String* null, i32 1
  %tmp.843 = ptrtoint %String* %tmp.842 to i32
  %tmp.844 = call i8* @malloc(i32 %tmp.843)
  %tmp.845 = icmp eq i8* null, %tmp.844
  br i1 %tmp.845, label %abort, label %malloc_normal66

malloc_normal66:                                  ; preds = %src_lte_mc.7.66
  %tmp.840 = bitcast i8* %tmp.844 to %String*
  %tmp.841 = alloca %String*
  store %String* %tmp.840, %String** %tmp.841
  %tmp.847 = load %String** %tmp.841
  %tmp.848 = getelementptr %String* %tmp.847, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.848
  %tmp.850 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.851 = getelementptr %String* %tmp.847, i32 0, i32 1
  store i8* %tmp.850, i8** %tmp.851
  %tmp.852 = getelementptr [21 x i8]* @.str35, i32 0, i32 0
  %tmp.853 = getelementptr %String* %tmp.847, i32 0, i32 1
  store i8* %tmp.852, i8** %tmp.853
  %tmp.855 = bitcast %String* %tmp.847 to %struct.String*
  %tmp.856 = load %Main** %tmp.752
  %tmp.857 = icmp eq %Main* null, %tmp.856
  br i1 %tmp.857, label %abort, label %normal67

normal67:                                         ; preds = %malloc_normal66
  %tmp.858 = getelementptr %Main* %tmp.856, i32 0, i32 0
  %tmp.859 = load %struct.Main_vtable** %tmp.858
  %tmp.860 = getelementptr %struct.Main_vtable* %tmp.859, i32 0, i32 7
  %tmp.861 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.860
  %tmp.863 = bitcast %Main* %tmp.856 to %struct.IO*
  %tmp.862 = call %struct.IO* %tmp.861(%struct.IO* %tmp.863, %struct.String* %tmp.855)
  %tmp.864 = bitcast %struct.IO* %tmp.862 to %Main*
  store %Main* %tmp.864, %Main** %tmp.760
  br label %case.exit.59

br_exit.7.66:                                     ; preds = %src_gte_br.7.66, %case.7.66
  br label %case.6.68

case.6.68:                                        ; preds = %br_exit.7.66
  %vtpm.12 = icmp slt i32 %tmp.759, 6
  br i1 %vtpm.12, label %br_exit.6.68, label %src_gte_br.6.68

src_gte_br.6.68:                                  ; preds = %case.6.68
  %vtpm.13 = icmp sgt i32 %tmp.759, 10
  br i1 %vtpm.13, label %br_exit.6.68, label %src_lte_mc.6.68

src_lte_mc.6.68:                                  ; preds = %src_gte_br.6.68
  %vtpm.14 = alloca %A*
  store %A* %tmp.754, %A** %vtpm.14
  %tmp.867 = getelementptr %String* null, i32 1
  %tmp.868 = ptrtoint %String* %tmp.867 to i32
  %tmp.869 = call i8* @malloc(i32 %tmp.868)
  %tmp.870 = icmp eq i8* null, %tmp.869
  br i1 %tmp.870, label %abort, label %malloc_normal68

malloc_normal68:                                  ; preds = %src_lte_mc.6.68
  %tmp.865 = bitcast i8* %tmp.869 to %String*
  %tmp.866 = alloca %String*
  store %String* %tmp.865, %String** %tmp.866
  %tmp.872 = load %String** %tmp.866
  %tmp.873 = getelementptr %String* %tmp.872, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.873
  %tmp.875 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.876 = getelementptr %String* %tmp.872, i32 0, i32 1
  store i8* %tmp.875, i8** %tmp.876
  %tmp.877 = getelementptr [21 x i8]* @.str34, i32 0, i32 0
  %tmp.878 = getelementptr %String* %tmp.872, i32 0, i32 1
  store i8* %tmp.877, i8** %tmp.878
  %tmp.880 = bitcast %String* %tmp.872 to %struct.String*
  %tmp.881 = load %Main** %tmp.752
  %tmp.882 = icmp eq %Main* null, %tmp.881
  br i1 %tmp.882, label %abort, label %normal69

normal69:                                         ; preds = %malloc_normal68
  %tmp.883 = getelementptr %Main* %tmp.881, i32 0, i32 0
  %tmp.884 = load %struct.Main_vtable** %tmp.883
  %tmp.885 = getelementptr %struct.Main_vtable* %tmp.884, i32 0, i32 7
  %tmp.886 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.885
  %tmp.888 = bitcast %Main* %tmp.881 to %struct.IO*
  %tmp.887 = call %struct.IO* %tmp.886(%struct.IO* %tmp.888, %struct.String* %tmp.880)
  %tmp.889 = bitcast %struct.IO* %tmp.887 to %Main*
  store %Main* %tmp.889, %Main** %tmp.760
  br label %case.exit.59

br_exit.6.68:                                     ; preds = %src_gte_br.6.68, %case.6.68
  br label %case.0.70

case.0.70:                                        ; preds = %br_exit.6.68
  %vtpm.15 = icmp slt i32 %tmp.759, 0
  br i1 %vtpm.15, label %br_exit.0.70, label %src_gte_br.0.70

src_gte_br.0.70:                                  ; preds = %case.0.70
  %vtpm.16 = icmp sgt i32 %tmp.759, 11
  br i1 %vtpm.16, label %br_exit.0.70, label %src_lte_mc.0.70

src_lte_mc.0.70:                                  ; preds = %src_gte_br.0.70
  %vtpm.17 = alloca %Object*
  %tmp.890 = bitcast %A* %tmp.754 to %Object*
  store %Object* %tmp.890, %Object** %vtpm.17
  %tmp.893 = getelementptr %String* null, i32 1
  %tmp.894 = ptrtoint %String* %tmp.893 to i32
  %tmp.895 = call i8* @malloc(i32 %tmp.894)
  %tmp.896 = icmp eq i8* null, %tmp.895
  br i1 %tmp.896, label %abort, label %malloc_normal70

malloc_normal70:                                  ; preds = %src_lte_mc.0.70
  %tmp.891 = bitcast i8* %tmp.895 to %String*
  %tmp.892 = alloca %String*
  store %String* %tmp.891, %String** %tmp.892
  %tmp.898 = load %String** %tmp.892
  %tmp.899 = getelementptr %String* %tmp.898, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.899
  %tmp.901 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.902 = getelementptr %String* %tmp.898, i32 0, i32 1
  store i8* %tmp.901, i8** %tmp.902
  %tmp.903 = getelementptr [8 x i8]* @.str39, i32 0, i32 0
  %tmp.904 = getelementptr %String* %tmp.898, i32 0, i32 1
  store i8* %tmp.903, i8** %tmp.904
  %tmp.906 = bitcast %String* %tmp.898 to %struct.String*
  %tmp.907 = load %Main** %tmp.752
  %tmp.908 = icmp eq %Main* null, %tmp.907
  br i1 %tmp.908, label %abort, label %normal71

normal71:                                         ; preds = %malloc_normal70
  %tmp.909 = getelementptr %Main* %tmp.907, i32 0, i32 0
  %tmp.910 = load %struct.Main_vtable** %tmp.909
  %tmp.911 = getelementptr %struct.Main_vtable* %tmp.910, i32 0, i32 7
  %tmp.912 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.911
  %tmp.914 = bitcast %Main* %tmp.907 to %struct.IO*
  %tmp.913 = call %struct.IO* %tmp.912(%struct.IO* %tmp.914, %struct.String* %tmp.906)
  %tmp.915 = bitcast %struct.IO* %tmp.913 to %Main*
  store %Main* %tmp.915, %Main** %tmp.760
  br label %case.exit.59

br_exit.0.70:                                     ; preds = %src_gte_br.0.70, %case.0.70
  br label %abort

case.exit.59:                                     ; preds = %normal71, %normal69, %normal67, %normal65, %normal63, %normal61
  %tmp.916 = load %Main** %tmp.760
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %br_exit.0.70, %malloc_normal70, %src_lte_mc.0.70, %malloc_normal68, %src_lte_mc.6.68, %malloc_normal66, %src_lte_mc.7.66, %malloc_normal64, %src_lte_mc.8.64, %malloc_normal62, %src_lte_mc.9.62, %malloc_normal60, %src_lte_mc.10.60, %entry
  call void @abort()
  %tmp.920 = getelementptr %Int* null, i32 1
  %tmp.921 = ptrtoint %Int* %tmp.920 to i32
  %tmp.922 = call i8* @malloc(i32 %tmp.921)
  %tmp.923 = icmp eq i8* null, %tmp.922
  br i1 %tmp.923, label %abort, label %malloc_normal73

malloc_normal73:                                  ; preds = %abort
  %tmp.918 = bitcast i8* %tmp.922 to %Int*
  %tmp.919 = alloca %Int*
  store %Int* %tmp.918, %Int** %tmp.919
  %tmp.925 = load %Int** %tmp.919
  %tmp.926 = getelementptr %Int* %tmp.925, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.926
  %tmp.928 = getelementptr %Int* %tmp.925, i32 0, i32 1
  store i32 0, i32* %tmp.928
  %tmp.929 = getelementptr %Int* %tmp.925, i32 0, i32 1
  store i32 -1, i32* %tmp.929
  %tmp.930 = bitcast %Int* %tmp.925 to %Main*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal73, %case.exit.59
  %UnifiedRetVal = phi %Main* [ %tmp.916, %case.exit.59 ], [ %tmp.930, %malloc_normal73 ]
  ret %Main* %UnifiedRetVal
}

define %Main* @Main_print(%Main* %self, %A* %var) {
entry:
  %tmp.931 = alloca %Main*
  store %Main* %self, %Main** %tmp.931
  %tmp.932 = alloca %A*
  store %A* %var, %A** %tmp.932
  %tmp.933 = call %A2I* @A2I_new()
  %tmp.935 = alloca %A2I*
  store %A2I* %tmp.933, %A2I** %tmp.935
  %tmp.936 = load %A2I** %tmp.935
  %tmp.937 = bitcast %A2I** %tmp.935 to %A2I**
  store %A2I* %tmp.936, %A2I** %tmp.937
  %tmp.938 = load %A** %tmp.932
  %tmp.939 = icmp eq %A* null, %tmp.938
  br i1 %tmp.939, label %abort, label %normal74

normal74:                                         ; preds = %entry
  %tmp.940 = getelementptr %A* %tmp.938, i32 0, i32 0
  %tmp.941 = load %struct.A_vtable** %tmp.940
  %tmp.942 = getelementptr %struct.A_vtable* %tmp.941, i32 0, i32 7
  %tmp.943 = load i32 (%A*)** %tmp.942
  %tmp.944 = call i32 %tmp.943(%A* %tmp.938)
  %tmp.945 = load %A2I** %tmp.937
  %tmp.946 = icmp eq %A2I* null, %tmp.945
  br i1 %tmp.946, label %abort, label %normal75

normal75:                                         ; preds = %normal74
  %tmp.947 = getelementptr %A2I* %tmp.945, i32 0, i32 0
  %tmp.948 = load %struct.A2I_vtable** %tmp.947
  %tmp.949 = getelementptr %struct.A2I_vtable* %tmp.948, i32 0, i32 11
  %tmp.950 = load %String* (%A2I*, i32)** %tmp.949
  %tmp.951 = call %String* %tmp.950(%A2I* %tmp.945, i32 %tmp.944)
  %tmp.953 = bitcast %String* %tmp.951 to %struct.String*
  %tmp.954 = load %Main** %tmp.931
  %tmp.955 = icmp eq %Main* null, %tmp.954
  br i1 %tmp.955, label %abort, label %normal76

normal76:                                         ; preds = %normal75
  %tmp.956 = getelementptr %Main* %tmp.954, i32 0, i32 0
  %tmp.957 = load %struct.Main_vtable** %tmp.956
  %tmp.958 = getelementptr %struct.Main_vtable* %tmp.957, i32 0, i32 7
  %tmp.959 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.958
  %tmp.961 = bitcast %Main* %tmp.954 to %struct.IO*
  %tmp.960 = call %struct.IO* %tmp.959(%struct.IO* %tmp.961, %struct.String* %tmp.953)
  %tmp.965 = getelementptr %String* null, i32 1
  %tmp.966 = ptrtoint %String* %tmp.965 to i32
  %tmp.967 = call i8* @malloc(i32 %tmp.966)
  %tmp.968 = icmp eq i8* null, %tmp.967
  br i1 %tmp.968, label %abort, label %malloc_normal77

malloc_normal77:                                  ; preds = %normal76
  %tmp.963 = bitcast i8* %tmp.967 to %String*
  %tmp.964 = alloca %String*
  store %String* %tmp.963, %String** %tmp.964
  %tmp.970 = load %String** %tmp.964
  %tmp.971 = getelementptr %String* %tmp.970, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.971
  %tmp.973 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.974 = getelementptr %String* %tmp.970, i32 0, i32 1
  store i8* %tmp.973, i8** %tmp.974
  %tmp.975 = getelementptr [2 x i8]* @.str40, i32 0, i32 0
  %tmp.976 = getelementptr %String* %tmp.970, i32 0, i32 1
  store i8* %tmp.975, i8** %tmp.976
  %tmp.978 = bitcast %String* %tmp.970 to %struct.String*
  %tmp.979 = load %Main** %tmp.931
  %tmp.980 = icmp eq %Main* null, %tmp.979
  br i1 %tmp.980, label %abort, label %normal78

normal78:                                         ; preds = %malloc_normal77
  %tmp.981 = getelementptr %Main* %tmp.979, i32 0, i32 0
  %tmp.982 = load %struct.Main_vtable** %tmp.981
  %tmp.983 = getelementptr %struct.Main_vtable* %tmp.982, i32 0, i32 7
  %tmp.984 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.983
  %tmp.986 = bitcast %Main* %tmp.979 to %struct.IO*
  %tmp.985 = call %struct.IO* %tmp.984(%struct.IO* %tmp.986, %struct.String* %tmp.978)
  %tmp.987 = bitcast %struct.IO* %tmp.985 to %Main*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %malloc_normal77, %normal76, %normal75, %normal74, %entry
  call void @abort()
  %tmp.991 = getelementptr %Int* null, i32 1
  %tmp.992 = ptrtoint %Int* %tmp.991 to i32
  %tmp.993 = call i8* @malloc(i32 %tmp.992)
  %tmp.994 = icmp eq i8* null, %tmp.993
  br i1 %tmp.994, label %abort, label %malloc_normal79

malloc_normal79:                                  ; preds = %abort
  %tmp.989 = bitcast i8* %tmp.993 to %Int*
  %tmp.990 = alloca %Int*
  store %Int* %tmp.989, %Int** %tmp.990
  %tmp.996 = load %Int** %tmp.990
  %tmp.997 = getelementptr %Int* %tmp.996, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.997
  %tmp.999 = getelementptr %Int* %tmp.996, i32 0, i32 1
  store i32 0, i32* %tmp.999
  %tmp.1000 = getelementptr %Int* %tmp.996, i32 0, i32 1
  store i32 -1, i32* %tmp.1000
  %tmp.1001 = bitcast %Int* %tmp.996 to %Main*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal79, %normal78
  %UnifiedRetVal = phi %Main* [ %tmp.987, %normal78 ], [ %tmp.1001, %malloc_normal79 ]
  ret %Main* %UnifiedRetVal
}

define %Object* @Main_main(%Main* %self) {
entry:
  %tmp.1002 = alloca %Main*
  store %Main* %self, %Main** %tmp.1002
  %tmp.1003 = call %A* @A_new()
  %tmp.1004 = load %Main** %tmp.1002
  %tmp.1005 = getelementptr %Main* %tmp.1004, i32 0, i32 2
  %tmp.1006 = alloca %A*
  store %A* %tmp.1003, %A** %tmp.1006
  %tmp.1007 = load %A** %tmp.1006
  store %A* %tmp.1007, %A** %tmp.1005
  br label %loop0

loop0:                                            ; preds = %after4, %entry
  %tmp.1008 = load %Main** %tmp.1002
  %tmp.1010 = getelementptr %Main* %tmp.1008, i32 0, i32 4
  %tmp.1009 = load i1* %tmp.1010
  br i1 %tmp.1009, label %true0, label %false0

true0:                                            ; preds = %loop0
  %tmp.1013 = getelementptr %String* null, i32 1
  %tmp.1014 = ptrtoint %String* %tmp.1013 to i32
  %tmp.1015 = call i8* @malloc(i32 %tmp.1014)
  %tmp.1016 = icmp eq i8* null, %tmp.1015
  br i1 %tmp.1016, label %abort, label %malloc_normal80

malloc_normal80:                                  ; preds = %true0
  %tmp.1011 = bitcast i8* %tmp.1015 to %String*
  %tmp.1012 = alloca %String*
  store %String* %tmp.1011, %String** %tmp.1012
  %tmp.1018 = load %String** %tmp.1012
  %tmp.1019 = getelementptr %String* %tmp.1018, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1019
  %tmp.1021 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1022 = getelementptr %String* %tmp.1018, i32 0, i32 1
  store i8* %tmp.1021, i8** %tmp.1022
  %tmp.1023 = getelementptr [8 x i8]* @.str41, i32 0, i32 0
  %tmp.1024 = getelementptr %String* %tmp.1018, i32 0, i32 1
  store i8* %tmp.1023, i8** %tmp.1024
  %tmp.1026 = bitcast %String* %tmp.1018 to %struct.String*
  %tmp.1027 = load %Main** %tmp.1002
  %tmp.1028 = icmp eq %Main* null, %tmp.1027
  br i1 %tmp.1028, label %abort, label %normal81

normal81:                                         ; preds = %malloc_normal80
  %tmp.1029 = getelementptr %Main* %tmp.1027, i32 0, i32 0
  %tmp.1030 = load %struct.Main_vtable** %tmp.1029
  %tmp.1031 = getelementptr %struct.Main_vtable* %tmp.1030, i32 0, i32 7
  %tmp.1032 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1031
  %tmp.1034 = bitcast %Main* %tmp.1027 to %struct.IO*
  %tmp.1033 = call %struct.IO* %tmp.1032(%struct.IO* %tmp.1034, %struct.String* %tmp.1026)
  %tmp.1036 = load %Main** %tmp.1002
  %tmp.1038 = getelementptr %Main* %tmp.1036, i32 0, i32 2
  %tmp.1037 = load %A** %tmp.1038
  %tmp.1039 = load %Main** %tmp.1002
  %tmp.1040 = icmp eq %Main* null, %tmp.1039
  br i1 %tmp.1040, label %abort, label %normal82

normal82:                                         ; preds = %normal81
  %tmp.1041 = getelementptr %Main* %tmp.1039, i32 0, i32 0
  %tmp.1042 = load %struct.Main_vtable** %tmp.1041
  %tmp.1043 = getelementptr %struct.Main_vtable* %tmp.1042, i32 0, i32 16
  %tmp.1044 = load %Main* (%Main*, %A*)** %tmp.1043
  %tmp.1045 = call %Main* %tmp.1044(%Main* %tmp.1039, %A* %tmp.1037)
  %tmp.1047 = alloca %Main*
  %tmp.1048 = load %Main** %tmp.1002
  %tmp.1050 = getelementptr %Main* %tmp.1048, i32 0, i32 2
  %tmp.1049 = load %A** %tmp.1050
  %tmp.1051 = icmp eq %A* null, %tmp.1049
  br i1 %tmp.1051, label %abort, label %normal83

normal83:                                         ; preds = %normal82
  %tmp.1052 = getelementptr %A* %tmp.1049, i32 0, i32 0
  %tmp.1053 = load %struct.A_vtable** %tmp.1052
  %tmp.1054 = getelementptr %struct.A_vtable* %tmp.1053, i32 0, i32 7
  %tmp.1055 = load i32 (%A*)** %tmp.1054
  %tmp.1056 = call i32 %tmp.1055(%A* %tmp.1049)
  %tmp.1057 = load %Main** %tmp.1002
  %tmp.1058 = icmp eq %Main* null, %tmp.1057
  br i1 %tmp.1058, label %abort, label %normal84

normal84:                                         ; preds = %normal83
  %tmp.1059 = getelementptr %Main* %tmp.1057, i32 0, i32 0
  %tmp.1060 = load %struct.Main_vtable** %tmp.1059
  %tmp.1061 = getelementptr %struct.Main_vtable* %tmp.1060, i32 0, i32 14
  %tmp.1062 = load i1 (%Main*, i32)** %tmp.1061
  %tmp.1063 = call i1 %tmp.1062(%Main* %tmp.1057, i32 %tmp.1056)
  br i1 %tmp.1063, label %then3, label %else3

then3:                                            ; preds = %normal84
  %tmp.1066 = getelementptr %String* null, i32 1
  %tmp.1067 = ptrtoint %String* %tmp.1066 to i32
  %tmp.1068 = call i8* @malloc(i32 %tmp.1067)
  %tmp.1069 = icmp eq i8* null, %tmp.1068
  br i1 %tmp.1069, label %abort, label %malloc_normal85

malloc_normal85:                                  ; preds = %then3
  %tmp.1064 = bitcast i8* %tmp.1068 to %String*
  %tmp.1065 = alloca %String*
  store %String* %tmp.1064, %String** %tmp.1065
  %tmp.1071 = load %String** %tmp.1065
  %tmp.1072 = getelementptr %String* %tmp.1071, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1072
  %tmp.1074 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1075 = getelementptr %String* %tmp.1071, i32 0, i32 1
  store i8* %tmp.1074, i8** %tmp.1075
  %tmp.1076 = getelementptr [10 x i8]* @.str42, i32 0, i32 0
  %tmp.1077 = getelementptr %String* %tmp.1071, i32 0, i32 1
  store i8* %tmp.1076, i8** %tmp.1077
  %tmp.1079 = bitcast %String* %tmp.1071 to %struct.String*
  %tmp.1080 = load %Main** %tmp.1002
  %tmp.1081 = icmp eq %Main* null, %tmp.1080
  br i1 %tmp.1081, label %abort, label %normal86

normal86:                                         ; preds = %malloc_normal85
  %tmp.1082 = getelementptr %Main* %tmp.1080, i32 0, i32 0
  %tmp.1083 = load %struct.Main_vtable** %tmp.1082
  %tmp.1084 = getelementptr %struct.Main_vtable* %tmp.1083, i32 0, i32 7
  %tmp.1085 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1084
  %tmp.1087 = bitcast %Main* %tmp.1080 to %struct.IO*
  %tmp.1086 = call %struct.IO* %tmp.1085(%struct.IO* %tmp.1087, %struct.String* %tmp.1079)
  %tmp.1088 = bitcast %struct.IO* %tmp.1086 to %Main*
  store %Main* %tmp.1088, %Main** %tmp.1047
  br label %after3

else3:                                            ; preds = %normal84
  %tmp.1091 = getelementptr %String* null, i32 1
  %tmp.1092 = ptrtoint %String* %tmp.1091 to i32
  %tmp.1093 = call i8* @malloc(i32 %tmp.1092)
  %tmp.1094 = icmp eq i8* null, %tmp.1093
  br i1 %tmp.1094, label %abort, label %malloc_normal87

malloc_normal87:                                  ; preds = %else3
  %tmp.1089 = bitcast i8* %tmp.1093 to %String*
  %tmp.1090 = alloca %String*
  store %String* %tmp.1089, %String** %tmp.1090
  %tmp.1096 = load %String** %tmp.1090
  %tmp.1097 = getelementptr %String* %tmp.1096, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1097
  %tmp.1099 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1100 = getelementptr %String* %tmp.1096, i32 0, i32 1
  store i8* %tmp.1099, i8** %tmp.1100
  %tmp.1101 = getelementptr [9 x i8]* @.str43, i32 0, i32 0
  %tmp.1102 = getelementptr %String* %tmp.1096, i32 0, i32 1
  store i8* %tmp.1101, i8** %tmp.1102
  %tmp.1104 = bitcast %String* %tmp.1096 to %struct.String*
  %tmp.1105 = load %Main** %tmp.1002
  %tmp.1106 = icmp eq %Main* null, %tmp.1105
  br i1 %tmp.1106, label %abort, label %normal88

normal88:                                         ; preds = %malloc_normal87
  %tmp.1107 = getelementptr %Main* %tmp.1105, i32 0, i32 0
  %tmp.1108 = load %struct.Main_vtable** %tmp.1107
  %tmp.1109 = getelementptr %struct.Main_vtable* %tmp.1108, i32 0, i32 7
  %tmp.1110 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1109
  %tmp.1112 = bitcast %Main* %tmp.1105 to %struct.IO*
  %tmp.1111 = call %struct.IO* %tmp.1110(%struct.IO* %tmp.1112, %struct.String* %tmp.1104)
  %tmp.1113 = bitcast %struct.IO* %tmp.1111 to %Main*
  store %Main* %tmp.1113, %Main** %tmp.1047
  br label %after3

after3:                                           ; preds = %normal88, %normal86
  %tmp.1115 = load %Main** %tmp.1002
  %tmp.1117 = getelementptr %Main* %tmp.1115, i32 0, i32 2
  %tmp.1116 = load %A** %tmp.1117
  %tmp.1118 = load %Main** %tmp.1002
  %tmp.1119 = icmp eq %Main* null, %tmp.1118
  br i1 %tmp.1119, label %abort, label %normal89

normal89:                                         ; preds = %after3
  %tmp.1120 = getelementptr %Main* %tmp.1118, i32 0, i32 0
  %tmp.1121 = load %struct.Main_vtable** %tmp.1120
  %tmp.1122 = getelementptr %struct.Main_vtable* %tmp.1121, i32 0, i32 15
  %tmp.1123 = load %Main* (%Main*, %A*)** %tmp.1122
  %tmp.1124 = call %Main* %tmp.1123(%Main* %tmp.1118, %A* %tmp.1116)
  %tmp.1126 = load %Main** %tmp.1002
  %tmp.1127 = icmp eq %Main* null, %tmp.1126
  br i1 %tmp.1127, label %abort, label %normal90

normal90:                                         ; preds = %normal89
  %tmp.1128 = getelementptr %Main* %tmp.1126, i32 0, i32 0
  %tmp.1129 = load %struct.Main_vtable** %tmp.1128
  %tmp.1130 = getelementptr %struct.Main_vtable* %tmp.1129, i32 0, i32 11
  %tmp.1131 = load %String* (%Main*)** %tmp.1130
  %tmp.1132 = call %String* %tmp.1131(%Main* %tmp.1126)
  %tmp.1133 = load %Main** %tmp.1002
  %tmp.1134 = getelementptr %Main* %tmp.1133, i32 0, i32 1
  %tmp.1135 = alloca %String*
  store %String* %tmp.1132, %String** %tmp.1135
  %tmp.1136 = load %String** %tmp.1135
  store %String* %tmp.1136, %String** %tmp.1134
  %tmp.1137 = alloca %Object*
  %tmp.1138 = load %Main** %tmp.1002
  %tmp.1140 = getelementptr %Main* %tmp.1138, i32 0, i32 1
  %tmp.1139 = load %String** %tmp.1140
  %tmp.1143 = getelementptr %String* null, i32 1
  %tmp.1144 = ptrtoint %String* %tmp.1143 to i32
  %tmp.1145 = call i8* @malloc(i32 %tmp.1144)
  %tmp.1146 = icmp eq i8* null, %tmp.1145
  br i1 %tmp.1146, label %abort, label %malloc_normal91

malloc_normal91:                                  ; preds = %normal90
  %tmp.1141 = bitcast i8* %tmp.1145 to %String*
  %tmp.1142 = alloca %String*
  store %String* %tmp.1141, %String** %tmp.1142
  %tmp.1148 = load %String** %tmp.1142
  %tmp.1149 = getelementptr %String* %tmp.1148, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1149
  %tmp.1151 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1152 = getelementptr %String* %tmp.1148, i32 0, i32 1
  store i8* %tmp.1151, i8** %tmp.1152
  %tmp.1153 = getelementptr [2 x i8]* @.str44, i32 0, i32 0
  %tmp.1154 = getelementptr %String* %tmp.1148, i32 0, i32 1
  store i8* %tmp.1153, i8** %tmp.1154
  %tmp.1157 = getelementptr %String* %tmp.1139, i32 0, i32 1
  %tmp.1158 = load i8** %tmp.1157
  %tmp.1159 = getelementptr %String* %tmp.1148, i32 0, i32 1
  %tmp.1160 = load i8** %tmp.1159
  %tmp.1156 = call i32 @strcmp(i8* %tmp.1158, i8* %tmp.1160)
  %tmp.1155 = icmp eq i32 %tmp.1156, 0
  br i1 %tmp.1155, label %then4, label %else4

then4:                                            ; preds = %malloc_normal91
  %tmp.1161 = load %Main** %tmp.1002
  %tmp.1162 = icmp eq %Main* null, %tmp.1161
  br i1 %tmp.1162, label %abort, label %normal92

normal92:                                         ; preds = %then4
  %tmp.1163 = getelementptr %Main* %tmp.1161, i32 0, i32 0
  %tmp.1164 = load %struct.Main_vtable** %tmp.1163
  %tmp.1165 = getelementptr %struct.Main_vtable* %tmp.1164, i32 0, i32 13
  %tmp.1166 = load i32 (%Main*)** %tmp.1165
  %tmp.1167 = call i32 %tmp.1166(%Main* %tmp.1161)
  %tmp.1168 = call %A* @A_new()
  %tmp.1169 = icmp eq %A* null, %tmp.1168
  br i1 %tmp.1169, label %abort, label %normal93

normal93:                                         ; preds = %normal92
  %tmp.1170 = getelementptr %A* %tmp.1168, i32 0, i32 0
  %tmp.1171 = load %struct.A_vtable** %tmp.1170
  %tmp.1172 = getelementptr %struct.A_vtable* %tmp.1171, i32 0, i32 8
  %tmp.1173 = load %A* (%A*, i32)** %tmp.1172
  %tmp.1174 = call %A* %tmp.1173(%A* %tmp.1168, i32 %tmp.1167)
  %tmp.1175 = bitcast %A* %tmp.1174 to %A*
  %tmp.1176 = load %Main** %tmp.1002
  %tmp.1177 = getelementptr %Main* %tmp.1176, i32 0, i32 3
  %tmp.1178 = alloca %A*
  store %A* %tmp.1175, %A** %tmp.1178
  %tmp.1179 = load %A** %tmp.1178
  store %A* %tmp.1179, %A** %tmp.1177
  %tmp.1180 = load %Main** %tmp.1002
  %tmp.1182 = getelementptr %Main* %tmp.1180, i32 0, i32 2
  %tmp.1181 = load %A** %tmp.1182
  %tmp.1183 = icmp eq %A* null, %tmp.1181
  br i1 %tmp.1183, label %abort, label %normal94

normal94:                                         ; preds = %normal93
  %tmp.1184 = getelementptr %A* %tmp.1181, i32 0, i32 0
  %tmp.1185 = load %struct.A_vtable** %tmp.1184
  %tmp.1186 = getelementptr %struct.A_vtable* %tmp.1185, i32 0, i32 7
  %tmp.1187 = load i32 (%A*)** %tmp.1186
  %tmp.1188 = call i32 %tmp.1187(%A* %tmp.1181)
  %tmp.1189 = load %Main** %tmp.1002
  %tmp.1191 = getelementptr %Main* %tmp.1189, i32 0, i32 3
  %tmp.1190 = load %A** %tmp.1191
  %tmp.1192 = icmp eq %A* null, %tmp.1190
  br i1 %tmp.1192, label %abort, label %normal95

normal95:                                         ; preds = %normal94
  %tmp.1193 = getelementptr %A* %tmp.1190, i32 0, i32 0
  %tmp.1194 = load %struct.A_vtable** %tmp.1193
  %tmp.1195 = getelementptr %struct.A_vtable* %tmp.1194, i32 0, i32 7
  %tmp.1196 = load i32 (%A*)** %tmp.1195
  %tmp.1197 = call i32 %tmp.1196(%A* %tmp.1190)
  %tmp.1198 = call %B* @B_new()
  %tmp.1199 = icmp eq %B* null, %tmp.1198
  br i1 %tmp.1199, label %abort, label %normal96

normal96:                                         ; preds = %normal95
  %tmp.1200 = getelementptr %B* %tmp.1198, i32 0, i32 0
  %tmp.1201 = load %struct.B_vtable** %tmp.1200
  %tmp.1202 = getelementptr %struct.B_vtable* %tmp.1201, i32 0, i32 10
  %tmp.1203 = load %B* (%A*, i32, i32)** %tmp.1202
  %tmp.1205 = bitcast %B* %tmp.1198 to %A*
  %tmp.1204 = call %B* %tmp.1203(%A* %tmp.1205, i32 %tmp.1188, i32 %tmp.1197)
  %tmp.1206 = load %Main** %tmp.1002
  %tmp.1207 = getelementptr %Main* %tmp.1206, i32 0, i32 2
  %tmp.1208 = alloca %B*
  store %B* %tmp.1204, %B** %tmp.1208
  %tmp.1209 = load %B** %tmp.1208
  %tmp.1210 = bitcast %B* %tmp.1209 to %A*
  store %A* %tmp.1210, %A** %tmp.1207
  %tmp.1211 = bitcast %B* %tmp.1204 to %Object*
  store %Object* %tmp.1211, %Object** %tmp.1137
  br label %after4

else4:                                            ; preds = %malloc_normal91
  %tmp.1212 = alloca %Object*
  %tmp.1213 = load %Main** %tmp.1002
  %tmp.1215 = getelementptr %Main* %tmp.1213, i32 0, i32 1
  %tmp.1214 = load %String** %tmp.1215
  %tmp.1218 = getelementptr %String* null, i32 1
  %tmp.1219 = ptrtoint %String* %tmp.1218 to i32
  %tmp.1220 = call i8* @malloc(i32 %tmp.1219)
  %tmp.1221 = icmp eq i8* null, %tmp.1220
  br i1 %tmp.1221, label %abort, label %malloc_normal97

malloc_normal97:                                  ; preds = %else4
  %tmp.1216 = bitcast i8* %tmp.1220 to %String*
  %tmp.1217 = alloca %String*
  store %String* %tmp.1216, %String** %tmp.1217
  %tmp.1223 = load %String** %tmp.1217
  %tmp.1224 = getelementptr %String* %tmp.1223, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1224
  %tmp.1226 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1227 = getelementptr %String* %tmp.1223, i32 0, i32 1
  store i8* %tmp.1226, i8** %tmp.1227
  %tmp.1228 = getelementptr [2 x i8]* @.str45, i32 0, i32 0
  %tmp.1229 = getelementptr %String* %tmp.1223, i32 0, i32 1
  store i8* %tmp.1228, i8** %tmp.1229
  %tmp.1232 = getelementptr %String* %tmp.1214, i32 0, i32 1
  %tmp.1233 = load i8** %tmp.1232
  %tmp.1234 = getelementptr %String* %tmp.1223, i32 0, i32 1
  %tmp.1235 = load i8** %tmp.1234
  %tmp.1231 = call i32 @strcmp(i8* %tmp.1233, i8* %tmp.1235)
  %tmp.1230 = icmp eq i32 %tmp.1231, 0
  br i1 %tmp.1230, label %then5, label %else5

then5:                                            ; preds = %malloc_normal97
  %tmp.1236 = load %Main** %tmp.1002
  %tmp.1238 = getelementptr %Main* %tmp.1236, i32 0, i32 2
  %tmp.1237 = load %A** %tmp.1238
  %tmp.1239 = icmp eq %A* null, %tmp.1237
  br i1 %tmp.1239, label %abort, label %case_normal98

case_normal98:                                    ; preds = %then5
  %tmp.1240 = getelementptr %A* %tmp.1237, i32 0, i32 0
  %tmp.1241 = load %struct.A_vtable** %tmp.1240
  %tmp.1242 = getelementptr %struct.A_vtable* %tmp.1241, i32 0, i32 1
  %tmp.1243 = load i32* %tmp.1242
  br label %case.hdr.98

case.hdr.98:                                      ; preds = %case_normal98
  %tmp.1244 = alloca %A*
  br label %case.8.99

case.8.99:                                        ; preds = %case.hdr.98
  %vtpm.18 = icmp slt i32 %tmp.1243, 8
  br i1 %vtpm.18, label %br_exit.8.99, label %src_gte_br.8.99

src_gte_br.8.99:                                  ; preds = %case.8.99
  %vtpm.19 = icmp sgt i32 %tmp.1243, 8
  br i1 %vtpm.19, label %br_exit.8.99, label %src_lte_mc.8.99

src_lte_mc.8.99:                                  ; preds = %src_gte_br.8.99
  %vtpm.20 = alloca %C*
  %tmp.1245 = bitcast %A* %tmp.1237 to %C*
  store %C* %tmp.1245, %C** %vtpm.20
  %tmp.1246 = load %C** %vtpm.20
  %tmp.1247 = icmp eq %C* null, %tmp.1246
  br i1 %tmp.1247, label %abort, label %normal99

normal99:                                         ; preds = %src_lte_mc.8.99
  %tmp.1248 = getelementptr %C* %tmp.1246, i32 0, i32 0
  %tmp.1249 = load %struct.C_vtable** %tmp.1248
  %tmp.1250 = getelementptr %struct.C_vtable* %tmp.1249, i32 0, i32 7
  %tmp.1251 = load i32 (%A*)** %tmp.1250
  %tmp.1253 = bitcast %C* %tmp.1246 to %A*
  %tmp.1252 = call i32 %tmp.1251(%A* %tmp.1253)
  %tmp.1254 = load %C** %vtpm.20
  %tmp.1255 = icmp eq %C* null, %tmp.1254
  br i1 %tmp.1255, label %abort, label %normal100

normal100:                                        ; preds = %normal99
  %tmp.1256 = getelementptr %C* %tmp.1254, i32 0, i32 0
  %tmp.1257 = load %struct.C_vtable** %tmp.1256
  %tmp.1258 = getelementptr %struct.C_vtable* %tmp.1257, i32 0, i32 14
  %tmp.1259 = load %A* (%C*, i32)** %tmp.1258
  %tmp.1260 = call %A* %tmp.1259(%C* %tmp.1254, i32 %tmp.1252)
  %tmp.1261 = load %Main** %tmp.1002
  %tmp.1262 = getelementptr %Main* %tmp.1261, i32 0, i32 2
  %tmp.1263 = alloca %A*
  store %A* %tmp.1260, %A** %tmp.1263
  %tmp.1264 = load %A** %tmp.1263
  store %A* %tmp.1264, %A** %tmp.1262
  %tmp.1265 = bitcast %A* %tmp.1260 to %Object*
  %tmp.1266 = bitcast %Object* %tmp.1265 to %A*
  store %A* %tmp.1266, %A** %tmp.1244
  br label %case.exit.98

br_exit.8.99:                                     ; preds = %src_gte_br.8.99, %case.8.99
  br label %case.6.101

case.6.101:                                       ; preds = %br_exit.8.99
  %vtpm.21 = icmp slt i32 %tmp.1243, 6
  br i1 %vtpm.21, label %br_exit.6.101, label %src_gte_br.6.101

src_gte_br.6.101:                                 ; preds = %case.6.101
  %vtpm.22 = icmp sgt i32 %tmp.1243, 10
  br i1 %vtpm.22, label %br_exit.6.101, label %src_lte_mc.6.101

src_lte_mc.6.101:                                 ; preds = %src_gte_br.6.101
  %vtpm.23 = alloca %A*
  store %A* %tmp.1237, %A** %vtpm.23
  %tmp.1267 = load %A** %vtpm.23
  %tmp.1268 = icmp eq %A* null, %tmp.1267
  br i1 %tmp.1268, label %abort, label %normal101

normal101:                                        ; preds = %src_lte_mc.6.101
  %tmp.1269 = getelementptr %A* %tmp.1267, i32 0, i32 0
  %tmp.1270 = load %struct.A_vtable** %tmp.1269
  %tmp.1271 = getelementptr %struct.A_vtable* %tmp.1270, i32 0, i32 7
  %tmp.1272 = load i32 (%A*)** %tmp.1271
  %tmp.1273 = call i32 %tmp.1272(%A* %tmp.1267)
  %tmp.1274 = load %A** %vtpm.23
  %tmp.1275 = icmp eq %A* null, %tmp.1274
  br i1 %tmp.1275, label %abort, label %normal102

normal102:                                        ; preds = %normal101
  %tmp.1276 = getelementptr %A* %tmp.1274, i32 0, i32 0
  %tmp.1277 = load %struct.A_vtable** %tmp.1276
  %tmp.1278 = getelementptr %struct.A_vtable* %tmp.1277, i32 0, i32 11
  %tmp.1279 = load %C* (%A*, i32)** %tmp.1278
  %tmp.1280 = call %C* %tmp.1279(%A* %tmp.1274, i32 %tmp.1273)
  %tmp.1281 = load %Main** %tmp.1002
  %tmp.1282 = getelementptr %Main* %tmp.1281, i32 0, i32 2
  %tmp.1283 = alloca %C*
  store %C* %tmp.1280, %C** %tmp.1283
  %tmp.1284 = load %C** %tmp.1283
  %tmp.1285 = bitcast %C* %tmp.1284 to %A*
  store %A* %tmp.1285, %A** %tmp.1282
  %tmp.1286 = bitcast %C* %tmp.1280 to %Object*
  %tmp.1287 = bitcast %Object* %tmp.1286 to %A*
  store %A* %tmp.1287, %A** %tmp.1244
  br label %case.exit.98

br_exit.6.101:                                    ; preds = %src_gte_br.6.101, %case.6.101
  br label %case.0.103

case.0.103:                                       ; preds = %br_exit.6.101
  %vtpm.24 = icmp slt i32 %tmp.1243, 0
  br i1 %vtpm.24, label %br_exit.0.103, label %src_gte_br.0.103

src_gte_br.0.103:                                 ; preds = %case.0.103
  %vtpm.25 = icmp sgt i32 %tmp.1243, 11
  br i1 %vtpm.25, label %br_exit.0.103, label %src_lte_mc.0.103

src_lte_mc.0.103:                                 ; preds = %src_gte_br.0.103
  %vtpm.26 = alloca %Object*
  %tmp.1288 = bitcast %A* %tmp.1237 to %Object*
  store %Object* %tmp.1288, %Object** %vtpm.26
  %tmp.1291 = getelementptr %String* null, i32 1
  %tmp.1292 = ptrtoint %String* %tmp.1291 to i32
  %tmp.1293 = call i8* @malloc(i32 %tmp.1292)
  %tmp.1294 = icmp eq i8* null, %tmp.1293
  br i1 %tmp.1294, label %abort, label %malloc_normal103

malloc_normal103:                                 ; preds = %src_lte_mc.0.103
  %tmp.1289 = bitcast i8* %tmp.1293 to %String*
  %tmp.1290 = alloca %String*
  store %String* %tmp.1289, %String** %tmp.1290
  %tmp.1296 = load %String** %tmp.1290
  %tmp.1297 = getelementptr %String* %tmp.1296, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1297
  %tmp.1299 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1300 = getelementptr %String* %tmp.1296, i32 0, i32 1
  store i8* %tmp.1299, i8** %tmp.1300
  %tmp.1301 = getelementptr [8 x i8]* @.str39, i32 0, i32 0
  %tmp.1302 = getelementptr %String* %tmp.1296, i32 0, i32 1
  store i8* %tmp.1301, i8** %tmp.1302
  %tmp.1304 = bitcast %String* %tmp.1296 to %struct.String*
  %tmp.1305 = load %Main** %tmp.1002
  %tmp.1306 = icmp eq %Main* null, %tmp.1305
  br i1 %tmp.1306, label %abort, label %normal104

normal104:                                        ; preds = %malloc_normal103
  %tmp.1307 = getelementptr %Main* %tmp.1305, i32 0, i32 0
  %tmp.1308 = load %struct.Main_vtable** %tmp.1307
  %tmp.1309 = getelementptr %struct.Main_vtable* %tmp.1308, i32 0, i32 7
  %tmp.1310 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1309
  %tmp.1312 = bitcast %Main* %tmp.1305 to %struct.IO*
  %tmp.1311 = call %struct.IO* %tmp.1310(%struct.IO* %tmp.1312, %struct.String* %tmp.1304)
  %tmp.1314 = load %Main** %tmp.1002
  %tmp.1315 = icmp eq %Main* null, %tmp.1314
  br i1 %tmp.1315, label %abort, label %normal105

normal105:                                        ; preds = %normal104
  %tmp.1316 = getelementptr %Main* %tmp.1314, i32 0, i32 0
  %tmp.1317 = load %struct.Main_vtable** %tmp.1316
  %tmp.1318 = getelementptr %struct.Main_vtable* %tmp.1317, i32 0, i32 4
  %tmp.1319 = load %struct.Object* (%struct.Object*)** %tmp.1318
  %tmp.1321 = bitcast %Main* %tmp.1314 to %struct.Object*
  %tmp.1320 = call %struct.Object* %tmp.1319(%struct.Object* %tmp.1321)
  %tmp.1325 = getelementptr %Int* null, i32 1
  %tmp.1326 = ptrtoint %Int* %tmp.1325 to i32
  %tmp.1327 = call i8* @malloc(i32 %tmp.1326)
  %tmp.1328 = icmp eq i8* null, %tmp.1327
  br i1 %tmp.1328, label %abort, label %malloc_normal106

malloc_normal106:                                 ; preds = %normal105
  %tmp.1323 = bitcast i8* %tmp.1327 to %Int*
  %tmp.1324 = alloca %Int*
  store %Int* %tmp.1323, %Int** %tmp.1324
  %tmp.1330 = load %Int** %tmp.1324
  %tmp.1331 = getelementptr %Int* %tmp.1330, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.1331
  %tmp.1333 = getelementptr %Int* %tmp.1330, i32 0, i32 1
  store i32 0, i32* %tmp.1333
  %tmp.1334 = getelementptr %Int* %tmp.1330, i32 0, i32 1
  store i32 0, i32* %tmp.1334
  %tmp.1335 = bitcast %Int* %tmp.1330 to %Object*
  %tmp.1336 = bitcast %Object* %tmp.1335 to %A*
  store %A* %tmp.1336, %A** %tmp.1244
  br label %case.exit.98

br_exit.0.103:                                    ; preds = %src_gte_br.0.103, %case.0.103
  br label %abort

case.exit.98:                                     ; preds = %malloc_normal106, %normal102, %normal100
  %tmp.1337 = load %A** %tmp.1244
  %tmp.1338 = bitcast %A* %tmp.1337 to %Object*
  store %Object* %tmp.1338, %Object** %tmp.1212
  br label %after5

else5:                                            ; preds = %malloc_normal97
  %tmp.1339 = alloca %Object*
  %tmp.1340 = load %Main** %tmp.1002
  %tmp.1342 = getelementptr %Main* %tmp.1340, i32 0, i32 1
  %tmp.1341 = load %String** %tmp.1342
  %tmp.1345 = getelementptr %String* null, i32 1
  %tmp.1346 = ptrtoint %String* %tmp.1345 to i32
  %tmp.1347 = call i8* @malloc(i32 %tmp.1346)
  %tmp.1348 = icmp eq i8* null, %tmp.1347
  br i1 %tmp.1348, label %abort, label %malloc_normal108

malloc_normal108:                                 ; preds = %else5
  %tmp.1343 = bitcast i8* %tmp.1347 to %String*
  %tmp.1344 = alloca %String*
  store %String* %tmp.1343, %String** %tmp.1344
  %tmp.1350 = load %String** %tmp.1344
  %tmp.1351 = getelementptr %String* %tmp.1350, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1351
  %tmp.1353 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1354 = getelementptr %String* %tmp.1350, i32 0, i32 1
  store i8* %tmp.1353, i8** %tmp.1354
  %tmp.1355 = getelementptr [2 x i8]* @.str46, i32 0, i32 0
  %tmp.1356 = getelementptr %String* %tmp.1350, i32 0, i32 1
  store i8* %tmp.1355, i8** %tmp.1356
  %tmp.1359 = getelementptr %String* %tmp.1341, i32 0, i32 1
  %tmp.1360 = load i8** %tmp.1359
  %tmp.1361 = getelementptr %String* %tmp.1350, i32 0, i32 1
  %tmp.1362 = load i8** %tmp.1361
  %tmp.1358 = call i32 @strcmp(i8* %tmp.1360, i8* %tmp.1362)
  %tmp.1357 = icmp eq i32 %tmp.1358, 0
  br i1 %tmp.1357, label %then6, label %else6

then6:                                            ; preds = %malloc_normal108
  %tmp.1363 = load %Main** %tmp.1002
  %tmp.1364 = icmp eq %Main* null, %tmp.1363
  br i1 %tmp.1364, label %abort, label %normal109

normal109:                                        ; preds = %then6
  %tmp.1365 = getelementptr %Main* %tmp.1363, i32 0, i32 0
  %tmp.1366 = load %struct.Main_vtable** %tmp.1365
  %tmp.1367 = getelementptr %struct.Main_vtable* %tmp.1366, i32 0, i32 13
  %tmp.1368 = load i32 (%Main*)** %tmp.1367
  %tmp.1369 = call i32 %tmp.1368(%Main* %tmp.1363)
  %tmp.1370 = call %A* @A_new()
  %tmp.1371 = icmp eq %A* null, %tmp.1370
  br i1 %tmp.1371, label %abort, label %normal110

normal110:                                        ; preds = %normal109
  %tmp.1372 = getelementptr %A* %tmp.1370, i32 0, i32 0
  %tmp.1373 = load %struct.A_vtable** %tmp.1372
  %tmp.1374 = getelementptr %struct.A_vtable* %tmp.1373, i32 0, i32 8
  %tmp.1375 = load %A* (%A*, i32)** %tmp.1374
  %tmp.1376 = call %A* %tmp.1375(%A* %tmp.1370, i32 %tmp.1369)
  %tmp.1377 = bitcast %A* %tmp.1376 to %A*
  %tmp.1378 = load %Main** %tmp.1002
  %tmp.1379 = getelementptr %Main* %tmp.1378, i32 0, i32 3
  %tmp.1380 = alloca %A*
  store %A* %tmp.1377, %A** %tmp.1380
  %tmp.1381 = load %A** %tmp.1380
  store %A* %tmp.1381, %A** %tmp.1379
  %tmp.1382 = load %Main** %tmp.1002
  %tmp.1384 = getelementptr %Main* %tmp.1382, i32 0, i32 2
  %tmp.1383 = load %A** %tmp.1384
  %tmp.1385 = icmp eq %A* null, %tmp.1383
  br i1 %tmp.1385, label %abort, label %normal111

normal111:                                        ; preds = %normal110
  %tmp.1386 = getelementptr %A* %tmp.1383, i32 0, i32 0
  %tmp.1387 = load %struct.A_vtable** %tmp.1386
  %tmp.1388 = getelementptr %struct.A_vtable* %tmp.1387, i32 0, i32 7
  %tmp.1389 = load i32 (%A*)** %tmp.1388
  %tmp.1390 = call i32 %tmp.1389(%A* %tmp.1383)
  %tmp.1391 = load %Main** %tmp.1002
  %tmp.1393 = getelementptr %Main* %tmp.1391, i32 0, i32 3
  %tmp.1392 = load %A** %tmp.1393
  %tmp.1394 = icmp eq %A* null, %tmp.1392
  br i1 %tmp.1394, label %abort, label %normal112

normal112:                                        ; preds = %normal111
  %tmp.1395 = getelementptr %A* %tmp.1392, i32 0, i32 0
  %tmp.1396 = load %struct.A_vtable** %tmp.1395
  %tmp.1397 = getelementptr %struct.A_vtable* %tmp.1396, i32 0, i32 7
  %tmp.1398 = load i32 (%A*)** %tmp.1397
  %tmp.1399 = call i32 %tmp.1398(%A* %tmp.1392)
  %tmp.1400 = call %D* @D_new()
  %tmp.1401 = icmp eq %D* null, %tmp.1400
  br i1 %tmp.1401, label %abort, label %normal113

normal113:                                        ; preds = %normal112
  %tmp.1402 = getelementptr %D* %tmp.1400, i32 0, i32 0
  %tmp.1403 = load %struct.D_vtable** %tmp.1402
  %tmp.1404 = getelementptr %struct.D_vtable* %tmp.1403, i32 0, i32 12
  %tmp.1405 = load %D* (%A*, i32, i32)** %tmp.1404
  %tmp.1407 = bitcast %D* %tmp.1400 to %A*
  %tmp.1406 = call %D* %tmp.1405(%A* %tmp.1407, i32 %tmp.1390, i32 %tmp.1399)
  %tmp.1408 = load %Main** %tmp.1002
  %tmp.1409 = getelementptr %Main* %tmp.1408, i32 0, i32 2
  %tmp.1410 = alloca %D*
  store %D* %tmp.1406, %D** %tmp.1410
  %tmp.1411 = load %D** %tmp.1410
  %tmp.1412 = bitcast %D* %tmp.1411 to %A*
  store %A* %tmp.1412, %A** %tmp.1409
  %tmp.1413 = bitcast %D* %tmp.1406 to %Object*
  store %Object* %tmp.1413, %Object** %tmp.1339
  br label %after6

else6:                                            ; preds = %malloc_normal108
  %tmp.1414 = alloca %Object*
  %tmp.1415 = load %Main** %tmp.1002
  %tmp.1417 = getelementptr %Main* %tmp.1415, i32 0, i32 1
  %tmp.1416 = load %String** %tmp.1417
  %tmp.1420 = getelementptr %String* null, i32 1
  %tmp.1421 = ptrtoint %String* %tmp.1420 to i32
  %tmp.1422 = call i8* @malloc(i32 %tmp.1421)
  %tmp.1423 = icmp eq i8* null, %tmp.1422
  br i1 %tmp.1423, label %abort, label %malloc_normal114

malloc_normal114:                                 ; preds = %else6
  %tmp.1418 = bitcast i8* %tmp.1422 to %String*
  %tmp.1419 = alloca %String*
  store %String* %tmp.1418, %String** %tmp.1419
  %tmp.1425 = load %String** %tmp.1419
  %tmp.1426 = getelementptr %String* %tmp.1425, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1426
  %tmp.1428 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1429 = getelementptr %String* %tmp.1425, i32 0, i32 1
  store i8* %tmp.1428, i8** %tmp.1429
  %tmp.1430 = getelementptr [2 x i8]* @.str47, i32 0, i32 0
  %tmp.1431 = getelementptr %String* %tmp.1425, i32 0, i32 1
  store i8* %tmp.1430, i8** %tmp.1431
  %tmp.1434 = getelementptr %String* %tmp.1416, i32 0, i32 1
  %tmp.1435 = load i8** %tmp.1434
  %tmp.1436 = getelementptr %String* %tmp.1425, i32 0, i32 1
  %tmp.1437 = load i8** %tmp.1436
  %tmp.1433 = call i32 @strcmp(i8* %tmp.1435, i8* %tmp.1437)
  %tmp.1432 = icmp eq i32 %tmp.1433, 0
  br i1 %tmp.1432, label %then7, label %else7

then7:                                            ; preds = %malloc_normal114
  %tmp.1438 = load %Main** %tmp.1002
  %tmp.1440 = getelementptr %Main* %tmp.1438, i32 0, i32 2
  %tmp.1439 = load %A** %tmp.1440
  %tmp.1441 = icmp eq %A* null, %tmp.1439
  br i1 %tmp.1441, label %abort, label %normal115

normal115:                                        ; preds = %then7
  %tmp.1442 = getelementptr %A* %tmp.1439, i32 0, i32 0
  %tmp.1443 = load %struct.A_vtable** %tmp.1442
  %tmp.1444 = getelementptr %struct.A_vtable* %tmp.1443, i32 0, i32 7
  %tmp.1445 = load i32 (%A*)** %tmp.1444
  %tmp.1446 = call i32 %tmp.1445(%A* %tmp.1439)
  %tmp.1447 = call %C* @C_new()
  %tmp.1448 = icmp eq %C* null, %tmp.1447
  br i1 %tmp.1448, label %abort, label %normal116

normal116:                                        ; preds = %normal115
  %tmp.1449 = bitcast %C* %tmp.1447 to %A*
  %tmp.1450 = call %E* @A_method5(%A* %tmp.1449, i32 %tmp.1446)
  %tmp.1451 = load %Main** %tmp.1002
  %tmp.1452 = getelementptr %Main* %tmp.1451, i32 0, i32 2
  %tmp.1453 = alloca %E*
  store %E* %tmp.1450, %E** %tmp.1453
  %tmp.1454 = load %E** %tmp.1453
  %tmp.1455 = bitcast %E* %tmp.1454 to %A*
  store %A* %tmp.1455, %A** %tmp.1452
  %tmp.1456 = bitcast %E* %tmp.1450 to %Object*
  store %Object* %tmp.1456, %Object** %tmp.1414
  br label %after7

else7:                                            ; preds = %malloc_normal114
  %tmp.1457 = alloca %Object*
  %tmp.1458 = load %Main** %tmp.1002
  %tmp.1460 = getelementptr %Main* %tmp.1458, i32 0, i32 1
  %tmp.1459 = load %String** %tmp.1460
  %tmp.1463 = getelementptr %String* null, i32 1
  %tmp.1464 = ptrtoint %String* %tmp.1463 to i32
  %tmp.1465 = call i8* @malloc(i32 %tmp.1464)
  %tmp.1466 = icmp eq i8* null, %tmp.1465
  br i1 %tmp.1466, label %abort, label %malloc_normal117

malloc_normal117:                                 ; preds = %else7
  %tmp.1461 = bitcast i8* %tmp.1465 to %String*
  %tmp.1462 = alloca %String*
  store %String* %tmp.1461, %String** %tmp.1462
  %tmp.1468 = load %String** %tmp.1462
  %tmp.1469 = getelementptr %String* %tmp.1468, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1469
  %tmp.1471 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1472 = getelementptr %String* %tmp.1468, i32 0, i32 1
  store i8* %tmp.1471, i8** %tmp.1472
  %tmp.1473 = getelementptr [2 x i8]* @.str48, i32 0, i32 0
  %tmp.1474 = getelementptr %String* %tmp.1468, i32 0, i32 1
  store i8* %tmp.1473, i8** %tmp.1474
  %tmp.1477 = getelementptr %String* %tmp.1459, i32 0, i32 1
  %tmp.1478 = load i8** %tmp.1477
  %tmp.1479 = getelementptr %String* %tmp.1468, i32 0, i32 1
  %tmp.1480 = load i8** %tmp.1479
  %tmp.1476 = call i32 @strcmp(i8* %tmp.1478, i8* %tmp.1480)
  %tmp.1475 = icmp eq i32 %tmp.1476, 0
  br i1 %tmp.1475, label %then8, label %else8

then8:                                            ; preds = %malloc_normal117
  %tmp.1481 = load %Main** %tmp.1002
  %tmp.1483 = getelementptr %Main* %tmp.1481, i32 0, i32 2
  %tmp.1482 = load %A** %tmp.1483
  %tmp.1484 = icmp eq %A* null, %tmp.1482
  br i1 %tmp.1484, label %abort, label %normal118

normal118:                                        ; preds = %then8
  %tmp.1485 = getelementptr %A* %tmp.1482, i32 0, i32 0
  %tmp.1486 = load %struct.A_vtable** %tmp.1485
  %tmp.1487 = getelementptr %struct.A_vtable* %tmp.1486, i32 0, i32 7
  %tmp.1488 = load i32 (%A*)** %tmp.1487
  %tmp.1489 = call i32 %tmp.1488(%A* %tmp.1482)
  %tmp.1490 = call %C* @C_new()
  %tmp.1491 = icmp eq %C* null, %tmp.1490
  br i1 %tmp.1491, label %abort, label %normal119

normal119:                                        ; preds = %normal118
  %tmp.1492 = bitcast %C* %tmp.1490 to %B*
  %tmp.1493 = call %E* @B_method5(%B* %tmp.1492, i32 %tmp.1489)
  %tmp.1494 = load %Main** %tmp.1002
  %tmp.1495 = getelementptr %Main* %tmp.1494, i32 0, i32 2
  %tmp.1496 = alloca %E*
  store %E* %tmp.1493, %E** %tmp.1496
  %tmp.1497 = load %E** %tmp.1496
  %tmp.1498 = bitcast %E* %tmp.1497 to %A*
  store %A* %tmp.1498, %A** %tmp.1495
  %tmp.1499 = bitcast %E* %tmp.1493 to %Object*
  store %Object* %tmp.1499, %Object** %tmp.1457
  br label %after8

else8:                                            ; preds = %malloc_normal117
  %tmp.1500 = alloca %Object*
  %tmp.1501 = load %Main** %tmp.1002
  %tmp.1503 = getelementptr %Main* %tmp.1501, i32 0, i32 1
  %tmp.1502 = load %String** %tmp.1503
  %tmp.1506 = getelementptr %String* null, i32 1
  %tmp.1507 = ptrtoint %String* %tmp.1506 to i32
  %tmp.1508 = call i8* @malloc(i32 %tmp.1507)
  %tmp.1509 = icmp eq i8* null, %tmp.1508
  br i1 %tmp.1509, label %abort, label %malloc_normal120

malloc_normal120:                                 ; preds = %else8
  %tmp.1504 = bitcast i8* %tmp.1508 to %String*
  %tmp.1505 = alloca %String*
  store %String* %tmp.1504, %String** %tmp.1505
  %tmp.1511 = load %String** %tmp.1505
  %tmp.1512 = getelementptr %String* %tmp.1511, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1512
  %tmp.1514 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1515 = getelementptr %String* %tmp.1511, i32 0, i32 1
  store i8* %tmp.1514, i8** %tmp.1515
  %tmp.1516 = getelementptr [2 x i8]* @.str49, i32 0, i32 0
  %tmp.1517 = getelementptr %String* %tmp.1511, i32 0, i32 1
  store i8* %tmp.1516, i8** %tmp.1517
  %tmp.1520 = getelementptr %String* %tmp.1502, i32 0, i32 1
  %tmp.1521 = load i8** %tmp.1520
  %tmp.1522 = getelementptr %String* %tmp.1511, i32 0, i32 1
  %tmp.1523 = load i8** %tmp.1522
  %tmp.1519 = call i32 @strcmp(i8* %tmp.1521, i8* %tmp.1523)
  %tmp.1518 = icmp eq i32 %tmp.1519, 0
  br i1 %tmp.1518, label %then9, label %else9

then9:                                            ; preds = %malloc_normal120
  %tmp.1524 = load %Main** %tmp.1002
  %tmp.1526 = getelementptr %Main* %tmp.1524, i32 0, i32 2
  %tmp.1525 = load %A** %tmp.1526
  %tmp.1527 = icmp eq %A* null, %tmp.1525
  br i1 %tmp.1527, label %abort, label %normal121

normal121:                                        ; preds = %then9
  %tmp.1528 = getelementptr %A* %tmp.1525, i32 0, i32 0
  %tmp.1529 = load %struct.A_vtable** %tmp.1528
  %tmp.1530 = getelementptr %struct.A_vtable* %tmp.1529, i32 0, i32 7
  %tmp.1531 = load i32 (%A*)** %tmp.1530
  %tmp.1532 = call i32 %tmp.1531(%A* %tmp.1525)
  %tmp.1533 = call %C* @C_new()
  %tmp.1534 = icmp eq %C* null, %tmp.1533
  br i1 %tmp.1534, label %abort, label %normal122

normal122:                                        ; preds = %normal121
  %tmp.1535 = call %E* @C_method5(%C* %tmp.1533, i32 %tmp.1532)
  %tmp.1536 = load %Main** %tmp.1002
  %tmp.1537 = getelementptr %Main* %tmp.1536, i32 0, i32 2
  %tmp.1538 = alloca %E*
  store %E* %tmp.1535, %E** %tmp.1538
  %tmp.1539 = load %E** %tmp.1538
  %tmp.1540 = bitcast %E* %tmp.1539 to %A*
  store %A* %tmp.1540, %A** %tmp.1537
  %tmp.1541 = bitcast %E* %tmp.1535 to %Object*
  store %Object* %tmp.1541, %Object** %tmp.1500
  br label %after9

else9:                                            ; preds = %malloc_normal120
  %tmp.1542 = alloca %Object*
  %tmp.1543 = load %Main** %tmp.1002
  %tmp.1545 = getelementptr %Main* %tmp.1543, i32 0, i32 1
  %tmp.1544 = load %String** %tmp.1545
  %tmp.1548 = getelementptr %String* null, i32 1
  %tmp.1549 = ptrtoint %String* %tmp.1548 to i32
  %tmp.1550 = call i8* @malloc(i32 %tmp.1549)
  %tmp.1551 = icmp eq i8* null, %tmp.1550
  br i1 %tmp.1551, label %abort, label %malloc_normal123

malloc_normal123:                                 ; preds = %else9
  %tmp.1546 = bitcast i8* %tmp.1550 to %String*
  %tmp.1547 = alloca %String*
  store %String* %tmp.1546, %String** %tmp.1547
  %tmp.1553 = load %String** %tmp.1547
  %tmp.1554 = getelementptr %String* %tmp.1553, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1554
  %tmp.1556 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1557 = getelementptr %String* %tmp.1553, i32 0, i32 1
  store i8* %tmp.1556, i8** %tmp.1557
  %tmp.1558 = getelementptr [2 x i8]* @.str50, i32 0, i32 0
  %tmp.1559 = getelementptr %String* %tmp.1553, i32 0, i32 1
  store i8* %tmp.1558, i8** %tmp.1559
  %tmp.1562 = getelementptr %String* %tmp.1544, i32 0, i32 1
  %tmp.1563 = load i8** %tmp.1562
  %tmp.1564 = getelementptr %String* %tmp.1553, i32 0, i32 1
  %tmp.1565 = load i8** %tmp.1564
  %tmp.1561 = call i32 @strcmp(i8* %tmp.1563, i8* %tmp.1565)
  %tmp.1560 = icmp eq i32 %tmp.1561, 0
  br i1 %tmp.1560, label %then10, label %else10

then10:                                           ; preds = %malloc_normal123
  %tmp.1566 = alloca %Main*
  %tmp.1567 = load %Main** %tmp.1002
  %tmp.1569 = getelementptr %Main* %tmp.1567, i32 0, i32 2
  %tmp.1568 = load %A** %tmp.1569
  %tmp.1570 = icmp eq %A* null, %tmp.1568
  br i1 %tmp.1570, label %abort, label %normal124

normal124:                                        ; preds = %then10
  %tmp.1571 = getelementptr %A* %tmp.1568, i32 0, i32 0
  %tmp.1572 = load %struct.A_vtable** %tmp.1571
  %tmp.1573 = getelementptr %struct.A_vtable* %tmp.1572, i32 0, i32 7
  %tmp.1574 = load i32 (%A*)** %tmp.1573
  %tmp.1575 = call i32 %tmp.1574(%A* %tmp.1568)
  %tmp.1576 = call %D* @D_new()
  %tmp.1577 = icmp eq %D* null, %tmp.1576
  br i1 %tmp.1577, label %abort, label %normal125

normal125:                                        ; preds = %normal124
  %tmp.1578 = getelementptr %D* %tmp.1576, i32 0, i32 0
  %tmp.1579 = load %struct.D_vtable** %tmp.1578
  %tmp.1580 = getelementptr %struct.D_vtable* %tmp.1579, i32 0, i32 14
  %tmp.1581 = load i1 (%D*, i32)** %tmp.1580
  %tmp.1582 = call i1 %tmp.1581(%D* %tmp.1576, i32 %tmp.1575)
  br i1 %tmp.1582, label %then11, label %else11

then11:                                           ; preds = %normal125
  %tmp.1585 = getelementptr %String* null, i32 1
  %tmp.1586 = ptrtoint %String* %tmp.1585 to i32
  %tmp.1587 = call i8* @malloc(i32 %tmp.1586)
  %tmp.1588 = icmp eq i8* null, %tmp.1587
  br i1 %tmp.1588, label %abort, label %malloc_normal126

malloc_normal126:                                 ; preds = %then11
  %tmp.1583 = bitcast i8* %tmp.1587 to %String*
  %tmp.1584 = alloca %String*
  store %String* %tmp.1583, %String** %tmp.1584
  %tmp.1590 = load %String** %tmp.1584
  %tmp.1591 = getelementptr %String* %tmp.1590, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1591
  %tmp.1593 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1594 = getelementptr %String* %tmp.1590, i32 0, i32 1
  store i8* %tmp.1593, i8** %tmp.1594
  %tmp.1595 = getelementptr [8 x i8]* @.str41, i32 0, i32 0
  %tmp.1596 = getelementptr %String* %tmp.1590, i32 0, i32 1
  store i8* %tmp.1595, i8** %tmp.1596
  %tmp.1598 = bitcast %String* %tmp.1590 to %struct.String*
  %tmp.1599 = load %Main** %tmp.1002
  %tmp.1600 = icmp eq %Main* null, %tmp.1599
  br i1 %tmp.1600, label %abort, label %normal127

normal127:                                        ; preds = %malloc_normal126
  %tmp.1601 = getelementptr %Main* %tmp.1599, i32 0, i32 0
  %tmp.1602 = load %struct.Main_vtable** %tmp.1601
  %tmp.1603 = getelementptr %struct.Main_vtable* %tmp.1602, i32 0, i32 7
  %tmp.1604 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1603
  %tmp.1606 = bitcast %Main* %tmp.1599 to %struct.IO*
  %tmp.1605 = call %struct.IO* %tmp.1604(%struct.IO* %tmp.1606, %struct.String* %tmp.1598)
  %tmp.1608 = load %Main** %tmp.1002
  %tmp.1610 = getelementptr %Main* %tmp.1608, i32 0, i32 2
  %tmp.1609 = load %A** %tmp.1610
  %tmp.1611 = load %Main** %tmp.1002
  %tmp.1612 = icmp eq %Main* null, %tmp.1611
  br i1 %tmp.1612, label %abort, label %normal128

normal128:                                        ; preds = %normal127
  %tmp.1613 = getelementptr %Main* %tmp.1611, i32 0, i32 0
  %tmp.1614 = load %struct.Main_vtable** %tmp.1613
  %tmp.1615 = getelementptr %struct.Main_vtable* %tmp.1614, i32 0, i32 16
  %tmp.1616 = load %Main* (%Main*, %A*)** %tmp.1615
  %tmp.1617 = call %Main* %tmp.1616(%Main* %tmp.1611, %A* %tmp.1609)
  %tmp.1621 = getelementptr %String* null, i32 1
  %tmp.1622 = ptrtoint %String* %tmp.1621 to i32
  %tmp.1623 = call i8* @malloc(i32 %tmp.1622)
  %tmp.1624 = icmp eq i8* null, %tmp.1623
  br i1 %tmp.1624, label %abort, label %malloc_normal129

malloc_normal129:                                 ; preds = %normal128
  %tmp.1619 = bitcast i8* %tmp.1623 to %String*
  %tmp.1620 = alloca %String*
  store %String* %tmp.1619, %String** %tmp.1620
  %tmp.1626 = load %String** %tmp.1620
  %tmp.1627 = getelementptr %String* %tmp.1626, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1627
  %tmp.1629 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1630 = getelementptr %String* %tmp.1626, i32 0, i32 1
  store i8* %tmp.1629, i8** %tmp.1630
  %tmp.1631 = getelementptr [20 x i8]* @.str51, i32 0, i32 0
  %tmp.1632 = getelementptr %String* %tmp.1626, i32 0, i32 1
  store i8* %tmp.1631, i8** %tmp.1632
  %tmp.1634 = bitcast %String* %tmp.1626 to %struct.String*
  %tmp.1635 = load %Main** %tmp.1002
  %tmp.1636 = icmp eq %Main* null, %tmp.1635
  br i1 %tmp.1636, label %abort, label %normal130

normal130:                                        ; preds = %malloc_normal129
  %tmp.1637 = getelementptr %Main* %tmp.1635, i32 0, i32 0
  %tmp.1638 = load %struct.Main_vtable** %tmp.1637
  %tmp.1639 = getelementptr %struct.Main_vtable* %tmp.1638, i32 0, i32 7
  %tmp.1640 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1639
  %tmp.1642 = bitcast %Main* %tmp.1635 to %struct.IO*
  %tmp.1641 = call %struct.IO* %tmp.1640(%struct.IO* %tmp.1642, %struct.String* %tmp.1634)
  %tmp.1643 = bitcast %struct.IO* %tmp.1641 to %Main*
  store %Main* %tmp.1643, %Main** %tmp.1566
  br label %after11

else11:                                           ; preds = %normal125
  %tmp.1646 = getelementptr %String* null, i32 1
  %tmp.1647 = ptrtoint %String* %tmp.1646 to i32
  %tmp.1648 = call i8* @malloc(i32 %tmp.1647)
  %tmp.1649 = icmp eq i8* null, %tmp.1648
  br i1 %tmp.1649, label %abort, label %malloc_normal131

malloc_normal131:                                 ; preds = %else11
  %tmp.1644 = bitcast i8* %tmp.1648 to %String*
  %tmp.1645 = alloca %String*
  store %String* %tmp.1644, %String** %tmp.1645
  %tmp.1651 = load %String** %tmp.1645
  %tmp.1652 = getelementptr %String* %tmp.1651, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1652
  %tmp.1654 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1655 = getelementptr %String* %tmp.1651, i32 0, i32 1
  store i8* %tmp.1654, i8** %tmp.1655
  %tmp.1656 = getelementptr [8 x i8]* @.str41, i32 0, i32 0
  %tmp.1657 = getelementptr %String* %tmp.1651, i32 0, i32 1
  store i8* %tmp.1656, i8** %tmp.1657
  %tmp.1659 = bitcast %String* %tmp.1651 to %struct.String*
  %tmp.1660 = load %Main** %tmp.1002
  %tmp.1661 = icmp eq %Main* null, %tmp.1660
  br i1 %tmp.1661, label %abort, label %normal132

normal132:                                        ; preds = %malloc_normal131
  %tmp.1662 = getelementptr %Main* %tmp.1660, i32 0, i32 0
  %tmp.1663 = load %struct.Main_vtable** %tmp.1662
  %tmp.1664 = getelementptr %struct.Main_vtable* %tmp.1663, i32 0, i32 7
  %tmp.1665 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1664
  %tmp.1667 = bitcast %Main* %tmp.1660 to %struct.IO*
  %tmp.1666 = call %struct.IO* %tmp.1665(%struct.IO* %tmp.1667, %struct.String* %tmp.1659)
  %tmp.1669 = load %Main** %tmp.1002
  %tmp.1671 = getelementptr %Main* %tmp.1669, i32 0, i32 2
  %tmp.1670 = load %A** %tmp.1671
  %tmp.1672 = load %Main** %tmp.1002
  %tmp.1673 = icmp eq %Main* null, %tmp.1672
  br i1 %tmp.1673, label %abort, label %normal133

normal133:                                        ; preds = %normal132
  %tmp.1674 = getelementptr %Main* %tmp.1672, i32 0, i32 0
  %tmp.1675 = load %struct.Main_vtable** %tmp.1674
  %tmp.1676 = getelementptr %struct.Main_vtable* %tmp.1675, i32 0, i32 16
  %tmp.1677 = load %Main* (%Main*, %A*)** %tmp.1676
  %tmp.1678 = call %Main* %tmp.1677(%Main* %tmp.1672, %A* %tmp.1670)
  %tmp.1682 = getelementptr %String* null, i32 1
  %tmp.1683 = ptrtoint %String* %tmp.1682 to i32
  %tmp.1684 = call i8* @malloc(i32 %tmp.1683)
  %tmp.1685 = icmp eq i8* null, %tmp.1684
  br i1 %tmp.1685, label %abort, label %malloc_normal134

malloc_normal134:                                 ; preds = %normal133
  %tmp.1680 = bitcast i8* %tmp.1684 to %String*
  %tmp.1681 = alloca %String*
  store %String* %tmp.1680, %String** %tmp.1681
  %tmp.1687 = load %String** %tmp.1681
  %tmp.1688 = getelementptr %String* %tmp.1687, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1688
  %tmp.1690 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1691 = getelementptr %String* %tmp.1687, i32 0, i32 1
  store i8* %tmp.1690, i8** %tmp.1691
  %tmp.1692 = getelementptr [24 x i8]* @.str52, i32 0, i32 0
  %tmp.1693 = getelementptr %String* %tmp.1687, i32 0, i32 1
  store i8* %tmp.1692, i8** %tmp.1693
  %tmp.1695 = bitcast %String* %tmp.1687 to %struct.String*
  %tmp.1696 = load %Main** %tmp.1002
  %tmp.1697 = icmp eq %Main* null, %tmp.1696
  br i1 %tmp.1697, label %abort, label %normal135

normal135:                                        ; preds = %malloc_normal134
  %tmp.1698 = getelementptr %Main* %tmp.1696, i32 0, i32 0
  %tmp.1699 = load %struct.Main_vtable** %tmp.1698
  %tmp.1700 = getelementptr %struct.Main_vtable* %tmp.1699, i32 0, i32 7
  %tmp.1701 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1700
  %tmp.1703 = bitcast %Main* %tmp.1696 to %struct.IO*
  %tmp.1702 = call %struct.IO* %tmp.1701(%struct.IO* %tmp.1703, %struct.String* %tmp.1695)
  %tmp.1704 = bitcast %struct.IO* %tmp.1702 to %Main*
  store %Main* %tmp.1704, %Main** %tmp.1566
  br label %after11

after11:                                          ; preds = %normal135, %normal130
  %tmp.1705 = load %Main** %tmp.1566
  %tmp.1706 = bitcast %Main* %tmp.1705 to %Object*
  store %Object* %tmp.1706, %Object** %tmp.1542
  br label %after10

else10:                                           ; preds = %malloc_normal123
  %tmp.1707 = alloca %Object*
  %tmp.1708 = load %Main** %tmp.1002
  %tmp.1710 = getelementptr %Main* %tmp.1708, i32 0, i32 1
  %tmp.1709 = load %String** %tmp.1710
  %tmp.1713 = getelementptr %String* null, i32 1
  %tmp.1714 = ptrtoint %String* %tmp.1713 to i32
  %tmp.1715 = call i8* @malloc(i32 %tmp.1714)
  %tmp.1716 = icmp eq i8* null, %tmp.1715
  br i1 %tmp.1716, label %abort, label %malloc_normal136

malloc_normal136:                                 ; preds = %else10
  %tmp.1711 = bitcast i8* %tmp.1715 to %String*
  %tmp.1712 = alloca %String*
  store %String* %tmp.1711, %String** %tmp.1712
  %tmp.1718 = load %String** %tmp.1712
  %tmp.1719 = getelementptr %String* %tmp.1718, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1719
  %tmp.1721 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1722 = getelementptr %String* %tmp.1718, i32 0, i32 1
  store i8* %tmp.1721, i8** %tmp.1722
  %tmp.1723 = getelementptr [2 x i8]* @.str53, i32 0, i32 0
  %tmp.1724 = getelementptr %String* %tmp.1718, i32 0, i32 1
  store i8* %tmp.1723, i8** %tmp.1724
  %tmp.1727 = getelementptr %String* %tmp.1709, i32 0, i32 1
  %tmp.1728 = load i8** %tmp.1727
  %tmp.1729 = getelementptr %String* %tmp.1718, i32 0, i32 1
  %tmp.1730 = load i8** %tmp.1729
  %tmp.1726 = call i32 @strcmp(i8* %tmp.1728, i8* %tmp.1730)
  %tmp.1725 = icmp eq i32 %tmp.1726, 0
  br i1 %tmp.1725, label %then12, label %else12

then12:                                           ; preds = %malloc_normal136
  %tmp.1731 = alloca %A*
  store %A* null, %A** %tmp.1731
  %tmp.1732 = load %A** %tmp.1731
  %tmp.1733 = alloca %A*
  store %A* %tmp.1732, %A** %tmp.1733
  %tmp.1735 = load %Main** %tmp.1002
  %tmp.1737 = getelementptr %Main* %tmp.1735, i32 0, i32 2
  %tmp.1736 = load %A** %tmp.1737
  %tmp.1738 = icmp eq %A* null, %tmp.1736
  br i1 %tmp.1738, label %abort, label %normal137

normal137:                                        ; preds = %then12
  %tmp.1739 = getelementptr %A* %tmp.1736, i32 0, i32 0
  %tmp.1740 = load %struct.A_vtable** %tmp.1739
  %tmp.1741 = getelementptr %struct.A_vtable* %tmp.1740, i32 0, i32 7
  %tmp.1742 = load i32 (%A*)** %tmp.1741
  %tmp.1743 = call i32 %tmp.1742(%A* %tmp.1736)
  %tmp.1744 = call %E* @E_new()
  %tmp.1745 = icmp eq %E* null, %tmp.1744
  br i1 %tmp.1745, label %abort, label %normal138

normal138:                                        ; preds = %normal137
  %tmp.1746 = getelementptr %E* %tmp.1744, i32 0, i32 0
  %tmp.1747 = load %struct.E_vtable** %tmp.1746
  %tmp.1748 = getelementptr %struct.E_vtable* %tmp.1747, i32 0, i32 15
  %tmp.1749 = load %A* (%E*, i32)** %tmp.1748
  %tmp.1750 = call %A* %tmp.1749(%E* %tmp.1744, i32 %tmp.1743)
  %tmp.1751 = alloca %A*
  store %A* %tmp.1750, %A** %tmp.1751
  %tmp.1752 = load %A** %tmp.1751
  store %A* %tmp.1752, %A** %tmp.1733
  %tmp.1753 = load %Main** %tmp.1002
  %tmp.1755 = getelementptr %Main* %tmp.1753, i32 0, i32 2
  %tmp.1754 = load %A** %tmp.1755
  %tmp.1756 = icmp eq %A* null, %tmp.1754
  br i1 %tmp.1756, label %abort, label %normal139

normal139:                                        ; preds = %normal138
  %tmp.1757 = getelementptr %A* %tmp.1754, i32 0, i32 0
  %tmp.1758 = load %struct.A_vtable** %tmp.1757
  %tmp.1759 = getelementptr %struct.A_vtable* %tmp.1758, i32 0, i32 7
  %tmp.1760 = load i32 (%A*)** %tmp.1759
  %tmp.1761 = call i32 %tmp.1760(%A* %tmp.1754)
  %tmp.1762 = load %A** %tmp.1733
  %tmp.1763 = icmp eq %A* null, %tmp.1762
  br i1 %tmp.1763, label %abort, label %normal140

normal140:                                        ; preds = %normal139
  %tmp.1764 = getelementptr %A* %tmp.1762, i32 0, i32 0
  %tmp.1765 = load %struct.A_vtable** %tmp.1764
  %tmp.1766 = getelementptr %struct.A_vtable* %tmp.1765, i32 0, i32 7
  %tmp.1767 = load i32 (%A*)** %tmp.1766
  %tmp.1768 = call i32 %tmp.1767(%A* %tmp.1762)
  %tmp.1769 = mul i32 %tmp.1768, 8
  %tmp.1770 = sub i32 %tmp.1761, %tmp.1769
  %tmp.1771 = alloca i32
  store i32 %tmp.1770, i32* %tmp.1771
  %tmp.1774 = getelementptr %String* null, i32 1
  %tmp.1775 = ptrtoint %String* %tmp.1774 to i32
  %tmp.1776 = call i8* @malloc(i32 %tmp.1775)
  %tmp.1777 = icmp eq i8* null, %tmp.1776
  br i1 %tmp.1777, label %abort, label %malloc_normal141

malloc_normal141:                                 ; preds = %normal140
  %tmp.1772 = bitcast i8* %tmp.1776 to %String*
  %tmp.1773 = alloca %String*
  store %String* %tmp.1772, %String** %tmp.1773
  %tmp.1779 = load %String** %tmp.1773
  %tmp.1780 = getelementptr %String* %tmp.1779, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1780
  %tmp.1782 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1783 = getelementptr %String* %tmp.1779, i32 0, i32 1
  store i8* %tmp.1782, i8** %tmp.1783
  %tmp.1784 = getelementptr [8 x i8]* @.str41, i32 0, i32 0
  %tmp.1785 = getelementptr %String* %tmp.1779, i32 0, i32 1
  store i8* %tmp.1784, i8** %tmp.1785
  %tmp.1787 = bitcast %String* %tmp.1779 to %struct.String*
  %tmp.1788 = load %Main** %tmp.1002
  %tmp.1789 = icmp eq %Main* null, %tmp.1788
  br i1 %tmp.1789, label %abort, label %normal142

normal142:                                        ; preds = %malloc_normal141
  %tmp.1790 = getelementptr %Main* %tmp.1788, i32 0, i32 0
  %tmp.1791 = load %struct.Main_vtable** %tmp.1790
  %tmp.1792 = getelementptr %struct.Main_vtable* %tmp.1791, i32 0, i32 7
  %tmp.1793 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1792
  %tmp.1795 = bitcast %Main* %tmp.1788 to %struct.IO*
  %tmp.1794 = call %struct.IO* %tmp.1793(%struct.IO* %tmp.1795, %struct.String* %tmp.1787)
  %tmp.1797 = load %Main** %tmp.1002
  %tmp.1799 = getelementptr %Main* %tmp.1797, i32 0, i32 2
  %tmp.1798 = load %A** %tmp.1799
  %tmp.1800 = load %Main** %tmp.1002
  %tmp.1801 = icmp eq %Main* null, %tmp.1800
  br i1 %tmp.1801, label %abort, label %normal143

normal143:                                        ; preds = %normal142
  %tmp.1802 = getelementptr %Main* %tmp.1800, i32 0, i32 0
  %tmp.1803 = load %struct.Main_vtable** %tmp.1802
  %tmp.1804 = getelementptr %struct.Main_vtable* %tmp.1803, i32 0, i32 16
  %tmp.1805 = load %Main* (%Main*, %A*)** %tmp.1804
  %tmp.1806 = call %Main* %tmp.1805(%Main* %tmp.1800, %A* %tmp.1798)
  %tmp.1810 = getelementptr %String* null, i32 1
  %tmp.1811 = ptrtoint %String* %tmp.1810 to i32
  %tmp.1812 = call i8* @malloc(i32 %tmp.1811)
  %tmp.1813 = icmp eq i8* null, %tmp.1812
  br i1 %tmp.1813, label %abort, label %malloc_normal144

malloc_normal144:                                 ; preds = %normal143
  %tmp.1808 = bitcast i8* %tmp.1812 to %String*
  %tmp.1809 = alloca %String*
  store %String* %tmp.1808, %String** %tmp.1809
  %tmp.1815 = load %String** %tmp.1809
  %tmp.1816 = getelementptr %String* %tmp.1815, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1816
  %tmp.1818 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1819 = getelementptr %String* %tmp.1815, i32 0, i32 1
  store i8* %tmp.1818, i8** %tmp.1819
  %tmp.1820 = getelementptr [13 x i8]* @.str54, i32 0, i32 0
  %tmp.1821 = getelementptr %String* %tmp.1815, i32 0, i32 1
  store i8* %tmp.1820, i8** %tmp.1821
  %tmp.1823 = bitcast %String* %tmp.1815 to %struct.String*
  %tmp.1824 = load %Main** %tmp.1002
  %tmp.1825 = icmp eq %Main* null, %tmp.1824
  br i1 %tmp.1825, label %abort, label %normal145

normal145:                                        ; preds = %malloc_normal144
  %tmp.1826 = getelementptr %Main* %tmp.1824, i32 0, i32 0
  %tmp.1827 = load %struct.Main_vtable** %tmp.1826
  %tmp.1828 = getelementptr %struct.Main_vtable* %tmp.1827, i32 0, i32 7
  %tmp.1829 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1828
  %tmp.1831 = bitcast %Main* %tmp.1824 to %struct.IO*
  %tmp.1830 = call %struct.IO* %tmp.1829(%struct.IO* %tmp.1831, %struct.String* %tmp.1823)
  %tmp.1833 = load %A** %tmp.1733
  %tmp.1834 = load %Main** %tmp.1002
  %tmp.1835 = icmp eq %Main* null, %tmp.1834
  br i1 %tmp.1835, label %abort, label %normal146

normal146:                                        ; preds = %normal145
  %tmp.1836 = getelementptr %Main* %tmp.1834, i32 0, i32 0
  %tmp.1837 = load %struct.Main_vtable** %tmp.1836
  %tmp.1838 = getelementptr %struct.Main_vtable* %tmp.1837, i32 0, i32 16
  %tmp.1839 = load %Main* (%Main*, %A*)** %tmp.1838
  %tmp.1840 = call %Main* %tmp.1839(%Main* %tmp.1834, %A* %tmp.1833)
  %tmp.1844 = getelementptr %String* null, i32 1
  %tmp.1845 = ptrtoint %String* %tmp.1844 to i32
  %tmp.1846 = call i8* @malloc(i32 %tmp.1845)
  %tmp.1847 = icmp eq i8* null, %tmp.1846
  br i1 %tmp.1847, label %abort, label %malloc_normal147

malloc_normal147:                                 ; preds = %normal146
  %tmp.1842 = bitcast i8* %tmp.1846 to %String*
  %tmp.1843 = alloca %String*
  store %String* %tmp.1842, %String** %tmp.1843
  %tmp.1849 = load %String** %tmp.1843
  %tmp.1850 = getelementptr %String* %tmp.1849, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1850
  %tmp.1852 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1853 = getelementptr %String* %tmp.1849, i32 0, i32 1
  store i8* %tmp.1852, i8** %tmp.1853
  %tmp.1854 = getelementptr [29 x i8]* @.str55, i32 0, i32 0
  %tmp.1855 = getelementptr %String* %tmp.1849, i32 0, i32 1
  store i8* %tmp.1854, i8** %tmp.1855
  %tmp.1857 = bitcast %String* %tmp.1849 to %struct.String*
  %tmp.1858 = load %Main** %tmp.1002
  %tmp.1859 = icmp eq %Main* null, %tmp.1858
  br i1 %tmp.1859, label %abort, label %normal148

normal148:                                        ; preds = %malloc_normal147
  %tmp.1860 = getelementptr %Main* %tmp.1858, i32 0, i32 0
  %tmp.1861 = load %struct.Main_vtable** %tmp.1860
  %tmp.1862 = getelementptr %struct.Main_vtable* %tmp.1861, i32 0, i32 7
  %tmp.1863 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1862
  %tmp.1865 = bitcast %Main* %tmp.1858 to %struct.IO*
  %tmp.1864 = call %struct.IO* %tmp.1863(%struct.IO* %tmp.1865, %struct.String* %tmp.1857)
  %tmp.1867 = call %A2I* @A2I_new()
  %tmp.1869 = alloca %A2I*
  store %A2I* %tmp.1867, %A2I** %tmp.1869
  %tmp.1870 = load %A2I** %tmp.1869
  %tmp.1871 = bitcast %A2I** %tmp.1869 to %A2I**
  store %A2I* %tmp.1870, %A2I** %tmp.1871
  %tmp.1872 = load i32* %tmp.1771
  %tmp.1873 = load %A2I** %tmp.1871
  %tmp.1874 = icmp eq %A2I* null, %tmp.1873
  br i1 %tmp.1874, label %abort, label %normal149

normal149:                                        ; preds = %normal148
  %tmp.1875 = getelementptr %A2I* %tmp.1873, i32 0, i32 0
  %tmp.1876 = load %struct.A2I_vtable** %tmp.1875
  %tmp.1877 = getelementptr %struct.A2I_vtable* %tmp.1876, i32 0, i32 11
  %tmp.1878 = load %String* (%A2I*, i32)** %tmp.1877
  %tmp.1879 = call %String* %tmp.1878(%A2I* %tmp.1873, i32 %tmp.1872)
  %tmp.1881 = bitcast %String* %tmp.1879 to %struct.String*
  %tmp.1882 = load %Main** %tmp.1002
  %tmp.1883 = icmp eq %Main* null, %tmp.1882
  br i1 %tmp.1883, label %abort, label %normal150

normal150:                                        ; preds = %normal149
  %tmp.1884 = getelementptr %Main* %tmp.1882, i32 0, i32 0
  %tmp.1885 = load %struct.Main_vtable** %tmp.1884
  %tmp.1886 = getelementptr %struct.Main_vtable* %tmp.1885, i32 0, i32 7
  %tmp.1887 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1886
  %tmp.1889 = bitcast %Main* %tmp.1882 to %struct.IO*
  %tmp.1888 = call %struct.IO* %tmp.1887(%struct.IO* %tmp.1889, %struct.String* %tmp.1881)
  %tmp.1893 = getelementptr %String* null, i32 1
  %tmp.1894 = ptrtoint %String* %tmp.1893 to i32
  %tmp.1895 = call i8* @malloc(i32 %tmp.1894)
  %tmp.1896 = icmp eq i8* null, %tmp.1895
  br i1 %tmp.1896, label %abort, label %malloc_normal151

malloc_normal151:                                 ; preds = %normal150
  %tmp.1891 = bitcast i8* %tmp.1895 to %String*
  %tmp.1892 = alloca %String*
  store %String* %tmp.1891, %String** %tmp.1892
  %tmp.1898 = load %String** %tmp.1892
  %tmp.1899 = getelementptr %String* %tmp.1898, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1899
  %tmp.1901 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1902 = getelementptr %String* %tmp.1898, i32 0, i32 1
  store i8* %tmp.1901, i8** %tmp.1902
  %tmp.1903 = getelementptr [2 x i8]* @.str32, i32 0, i32 0
  %tmp.1904 = getelementptr %String* %tmp.1898, i32 0, i32 1
  store i8* %tmp.1903, i8** %tmp.1904
  %tmp.1906 = bitcast %String* %tmp.1898 to %struct.String*
  %tmp.1907 = load %Main** %tmp.1002
  %tmp.1908 = icmp eq %Main* null, %tmp.1907
  br i1 %tmp.1908, label %abort, label %normal152

normal152:                                        ; preds = %malloc_normal151
  %tmp.1909 = getelementptr %Main* %tmp.1907, i32 0, i32 0
  %tmp.1910 = load %struct.Main_vtable** %tmp.1909
  %tmp.1911 = getelementptr %struct.Main_vtable* %tmp.1910, i32 0, i32 7
  %tmp.1912 = load %struct.IO* (%struct.IO*, %struct.String*)** %tmp.1911
  %tmp.1914 = bitcast %Main* %tmp.1907 to %struct.IO*
  %tmp.1913 = call %struct.IO* %tmp.1912(%struct.IO* %tmp.1914, %struct.String* %tmp.1906)
  %tmp.1916 = load %A** %tmp.1733
  %tmp.1917 = load %Main** %tmp.1002
  %tmp.1918 = getelementptr %Main* %tmp.1917, i32 0, i32 2
  %tmp.1919 = alloca %A*
  store %A* %tmp.1916, %A** %tmp.1919
  %tmp.1920 = load %A** %tmp.1919
  store %A* %tmp.1920, %A** %tmp.1918
  %tmp.1921 = bitcast %A* %tmp.1916 to %Object*
  store %Object* %tmp.1921, %Object** %tmp.1707
  br label %after12

else12:                                           ; preds = %malloc_normal136
  %tmp.1922 = alloca %Object*
  %tmp.1923 = load %Main** %tmp.1002
  %tmp.1925 = getelementptr %Main* %tmp.1923, i32 0, i32 1
  %tmp.1924 = load %String** %tmp.1925
  %tmp.1928 = getelementptr %String* null, i32 1
  %tmp.1929 = ptrtoint %String* %tmp.1928 to i32
  %tmp.1930 = call i8* @malloc(i32 %tmp.1929)
  %tmp.1931 = icmp eq i8* null, %tmp.1930
  br i1 %tmp.1931, label %abort, label %malloc_normal153

malloc_normal153:                                 ; preds = %else12
  %tmp.1926 = bitcast i8* %tmp.1930 to %String*
  %tmp.1927 = alloca %String*
  store %String* %tmp.1926, %String** %tmp.1927
  %tmp.1933 = load %String** %tmp.1927
  %tmp.1934 = getelementptr %String* %tmp.1933, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1934
  %tmp.1936 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1937 = getelementptr %String* %tmp.1933, i32 0, i32 1
  store i8* %tmp.1936, i8** %tmp.1937
  %tmp.1938 = getelementptr [2 x i8]* @.str56, i32 0, i32 0
  %tmp.1939 = getelementptr %String* %tmp.1933, i32 0, i32 1
  store i8* %tmp.1938, i8** %tmp.1939
  %tmp.1942 = getelementptr %String* %tmp.1924, i32 0, i32 1
  %tmp.1943 = load i8** %tmp.1942
  %tmp.1944 = getelementptr %String* %tmp.1933, i32 0, i32 1
  %tmp.1945 = load i8** %tmp.1944
  %tmp.1941 = call i32 @strcmp(i8* %tmp.1943, i8* %tmp.1945)
  %tmp.1940 = icmp eq i32 %tmp.1941, 0
  br i1 %tmp.1940, label %then13, label %else13

then13:                                           ; preds = %malloc_normal153
  %tmp.1946 = call %A* @A_new()
  %tmp.1947 = load %Main** %tmp.1002
  %tmp.1948 = getelementptr %Main* %tmp.1947, i32 0, i32 2
  %tmp.1949 = alloca %A*
  store %A* %tmp.1946, %A** %tmp.1949
  %tmp.1950 = load %A** %tmp.1949
  store %A* %tmp.1950, %A** %tmp.1948
  %tmp.1951 = bitcast %A* %tmp.1946 to %Object*
  store %Object* %tmp.1951, %Object** %tmp.1922
  br label %after13

else13:                                           ; preds = %malloc_normal153
  %tmp.1952 = alloca %Object*
  %tmp.1953 = load %Main** %tmp.1002
  %tmp.1955 = getelementptr %Main* %tmp.1953, i32 0, i32 1
  %tmp.1954 = load %String** %tmp.1955
  %tmp.1958 = getelementptr %String* null, i32 1
  %tmp.1959 = ptrtoint %String* %tmp.1958 to i32
  %tmp.1960 = call i8* @malloc(i32 %tmp.1959)
  %tmp.1961 = icmp eq i8* null, %tmp.1960
  br i1 %tmp.1961, label %abort, label %malloc_normal154

malloc_normal154:                                 ; preds = %else13
  %tmp.1956 = bitcast i8* %tmp.1960 to %String*
  %tmp.1957 = alloca %String*
  store %String* %tmp.1956, %String** %tmp.1957
  %tmp.1963 = load %String** %tmp.1957
  %tmp.1964 = getelementptr %String* %tmp.1963, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.1964
  %tmp.1966 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.1967 = getelementptr %String* %tmp.1963, i32 0, i32 1
  store i8* %tmp.1966, i8** %tmp.1967
  %tmp.1968 = getelementptr [2 x i8]* @.str57, i32 0, i32 0
  %tmp.1969 = getelementptr %String* %tmp.1963, i32 0, i32 1
  store i8* %tmp.1968, i8** %tmp.1969
  %tmp.1972 = getelementptr %String* %tmp.1954, i32 0, i32 1
  %tmp.1973 = load i8** %tmp.1972
  %tmp.1974 = getelementptr %String* %tmp.1963, i32 0, i32 1
  %tmp.1975 = load i8** %tmp.1974
  %tmp.1971 = call i32 @strcmp(i8* %tmp.1973, i8* %tmp.1975)
  %tmp.1970 = icmp eq i32 %tmp.1971, 0
  br i1 %tmp.1970, label %then14, label %else14

then14:                                           ; preds = %malloc_normal154
  %tmp.1976 = load %Main** %tmp.1002
  %tmp.1977 = getelementptr %Main* %tmp.1976, i32 0, i32 4
  store i1 false, i1* %tmp.1977
  %tmp.1980 = getelementptr %Bool* null, i32 1
  %tmp.1981 = ptrtoint %Bool* %tmp.1980 to i32
  %tmp.1982 = call i8* @malloc(i32 %tmp.1981)
  %tmp.1983 = icmp eq i8* null, %tmp.1982
  br i1 %tmp.1983, label %abort, label %malloc_normal155

malloc_normal155:                                 ; preds = %then14
  %tmp.1978 = bitcast i8* %tmp.1982 to %Bool*
  %tmp.1979 = alloca %Bool*
  store %Bool* %tmp.1978, %Bool** %tmp.1979
  %tmp.1985 = load %Bool** %tmp.1979
  %tmp.1986 = getelementptr %Bool* %tmp.1985, i32 0, i32 0
  store %struct.Bool_vtable* @struct.Bool_vtable_prototype, %struct.Bool_vtable** %tmp.1986
  %tmp.1988 = getelementptr %Bool* %tmp.1985, i32 0, i32 1
  store i1 false, i1* %tmp.1988
  %tmp.1989 = getelementptr %Bool* %tmp.1985, i32 0, i32 1
  store i1 false, i1* %tmp.1989
  %tmp.1990 = bitcast %Bool* %tmp.1985 to %Object*
  store %Object* %tmp.1990, %Object** %tmp.1952
  br label %after14

else14:                                           ; preds = %malloc_normal154
  %tmp.1991 = load %Main** %tmp.1002
  %tmp.1993 = getelementptr %Main* %tmp.1991, i32 0, i32 2
  %tmp.1992 = load %A** %tmp.1993
  %tmp.1994 = icmp eq %A* null, %tmp.1992
  br i1 %tmp.1994, label %abort, label %normal156

normal156:                                        ; preds = %else14
  %tmp.1995 = getelementptr %A* %tmp.1992, i32 0, i32 0
  %tmp.1996 = load %struct.A_vtable** %tmp.1995
  %tmp.1997 = getelementptr %struct.A_vtable* %tmp.1996, i32 0, i32 7
  %tmp.1998 = load i32 (%A*)** %tmp.1997
  %tmp.1999 = call i32 %tmp.1998(%A* %tmp.1992)
  %tmp.2000 = call %A* @A_new()
  %tmp.2001 = icmp eq %A* null, %tmp.2000
  br i1 %tmp.2001, label %abort, label %normal157

normal157:                                        ; preds = %normal156
  %tmp.2002 = getelementptr %A* %tmp.2000, i32 0, i32 0
  %tmp.2003 = load %struct.A_vtable** %tmp.2002
  %tmp.2004 = getelementptr %struct.A_vtable* %tmp.2003, i32 0, i32 9
  %tmp.2005 = load %A* (%A*, i32)** %tmp.2004
  %tmp.2006 = call %A* %tmp.2005(%A* %tmp.2000, i32 %tmp.1999)
  %tmp.2007 = bitcast %A* %tmp.2006 to %A*
  %tmp.2008 = load %Main** %tmp.1002
  %tmp.2009 = getelementptr %Main* %tmp.2008, i32 0, i32 2
  %tmp.2010 = alloca %A*
  store %A* %tmp.2007, %A** %tmp.2010
  %tmp.2011 = load %A** %tmp.2010
  store %A* %tmp.2011, %A** %tmp.2009
  %tmp.2012 = bitcast %A* %tmp.2007 to %Object*
  store %Object* %tmp.2012, %Object** %tmp.1952
  br label %after14

after14:                                          ; preds = %normal157, %malloc_normal155
  %tmp.2013 = load %Object** %tmp.1952
  store %Object* %tmp.2013, %Object** %tmp.1922
  br label %after13

after13:                                          ; preds = %after14, %then13
  %tmp.2014 = load %Object** %tmp.1922
  store %Object* %tmp.2014, %Object** %tmp.1707
  br label %after12

after12:                                          ; preds = %after13, %normal152
  %tmp.2015 = load %Object** %tmp.1707
  store %Object* %tmp.2015, %Object** %tmp.1542
  br label %after10

after10:                                          ; preds = %after12, %after11
  %tmp.2016 = load %Object** %tmp.1542
  store %Object* %tmp.2016, %Object** %tmp.1500
  br label %after9

after9:                                           ; preds = %after10, %normal122
  %tmp.2017 = load %Object** %tmp.1500
  store %Object* %tmp.2017, %Object** %tmp.1457
  br label %after8

after8:                                           ; preds = %after9, %normal119
  %tmp.2018 = load %Object** %tmp.1457
  store %Object* %tmp.2018, %Object** %tmp.1414
  br label %after7

after7:                                           ; preds = %after8, %normal116
  %tmp.2019 = load %Object** %tmp.1414
  store %Object* %tmp.2019, %Object** %tmp.1339
  br label %after6

after6:                                           ; preds = %after7, %normal113
  %tmp.2020 = load %Object** %tmp.1339
  store %Object* %tmp.2020, %Object** %tmp.1212
  br label %after5

after5:                                           ; preds = %after6, %case.exit.98
  %tmp.2021 = load %Object** %tmp.1212
  store %Object* %tmp.2021, %Object** %tmp.1137
  br label %after4

after4:                                           ; preds = %after5, %normal96
  br label %loop0

false0:                                           ; preds = %loop0
  %tmp.2023 = alloca %Object*
  store %Object* null, %Object** %tmp.2023
  %tmp.2024 = load %Object** %tmp.2023
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal156, %else14, %then14, %else13, %else12, %malloc_normal151, %normal150, %normal149, %normal148, %malloc_normal147, %normal146, %normal145, %malloc_normal144, %normal143, %normal142, %malloc_normal141, %normal140, %normal139, %normal138, %normal137, %then12, %else10, %malloc_normal134, %normal133, %normal132, %malloc_normal131, %else11, %malloc_normal129, %normal128, %normal127, %malloc_normal126, %then11, %normal124, %then10, %else9, %normal121, %then9, %else8, %normal118, %then8, %else7, %normal115, %then7, %else6, %normal112, %normal111, %normal110, %normal109, %then6, %else5, %br_exit.0.103, %normal105, %normal104, %malloc_normal103, %src_lte_mc.0.103, %normal101, %src_lte_mc.6.101, %normal99, %src_lte_mc.8.99, %then5, %else4, %normal95, %normal94, %normal93, %normal92, %then4, %normal90, %normal89, %after3, %malloc_normal87, %else3, %malloc_normal85, %then3, %normal83, %normal82, %normal81, %malloc_normal80, %true0
  call void @abort()
  %tmp.2028 = getelementptr %Int* null, i32 1
  %tmp.2029 = ptrtoint %Int* %tmp.2028 to i32
  %tmp.2030 = call i8* @malloc(i32 %tmp.2029)
  %tmp.2031 = icmp eq i8* null, %tmp.2030
  br i1 %tmp.2031, label %abort, label %malloc_normal158

malloc_normal158:                                 ; preds = %abort
  %tmp.2026 = bitcast i8* %tmp.2030 to %Int*
  %tmp.2027 = alloca %Int*
  store %Int* %tmp.2026, %Int** %tmp.2027
  %tmp.2033 = load %Int** %tmp.2027
  %tmp.2034 = getelementptr %Int* %tmp.2033, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.2034
  %tmp.2036 = getelementptr %Int* %tmp.2033, i32 0, i32 1
  store i32 0, i32* %tmp.2036
  %tmp.2037 = getelementptr %Int* %tmp.2033, i32 0, i32 1
  store i32 -1, i32* %tmp.2037
  %tmp.2038 = bitcast %Int* %tmp.2033 to %Object*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal158, %false0
  %UnifiedRetVal = phi %Object* [ %tmp.2024, %false0 ], [ %tmp.2038, %malloc_normal158 ]
  ret %Object* %UnifiedRetVal
}

define %A* @A_new() {
entry:
  %tmp.2 = getelementptr %A* null, i32 1
  %tmp.3 = ptrtoint %A* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %A*
  %tmp.1 = alloca %A*
  store %A* %tmp.0, %A** %tmp.1
  %tmp.7 = load %A** %tmp.1
  %tmp.8 = getelementptr %A* %tmp.7, i32 0, i32 0
  store %struct.A_vtable* @struct.A_vtable_prototype, %struct.A_vtable** %tmp.8
  %tmp.11 = alloca i32
  store i32 0, i32* %tmp.11
  %tmp.12 = load i32* %tmp.11
  %tmp.14 = getelementptr %A* %tmp.7, i32 0, i32 1
  store i32 %tmp.12, i32* %tmp.14
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.18 = getelementptr %Int* null, i32 1
  %tmp.19 = ptrtoint %Int* %tmp.18 to i32
  %tmp.20 = call i8* @malloc(i32 %tmp.19)
  %tmp.21 = icmp eq i8* null, %tmp.20
  br i1 %tmp.21, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.16 = bitcast i8* %tmp.20 to %Int*
  %tmp.17 = alloca %Int*
  store %Int* %tmp.16, %Int** %tmp.17
  %tmp.23 = load %Int** %tmp.17
  %tmp.24 = getelementptr %Int* %tmp.23, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.24
  %tmp.26 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 0, i32* %tmp.26
  %tmp.27 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 -1, i32* %tmp.27
  %tmp.28 = bitcast %Int* %tmp.23 to %A*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %A* [ %tmp.7, %malloc_normal0 ], [ %tmp.28, %malloc_normal1 ]
  ret %A* %UnifiedRetVal
}

define i32 @A_value(%A* %self) {
entry:
  %tmp.29 = alloca %A*
  store %A* %self, %A** %tmp.29
  %tmp.30 = load %A** %tmp.29
  %tmp.32 = getelementptr %A* %tmp.30, i32 0, i32 1
  %tmp.31 = load i32* %tmp.32
  br label %UnifiedReturnBlock

abort:                                            ; No predecessors!
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %entry
  %UnifiedRetVal = phi i32 [ %tmp.31, %entry ], [ -1, %abort ]
  ret i32 %UnifiedRetVal
}

define %A* @A_set_var(%A* %self, i32 %num) {
entry:
  %tmp.34 = alloca %A*
  store %A* %self, %A** %tmp.34
  %tmp.35 = alloca i32
  store i32 %num, i32* %tmp.35
  %tmp.36 = load i32* %tmp.35
  %tmp.37 = load %A** %tmp.34
  %tmp.38 = getelementptr %A* %tmp.37, i32 0, i32 1
  store i32 %tmp.36, i32* %tmp.38
  %tmp.39 = load %A** %tmp.34
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort
  call void @abort()
  %tmp.43 = getelementptr %Int* null, i32 1
  %tmp.44 = ptrtoint %Int* %tmp.43 to i32
  %tmp.45 = call i8* @malloc(i32 %tmp.44)
  %tmp.46 = icmp eq i8* null, %tmp.45
  br i1 %tmp.46, label %abort, label %malloc_normal2

malloc_normal2:                                   ; preds = %abort
  %tmp.41 = bitcast i8* %tmp.45 to %Int*
  %tmp.42 = alloca %Int*
  store %Int* %tmp.41, %Int** %tmp.42
  %tmp.48 = load %Int** %tmp.42
  %tmp.49 = getelementptr %Int* %tmp.48, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.49
  %tmp.51 = getelementptr %Int* %tmp.48, i32 0, i32 1
  store i32 0, i32* %tmp.51
  %tmp.52 = getelementptr %Int* %tmp.48, i32 0, i32 1
  store i32 -1, i32* %tmp.52
  %tmp.53 = bitcast %Int* %tmp.48 to %A*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal2, %entry
  %UnifiedRetVal = phi %A* [ %tmp.39, %entry ], [ %tmp.53, %malloc_normal2 ]
  ret %A* %UnifiedRetVal
}

define %A* @A_method1(%A* %self, i32 %num) {
entry:
  %tmp.54 = alloca %A*
  store %A* %self, %A** %tmp.54
  %tmp.55 = alloca i32
  store i32 %num, i32* %tmp.55
  %tmp.56 = load %A** %tmp.54
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort
  call void @abort()
  %tmp.60 = getelementptr %Int* null, i32 1
  %tmp.61 = ptrtoint %Int* %tmp.60 to i32
  %tmp.62 = call i8* @malloc(i32 %tmp.61)
  %tmp.63 = icmp eq i8* null, %tmp.62
  br i1 %tmp.63, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %abort
  %tmp.58 = bitcast i8* %tmp.62 to %Int*
  %tmp.59 = alloca %Int*
  store %Int* %tmp.58, %Int** %tmp.59
  %tmp.65 = load %Int** %tmp.59
  %tmp.66 = getelementptr %Int* %tmp.65, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.66
  %tmp.68 = getelementptr %Int* %tmp.65, i32 0, i32 1
  store i32 0, i32* %tmp.68
  %tmp.69 = getelementptr %Int* %tmp.65, i32 0, i32 1
  store i32 -1, i32* %tmp.69
  %tmp.70 = bitcast %Int* %tmp.65 to %A*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal3, %entry
  %UnifiedRetVal = phi %A* [ %tmp.56, %entry ], [ %tmp.70, %malloc_normal3 ]
  ret %A* %UnifiedRetVal
}

define %B* @A_method2(%A* %self, i32 %num1, i32 %num2) {
entry:
  %tmp.71 = alloca %A*
  store %A* %self, %A** %tmp.71
  %tmp.72 = alloca i32
  store i32 %num1, i32* %tmp.72
  %tmp.73 = alloca i32
  store i32 %num2, i32* %tmp.73
  %tmp.74 = alloca i32
  store i32 0, i32* %tmp.74
  %tmp.75 = load i32* %tmp.72
  %tmp.76 = load i32* %tmp.73
  %tmp.77 = add i32 %tmp.75, %tmp.76
  store i32 %tmp.77, i32* %tmp.74
  %tmp.78 = load i32* %tmp.74
  %tmp.79 = call %B* @B_new()
  %tmp.80 = icmp eq %B* null, %tmp.79
  br i1 %tmp.80, label %abort, label %normal4

normal4:                                          ; preds = %entry
  %tmp.81 = getelementptr %B* %tmp.79, i32 0, i32 0
  %tmp.82 = load %struct.B_vtable** %tmp.81
  %tmp.83 = getelementptr %struct.B_vtable* %tmp.82, i32 0, i32 8
  %tmp.84 = load %A* (%A*, i32)** %tmp.83
  %tmp.86 = bitcast %B* %tmp.79 to %A*
  %tmp.85 = call %A* %tmp.84(%A* %tmp.86, i32 %tmp.78)
  %tmp.87 = bitcast %A* %tmp.85 to %B*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.91 = getelementptr %Int* null, i32 1
  %tmp.92 = ptrtoint %Int* %tmp.91 to i32
  %tmp.93 = call i8* @malloc(i32 %tmp.92)
  %tmp.94 = icmp eq i8* null, %tmp.93
  br i1 %tmp.94, label %abort, label %malloc_normal5

malloc_normal5:                                   ; preds = %abort
  %tmp.89 = bitcast i8* %tmp.93 to %Int*
  %tmp.90 = alloca %Int*
  store %Int* %tmp.89, %Int** %tmp.90
  %tmp.96 = load %Int** %tmp.90
  %tmp.97 = getelementptr %Int* %tmp.96, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.97
  %tmp.99 = getelementptr %Int* %tmp.96, i32 0, i32 1
  store i32 0, i32* %tmp.99
  %tmp.100 = getelementptr %Int* %tmp.96, i32 0, i32 1
  store i32 -1, i32* %tmp.100
  %tmp.101 = bitcast %Int* %tmp.96 to %B*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal5, %normal4
  %UnifiedRetVal = phi %B* [ %tmp.87, %normal4 ], [ %tmp.101, %malloc_normal5 ]
  ret %B* %UnifiedRetVal
}

define %C* @A_method3(%A* %self, i32 %num) {
entry:
  %tmp.102 = alloca %A*
  store %A* %self, %A** %tmp.102
  %tmp.103 = alloca i32
  store i32 %num, i32* %tmp.103
  %tmp.104 = alloca i32
  store i32 0, i32* %tmp.104
  %tmp.105 = load i32* %tmp.103
  %tmp.106 = mul i32 %tmp.105, -1
  store i32 %tmp.106, i32* %tmp.104
  %tmp.107 = load i32* %tmp.104
  %tmp.108 = call %C* @C_new()
  %tmp.109 = icmp eq %C* null, %tmp.108
  br i1 %tmp.109, label %abort, label %normal6

normal6:                                          ; preds = %entry
  %tmp.110 = getelementptr %C* %tmp.108, i32 0, i32 0
  %tmp.111 = load %struct.C_vtable** %tmp.110
  %tmp.112 = getelementptr %struct.C_vtable* %tmp.111, i32 0, i32 8
  %tmp.113 = load %A* (%A*, i32)** %tmp.112
  %tmp.115 = bitcast %C* %tmp.108 to %A*
  %tmp.114 = call %A* %tmp.113(%A* %tmp.115, i32 %tmp.107)
  %tmp.116 = bitcast %A* %tmp.114 to %C*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.120 = getelementptr %Int* null, i32 1
  %tmp.121 = ptrtoint %Int* %tmp.120 to i32
  %tmp.122 = call i8* @malloc(i32 %tmp.121)
  %tmp.123 = icmp eq i8* null, %tmp.122
  br i1 %tmp.123, label %abort, label %malloc_normal7

malloc_normal7:                                   ; preds = %abort
  %tmp.118 = bitcast i8* %tmp.122 to %Int*
  %tmp.119 = alloca %Int*
  store %Int* %tmp.118, %Int** %tmp.119
  %tmp.125 = load %Int** %tmp.119
  %tmp.126 = getelementptr %Int* %tmp.125, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.126
  %tmp.128 = getelementptr %Int* %tmp.125, i32 0, i32 1
  store i32 0, i32* %tmp.128
  %tmp.129 = getelementptr %Int* %tmp.125, i32 0, i32 1
  store i32 -1, i32* %tmp.129
  %tmp.130 = bitcast %Int* %tmp.125 to %C*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal7, %normal6
  %UnifiedRetVal = phi %C* [ %tmp.116, %normal6 ], [ %tmp.130, %malloc_normal7 ]
  ret %C* %UnifiedRetVal
}

define %D* @A_method4(%A* %self, i32 %num1, i32 %num2) {
entry:
  %tmp.131 = alloca %A*
  store %A* %self, %A** %tmp.131
  %tmp.132 = alloca i32
  store i32 %num1, i32* %tmp.132
  %tmp.133 = alloca i32
  store i32 %num2, i32* %tmp.133
  %tmp.134 = alloca %D*
  %tmp.135 = load i32* %tmp.133
  %tmp.136 = load i32* %tmp.132
  %tmp.137 = icmp slt i32 %tmp.135, %tmp.136
  br i1 %tmp.137, label %then0, label %else0

then0:                                            ; preds = %entry
  %tmp.138 = alloca i32
  store i32 0, i32* %tmp.138
  %tmp.139 = load i32* %tmp.132
  %tmp.140 = load i32* %tmp.133
  %tmp.141 = sub i32 %tmp.139, %tmp.140
  store i32 %tmp.141, i32* %tmp.138
  %tmp.142 = load i32* %tmp.138
  %tmp.143 = call %D* @D_new()
  %tmp.144 = icmp eq %D* null, %tmp.143
  br i1 %tmp.144, label %abort, label %normal8

normal8:                                          ; preds = %then0
  %tmp.145 = getelementptr %D* %tmp.143, i32 0, i32 0
  %tmp.146 = load %struct.D_vtable** %tmp.145
  %tmp.147 = getelementptr %struct.D_vtable* %tmp.146, i32 0, i32 8
  %tmp.148 = load %A* (%A*, i32)** %tmp.147
  %tmp.150 = bitcast %D* %tmp.143 to %A*
  %tmp.149 = call %A* %tmp.148(%A* %tmp.150, i32 %tmp.142)
  %tmp.151 = bitcast %A* %tmp.149 to %D*
  store %D* %tmp.151, %D** %tmp.134
  br label %after0

else0:                                            ; preds = %entry
  %tmp.152 = alloca i32
  store i32 0, i32* %tmp.152
  %tmp.153 = load i32* %tmp.133
  %tmp.154 = load i32* %tmp.132
  %tmp.155 = sub i32 %tmp.153, %tmp.154
  store i32 %tmp.155, i32* %tmp.152
  %tmp.156 = load i32* %tmp.152
  %tmp.157 = call %D* @D_new()
  %tmp.158 = icmp eq %D* null, %tmp.157
  br i1 %tmp.158, label %abort, label %normal9

normal9:                                          ; preds = %else0
  %tmp.159 = getelementptr %D* %tmp.157, i32 0, i32 0
  %tmp.160 = load %struct.D_vtable** %tmp.159
  %tmp.161 = getelementptr %struct.D_vtable* %tmp.160, i32 0, i32 8
  %tmp.162 = load %A* (%A*, i32)** %tmp.161
  %tmp.164 = bitcast %D* %tmp.157 to %A*
  %tmp.163 = call %A* %tmp.162(%A* %tmp.164, i32 %tmp.156)
  %tmp.165 = bitcast %A* %tmp.163 to %D*
  store %D* %tmp.165, %D** %tmp.134
  br label %after0

after0:                                           ; preds = %normal9, %normal8
  %tmp.166 = load %D** %tmp.134
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %else0, %then0
  call void @abort()
  %tmp.170 = getelementptr %Int* null, i32 1
  %tmp.171 = ptrtoint %Int* %tmp.170 to i32
  %tmp.172 = call i8* @malloc(i32 %tmp.171)
  %tmp.173 = icmp eq i8* null, %tmp.172
  br i1 %tmp.173, label %abort, label %malloc_normal10

malloc_normal10:                                  ; preds = %abort
  %tmp.168 = bitcast i8* %tmp.172 to %Int*
  %tmp.169 = alloca %Int*
  store %Int* %tmp.168, %Int** %tmp.169
  %tmp.175 = load %Int** %tmp.169
  %tmp.176 = getelementptr %Int* %tmp.175, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.176
  %tmp.178 = getelementptr %Int* %tmp.175, i32 0, i32 1
  store i32 0, i32* %tmp.178
  %tmp.179 = getelementptr %Int* %tmp.175, i32 0, i32 1
  store i32 -1, i32* %tmp.179
  %tmp.180 = bitcast %Int* %tmp.175 to %D*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal10, %after0
  %UnifiedRetVal = phi %D* [ %tmp.166, %after0 ], [ %tmp.180, %malloc_normal10 ]
  ret %D* %UnifiedRetVal
}

define %E* @A_method5(%A* %self, i32 %num) {
entry:
  %tmp.181 = alloca %A*
  store %A* %self, %A** %tmp.181
  %tmp.182 = alloca i32
  store i32 %num, i32* %tmp.182
  %tmp.183 = alloca i32
  store i32 1, i32* %tmp.183
  %tmp.184 = alloca i32
  store i32 1, i32* %tmp.184
  br label %loop0

loop0:                                            ; preds = %true0, %entry
  %tmp.185 = load i32* %tmp.184
  %tmp.186 = load i32* %tmp.182
  %tmp.187 = icmp sle i32 %tmp.185, %tmp.186
  br i1 %tmp.187, label %true0, label %false0

true0:                                            ; preds = %loop0
  %tmp.188 = load i32* %tmp.183
  %tmp.189 = load i32* %tmp.184
  %tmp.190 = mul i32 %tmp.188, %tmp.189
  store i32 %tmp.190, i32* %tmp.183
  %tmp.191 = load i32* %tmp.184
  %tmp.192 = add i32 %tmp.191, 1
  store i32 %tmp.192, i32* %tmp.184
  br label %loop0

false0:                                           ; preds = %loop0
  %tmp.193 = alloca %Object*
  store %Object* null, %Object** %tmp.193
  %tmp.195 = load i32* %tmp.183
  %tmp.196 = call %E* @E_new()
  %tmp.197 = icmp eq %E* null, %tmp.196
  br i1 %tmp.197, label %abort, label %normal11

normal11:                                         ; preds = %false0
  %tmp.198 = getelementptr %E* %tmp.196, i32 0, i32 0
  %tmp.199 = load %struct.E_vtable** %tmp.198
  %tmp.200 = getelementptr %struct.E_vtable* %tmp.199, i32 0, i32 8
  %tmp.201 = load %A* (%A*, i32)** %tmp.200
  %tmp.203 = bitcast %E* %tmp.196 to %A*
  %tmp.202 = call %A* %tmp.201(%A* %tmp.203, i32 %tmp.195)
  %tmp.204 = bitcast %A* %tmp.202 to %E*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %false0
  call void @abort()
  %tmp.208 = getelementptr %Int* null, i32 1
  %tmp.209 = ptrtoint %Int* %tmp.208 to i32
  %tmp.210 = call i8* @malloc(i32 %tmp.209)
  %tmp.211 = icmp eq i8* null, %tmp.210
  br i1 %tmp.211, label %abort, label %malloc_normal12

malloc_normal12:                                  ; preds = %abort
  %tmp.206 = bitcast i8* %tmp.210 to %Int*
  %tmp.207 = alloca %Int*
  store %Int* %tmp.206, %Int** %tmp.207
  %tmp.213 = load %Int** %tmp.207
  %tmp.214 = getelementptr %Int* %tmp.213, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.214
  %tmp.216 = getelementptr %Int* %tmp.213, i32 0, i32 1
  store i32 0, i32* %tmp.216
  %tmp.217 = getelementptr %Int* %tmp.213, i32 0, i32 1
  store i32 -1, i32* %tmp.217
  %tmp.218 = bitcast %Int* %tmp.213 to %E*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal12, %normal11
  %UnifiedRetVal = phi %E* [ %tmp.204, %normal11 ], [ %tmp.218, %malloc_normal12 ]
  ret %E* %UnifiedRetVal
}

define %B* @B_new() {
entry:
  %tmp.2 = getelementptr %B* null, i32 1
  %tmp.3 = ptrtoint %B* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %B*
  %tmp.1 = alloca %B*
  store %B* %tmp.0, %B** %tmp.1
  %tmp.7 = load %B** %tmp.1
  %tmp.8 = getelementptr %B* %tmp.7, i32 0, i32 0
  store %struct.B_vtable* @struct.B_vtable_prototype, %struct.B_vtable** %tmp.8
  %tmp.11 = alloca i32
  store i32 0, i32* %tmp.11
  %tmp.12 = load i32* %tmp.11
  %tmp.14 = getelementptr %B* %tmp.7, i32 0, i32 1
  store i32 %tmp.12, i32* %tmp.14
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.18 = getelementptr %Int* null, i32 1
  %tmp.19 = ptrtoint %Int* %tmp.18 to i32
  %tmp.20 = call i8* @malloc(i32 %tmp.19)
  %tmp.21 = icmp eq i8* null, %tmp.20
  br i1 %tmp.21, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.16 = bitcast i8* %tmp.20 to %Int*
  %tmp.17 = alloca %Int*
  store %Int* %tmp.16, %Int** %tmp.17
  %tmp.23 = load %Int** %tmp.17
  %tmp.24 = getelementptr %Int* %tmp.23, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.24
  %tmp.26 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 0, i32* %tmp.26
  %tmp.27 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 -1, i32* %tmp.27
  %tmp.28 = bitcast %Int* %tmp.23 to %B*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %B* [ %tmp.7, %malloc_normal0 ], [ %tmp.28, %malloc_normal1 ]
  ret %B* %UnifiedRetVal
}

define %E* @B_method5(%B* %self, i32 %num) {
entry:
  %tmp.29 = alloca %B*
  store %B* %self, %B** %tmp.29
  %tmp.30 = alloca i32
  store i32 %num, i32* %tmp.30
  %tmp.31 = alloca i32
  store i32 0, i32* %tmp.31
  %tmp.32 = load i32* %tmp.30
  %tmp.33 = load i32* %tmp.30
  %tmp.34 = mul i32 %tmp.32, %tmp.33
  store i32 %tmp.34, i32* %tmp.31
  %tmp.35 = load i32* %tmp.31
  %tmp.36 = call %E* @E_new()
  %tmp.37 = icmp eq %E* null, %tmp.36
  br i1 %tmp.37, label %abort, label %normal2

normal2:                                          ; preds = %entry
  %tmp.38 = getelementptr %E* %tmp.36, i32 0, i32 0
  %tmp.39 = load %struct.E_vtable** %tmp.38
  %tmp.40 = getelementptr %struct.E_vtable* %tmp.39, i32 0, i32 8
  %tmp.41 = load %A* (%A*, i32)** %tmp.40
  %tmp.43 = bitcast %E* %tmp.36 to %A*
  %tmp.42 = call %A* %tmp.41(%A* %tmp.43, i32 %tmp.35)
  %tmp.44 = bitcast %A* %tmp.42 to %E*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.48 = getelementptr %Int* null, i32 1
  %tmp.49 = ptrtoint %Int* %tmp.48 to i32
  %tmp.50 = call i8* @malloc(i32 %tmp.49)
  %tmp.51 = icmp eq i8* null, %tmp.50
  br i1 %tmp.51, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %abort
  %tmp.46 = bitcast i8* %tmp.50 to %Int*
  %tmp.47 = alloca %Int*
  store %Int* %tmp.46, %Int** %tmp.47
  %tmp.53 = load %Int** %tmp.47
  %tmp.54 = getelementptr %Int* %tmp.53, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.54
  %tmp.56 = getelementptr %Int* %tmp.53, i32 0, i32 1
  store i32 0, i32* %tmp.56
  %tmp.57 = getelementptr %Int* %tmp.53, i32 0, i32 1
  store i32 -1, i32* %tmp.57
  %tmp.58 = bitcast %Int* %tmp.53 to %E*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal3, %normal2
  %UnifiedRetVal = phi %E* [ %tmp.44, %normal2 ], [ %tmp.58, %malloc_normal3 ]
  ret %E* %UnifiedRetVal
}

define %C* @C_new() {
entry:
  %tmp.2 = getelementptr %C* null, i32 1
  %tmp.3 = ptrtoint %C* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %C*
  %tmp.1 = alloca %C*
  store %C* %tmp.0, %C** %tmp.1
  %tmp.7 = load %C** %tmp.1
  %tmp.8 = getelementptr %C* %tmp.7, i32 0, i32 0
  store %struct.C_vtable* @struct.C_vtable_prototype, %struct.C_vtable** %tmp.8
  %tmp.11 = alloca i32
  store i32 0, i32* %tmp.11
  %tmp.12 = load i32* %tmp.11
  %tmp.14 = getelementptr %C* %tmp.7, i32 0, i32 1
  store i32 %tmp.12, i32* %tmp.14
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.18 = getelementptr %Int* null, i32 1
  %tmp.19 = ptrtoint %Int* %tmp.18 to i32
  %tmp.20 = call i8* @malloc(i32 %tmp.19)
  %tmp.21 = icmp eq i8* null, %tmp.20
  br i1 %tmp.21, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.16 = bitcast i8* %tmp.20 to %Int*
  %tmp.17 = alloca %Int*
  store %Int* %tmp.16, %Int** %tmp.17
  %tmp.23 = load %Int** %tmp.17
  %tmp.24 = getelementptr %Int* %tmp.23, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.24
  %tmp.26 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 0, i32* %tmp.26
  %tmp.27 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 -1, i32* %tmp.27
  %tmp.28 = bitcast %Int* %tmp.23 to %C*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %C* [ %tmp.7, %malloc_normal0 ], [ %tmp.28, %malloc_normal1 ]
  ret %C* %UnifiedRetVal
}

define %A* @C_method6(%C* %self, i32 %num) {
entry:
  %tmp.29 = alloca %C*
  store %C* %self, %C** %tmp.29
  %tmp.30 = alloca i32
  store i32 %num, i32* %tmp.30
  %tmp.31 = alloca i32
  store i32 0, i32* %tmp.31
  %tmp.32 = load i32* %tmp.30
  %tmp.33 = mul i32 %tmp.32, -1
  store i32 %tmp.33, i32* %tmp.31
  %tmp.34 = load i32* %tmp.31
  %tmp.35 = call %A* @A_new()
  %tmp.36 = icmp eq %A* null, %tmp.35
  br i1 %tmp.36, label %abort, label %normal2

normal2:                                          ; preds = %entry
  %tmp.37 = getelementptr %A* %tmp.35, i32 0, i32 0
  %tmp.38 = load %struct.A_vtable** %tmp.37
  %tmp.39 = getelementptr %struct.A_vtable* %tmp.38, i32 0, i32 8
  %tmp.40 = load %A* (%A*, i32)** %tmp.39
  %tmp.41 = call %A* %tmp.40(%A* %tmp.35, i32 %tmp.34)
  %tmp.42 = bitcast %A* %tmp.41 to %A*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.46 = getelementptr %Int* null, i32 1
  %tmp.47 = ptrtoint %Int* %tmp.46 to i32
  %tmp.48 = call i8* @malloc(i32 %tmp.47)
  %tmp.49 = icmp eq i8* null, %tmp.48
  br i1 %tmp.49, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %abort
  %tmp.44 = bitcast i8* %tmp.48 to %Int*
  %tmp.45 = alloca %Int*
  store %Int* %tmp.44, %Int** %tmp.45
  %tmp.51 = load %Int** %tmp.45
  %tmp.52 = getelementptr %Int* %tmp.51, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.52
  %tmp.54 = getelementptr %Int* %tmp.51, i32 0, i32 1
  store i32 0, i32* %tmp.54
  %tmp.55 = getelementptr %Int* %tmp.51, i32 0, i32 1
  store i32 -1, i32* %tmp.55
  %tmp.56 = bitcast %Int* %tmp.51 to %A*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal3, %normal2
  %UnifiedRetVal = phi %A* [ %tmp.42, %normal2 ], [ %tmp.56, %malloc_normal3 ]
  ret %A* %UnifiedRetVal
}

define %E* @C_method5(%C* %self, i32 %num) {
entry:
  %tmp.57 = alloca %C*
  store %C* %self, %C** %tmp.57
  %tmp.58 = alloca i32
  store i32 %num, i32* %tmp.58
  %tmp.59 = alloca i32
  store i32 0, i32* %tmp.59
  %tmp.60 = load i32* %tmp.58
  %tmp.61 = load i32* %tmp.58
  %tmp.62 = mul i32 %tmp.60, %tmp.61
  %tmp.63 = load i32* %tmp.58
  %tmp.64 = mul i32 %tmp.62, %tmp.63
  store i32 %tmp.64, i32* %tmp.59
  %tmp.65 = load i32* %tmp.59
  %tmp.66 = call %E* @E_new()
  %tmp.67 = icmp eq %E* null, %tmp.66
  br i1 %tmp.67, label %abort, label %normal4

normal4:                                          ; preds = %entry
  %tmp.68 = getelementptr %E* %tmp.66, i32 0, i32 0
  %tmp.69 = load %struct.E_vtable** %tmp.68
  %tmp.70 = getelementptr %struct.E_vtable* %tmp.69, i32 0, i32 8
  %tmp.71 = load %A* (%A*, i32)** %tmp.70
  %tmp.73 = bitcast %E* %tmp.66 to %A*
  %tmp.72 = call %A* %tmp.71(%A* %tmp.73, i32 %tmp.65)
  %tmp.74 = bitcast %A* %tmp.72 to %E*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.78 = getelementptr %Int* null, i32 1
  %tmp.79 = ptrtoint %Int* %tmp.78 to i32
  %tmp.80 = call i8* @malloc(i32 %tmp.79)
  %tmp.81 = icmp eq i8* null, %tmp.80
  br i1 %tmp.81, label %abort, label %malloc_normal5

malloc_normal5:                                   ; preds = %abort
  %tmp.76 = bitcast i8* %tmp.80 to %Int*
  %tmp.77 = alloca %Int*
  store %Int* %tmp.76, %Int** %tmp.77
  %tmp.83 = load %Int** %tmp.77
  %tmp.84 = getelementptr %Int* %tmp.83, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.84
  %tmp.86 = getelementptr %Int* %tmp.83, i32 0, i32 1
  store i32 0, i32* %tmp.86
  %tmp.87 = getelementptr %Int* %tmp.83, i32 0, i32 1
  store i32 -1, i32* %tmp.87
  %tmp.88 = bitcast %Int* %tmp.83 to %E*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal5, %normal4
  %UnifiedRetVal = phi %E* [ %tmp.74, %normal4 ], [ %tmp.88, %malloc_normal5 ]
  ret %E* %UnifiedRetVal
}

define %D* @D_new() {
entry:
  %tmp.2 = getelementptr %D* null, i32 1
  %tmp.3 = ptrtoint %D* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %D*
  %tmp.1 = alloca %D*
  store %D* %tmp.0, %D** %tmp.1
  %tmp.7 = load %D** %tmp.1
  %tmp.8 = getelementptr %D* %tmp.7, i32 0, i32 0
  store %struct.D_vtable* @struct.D_vtable_prototype, %struct.D_vtable** %tmp.8
  %tmp.11 = alloca i32
  store i32 0, i32* %tmp.11
  %tmp.12 = load i32* %tmp.11
  %tmp.14 = getelementptr %D* %tmp.7, i32 0, i32 1
  store i32 %tmp.12, i32* %tmp.14
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.18 = getelementptr %Int* null, i32 1
  %tmp.19 = ptrtoint %Int* %tmp.18 to i32
  %tmp.20 = call i8* @malloc(i32 %tmp.19)
  %tmp.21 = icmp eq i8* null, %tmp.20
  br i1 %tmp.21, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.16 = bitcast i8* %tmp.20 to %Int*
  %tmp.17 = alloca %Int*
  store %Int* %tmp.16, %Int** %tmp.17
  %tmp.23 = load %Int** %tmp.17
  %tmp.24 = getelementptr %Int* %tmp.23, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.24
  %tmp.26 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 0, i32* %tmp.26
  %tmp.27 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 -1, i32* %tmp.27
  %tmp.28 = bitcast %Int* %tmp.23 to %D*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %D* [ %tmp.7, %malloc_normal0 ], [ %tmp.28, %malloc_normal1 ]
  ret %D* %UnifiedRetVal
}

define i1 @D_method7(%D* %self, i32 %num) {
entry:
  %tmp.29 = alloca %D*
  store %D* %self, %D** %tmp.29
  %tmp.30 = alloca i32
  store i32 %num, i32* %tmp.30
  %tmp.31 = load i32* %tmp.30
  %tmp.32 = alloca i32
  store i32 %tmp.31, i32* %tmp.32
  %tmp.33 = alloca i1
  %tmp.34 = load i32* %tmp.32
  %tmp.35 = icmp slt i32 %tmp.34, 0
  br i1 %tmp.35, label %then0, label %else0

then0:                                            ; preds = %entry
  %tmp.36 = load i32* %tmp.32
  %tmp.37 = mul i32 %tmp.36, -1
  %tmp.38 = load %D** %tmp.29
  %tmp.39 = icmp eq %D* null, %tmp.38
  br i1 %tmp.39, label %abort, label %normal2

normal2:                                          ; preds = %then0
  %tmp.40 = getelementptr %D* %tmp.38, i32 0, i32 0
  %tmp.41 = load %struct.D_vtable** %tmp.40
  %tmp.42 = getelementptr %struct.D_vtable* %tmp.41, i32 0, i32 14
  %tmp.43 = load i1 (%D*, i32)** %tmp.42
  %tmp.44 = call i1 %tmp.43(%D* %tmp.38, i32 %tmp.37)
  store i1 %tmp.44, i1* %tmp.33
  br label %after0

else0:                                            ; preds = %entry
  %tmp.45 = alloca i1
  %tmp.46 = load i32* %tmp.32
  %tmp.47 = icmp eq i32 0, %tmp.46
  br i1 %tmp.47, label %then1, label %else1

then1:                                            ; preds = %else0
  store i1 true, i1* %tmp.45
  br label %after1

else1:                                            ; preds = %else0
  %tmp.48 = alloca i1
  %tmp.49 = load i32* %tmp.32
  %tmp.50 = icmp eq i32 1, %tmp.49
  br i1 %tmp.50, label %then2, label %else2

then2:                                            ; preds = %else1
  store i1 false, i1* %tmp.48
  br label %after2

else2:                                            ; preds = %else1
  %tmp.51 = alloca i1
  %tmp.52 = load i32* %tmp.32
  %tmp.53 = icmp eq i32 2, %tmp.52
  br i1 %tmp.53, label %then3, label %else3

then3:                                            ; preds = %else2
  store i1 false, i1* %tmp.51
  br label %after3

else3:                                            ; preds = %else2
  %tmp.54 = load i32* %tmp.32
  %tmp.55 = sub i32 %tmp.54, 3
  %tmp.56 = load %D** %tmp.29
  %tmp.57 = icmp eq %D* null, %tmp.56
  br i1 %tmp.57, label %abort, label %normal3

normal3:                                          ; preds = %else3
  %tmp.58 = getelementptr %D* %tmp.56, i32 0, i32 0
  %tmp.59 = load %struct.D_vtable** %tmp.58
  %tmp.60 = getelementptr %struct.D_vtable* %tmp.59, i32 0, i32 14
  %tmp.61 = load i1 (%D*, i32)** %tmp.60
  %tmp.62 = call i1 %tmp.61(%D* %tmp.56, i32 %tmp.55)
  store i1 %tmp.62, i1* %tmp.51
  br label %after3

after3:                                           ; preds = %normal3, %then3
  %tmp.63 = load i1* %tmp.51
  store i1 %tmp.63, i1* %tmp.48
  br label %after2

after2:                                           ; preds = %after3, %then2
  %tmp.64 = load i1* %tmp.48
  store i1 %tmp.64, i1* %tmp.45
  br label %after1

after1:                                           ; preds = %after2, %then1
  %tmp.65 = load i1* %tmp.45
  store i1 %tmp.65, i1* %tmp.33
  br label %after0

after0:                                           ; preds = %after1, %normal2
  %tmp.66 = load i1* %tmp.33
  br label %UnifiedReturnBlock

abort:                                            ; preds = %else3, %then0
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %after0
  %UnifiedRetVal = phi i1 [ %tmp.66, %after0 ], [ false, %abort ]
  ret i1 %UnifiedRetVal
}

define %E* @E_new() {
entry:
  %tmp.2 = getelementptr %E* null, i32 1
  %tmp.3 = ptrtoint %E* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %E*
  %tmp.1 = alloca %E*
  store %E* %tmp.0, %E** %tmp.1
  %tmp.7 = load %E** %tmp.1
  %tmp.8 = getelementptr %E* %tmp.7, i32 0, i32 0
  store %struct.E_vtable* @struct.E_vtable_prototype, %struct.E_vtable** %tmp.8
  %tmp.11 = alloca i32
  store i32 0, i32* %tmp.11
  %tmp.12 = load i32* %tmp.11
  %tmp.14 = getelementptr %E* %tmp.7, i32 0, i32 1
  store i32 %tmp.12, i32* %tmp.14
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.18 = getelementptr %Int* null, i32 1
  %tmp.19 = ptrtoint %Int* %tmp.18 to i32
  %tmp.20 = call i8* @malloc(i32 %tmp.19)
  %tmp.21 = icmp eq i8* null, %tmp.20
  br i1 %tmp.21, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.16 = bitcast i8* %tmp.20 to %Int*
  %tmp.17 = alloca %Int*
  store %Int* %tmp.16, %Int** %tmp.17
  %tmp.23 = load %Int** %tmp.17
  %tmp.24 = getelementptr %Int* %tmp.23, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.24
  %tmp.26 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 0, i32* %tmp.26
  %tmp.27 = getelementptr %Int* %tmp.23, i32 0, i32 1
  store i32 -1, i32* %tmp.27
  %tmp.28 = bitcast %Int* %tmp.23 to %E*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %E* [ %tmp.7, %malloc_normal0 ], [ %tmp.28, %malloc_normal1 ]
  ret %E* %UnifiedRetVal
}

define %A* @E_method6(%E* %self, i32 %num) {
entry:
  %tmp.29 = alloca %E*
  store %E* %self, %E** %tmp.29
  %tmp.30 = alloca i32
  store i32 %num, i32* %tmp.30
  %tmp.31 = alloca i32
  store i32 0, i32* %tmp.31
  %tmp.32 = load i32* %tmp.30
  %tmp.33 = icmp eq i32 8, 0
  br i1 %tmp.33, label %abort, label %div_ok0

div_ok0:                                          ; preds = %entry
  %tmp.34 = sdiv i32 %tmp.32, 8
  store i32 %tmp.34, i32* %tmp.31
  %tmp.35 = load i32* %tmp.31
  %tmp.36 = call %A* @A_new()
  %tmp.37 = icmp eq %A* null, %tmp.36
  br i1 %tmp.37, label %abort, label %normal2

normal2:                                          ; preds = %div_ok0
  %tmp.38 = getelementptr %A* %tmp.36, i32 0, i32 0
  %tmp.39 = load %struct.A_vtable** %tmp.38
  %tmp.40 = getelementptr %struct.A_vtable* %tmp.39, i32 0, i32 8
  %tmp.41 = load %A* (%A*, i32)** %tmp.40
  %tmp.42 = call %A* %tmp.41(%A* %tmp.36, i32 %tmp.35)
  %tmp.43 = bitcast %A* %tmp.42 to %A*
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %div_ok0, %entry
  call void @abort()
  %tmp.47 = getelementptr %Int* null, i32 1
  %tmp.48 = ptrtoint %Int* %tmp.47 to i32
  %tmp.49 = call i8* @malloc(i32 %tmp.48)
  %tmp.50 = icmp eq i8* null, %tmp.49
  br i1 %tmp.50, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %abort
  %tmp.45 = bitcast i8* %tmp.49 to %Int*
  %tmp.46 = alloca %Int*
  store %Int* %tmp.45, %Int** %tmp.46
  %tmp.52 = load %Int** %tmp.46
  %tmp.53 = getelementptr %Int* %tmp.52, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.53
  %tmp.55 = getelementptr %Int* %tmp.52, i32 0, i32 1
  store i32 0, i32* %tmp.55
  %tmp.56 = getelementptr %Int* %tmp.52, i32 0, i32 1
  store i32 -1, i32* %tmp.56
  %tmp.57 = bitcast %Int* %tmp.52 to %A*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal3, %normal2
  %UnifiedRetVal = phi %A* [ %tmp.43, %normal2 ], [ %tmp.57, %malloc_normal3 ]
  ret %A* %UnifiedRetVal
}

define %A2I* @A2I_new() {
entry:
  %tmp.2 = getelementptr %A2I* null, i32 1
  %tmp.3 = ptrtoint %A2I* %tmp.2 to i32
  %tmp.4 = call i8* @malloc(i32 %tmp.3)
  %tmp.5 = icmp eq i8* null, %tmp.4
  br i1 %tmp.5, label %abort, label %malloc_normal0

malloc_normal0:                                   ; preds = %entry
  %tmp.0 = bitcast i8* %tmp.4 to %A2I*
  %tmp.1 = alloca %A2I*
  store %A2I* %tmp.0, %A2I** %tmp.1
  %tmp.7 = load %A2I** %tmp.1
  %tmp.8 = getelementptr %A2I* %tmp.7, i32 0, i32 0
  store %struct.A2I_vtable* @struct.A2I_vtable_prototype, %struct.A2I_vtable** %tmp.8
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %entry
  call void @abort()
  %tmp.13 = getelementptr %Int* null, i32 1
  %tmp.14 = ptrtoint %Int* %tmp.13 to i32
  %tmp.15 = call i8* @malloc(i32 %tmp.14)
  %tmp.16 = icmp eq i8* null, %tmp.15
  br i1 %tmp.16, label %abort, label %malloc_normal1

malloc_normal1:                                   ; preds = %abort
  %tmp.11 = bitcast i8* %tmp.15 to %Int*
  %tmp.12 = alloca %Int*
  store %Int* %tmp.11, %Int** %tmp.12
  %tmp.18 = load %Int** %tmp.12
  %tmp.19 = getelementptr %Int* %tmp.18, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.19
  %tmp.21 = getelementptr %Int* %tmp.18, i32 0, i32 1
  store i32 0, i32* %tmp.21
  %tmp.22 = getelementptr %Int* %tmp.18, i32 0, i32 1
  store i32 -1, i32* %tmp.22
  %tmp.23 = bitcast %Int* %tmp.18 to %A2I*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal1, %malloc_normal0
  %UnifiedRetVal = phi %A2I* [ %tmp.7, %malloc_normal0 ], [ %tmp.23, %malloc_normal1 ]
  ret %A2I* %UnifiedRetVal
}

define i32 @A2I_c2i(%A2I* %self, %String* %char) {
entry:
  %tmp.24 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.24
  %tmp.25 = alloca %String*
  store %String* %char, %String** %tmp.25
  %tmp.26 = alloca i32
  %tmp.27 = load %String** %tmp.25
  %tmp.30 = getelementptr %String* null, i32 1
  %tmp.31 = ptrtoint %String* %tmp.30 to i32
  %tmp.32 = call i8* @malloc(i32 %tmp.31)
  %tmp.33 = icmp eq i8* null, %tmp.32
  br i1 %tmp.33, label %abort, label %malloc_normal2

malloc_normal2:                                   ; preds = %entry
  %tmp.28 = bitcast i8* %tmp.32 to %String*
  %tmp.29 = alloca %String*
  store %String* %tmp.28, %String** %tmp.29
  %tmp.35 = load %String** %tmp.29
  %tmp.36 = getelementptr %String* %tmp.35, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.36
  %tmp.38 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.39 = getelementptr %String* %tmp.35, i32 0, i32 1
  store i8* %tmp.38, i8** %tmp.39
  %tmp.40 = getelementptr [2 x i8]* @.str1, i32 0, i32 0
  %tmp.41 = getelementptr %String* %tmp.35, i32 0, i32 1
  store i8* %tmp.40, i8** %tmp.41
  %tmp.44 = getelementptr %String* %tmp.27, i32 0, i32 1
  %tmp.45 = load i8** %tmp.44
  %tmp.46 = getelementptr %String* %tmp.35, i32 0, i32 1
  %tmp.47 = load i8** %tmp.46
  %tmp.43 = call i32 @strcmp(i8* %tmp.45, i8* %tmp.47)
  %tmp.42 = icmp eq i32 %tmp.43, 0
  br i1 %tmp.42, label %then0, label %else0

then0:                                            ; preds = %malloc_normal2
  store i32 0, i32* %tmp.26
  br label %after0

else0:                                            ; preds = %malloc_normal2
  %tmp.48 = alloca i32
  %tmp.49 = load %String** %tmp.25
  %tmp.52 = getelementptr %String* null, i32 1
  %tmp.53 = ptrtoint %String* %tmp.52 to i32
  %tmp.54 = call i8* @malloc(i32 %tmp.53)
  %tmp.55 = icmp eq i8* null, %tmp.54
  br i1 %tmp.55, label %abort, label %malloc_normal3

malloc_normal3:                                   ; preds = %else0
  %tmp.50 = bitcast i8* %tmp.54 to %String*
  %tmp.51 = alloca %String*
  store %String* %tmp.50, %String** %tmp.51
  %tmp.57 = load %String** %tmp.51
  %tmp.58 = getelementptr %String* %tmp.57, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.58
  %tmp.60 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.61 = getelementptr %String* %tmp.57, i32 0, i32 1
  store i8* %tmp.60, i8** %tmp.61
  %tmp.62 = getelementptr [2 x i8]* @.str2, i32 0, i32 0
  %tmp.63 = getelementptr %String* %tmp.57, i32 0, i32 1
  store i8* %tmp.62, i8** %tmp.63
  %tmp.66 = getelementptr %String* %tmp.49, i32 0, i32 1
  %tmp.67 = load i8** %tmp.66
  %tmp.68 = getelementptr %String* %tmp.57, i32 0, i32 1
  %tmp.69 = load i8** %tmp.68
  %tmp.65 = call i32 @strcmp(i8* %tmp.67, i8* %tmp.69)
  %tmp.64 = icmp eq i32 %tmp.65, 0
  br i1 %tmp.64, label %then1, label %else1

then1:                                            ; preds = %malloc_normal3
  store i32 1, i32* %tmp.48
  br label %after1

else1:                                            ; preds = %malloc_normal3
  %tmp.70 = alloca i32
  %tmp.71 = load %String** %tmp.25
  %tmp.74 = getelementptr %String* null, i32 1
  %tmp.75 = ptrtoint %String* %tmp.74 to i32
  %tmp.76 = call i8* @malloc(i32 %tmp.75)
  %tmp.77 = icmp eq i8* null, %tmp.76
  br i1 %tmp.77, label %abort, label %malloc_normal4

malloc_normal4:                                   ; preds = %else1
  %tmp.72 = bitcast i8* %tmp.76 to %String*
  %tmp.73 = alloca %String*
  store %String* %tmp.72, %String** %tmp.73
  %tmp.79 = load %String** %tmp.73
  %tmp.80 = getelementptr %String* %tmp.79, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.80
  %tmp.82 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.83 = getelementptr %String* %tmp.79, i32 0, i32 1
  store i8* %tmp.82, i8** %tmp.83
  %tmp.84 = getelementptr [2 x i8]* @.str3, i32 0, i32 0
  %tmp.85 = getelementptr %String* %tmp.79, i32 0, i32 1
  store i8* %tmp.84, i8** %tmp.85
  %tmp.88 = getelementptr %String* %tmp.71, i32 0, i32 1
  %tmp.89 = load i8** %tmp.88
  %tmp.90 = getelementptr %String* %tmp.79, i32 0, i32 1
  %tmp.91 = load i8** %tmp.90
  %tmp.87 = call i32 @strcmp(i8* %tmp.89, i8* %tmp.91)
  %tmp.86 = icmp eq i32 %tmp.87, 0
  br i1 %tmp.86, label %then2, label %else2

then2:                                            ; preds = %malloc_normal4
  store i32 2, i32* %tmp.70
  br label %after2

else2:                                            ; preds = %malloc_normal4
  %tmp.92 = alloca i32
  %tmp.93 = load %String** %tmp.25
  %tmp.96 = getelementptr %String* null, i32 1
  %tmp.97 = ptrtoint %String* %tmp.96 to i32
  %tmp.98 = call i8* @malloc(i32 %tmp.97)
  %tmp.99 = icmp eq i8* null, %tmp.98
  br i1 %tmp.99, label %abort, label %malloc_normal5

malloc_normal5:                                   ; preds = %else2
  %tmp.94 = bitcast i8* %tmp.98 to %String*
  %tmp.95 = alloca %String*
  store %String* %tmp.94, %String** %tmp.95
  %tmp.101 = load %String** %tmp.95
  %tmp.102 = getelementptr %String* %tmp.101, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.102
  %tmp.104 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.105 = getelementptr %String* %tmp.101, i32 0, i32 1
  store i8* %tmp.104, i8** %tmp.105
  %tmp.106 = getelementptr [2 x i8]* @.str4, i32 0, i32 0
  %tmp.107 = getelementptr %String* %tmp.101, i32 0, i32 1
  store i8* %tmp.106, i8** %tmp.107
  %tmp.110 = getelementptr %String* %tmp.93, i32 0, i32 1
  %tmp.111 = load i8** %tmp.110
  %tmp.112 = getelementptr %String* %tmp.101, i32 0, i32 1
  %tmp.113 = load i8** %tmp.112
  %tmp.109 = call i32 @strcmp(i8* %tmp.111, i8* %tmp.113)
  %tmp.108 = icmp eq i32 %tmp.109, 0
  br i1 %tmp.108, label %then3, label %else3

then3:                                            ; preds = %malloc_normal5
  store i32 3, i32* %tmp.92
  br label %after3

else3:                                            ; preds = %malloc_normal5
  %tmp.114 = alloca i32
  %tmp.115 = load %String** %tmp.25
  %tmp.118 = getelementptr %String* null, i32 1
  %tmp.119 = ptrtoint %String* %tmp.118 to i32
  %tmp.120 = call i8* @malloc(i32 %tmp.119)
  %tmp.121 = icmp eq i8* null, %tmp.120
  br i1 %tmp.121, label %abort, label %malloc_normal6

malloc_normal6:                                   ; preds = %else3
  %tmp.116 = bitcast i8* %tmp.120 to %String*
  %tmp.117 = alloca %String*
  store %String* %tmp.116, %String** %tmp.117
  %tmp.123 = load %String** %tmp.117
  %tmp.124 = getelementptr %String* %tmp.123, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.124
  %tmp.126 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.127 = getelementptr %String* %tmp.123, i32 0, i32 1
  store i8* %tmp.126, i8** %tmp.127
  %tmp.128 = getelementptr [2 x i8]* @.str5, i32 0, i32 0
  %tmp.129 = getelementptr %String* %tmp.123, i32 0, i32 1
  store i8* %tmp.128, i8** %tmp.129
  %tmp.132 = getelementptr %String* %tmp.115, i32 0, i32 1
  %tmp.133 = load i8** %tmp.132
  %tmp.134 = getelementptr %String* %tmp.123, i32 0, i32 1
  %tmp.135 = load i8** %tmp.134
  %tmp.131 = call i32 @strcmp(i8* %tmp.133, i8* %tmp.135)
  %tmp.130 = icmp eq i32 %tmp.131, 0
  br i1 %tmp.130, label %then4, label %else4

then4:                                            ; preds = %malloc_normal6
  store i32 4, i32* %tmp.114
  br label %after4

else4:                                            ; preds = %malloc_normal6
  %tmp.136 = alloca i32
  %tmp.137 = load %String** %tmp.25
  %tmp.140 = getelementptr %String* null, i32 1
  %tmp.141 = ptrtoint %String* %tmp.140 to i32
  %tmp.142 = call i8* @malloc(i32 %tmp.141)
  %tmp.143 = icmp eq i8* null, %tmp.142
  br i1 %tmp.143, label %abort, label %malloc_normal7

malloc_normal7:                                   ; preds = %else4
  %tmp.138 = bitcast i8* %tmp.142 to %String*
  %tmp.139 = alloca %String*
  store %String* %tmp.138, %String** %tmp.139
  %tmp.145 = load %String** %tmp.139
  %tmp.146 = getelementptr %String* %tmp.145, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.146
  %tmp.148 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.149 = getelementptr %String* %tmp.145, i32 0, i32 1
  store i8* %tmp.148, i8** %tmp.149
  %tmp.150 = getelementptr [2 x i8]* @.str6, i32 0, i32 0
  %tmp.151 = getelementptr %String* %tmp.145, i32 0, i32 1
  store i8* %tmp.150, i8** %tmp.151
  %tmp.154 = getelementptr %String* %tmp.137, i32 0, i32 1
  %tmp.155 = load i8** %tmp.154
  %tmp.156 = getelementptr %String* %tmp.145, i32 0, i32 1
  %tmp.157 = load i8** %tmp.156
  %tmp.153 = call i32 @strcmp(i8* %tmp.155, i8* %tmp.157)
  %tmp.152 = icmp eq i32 %tmp.153, 0
  br i1 %tmp.152, label %then5, label %else5

then5:                                            ; preds = %malloc_normal7
  store i32 5, i32* %tmp.136
  br label %after5

else5:                                            ; preds = %malloc_normal7
  %tmp.158 = alloca i32
  %tmp.159 = load %String** %tmp.25
  %tmp.162 = getelementptr %String* null, i32 1
  %tmp.163 = ptrtoint %String* %tmp.162 to i32
  %tmp.164 = call i8* @malloc(i32 %tmp.163)
  %tmp.165 = icmp eq i8* null, %tmp.164
  br i1 %tmp.165, label %abort, label %malloc_normal8

malloc_normal8:                                   ; preds = %else5
  %tmp.160 = bitcast i8* %tmp.164 to %String*
  %tmp.161 = alloca %String*
  store %String* %tmp.160, %String** %tmp.161
  %tmp.167 = load %String** %tmp.161
  %tmp.168 = getelementptr %String* %tmp.167, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.168
  %tmp.170 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.171 = getelementptr %String* %tmp.167, i32 0, i32 1
  store i8* %tmp.170, i8** %tmp.171
  %tmp.172 = getelementptr [2 x i8]* @.str7, i32 0, i32 0
  %tmp.173 = getelementptr %String* %tmp.167, i32 0, i32 1
  store i8* %tmp.172, i8** %tmp.173
  %tmp.176 = getelementptr %String* %tmp.159, i32 0, i32 1
  %tmp.177 = load i8** %tmp.176
  %tmp.178 = getelementptr %String* %tmp.167, i32 0, i32 1
  %tmp.179 = load i8** %tmp.178
  %tmp.175 = call i32 @strcmp(i8* %tmp.177, i8* %tmp.179)
  %tmp.174 = icmp eq i32 %tmp.175, 0
  br i1 %tmp.174, label %then6, label %else6

then6:                                            ; preds = %malloc_normal8
  store i32 6, i32* %tmp.158
  br label %after6

else6:                                            ; preds = %malloc_normal8
  %tmp.180 = alloca i32
  %tmp.181 = load %String** %tmp.25
  %tmp.184 = getelementptr %String* null, i32 1
  %tmp.185 = ptrtoint %String* %tmp.184 to i32
  %tmp.186 = call i8* @malloc(i32 %tmp.185)
  %tmp.187 = icmp eq i8* null, %tmp.186
  br i1 %tmp.187, label %abort, label %malloc_normal9

malloc_normal9:                                   ; preds = %else6
  %tmp.182 = bitcast i8* %tmp.186 to %String*
  %tmp.183 = alloca %String*
  store %String* %tmp.182, %String** %tmp.183
  %tmp.189 = load %String** %tmp.183
  %tmp.190 = getelementptr %String* %tmp.189, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.190
  %tmp.192 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.193 = getelementptr %String* %tmp.189, i32 0, i32 1
  store i8* %tmp.192, i8** %tmp.193
  %tmp.194 = getelementptr [2 x i8]* @.str8, i32 0, i32 0
  %tmp.195 = getelementptr %String* %tmp.189, i32 0, i32 1
  store i8* %tmp.194, i8** %tmp.195
  %tmp.198 = getelementptr %String* %tmp.181, i32 0, i32 1
  %tmp.199 = load i8** %tmp.198
  %tmp.200 = getelementptr %String* %tmp.189, i32 0, i32 1
  %tmp.201 = load i8** %tmp.200
  %tmp.197 = call i32 @strcmp(i8* %tmp.199, i8* %tmp.201)
  %tmp.196 = icmp eq i32 %tmp.197, 0
  br i1 %tmp.196, label %then7, label %else7

then7:                                            ; preds = %malloc_normal9
  store i32 7, i32* %tmp.180
  br label %after7

else7:                                            ; preds = %malloc_normal9
  %tmp.202 = alloca i32
  %tmp.203 = load %String** %tmp.25
  %tmp.206 = getelementptr %String* null, i32 1
  %tmp.207 = ptrtoint %String* %tmp.206 to i32
  %tmp.208 = call i8* @malloc(i32 %tmp.207)
  %tmp.209 = icmp eq i8* null, %tmp.208
  br i1 %tmp.209, label %abort, label %malloc_normal10

malloc_normal10:                                  ; preds = %else7
  %tmp.204 = bitcast i8* %tmp.208 to %String*
  %tmp.205 = alloca %String*
  store %String* %tmp.204, %String** %tmp.205
  %tmp.211 = load %String** %tmp.205
  %tmp.212 = getelementptr %String* %tmp.211, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.212
  %tmp.214 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.215 = getelementptr %String* %tmp.211, i32 0, i32 1
  store i8* %tmp.214, i8** %tmp.215
  %tmp.216 = getelementptr [2 x i8]* @.str9, i32 0, i32 0
  %tmp.217 = getelementptr %String* %tmp.211, i32 0, i32 1
  store i8* %tmp.216, i8** %tmp.217
  %tmp.220 = getelementptr %String* %tmp.203, i32 0, i32 1
  %tmp.221 = load i8** %tmp.220
  %tmp.222 = getelementptr %String* %tmp.211, i32 0, i32 1
  %tmp.223 = load i8** %tmp.222
  %tmp.219 = call i32 @strcmp(i8* %tmp.221, i8* %tmp.223)
  %tmp.218 = icmp eq i32 %tmp.219, 0
  br i1 %tmp.218, label %then8, label %else8

then8:                                            ; preds = %malloc_normal10
  store i32 8, i32* %tmp.202
  br label %after8

else8:                                            ; preds = %malloc_normal10
  %tmp.224 = alloca i32
  %tmp.225 = load %String** %tmp.25
  %tmp.228 = getelementptr %String* null, i32 1
  %tmp.229 = ptrtoint %String* %tmp.228 to i32
  %tmp.230 = call i8* @malloc(i32 %tmp.229)
  %tmp.231 = icmp eq i8* null, %tmp.230
  br i1 %tmp.231, label %abort, label %malloc_normal11

malloc_normal11:                                  ; preds = %else8
  %tmp.226 = bitcast i8* %tmp.230 to %String*
  %tmp.227 = alloca %String*
  store %String* %tmp.226, %String** %tmp.227
  %tmp.233 = load %String** %tmp.227
  %tmp.234 = getelementptr %String* %tmp.233, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.234
  %tmp.236 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.237 = getelementptr %String* %tmp.233, i32 0, i32 1
  store i8* %tmp.236, i8** %tmp.237
  %tmp.238 = getelementptr [2 x i8]* @.str10, i32 0, i32 0
  %tmp.239 = getelementptr %String* %tmp.233, i32 0, i32 1
  store i8* %tmp.238, i8** %tmp.239
  %tmp.242 = getelementptr %String* %tmp.225, i32 0, i32 1
  %tmp.243 = load i8** %tmp.242
  %tmp.244 = getelementptr %String* %tmp.233, i32 0, i32 1
  %tmp.245 = load i8** %tmp.244
  %tmp.241 = call i32 @strcmp(i8* %tmp.243, i8* %tmp.245)
  %tmp.240 = icmp eq i32 %tmp.241, 0
  br i1 %tmp.240, label %then9, label %else9

then9:                                            ; preds = %malloc_normal11
  store i32 9, i32* %tmp.224
  br label %after9

else9:                                            ; preds = %malloc_normal11
  %tmp.246 = load %A2I** %tmp.24
  %tmp.247 = icmp eq %A2I* null, %tmp.246
  br i1 %tmp.247, label %abort, label %normal12

normal12:                                         ; preds = %else9
  %tmp.248 = getelementptr %A2I* %tmp.246, i32 0, i32 0
  %tmp.249 = load %struct.A2I_vtable** %tmp.248
  %tmp.250 = getelementptr %struct.A2I_vtable* %tmp.249, i32 0, i32 4
  %tmp.251 = load %struct.Object* (%struct.Object*)** %tmp.250
  %tmp.253 = bitcast %A2I* %tmp.246 to %struct.Object*
  %tmp.252 = call %struct.Object* %tmp.251(%struct.Object* %tmp.253)
  store i32 0, i32* %tmp.224
  br label %after9

after9:                                           ; preds = %normal12, %then9
  %tmp.255 = load i32* %tmp.224
  store i32 %tmp.255, i32* %tmp.202
  br label %after8

after8:                                           ; preds = %after9, %then8
  %tmp.256 = load i32* %tmp.202
  store i32 %tmp.256, i32* %tmp.180
  br label %after7

after7:                                           ; preds = %after8, %then7
  %tmp.257 = load i32* %tmp.180
  store i32 %tmp.257, i32* %tmp.158
  br label %after6

after6:                                           ; preds = %after7, %then6
  %tmp.258 = load i32* %tmp.158
  store i32 %tmp.258, i32* %tmp.136
  br label %after5

after5:                                           ; preds = %after6, %then5
  %tmp.259 = load i32* %tmp.136
  store i32 %tmp.259, i32* %tmp.114
  br label %after4

after4:                                           ; preds = %after5, %then4
  %tmp.260 = load i32* %tmp.114
  store i32 %tmp.260, i32* %tmp.92
  br label %after3

after3:                                           ; preds = %after4, %then3
  %tmp.261 = load i32* %tmp.92
  store i32 %tmp.261, i32* %tmp.70
  br label %after2

after2:                                           ; preds = %after3, %then2
  %tmp.262 = load i32* %tmp.70
  store i32 %tmp.262, i32* %tmp.48
  br label %after1

after1:                                           ; preds = %after2, %then1
  %tmp.263 = load i32* %tmp.48
  store i32 %tmp.263, i32* %tmp.26
  br label %after0

after0:                                           ; preds = %after1, %then0
  %tmp.264 = load i32* %tmp.26
  br label %UnifiedReturnBlock

abort:                                            ; preds = %else9, %else8, %else7, %else6, %else5, %else4, %else3, %else2, %else1, %else0, %entry
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %after0
  %UnifiedRetVal = phi i32 [ %tmp.264, %after0 ], [ -1, %abort ]
  ret i32 %UnifiedRetVal
}

define %String* @A2I_i2c(%A2I* %self, i32 %i) {
entry:
  %tmp.266 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.266
  %tmp.267 = alloca i32
  store i32 %i, i32* %tmp.267
  %tmp.268 = alloca %String*
  %tmp.269 = load i32* %tmp.267
  %tmp.270 = icmp eq i32 %tmp.269, 0
  br i1 %tmp.270, label %then10, label %else10

then10:                                           ; preds = %entry
  %tmp.273 = getelementptr %String* null, i32 1
  %tmp.274 = ptrtoint %String* %tmp.273 to i32
  %tmp.275 = call i8* @malloc(i32 %tmp.274)
  %tmp.276 = icmp eq i8* null, %tmp.275
  br i1 %tmp.276, label %abort, label %malloc_normal13

malloc_normal13:                                  ; preds = %then10
  %tmp.271 = bitcast i8* %tmp.275 to %String*
  %tmp.272 = alloca %String*
  store %String* %tmp.271, %String** %tmp.272
  %tmp.278 = load %String** %tmp.272
  %tmp.279 = getelementptr %String* %tmp.278, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.279
  %tmp.281 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.282 = getelementptr %String* %tmp.278, i32 0, i32 1
  store i8* %tmp.281, i8** %tmp.282
  %tmp.283 = getelementptr [2 x i8]* @.str1, i32 0, i32 0
  %tmp.284 = getelementptr %String* %tmp.278, i32 0, i32 1
  store i8* %tmp.283, i8** %tmp.284
  store %String* %tmp.278, %String** %tmp.268
  br label %after10

else10:                                           ; preds = %entry
  %tmp.285 = alloca %String*
  %tmp.286 = load i32* %tmp.267
  %tmp.287 = icmp eq i32 %tmp.286, 1
  br i1 %tmp.287, label %then11, label %else11

then11:                                           ; preds = %else10
  %tmp.290 = getelementptr %String* null, i32 1
  %tmp.291 = ptrtoint %String* %tmp.290 to i32
  %tmp.292 = call i8* @malloc(i32 %tmp.291)
  %tmp.293 = icmp eq i8* null, %tmp.292
  br i1 %tmp.293, label %abort, label %malloc_normal14

malloc_normal14:                                  ; preds = %then11
  %tmp.288 = bitcast i8* %tmp.292 to %String*
  %tmp.289 = alloca %String*
  store %String* %tmp.288, %String** %tmp.289
  %tmp.295 = load %String** %tmp.289
  %tmp.296 = getelementptr %String* %tmp.295, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.296
  %tmp.298 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.299 = getelementptr %String* %tmp.295, i32 0, i32 1
  store i8* %tmp.298, i8** %tmp.299
  %tmp.300 = getelementptr [2 x i8]* @.str2, i32 0, i32 0
  %tmp.301 = getelementptr %String* %tmp.295, i32 0, i32 1
  store i8* %tmp.300, i8** %tmp.301
  store %String* %tmp.295, %String** %tmp.285
  br label %after11

else11:                                           ; preds = %else10
  %tmp.302 = alloca %String*
  %tmp.303 = load i32* %tmp.267
  %tmp.304 = icmp eq i32 %tmp.303, 2
  br i1 %tmp.304, label %then12, label %else12

then12:                                           ; preds = %else11
  %tmp.307 = getelementptr %String* null, i32 1
  %tmp.308 = ptrtoint %String* %tmp.307 to i32
  %tmp.309 = call i8* @malloc(i32 %tmp.308)
  %tmp.310 = icmp eq i8* null, %tmp.309
  br i1 %tmp.310, label %abort, label %malloc_normal15

malloc_normal15:                                  ; preds = %then12
  %tmp.305 = bitcast i8* %tmp.309 to %String*
  %tmp.306 = alloca %String*
  store %String* %tmp.305, %String** %tmp.306
  %tmp.312 = load %String** %tmp.306
  %tmp.313 = getelementptr %String* %tmp.312, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.313
  %tmp.315 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.316 = getelementptr %String* %tmp.312, i32 0, i32 1
  store i8* %tmp.315, i8** %tmp.316
  %tmp.317 = getelementptr [2 x i8]* @.str3, i32 0, i32 0
  %tmp.318 = getelementptr %String* %tmp.312, i32 0, i32 1
  store i8* %tmp.317, i8** %tmp.318
  store %String* %tmp.312, %String** %tmp.302
  br label %after12

else12:                                           ; preds = %else11
  %tmp.319 = alloca %String*
  %tmp.320 = load i32* %tmp.267
  %tmp.321 = icmp eq i32 %tmp.320, 3
  br i1 %tmp.321, label %then13, label %else13

then13:                                           ; preds = %else12
  %tmp.324 = getelementptr %String* null, i32 1
  %tmp.325 = ptrtoint %String* %tmp.324 to i32
  %tmp.326 = call i8* @malloc(i32 %tmp.325)
  %tmp.327 = icmp eq i8* null, %tmp.326
  br i1 %tmp.327, label %abort, label %malloc_normal16

malloc_normal16:                                  ; preds = %then13
  %tmp.322 = bitcast i8* %tmp.326 to %String*
  %tmp.323 = alloca %String*
  store %String* %tmp.322, %String** %tmp.323
  %tmp.329 = load %String** %tmp.323
  %tmp.330 = getelementptr %String* %tmp.329, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.330
  %tmp.332 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.333 = getelementptr %String* %tmp.329, i32 0, i32 1
  store i8* %tmp.332, i8** %tmp.333
  %tmp.334 = getelementptr [2 x i8]* @.str4, i32 0, i32 0
  %tmp.335 = getelementptr %String* %tmp.329, i32 0, i32 1
  store i8* %tmp.334, i8** %tmp.335
  store %String* %tmp.329, %String** %tmp.319
  br label %after13

else13:                                           ; preds = %else12
  %tmp.336 = alloca %String*
  %tmp.337 = load i32* %tmp.267
  %tmp.338 = icmp eq i32 %tmp.337, 4
  br i1 %tmp.338, label %then14, label %else14

then14:                                           ; preds = %else13
  %tmp.341 = getelementptr %String* null, i32 1
  %tmp.342 = ptrtoint %String* %tmp.341 to i32
  %tmp.343 = call i8* @malloc(i32 %tmp.342)
  %tmp.344 = icmp eq i8* null, %tmp.343
  br i1 %tmp.344, label %abort, label %malloc_normal17

malloc_normal17:                                  ; preds = %then14
  %tmp.339 = bitcast i8* %tmp.343 to %String*
  %tmp.340 = alloca %String*
  store %String* %tmp.339, %String** %tmp.340
  %tmp.346 = load %String** %tmp.340
  %tmp.347 = getelementptr %String* %tmp.346, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.347
  %tmp.349 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.350 = getelementptr %String* %tmp.346, i32 0, i32 1
  store i8* %tmp.349, i8** %tmp.350
  %tmp.351 = getelementptr [2 x i8]* @.str5, i32 0, i32 0
  %tmp.352 = getelementptr %String* %tmp.346, i32 0, i32 1
  store i8* %tmp.351, i8** %tmp.352
  store %String* %tmp.346, %String** %tmp.336
  br label %after14

else14:                                           ; preds = %else13
  %tmp.353 = alloca %String*
  %tmp.354 = load i32* %tmp.267
  %tmp.355 = icmp eq i32 %tmp.354, 5
  br i1 %tmp.355, label %then15, label %else15

then15:                                           ; preds = %else14
  %tmp.358 = getelementptr %String* null, i32 1
  %tmp.359 = ptrtoint %String* %tmp.358 to i32
  %tmp.360 = call i8* @malloc(i32 %tmp.359)
  %tmp.361 = icmp eq i8* null, %tmp.360
  br i1 %tmp.361, label %abort, label %malloc_normal18

malloc_normal18:                                  ; preds = %then15
  %tmp.356 = bitcast i8* %tmp.360 to %String*
  %tmp.357 = alloca %String*
  store %String* %tmp.356, %String** %tmp.357
  %tmp.363 = load %String** %tmp.357
  %tmp.364 = getelementptr %String* %tmp.363, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.364
  %tmp.366 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.367 = getelementptr %String* %tmp.363, i32 0, i32 1
  store i8* %tmp.366, i8** %tmp.367
  %tmp.368 = getelementptr [2 x i8]* @.str6, i32 0, i32 0
  %tmp.369 = getelementptr %String* %tmp.363, i32 0, i32 1
  store i8* %tmp.368, i8** %tmp.369
  store %String* %tmp.363, %String** %tmp.353
  br label %after15

else15:                                           ; preds = %else14
  %tmp.370 = alloca %String*
  %tmp.371 = load i32* %tmp.267
  %tmp.372 = icmp eq i32 %tmp.371, 6
  br i1 %tmp.372, label %then16, label %else16

then16:                                           ; preds = %else15
  %tmp.375 = getelementptr %String* null, i32 1
  %tmp.376 = ptrtoint %String* %tmp.375 to i32
  %tmp.377 = call i8* @malloc(i32 %tmp.376)
  %tmp.378 = icmp eq i8* null, %tmp.377
  br i1 %tmp.378, label %abort, label %malloc_normal19

malloc_normal19:                                  ; preds = %then16
  %tmp.373 = bitcast i8* %tmp.377 to %String*
  %tmp.374 = alloca %String*
  store %String* %tmp.373, %String** %tmp.374
  %tmp.380 = load %String** %tmp.374
  %tmp.381 = getelementptr %String* %tmp.380, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.381
  %tmp.383 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.384 = getelementptr %String* %tmp.380, i32 0, i32 1
  store i8* %tmp.383, i8** %tmp.384
  %tmp.385 = getelementptr [2 x i8]* @.str7, i32 0, i32 0
  %tmp.386 = getelementptr %String* %tmp.380, i32 0, i32 1
  store i8* %tmp.385, i8** %tmp.386
  store %String* %tmp.380, %String** %tmp.370
  br label %after16

else16:                                           ; preds = %else15
  %tmp.387 = alloca %String*
  %tmp.388 = load i32* %tmp.267
  %tmp.389 = icmp eq i32 %tmp.388, 7
  br i1 %tmp.389, label %then17, label %else17

then17:                                           ; preds = %else16
  %tmp.392 = getelementptr %String* null, i32 1
  %tmp.393 = ptrtoint %String* %tmp.392 to i32
  %tmp.394 = call i8* @malloc(i32 %tmp.393)
  %tmp.395 = icmp eq i8* null, %tmp.394
  br i1 %tmp.395, label %abort, label %malloc_normal20

malloc_normal20:                                  ; preds = %then17
  %tmp.390 = bitcast i8* %tmp.394 to %String*
  %tmp.391 = alloca %String*
  store %String* %tmp.390, %String** %tmp.391
  %tmp.397 = load %String** %tmp.391
  %tmp.398 = getelementptr %String* %tmp.397, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.398
  %tmp.400 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.401 = getelementptr %String* %tmp.397, i32 0, i32 1
  store i8* %tmp.400, i8** %tmp.401
  %tmp.402 = getelementptr [2 x i8]* @.str8, i32 0, i32 0
  %tmp.403 = getelementptr %String* %tmp.397, i32 0, i32 1
  store i8* %tmp.402, i8** %tmp.403
  store %String* %tmp.397, %String** %tmp.387
  br label %after17

else17:                                           ; preds = %else16
  %tmp.404 = alloca %String*
  %tmp.405 = load i32* %tmp.267
  %tmp.406 = icmp eq i32 %tmp.405, 8
  br i1 %tmp.406, label %then18, label %else18

then18:                                           ; preds = %else17
  %tmp.409 = getelementptr %String* null, i32 1
  %tmp.410 = ptrtoint %String* %tmp.409 to i32
  %tmp.411 = call i8* @malloc(i32 %tmp.410)
  %tmp.412 = icmp eq i8* null, %tmp.411
  br i1 %tmp.412, label %abort, label %malloc_normal21

malloc_normal21:                                  ; preds = %then18
  %tmp.407 = bitcast i8* %tmp.411 to %String*
  %tmp.408 = alloca %String*
  store %String* %tmp.407, %String** %tmp.408
  %tmp.414 = load %String** %tmp.408
  %tmp.415 = getelementptr %String* %tmp.414, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.415
  %tmp.417 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.418 = getelementptr %String* %tmp.414, i32 0, i32 1
  store i8* %tmp.417, i8** %tmp.418
  %tmp.419 = getelementptr [2 x i8]* @.str9, i32 0, i32 0
  %tmp.420 = getelementptr %String* %tmp.414, i32 0, i32 1
  store i8* %tmp.419, i8** %tmp.420
  store %String* %tmp.414, %String** %tmp.404
  br label %after18

else18:                                           ; preds = %else17
  %tmp.421 = alloca %String*
  %tmp.422 = load i32* %tmp.267
  %tmp.423 = icmp eq i32 %tmp.422, 9
  br i1 %tmp.423, label %then19, label %else19

then19:                                           ; preds = %else18
  %tmp.426 = getelementptr %String* null, i32 1
  %tmp.427 = ptrtoint %String* %tmp.426 to i32
  %tmp.428 = call i8* @malloc(i32 %tmp.427)
  %tmp.429 = icmp eq i8* null, %tmp.428
  br i1 %tmp.429, label %abort, label %malloc_normal22

malloc_normal22:                                  ; preds = %then19
  %tmp.424 = bitcast i8* %tmp.428 to %String*
  %tmp.425 = alloca %String*
  store %String* %tmp.424, %String** %tmp.425
  %tmp.431 = load %String** %tmp.425
  %tmp.432 = getelementptr %String* %tmp.431, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.432
  %tmp.434 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.435 = getelementptr %String* %tmp.431, i32 0, i32 1
  store i8* %tmp.434, i8** %tmp.435
  %tmp.436 = getelementptr [2 x i8]* @.str10, i32 0, i32 0
  %tmp.437 = getelementptr %String* %tmp.431, i32 0, i32 1
  store i8* %tmp.436, i8** %tmp.437
  store %String* %tmp.431, %String** %tmp.421
  br label %after19

else19:                                           ; preds = %else18
  %tmp.438 = load %A2I** %tmp.266
  %tmp.439 = icmp eq %A2I* null, %tmp.438
  br i1 %tmp.439, label %abort, label %normal23

normal23:                                         ; preds = %else19
  %tmp.440 = getelementptr %A2I* %tmp.438, i32 0, i32 0
  %tmp.441 = load %struct.A2I_vtable** %tmp.440
  %tmp.442 = getelementptr %struct.A2I_vtable* %tmp.441, i32 0, i32 4
  %tmp.443 = load %struct.Object* (%struct.Object*)** %tmp.442
  %tmp.445 = bitcast %A2I* %tmp.438 to %struct.Object*
  %tmp.444 = call %struct.Object* %tmp.443(%struct.Object* %tmp.445)
  %tmp.449 = getelementptr %String* null, i32 1
  %tmp.450 = ptrtoint %String* %tmp.449 to i32
  %tmp.451 = call i8* @malloc(i32 %tmp.450)
  %tmp.452 = icmp eq i8* null, %tmp.451
  br i1 %tmp.452, label %abort, label %malloc_normal24

malloc_normal24:                                  ; preds = %normal23
  %tmp.447 = bitcast i8* %tmp.451 to %String*
  %tmp.448 = alloca %String*
  store %String* %tmp.447, %String** %tmp.448
  %tmp.454 = load %String** %tmp.448
  %tmp.455 = getelementptr %String* %tmp.454, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.455
  %tmp.457 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.458 = getelementptr %String* %tmp.454, i32 0, i32 1
  store i8* %tmp.457, i8** %tmp.458
  %tmp.459 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.460 = getelementptr %String* %tmp.454, i32 0, i32 1
  store i8* %tmp.459, i8** %tmp.460
  store %String* %tmp.454, %String** %tmp.421
  br label %after19

after19:                                          ; preds = %malloc_normal24, %malloc_normal22
  %tmp.461 = load %String** %tmp.421
  store %String* %tmp.461, %String** %tmp.404
  br label %after18

after18:                                          ; preds = %after19, %malloc_normal21
  %tmp.462 = load %String** %tmp.404
  store %String* %tmp.462, %String** %tmp.387
  br label %after17

after17:                                          ; preds = %after18, %malloc_normal20
  %tmp.463 = load %String** %tmp.387
  store %String* %tmp.463, %String** %tmp.370
  br label %after16

after16:                                          ; preds = %after17, %malloc_normal19
  %tmp.464 = load %String** %tmp.370
  store %String* %tmp.464, %String** %tmp.353
  br label %after15

after15:                                          ; preds = %after16, %malloc_normal18
  %tmp.465 = load %String** %tmp.353
  store %String* %tmp.465, %String** %tmp.336
  br label %after14

after14:                                          ; preds = %after15, %malloc_normal17
  %tmp.466 = load %String** %tmp.336
  store %String* %tmp.466, %String** %tmp.319
  br label %after13

after13:                                          ; preds = %after14, %malloc_normal16
  %tmp.467 = load %String** %tmp.319
  store %String* %tmp.467, %String** %tmp.302
  br label %after12

after12:                                          ; preds = %after13, %malloc_normal15
  %tmp.468 = load %String** %tmp.302
  store %String* %tmp.468, %String** %tmp.285
  br label %after11

after11:                                          ; preds = %after12, %malloc_normal14
  %tmp.469 = load %String** %tmp.285
  store %String* %tmp.469, %String** %tmp.268
  br label %after10

after10:                                          ; preds = %after11, %malloc_normal13
  %tmp.470 = load %String** %tmp.268
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal23, %else19, %then19, %then18, %then17, %then16, %then15, %then14, %then13, %then12, %then11, %then10
  call void @abort()
  %tmp.474 = getelementptr %Int* null, i32 1
  %tmp.475 = ptrtoint %Int* %tmp.474 to i32
  %tmp.476 = call i8* @malloc(i32 %tmp.475)
  %tmp.477 = icmp eq i8* null, %tmp.476
  br i1 %tmp.477, label %abort, label %malloc_normal25

malloc_normal25:                                  ; preds = %abort
  %tmp.472 = bitcast i8* %tmp.476 to %Int*
  %tmp.473 = alloca %Int*
  store %Int* %tmp.472, %Int** %tmp.473
  %tmp.479 = load %Int** %tmp.473
  %tmp.480 = getelementptr %Int* %tmp.479, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.480
  %tmp.482 = getelementptr %Int* %tmp.479, i32 0, i32 1
  store i32 0, i32* %tmp.482
  %tmp.483 = getelementptr %Int* %tmp.479, i32 0, i32 1
  store i32 -1, i32* %tmp.483
  %tmp.484 = bitcast %Int* %tmp.479 to %String*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal25, %after10
  %UnifiedRetVal = phi %String* [ %tmp.470, %after10 ], [ %tmp.484, %malloc_normal25 ]
  ret %String* %UnifiedRetVal
}

define i32 @A2I_a2i(%A2I* %self, %String* %s) {
entry:
  %tmp.485 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.485
  %tmp.486 = alloca %String*
  store %String* %s, %String** %tmp.486
  %tmp.487 = alloca i32
  %tmp.488 = load %String** %tmp.486
  %tmp.490 = getelementptr %String* %tmp.488, i32 0, i32 0
  %tmp.491 = load %struct.String_vtable** %tmp.490
  %tmp.492 = getelementptr %struct.String_vtable* %tmp.491, i32 0, i32 7
  %tmp.493 = load %struct.Int* (%struct.String*)** %tmp.492
  %tmp.495 = bitcast %String* %tmp.488 to %struct.String*
  %tmp.494 = call %struct.Int* %tmp.493(%struct.String* %tmp.495)
  %tmp.498 = bitcast %struct.Int* %tmp.494 to %Int*
  %tmp.497 = getelementptr %Int* %tmp.498, i32 0, i32 1
  %tmp.496 = load i32* %tmp.497
  %tmp.499 = icmp eq i32 %tmp.496, 0
  br i1 %tmp.499, label %then20, label %else20

then20:                                           ; preds = %entry
  store i32 0, i32* %tmp.487
  br label %after20

else20:                                           ; preds = %entry
  %tmp.500 = alloca i32
  %tmp.504 = getelementptr %Int* null, i32 1
  %tmp.505 = ptrtoint %Int* %tmp.504 to i32
  %tmp.506 = call i8* @malloc(i32 %tmp.505)
  %tmp.507 = icmp eq i8* null, %tmp.506
  br i1 %tmp.507, label %abort, label %malloc_normal26

malloc_normal26:                                  ; preds = %else20
  %tmp.502 = bitcast i8* %tmp.506 to %Int*
  %tmp.503 = alloca %Int*
  store %Int* %tmp.502, %Int** %tmp.503
  %tmp.509 = load %Int** %tmp.503
  %tmp.510 = getelementptr %Int* %tmp.509, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.510
  %tmp.512 = getelementptr %Int* %tmp.509, i32 0, i32 1
  store i32 0, i32* %tmp.512
  %tmp.513 = getelementptr %Int* %tmp.509, i32 0, i32 1
  store i32 0, i32* %tmp.513
  %tmp.514 = bitcast %Int* %tmp.509 to %struct.Int*
  %tmp.518 = getelementptr %Int* null, i32 1
  %tmp.519 = ptrtoint %Int* %tmp.518 to i32
  %tmp.520 = call i8* @malloc(i32 %tmp.519)
  %tmp.521 = icmp eq i8* null, %tmp.520
  br i1 %tmp.521, label %abort, label %malloc_normal27

malloc_normal27:                                  ; preds = %malloc_normal26
  %tmp.516 = bitcast i8* %tmp.520 to %Int*
  %tmp.517 = alloca %Int*
  store %Int* %tmp.516, %Int** %tmp.517
  %tmp.523 = load %Int** %tmp.517
  %tmp.524 = getelementptr %Int* %tmp.523, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.524
  %tmp.526 = getelementptr %Int* %tmp.523, i32 0, i32 1
  store i32 0, i32* %tmp.526
  %tmp.527 = getelementptr %Int* %tmp.523, i32 0, i32 1
  store i32 1, i32* %tmp.527
  %tmp.528 = bitcast %Int* %tmp.523 to %struct.Int*
  %tmp.529 = load %String** %tmp.486
  %tmp.531 = getelementptr %String* %tmp.529, i32 0, i32 0
  %tmp.532 = load %struct.String_vtable** %tmp.531
  %tmp.533 = getelementptr %struct.String_vtable* %tmp.532, i32 0, i32 9
  %tmp.534 = load %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)** %tmp.533
  %tmp.536 = bitcast %String* %tmp.529 to %struct.String*
  %tmp.535 = call %struct.String* %tmp.534(%struct.String* %tmp.536, %struct.Int* %tmp.514, %struct.Int* %tmp.528)
  %tmp.537 = bitcast %struct.String* %tmp.535 to %String*
  %tmp.540 = getelementptr %String* null, i32 1
  %tmp.541 = ptrtoint %String* %tmp.540 to i32
  %tmp.542 = call i8* @malloc(i32 %tmp.541)
  %tmp.543 = icmp eq i8* null, %tmp.542
  br i1 %tmp.543, label %abort, label %malloc_normal28

malloc_normal28:                                  ; preds = %malloc_normal27
  %tmp.538 = bitcast i8* %tmp.542 to %String*
  %tmp.539 = alloca %String*
  store %String* %tmp.538, %String** %tmp.539
  %tmp.545 = load %String** %tmp.539
  %tmp.546 = getelementptr %String* %tmp.545, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.546
  %tmp.548 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.549 = getelementptr %String* %tmp.545, i32 0, i32 1
  store i8* %tmp.548, i8** %tmp.549
  %tmp.550 = getelementptr [2 x i8]* @.str12, i32 0, i32 0
  %tmp.551 = getelementptr %String* %tmp.545, i32 0, i32 1
  store i8* %tmp.550, i8** %tmp.551
  %tmp.554 = getelementptr %String* %tmp.537, i32 0, i32 1
  %tmp.555 = load i8** %tmp.554
  %tmp.556 = getelementptr %String* %tmp.545, i32 0, i32 1
  %tmp.557 = load i8** %tmp.556
  %tmp.553 = call i32 @strcmp(i8* %tmp.555, i8* %tmp.557)
  %tmp.552 = icmp eq i32 %tmp.553, 0
  br i1 %tmp.552, label %then21, label %else21

then21:                                           ; preds = %malloc_normal28
  %tmp.561 = getelementptr %Int* null, i32 1
  %tmp.562 = ptrtoint %Int* %tmp.561 to i32
  %tmp.563 = call i8* @malloc(i32 %tmp.562)
  %tmp.564 = icmp eq i8* null, %tmp.563
  br i1 %tmp.564, label %abort, label %malloc_normal29

malloc_normal29:                                  ; preds = %then21
  %tmp.559 = bitcast i8* %tmp.563 to %Int*
  %tmp.560 = alloca %Int*
  store %Int* %tmp.559, %Int** %tmp.560
  %tmp.566 = load %Int** %tmp.560
  %tmp.567 = getelementptr %Int* %tmp.566, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.567
  %tmp.569 = getelementptr %Int* %tmp.566, i32 0, i32 1
  store i32 0, i32* %tmp.569
  %tmp.570 = getelementptr %Int* %tmp.566, i32 0, i32 1
  store i32 1, i32* %tmp.570
  %tmp.571 = bitcast %Int* %tmp.566 to %struct.Int*
  %tmp.572 = load %String** %tmp.486
  %tmp.574 = getelementptr %String* %tmp.572, i32 0, i32 0
  %tmp.575 = load %struct.String_vtable** %tmp.574
  %tmp.576 = getelementptr %struct.String_vtable* %tmp.575, i32 0, i32 7
  %tmp.577 = load %struct.Int* (%struct.String*)** %tmp.576
  %tmp.579 = bitcast %String* %tmp.572 to %struct.String*
  %tmp.578 = call %struct.Int* %tmp.577(%struct.String* %tmp.579)
  %tmp.582 = bitcast %struct.Int* %tmp.578 to %Int*
  %tmp.581 = getelementptr %Int* %tmp.582, i32 0, i32 1
  %tmp.580 = load i32* %tmp.581
  %tmp.583 = sub i32 %tmp.580, 1
  %tmp.587 = getelementptr %Int* null, i32 1
  %tmp.588 = ptrtoint %Int* %tmp.587 to i32
  %tmp.589 = call i8* @malloc(i32 %tmp.588)
  %tmp.590 = icmp eq i8* null, %tmp.589
  br i1 %tmp.590, label %abort, label %malloc_normal30

malloc_normal30:                                  ; preds = %malloc_normal29
  %tmp.585 = bitcast i8* %tmp.589 to %Int*
  %tmp.586 = alloca %Int*
  store %Int* %tmp.585, %Int** %tmp.586
  %tmp.592 = load %Int** %tmp.586
  %tmp.593 = getelementptr %Int* %tmp.592, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.593
  %tmp.595 = getelementptr %Int* %tmp.592, i32 0, i32 1
  store i32 0, i32* %tmp.595
  %tmp.596 = getelementptr %Int* %tmp.592, i32 0, i32 1
  store i32 %tmp.583, i32* %tmp.596
  %tmp.597 = bitcast %Int* %tmp.592 to %struct.Int*
  %tmp.598 = load %String** %tmp.486
  %tmp.600 = getelementptr %String* %tmp.598, i32 0, i32 0
  %tmp.601 = load %struct.String_vtable** %tmp.600
  %tmp.602 = getelementptr %struct.String_vtable* %tmp.601, i32 0, i32 9
  %tmp.603 = load %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)** %tmp.602
  %tmp.605 = bitcast %String* %tmp.598 to %struct.String*
  %tmp.604 = call %struct.String* %tmp.603(%struct.String* %tmp.605, %struct.Int* %tmp.571, %struct.Int* %tmp.597)
  %tmp.606 = bitcast %struct.String* %tmp.604 to %String*
  %tmp.607 = load %A2I** %tmp.485
  %tmp.608 = icmp eq %A2I* null, %tmp.607
  br i1 %tmp.608, label %abort, label %normal31

normal31:                                         ; preds = %malloc_normal30
  %tmp.609 = getelementptr %A2I* %tmp.607, i32 0, i32 0
  %tmp.610 = load %struct.A2I_vtable** %tmp.609
  %tmp.611 = getelementptr %struct.A2I_vtable* %tmp.610, i32 0, i32 10
  %tmp.612 = load i32 (%A2I*, %String*)** %tmp.611
  %tmp.613 = call i32 %tmp.612(%A2I* %tmp.607, %String* %tmp.606)
  %tmp.614 = mul i32 %tmp.613, -1
  store i32 %tmp.614, i32* %tmp.500
  br label %after21

else21:                                           ; preds = %malloc_normal28
  %tmp.615 = alloca i32
  %tmp.619 = getelementptr %Int* null, i32 1
  %tmp.620 = ptrtoint %Int* %tmp.619 to i32
  %tmp.621 = call i8* @malloc(i32 %tmp.620)
  %tmp.622 = icmp eq i8* null, %tmp.621
  br i1 %tmp.622, label %abort, label %malloc_normal32

malloc_normal32:                                  ; preds = %else21
  %tmp.617 = bitcast i8* %tmp.621 to %Int*
  %tmp.618 = alloca %Int*
  store %Int* %tmp.617, %Int** %tmp.618
  %tmp.624 = load %Int** %tmp.618
  %tmp.625 = getelementptr %Int* %tmp.624, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.625
  %tmp.627 = getelementptr %Int* %tmp.624, i32 0, i32 1
  store i32 0, i32* %tmp.627
  %tmp.628 = getelementptr %Int* %tmp.624, i32 0, i32 1
  store i32 0, i32* %tmp.628
  %tmp.629 = bitcast %Int* %tmp.624 to %struct.Int*
  %tmp.633 = getelementptr %Int* null, i32 1
  %tmp.634 = ptrtoint %Int* %tmp.633 to i32
  %tmp.635 = call i8* @malloc(i32 %tmp.634)
  %tmp.636 = icmp eq i8* null, %tmp.635
  br i1 %tmp.636, label %abort, label %malloc_normal33

malloc_normal33:                                  ; preds = %malloc_normal32
  %tmp.631 = bitcast i8* %tmp.635 to %Int*
  %tmp.632 = alloca %Int*
  store %Int* %tmp.631, %Int** %tmp.632
  %tmp.638 = load %Int** %tmp.632
  %tmp.639 = getelementptr %Int* %tmp.638, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.639
  %tmp.641 = getelementptr %Int* %tmp.638, i32 0, i32 1
  store i32 0, i32* %tmp.641
  %tmp.642 = getelementptr %Int* %tmp.638, i32 0, i32 1
  store i32 1, i32* %tmp.642
  %tmp.643 = bitcast %Int* %tmp.638 to %struct.Int*
  %tmp.644 = load %String** %tmp.486
  %tmp.646 = getelementptr %String* %tmp.644, i32 0, i32 0
  %tmp.647 = load %struct.String_vtable** %tmp.646
  %tmp.648 = getelementptr %struct.String_vtable* %tmp.647, i32 0, i32 9
  %tmp.649 = load %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)** %tmp.648
  %tmp.651 = bitcast %String* %tmp.644 to %struct.String*
  %tmp.650 = call %struct.String* %tmp.649(%struct.String* %tmp.651, %struct.Int* %tmp.629, %struct.Int* %tmp.643)
  %tmp.652 = bitcast %struct.String* %tmp.650 to %String*
  %tmp.655 = getelementptr %String* null, i32 1
  %tmp.656 = ptrtoint %String* %tmp.655 to i32
  %tmp.657 = call i8* @malloc(i32 %tmp.656)
  %tmp.658 = icmp eq i8* null, %tmp.657
  br i1 %tmp.658, label %abort, label %malloc_normal34

malloc_normal34:                                  ; preds = %malloc_normal33
  %tmp.653 = bitcast i8* %tmp.657 to %String*
  %tmp.654 = alloca %String*
  store %String* %tmp.653, %String** %tmp.654
  %tmp.660 = load %String** %tmp.654
  %tmp.661 = getelementptr %String* %tmp.660, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.661
  %tmp.663 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.664 = getelementptr %String* %tmp.660, i32 0, i32 1
  store i8* %tmp.663, i8** %tmp.664
  %tmp.665 = getelementptr [2 x i8]* @.str13, i32 0, i32 0
  %tmp.666 = getelementptr %String* %tmp.660, i32 0, i32 1
  store i8* %tmp.665, i8** %tmp.666
  %tmp.669 = getelementptr %String* %tmp.652, i32 0, i32 1
  %tmp.670 = load i8** %tmp.669
  %tmp.671 = getelementptr %String* %tmp.660, i32 0, i32 1
  %tmp.672 = load i8** %tmp.671
  %tmp.668 = call i32 @strcmp(i8* %tmp.670, i8* %tmp.672)
  %tmp.667 = icmp eq i32 %tmp.668, 0
  br i1 %tmp.667, label %then22, label %else22

then22:                                           ; preds = %malloc_normal34
  %tmp.676 = getelementptr %Int* null, i32 1
  %tmp.677 = ptrtoint %Int* %tmp.676 to i32
  %tmp.678 = call i8* @malloc(i32 %tmp.677)
  %tmp.679 = icmp eq i8* null, %tmp.678
  br i1 %tmp.679, label %abort, label %malloc_normal35

malloc_normal35:                                  ; preds = %then22
  %tmp.674 = bitcast i8* %tmp.678 to %Int*
  %tmp.675 = alloca %Int*
  store %Int* %tmp.674, %Int** %tmp.675
  %tmp.681 = load %Int** %tmp.675
  %tmp.682 = getelementptr %Int* %tmp.681, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.682
  %tmp.684 = getelementptr %Int* %tmp.681, i32 0, i32 1
  store i32 0, i32* %tmp.684
  %tmp.685 = getelementptr %Int* %tmp.681, i32 0, i32 1
  store i32 1, i32* %tmp.685
  %tmp.686 = bitcast %Int* %tmp.681 to %struct.Int*
  %tmp.687 = load %String** %tmp.486
  %tmp.689 = getelementptr %String* %tmp.687, i32 0, i32 0
  %tmp.690 = load %struct.String_vtable** %tmp.689
  %tmp.691 = getelementptr %struct.String_vtable* %tmp.690, i32 0, i32 7
  %tmp.692 = load %struct.Int* (%struct.String*)** %tmp.691
  %tmp.694 = bitcast %String* %tmp.687 to %struct.String*
  %tmp.693 = call %struct.Int* %tmp.692(%struct.String* %tmp.694)
  %tmp.697 = bitcast %struct.Int* %tmp.693 to %Int*
  %tmp.696 = getelementptr %Int* %tmp.697, i32 0, i32 1
  %tmp.695 = load i32* %tmp.696
  %tmp.698 = sub i32 %tmp.695, 1
  %tmp.702 = getelementptr %Int* null, i32 1
  %tmp.703 = ptrtoint %Int* %tmp.702 to i32
  %tmp.704 = call i8* @malloc(i32 %tmp.703)
  %tmp.705 = icmp eq i8* null, %tmp.704
  br i1 %tmp.705, label %abort, label %malloc_normal36

malloc_normal36:                                  ; preds = %malloc_normal35
  %tmp.700 = bitcast i8* %tmp.704 to %Int*
  %tmp.701 = alloca %Int*
  store %Int* %tmp.700, %Int** %tmp.701
  %tmp.707 = load %Int** %tmp.701
  %tmp.708 = getelementptr %Int* %tmp.707, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.708
  %tmp.710 = getelementptr %Int* %tmp.707, i32 0, i32 1
  store i32 0, i32* %tmp.710
  %tmp.711 = getelementptr %Int* %tmp.707, i32 0, i32 1
  store i32 %tmp.698, i32* %tmp.711
  %tmp.712 = bitcast %Int* %tmp.707 to %struct.Int*
  %tmp.713 = load %String** %tmp.486
  %tmp.715 = getelementptr %String* %tmp.713, i32 0, i32 0
  %tmp.716 = load %struct.String_vtable** %tmp.715
  %tmp.717 = getelementptr %struct.String_vtable* %tmp.716, i32 0, i32 9
  %tmp.718 = load %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)** %tmp.717
  %tmp.720 = bitcast %String* %tmp.713 to %struct.String*
  %tmp.719 = call %struct.String* %tmp.718(%struct.String* %tmp.720, %struct.Int* %tmp.686, %struct.Int* %tmp.712)
  %tmp.721 = bitcast %struct.String* %tmp.719 to %String*
  %tmp.722 = load %A2I** %tmp.485
  %tmp.723 = icmp eq %A2I* null, %tmp.722
  br i1 %tmp.723, label %abort, label %normal37

normal37:                                         ; preds = %malloc_normal36
  %tmp.724 = getelementptr %A2I* %tmp.722, i32 0, i32 0
  %tmp.725 = load %struct.A2I_vtable** %tmp.724
  %tmp.726 = getelementptr %struct.A2I_vtable* %tmp.725, i32 0, i32 10
  %tmp.727 = load i32 (%A2I*, %String*)** %tmp.726
  %tmp.728 = call i32 %tmp.727(%A2I* %tmp.722, %String* %tmp.721)
  store i32 %tmp.728, i32* %tmp.615
  br label %after22

else22:                                           ; preds = %malloc_normal34
  %tmp.729 = load %String** %tmp.486
  %tmp.730 = load %A2I** %tmp.485
  %tmp.731 = icmp eq %A2I* null, %tmp.730
  br i1 %tmp.731, label %abort, label %normal38

normal38:                                         ; preds = %else22
  %tmp.732 = getelementptr %A2I* %tmp.730, i32 0, i32 0
  %tmp.733 = load %struct.A2I_vtable** %tmp.732
  %tmp.734 = getelementptr %struct.A2I_vtable* %tmp.733, i32 0, i32 10
  %tmp.735 = load i32 (%A2I*, %String*)** %tmp.734
  %tmp.736 = call i32 %tmp.735(%A2I* %tmp.730, %String* %tmp.729)
  store i32 %tmp.736, i32* %tmp.615
  br label %after22

after22:                                          ; preds = %normal38, %normal37
  %tmp.737 = load i32* %tmp.615
  store i32 %tmp.737, i32* %tmp.500
  br label %after21

after21:                                          ; preds = %after22, %normal31
  %tmp.738 = load i32* %tmp.500
  store i32 %tmp.738, i32* %tmp.487
  br label %after20

after20:                                          ; preds = %after21, %then20
  %tmp.739 = load i32* %tmp.487
  br label %UnifiedReturnBlock

abort:                                            ; preds = %else22, %malloc_normal36, %malloc_normal35, %then22, %malloc_normal33, %malloc_normal32, %else21, %malloc_normal30, %malloc_normal29, %then21, %malloc_normal27, %malloc_normal26, %else20
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %after20
  %UnifiedRetVal = phi i32 [ %tmp.739, %after20 ], [ -1, %abort ]
  ret i32 %UnifiedRetVal
}

define i32 @A2I_a2i_aux(%A2I* %self, %String* %s) {
entry:
  %tmp.741 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.741
  %tmp.742 = alloca %String*
  store %String* %s, %String** %tmp.742
  %tmp.743 = alloca i32
  store i32 0, i32* %tmp.743
  %tmp.744 = load %String** %tmp.742
  %tmp.746 = getelementptr %String* %tmp.744, i32 0, i32 0
  %tmp.747 = load %struct.String_vtable** %tmp.746
  %tmp.748 = getelementptr %struct.String_vtable* %tmp.747, i32 0, i32 7
  %tmp.749 = load %struct.Int* (%struct.String*)** %tmp.748
  %tmp.751 = bitcast %String* %tmp.744 to %struct.String*
  %tmp.750 = call %struct.Int* %tmp.749(%struct.String* %tmp.751)
  %tmp.754 = bitcast %struct.Int* %tmp.750 to %Int*
  %tmp.753 = getelementptr %Int* %tmp.754, i32 0, i32 1
  %tmp.752 = load i32* %tmp.753
  %tmp.755 = alloca i32
  store i32 %tmp.752, i32* %tmp.755
  %tmp.756 = alloca i32
  store i32 0, i32* %tmp.756
  br label %loop0

loop0:                                            ; preds = %normal41, %entry
  %tmp.757 = load i32* %tmp.756
  %tmp.758 = load i32* %tmp.755
  %tmp.759 = icmp slt i32 %tmp.757, %tmp.758
  br i1 %tmp.759, label %true0, label %false0

true0:                                            ; preds = %loop0
  %tmp.760 = load i32* %tmp.743
  %tmp.761 = mul i32 %tmp.760, 10
  %tmp.762 = load i32* %tmp.756
  %tmp.766 = getelementptr %Int* null, i32 1
  %tmp.767 = ptrtoint %Int* %tmp.766 to i32
  %tmp.768 = call i8* @malloc(i32 %tmp.767)
  %tmp.769 = icmp eq i8* null, %tmp.768
  br i1 %tmp.769, label %abort, label %malloc_normal39

malloc_normal39:                                  ; preds = %true0
  %tmp.764 = bitcast i8* %tmp.768 to %Int*
  %tmp.765 = alloca %Int*
  store %Int* %tmp.764, %Int** %tmp.765
  %tmp.771 = load %Int** %tmp.765
  %tmp.772 = getelementptr %Int* %tmp.771, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.772
  %tmp.774 = getelementptr %Int* %tmp.771, i32 0, i32 1
  store i32 0, i32* %tmp.774
  %tmp.775 = getelementptr %Int* %tmp.771, i32 0, i32 1
  store i32 %tmp.762, i32* %tmp.775
  %tmp.776 = bitcast %Int* %tmp.771 to %struct.Int*
  %tmp.780 = getelementptr %Int* null, i32 1
  %tmp.781 = ptrtoint %Int* %tmp.780 to i32
  %tmp.782 = call i8* @malloc(i32 %tmp.781)
  %tmp.783 = icmp eq i8* null, %tmp.782
  br i1 %tmp.783, label %abort, label %malloc_normal40

malloc_normal40:                                  ; preds = %malloc_normal39
  %tmp.778 = bitcast i8* %tmp.782 to %Int*
  %tmp.779 = alloca %Int*
  store %Int* %tmp.778, %Int** %tmp.779
  %tmp.785 = load %Int** %tmp.779
  %tmp.786 = getelementptr %Int* %tmp.785, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.786
  %tmp.788 = getelementptr %Int* %tmp.785, i32 0, i32 1
  store i32 0, i32* %tmp.788
  %tmp.789 = getelementptr %Int* %tmp.785, i32 0, i32 1
  store i32 1, i32* %tmp.789
  %tmp.790 = bitcast %Int* %tmp.785 to %struct.Int*
  %tmp.791 = load %String** %tmp.742
  %tmp.793 = getelementptr %String* %tmp.791, i32 0, i32 0
  %tmp.794 = load %struct.String_vtable** %tmp.793
  %tmp.795 = getelementptr %struct.String_vtable* %tmp.794, i32 0, i32 9
  %tmp.796 = load %struct.String* (%struct.String*, %struct.Int*, %struct.Int*)** %tmp.795
  %tmp.798 = bitcast %String* %tmp.791 to %struct.String*
  %tmp.797 = call %struct.String* %tmp.796(%struct.String* %tmp.798, %struct.Int* %tmp.776, %struct.Int* %tmp.790)
  %tmp.799 = bitcast %struct.String* %tmp.797 to %String*
  %tmp.800 = load %A2I** %tmp.741
  %tmp.801 = icmp eq %A2I* null, %tmp.800
  br i1 %tmp.801, label %abort, label %normal41

normal41:                                         ; preds = %malloc_normal40
  %tmp.802 = getelementptr %A2I* %tmp.800, i32 0, i32 0
  %tmp.803 = load %struct.A2I_vtable** %tmp.802
  %tmp.804 = getelementptr %struct.A2I_vtable* %tmp.803, i32 0, i32 7
  %tmp.805 = load i32 (%A2I*, %String*)** %tmp.804
  %tmp.806 = call i32 %tmp.805(%A2I* %tmp.800, %String* %tmp.799)
  %tmp.807 = add i32 %tmp.761, %tmp.806
  store i32 %tmp.807, i32* %tmp.743
  %tmp.808 = load i32* %tmp.756
  %tmp.809 = add i32 %tmp.808, 1
  store i32 %tmp.809, i32* %tmp.756
  br label %loop0

false0:                                           ; preds = %loop0
  %tmp.810 = alloca %Object*
  store %Object* null, %Object** %tmp.810
  %tmp.812 = load i32* %tmp.743
  br label %UnifiedReturnBlock

abort:                                            ; preds = %malloc_normal40, %malloc_normal39, %true0
  call void @abort()
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %abort, %false0
  %UnifiedRetVal = phi i32 [ %tmp.812, %false0 ], [ -1, %abort ]
  ret i32 %UnifiedRetVal
}

define %String* @A2I_i2a(%A2I* %self, i32 %i) {
entry:
  %tmp.814 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.814
  %tmp.815 = alloca i32
  store i32 %i, i32* %tmp.815
  %tmp.816 = alloca %String*
  %tmp.817 = load i32* %tmp.815
  %tmp.818 = icmp eq i32 %tmp.817, 0
  br i1 %tmp.818, label %then23, label %else23

then23:                                           ; preds = %entry
  %tmp.821 = getelementptr %String* null, i32 1
  %tmp.822 = ptrtoint %String* %tmp.821 to i32
  %tmp.823 = call i8* @malloc(i32 %tmp.822)
  %tmp.824 = icmp eq i8* null, %tmp.823
  br i1 %tmp.824, label %abort, label %malloc_normal42

malloc_normal42:                                  ; preds = %then23
  %tmp.819 = bitcast i8* %tmp.823 to %String*
  %tmp.820 = alloca %String*
  store %String* %tmp.819, %String** %tmp.820
  %tmp.826 = load %String** %tmp.820
  %tmp.827 = getelementptr %String* %tmp.826, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.827
  %tmp.829 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.830 = getelementptr %String* %tmp.826, i32 0, i32 1
  store i8* %tmp.829, i8** %tmp.830
  %tmp.831 = getelementptr [2 x i8]* @.str1, i32 0, i32 0
  %tmp.832 = getelementptr %String* %tmp.826, i32 0, i32 1
  store i8* %tmp.831, i8** %tmp.832
  store %String* %tmp.826, %String** %tmp.816
  br label %after23

else23:                                           ; preds = %entry
  %tmp.833 = alloca %String*
  %tmp.834 = load i32* %tmp.815
  %tmp.835 = icmp slt i32 0, %tmp.834
  br i1 %tmp.835, label %then24, label %else24

then24:                                           ; preds = %else23
  %tmp.836 = load i32* %tmp.815
  %tmp.837 = load %A2I** %tmp.814
  %tmp.838 = icmp eq %A2I* null, %tmp.837
  br i1 %tmp.838, label %abort, label %normal43

normal43:                                         ; preds = %then24
  %tmp.839 = getelementptr %A2I* %tmp.837, i32 0, i32 0
  %tmp.840 = load %struct.A2I_vtable** %tmp.839
  %tmp.841 = getelementptr %struct.A2I_vtable* %tmp.840, i32 0, i32 12
  %tmp.842 = load %String* (%A2I*, i32)** %tmp.841
  %tmp.843 = call %String* %tmp.842(%A2I* %tmp.837, i32 %tmp.836)
  store %String* %tmp.843, %String** %tmp.833
  br label %after24

else24:                                           ; preds = %else23
  %tmp.844 = load i32* %tmp.815
  %tmp.845 = mul i32 1, -1
  %tmp.846 = mul i32 %tmp.844, %tmp.845
  %tmp.847 = load %A2I** %tmp.814
  %tmp.848 = icmp eq %A2I* null, %tmp.847
  br i1 %tmp.848, label %abort, label %normal44

normal44:                                         ; preds = %else24
  %tmp.849 = getelementptr %A2I* %tmp.847, i32 0, i32 0
  %tmp.850 = load %struct.A2I_vtable** %tmp.849
  %tmp.851 = getelementptr %struct.A2I_vtable* %tmp.850, i32 0, i32 12
  %tmp.852 = load %String* (%A2I*, i32)** %tmp.851
  %tmp.853 = call %String* %tmp.852(%A2I* %tmp.847, i32 %tmp.846)
  %tmp.855 = bitcast %String* %tmp.853 to %struct.String*
  %tmp.858 = getelementptr %String* null, i32 1
  %tmp.859 = ptrtoint %String* %tmp.858 to i32
  %tmp.860 = call i8* @malloc(i32 %tmp.859)
  %tmp.861 = icmp eq i8* null, %tmp.860
  br i1 %tmp.861, label %abort, label %malloc_normal45

malloc_normal45:                                  ; preds = %normal44
  %tmp.856 = bitcast i8* %tmp.860 to %String*
  %tmp.857 = alloca %String*
  store %String* %tmp.856, %String** %tmp.857
  %tmp.863 = load %String** %tmp.857
  %tmp.864 = getelementptr %String* %tmp.863, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.864
  %tmp.866 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.867 = getelementptr %String* %tmp.863, i32 0, i32 1
  store i8* %tmp.866, i8** %tmp.867
  %tmp.868 = getelementptr [2 x i8]* @.str12, i32 0, i32 0
  %tmp.869 = getelementptr %String* %tmp.863, i32 0, i32 1
  store i8* %tmp.868, i8** %tmp.869
  %tmp.871 = getelementptr %String* %tmp.863, i32 0, i32 0
  %tmp.872 = load %struct.String_vtable** %tmp.871
  %tmp.873 = getelementptr %struct.String_vtable* %tmp.872, i32 0, i32 8
  %tmp.874 = load %struct.String* (%struct.String*, %struct.String*)** %tmp.873
  %tmp.876 = bitcast %String* %tmp.863 to %struct.String*
  %tmp.875 = call %struct.String* %tmp.874(%struct.String* %tmp.876, %struct.String* %tmp.855)
  %tmp.877 = bitcast %struct.String* %tmp.875 to %String*
  store %String* %tmp.877, %String** %tmp.833
  br label %after24

after24:                                          ; preds = %malloc_normal45, %normal43
  %tmp.878 = load %String** %tmp.833
  store %String* %tmp.878, %String** %tmp.816
  br label %after23

after23:                                          ; preds = %after24, %malloc_normal42
  %tmp.879 = load %String** %tmp.816
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal44, %else24, %then24, %then23
  call void @abort()
  %tmp.883 = getelementptr %Int* null, i32 1
  %tmp.884 = ptrtoint %Int* %tmp.883 to i32
  %tmp.885 = call i8* @malloc(i32 %tmp.884)
  %tmp.886 = icmp eq i8* null, %tmp.885
  br i1 %tmp.886, label %abort, label %malloc_normal46

malloc_normal46:                                  ; preds = %abort
  %tmp.881 = bitcast i8* %tmp.885 to %Int*
  %tmp.882 = alloca %Int*
  store %Int* %tmp.881, %Int** %tmp.882
  %tmp.888 = load %Int** %tmp.882
  %tmp.889 = getelementptr %Int* %tmp.888, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.889
  %tmp.891 = getelementptr %Int* %tmp.888, i32 0, i32 1
  store i32 0, i32* %tmp.891
  %tmp.892 = getelementptr %Int* %tmp.888, i32 0, i32 1
  store i32 -1, i32* %tmp.892
  %tmp.893 = bitcast %Int* %tmp.888 to %String*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal46, %after23
  %UnifiedRetVal = phi %String* [ %tmp.879, %after23 ], [ %tmp.893, %malloc_normal46 ]
  ret %String* %UnifiedRetVal
}

define %String* @A2I_i2a_aux(%A2I* %self, i32 %i) {
entry:
  %tmp.894 = alloca %A2I*
  store %A2I* %self, %A2I** %tmp.894
  %tmp.895 = alloca i32
  store i32 %i, i32* %tmp.895
  %tmp.896 = alloca %String*
  %tmp.897 = load i32* %tmp.895
  %tmp.898 = icmp eq i32 %tmp.897, 0
  br i1 %tmp.898, label %then25, label %else25

then25:                                           ; preds = %entry
  %tmp.901 = getelementptr %String* null, i32 1
  %tmp.902 = ptrtoint %String* %tmp.901 to i32
  %tmp.903 = call i8* @malloc(i32 %tmp.902)
  %tmp.904 = icmp eq i8* null, %tmp.903
  br i1 %tmp.904, label %abort, label %malloc_normal47

malloc_normal47:                                  ; preds = %then25
  %tmp.899 = bitcast i8* %tmp.903 to %String*
  %tmp.900 = alloca %String*
  store %String* %tmp.899, %String** %tmp.900
  %tmp.906 = load %String** %tmp.900
  %tmp.907 = getelementptr %String* %tmp.906, i32 0, i32 0
  store %struct.String_vtable* @struct.String_vtable_prototype, %struct.String_vtable** %tmp.907
  %tmp.909 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.910 = getelementptr %String* %tmp.906, i32 0, i32 1
  store i8* %tmp.909, i8** %tmp.910
  %tmp.911 = getelementptr [1 x i8]* @.str11, i32 0, i32 0
  %tmp.912 = getelementptr %String* %tmp.906, i32 0, i32 1
  store i8* %tmp.911, i8** %tmp.912
  store %String* %tmp.906, %String** %tmp.896
  br label %after25

else25:                                           ; preds = %entry
  %tmp.913 = load i32* %tmp.895
  %tmp.914 = icmp eq i32 10, 0
  br i1 %tmp.914, label %abort, label %div_ok1

div_ok1:                                          ; preds = %else25
  %tmp.915 = sdiv i32 %tmp.913, 10
  %tmp.916 = alloca i32
  store i32 %tmp.915, i32* %tmp.916
  %tmp.917 = load i32* %tmp.895
  %tmp.918 = load i32* %tmp.916
  %tmp.919 = mul i32 %tmp.918, 10
  %tmp.920 = sub i32 %tmp.917, %tmp.919
  %tmp.921 = load %A2I** %tmp.894
  %tmp.922 = icmp eq %A2I* null, %tmp.921
  br i1 %tmp.922, label %abort, label %normal48

normal48:                                         ; preds = %div_ok1
  %tmp.923 = getelementptr %A2I* %tmp.921, i32 0, i32 0
  %tmp.924 = load %struct.A2I_vtable** %tmp.923
  %tmp.925 = getelementptr %struct.A2I_vtable* %tmp.924, i32 0, i32 8
  %tmp.926 = load %String* (%A2I*, i32)** %tmp.925
  %tmp.927 = call %String* %tmp.926(%A2I* %tmp.921, i32 %tmp.920)
  %tmp.929 = bitcast %String* %tmp.927 to %struct.String*
  %tmp.930 = load i32* %tmp.916
  %tmp.931 = load %A2I** %tmp.894
  %tmp.932 = icmp eq %A2I* null, %tmp.931
  br i1 %tmp.932, label %abort, label %normal49

normal49:                                         ; preds = %normal48
  %tmp.933 = getelementptr %A2I* %tmp.931, i32 0, i32 0
  %tmp.934 = load %struct.A2I_vtable** %tmp.933
  %tmp.935 = getelementptr %struct.A2I_vtable* %tmp.934, i32 0, i32 12
  %tmp.936 = load %String* (%A2I*, i32)** %tmp.935
  %tmp.937 = call %String* %tmp.936(%A2I* %tmp.931, i32 %tmp.930)
  %tmp.939 = getelementptr %String* %tmp.937, i32 0, i32 0
  %tmp.940 = load %struct.String_vtable** %tmp.939
  %tmp.941 = getelementptr %struct.String_vtable* %tmp.940, i32 0, i32 8
  %tmp.942 = load %struct.String* (%struct.String*, %struct.String*)** %tmp.941
  %tmp.944 = bitcast %String* %tmp.937 to %struct.String*
  %tmp.943 = call %struct.String* %tmp.942(%struct.String* %tmp.944, %struct.String* %tmp.929)
  %tmp.945 = bitcast %struct.String* %tmp.943 to %String*
  store %String* %tmp.945, %String** %tmp.896
  br label %after25

after25:                                          ; preds = %normal49, %malloc_normal47
  %tmp.946 = load %String** %tmp.896
  br label %UnifiedReturnBlock

abort:                                            ; preds = %abort, %normal48, %div_ok1, %else25, %then25
  call void @abort()
  %tmp.950 = getelementptr %Int* null, i32 1
  %tmp.951 = ptrtoint %Int* %tmp.950 to i32
  %tmp.952 = call i8* @malloc(i32 %tmp.951)
  %tmp.953 = icmp eq i8* null, %tmp.952
  br i1 %tmp.953, label %abort, label %malloc_normal50

malloc_normal50:                                  ; preds = %abort
  %tmp.948 = bitcast i8* %tmp.952 to %Int*
  %tmp.949 = alloca %Int*
  store %Int* %tmp.948, %Int** %tmp.949
  %tmp.955 = load %Int** %tmp.949
  %tmp.956 = getelementptr %Int* %tmp.955, i32 0, i32 0
  store %struct.Int_vtable* @struct.Int_vtable_prototype, %struct.Int_vtable** %tmp.956
  %tmp.958 = getelementptr %Int* %tmp.955, i32 0, i32 1
  store i32 0, i32* %tmp.958
  %tmp.959 = getelementptr %Int* %tmp.955, i32 0, i32 1
  store i32 -1, i32* %tmp.959
  %tmp.960 = bitcast %Int* %tmp.955 to %String*
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %malloc_normal50, %after25
  %UnifiedRetVal = phi %String* [ %tmp.946, %after25 ], [ %tmp.960, %malloc_normal50 ]
  ret %String* %UnifiedRetVal
}
