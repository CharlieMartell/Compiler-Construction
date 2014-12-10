; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.twoInt = type { i32, i32 }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [21 x i8] c"USAGE: licm a b c d\0A\00", align 1
@i2 = common global %struct.twoInt zeroinitializer, align 4
@.str1 = private unnamed_addr constant [22 x i8] c"%d %d %d %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %cmp = icmp slt i32 %argc, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %1 = load i8** %arrayidx, align 8
  %call1 = call i32 @atoi(i8* %1) #5
  %arrayidx2 = getelementptr inbounds i8** %argv, i64 2
  %2 = load i8** %arrayidx2, align 8
  %call3 = call i32 @atoi(i8* %2) #5
  %arrayidx4 = getelementptr inbounds i8** %argv, i64 3
  %3 = load i8** %arrayidx4, align 8
  %call5 = call i32 @atoi(i8* %3) #5
  %arrayidx6 = getelementptr inbounds i8** %argv, i64 4
  %4 = load i8** %arrayidx6, align 8
  %call7 = call i32 @atoi(i8* %4) #5
  store i32 %call1, i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 0), align 4
  store i32 %call3, i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 1), align 4
  %add15 = add nsw i32 %call3, %call5
  br label %for.cond

for.cond:                                         ; preds = %for.inc16, %if.end
  %d.0 = phi i32 [ %call7, %if.end ], [ %d.1, %for.inc16 ]
  %a.0 = phi i32 [ %call1, %if.end ], [ %a.1, %for.inc16 ]
  %x.0 = phi i32 [ undef, %if.end ], [ %x.1, %for.inc16 ]
  %j.0 = phi i32 [ 0, %if.end ], [ %inc17, %for.inc16 ]
  %cmp8 = icmp slt i32 %j.0, %call3
  br i1 %cmp8, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %call3, %j.0
  %mul12 = mul nsw i32 %call3, %j.0
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body
  %d.1 = phi i32 [ %d.0, %for.body ], [ %mul14, %for.inc ]
  %a.1 = phi i32 [ %a.0, %for.body ], [ %sub, %for.inc ]
  %x.1 = phi i32 [ %x.0, %for.body ], [ %add13, %for.inc ]
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp10 = icmp slt i32 %i.0, %call5
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %div = sdiv i32 %call5, %call3
  %add = add nsw i32 %div, %mul
  %5 = load i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 0), align 4
  %add13 = add nsw i32 %mul12, %5
  %mul14 = mul nsw i32 %add, %call5
  %sub = sub nsw i32 %add, %call5
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %inc = add nsw i32 %i.0, 1
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  store i32 %add15, i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 1), align 4
  br label %for.inc16

for.inc16:                                        ; preds = %for.end
  %inc17 = add nsw i32 %j.0, 1
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  %6 = load i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 0), align 4
  %7 = load i32* getelementptr inbounds (%struct.twoInt* @i2, i32 0, i32 1), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %a.0, i32 %call3, i32 %call5, i32 %d.0, i32 %x.0, i32 %6, i32 %7)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
