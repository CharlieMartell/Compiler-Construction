; ModuleID = '<stdin>'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"b = %ld\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %A = alloca [100 x i64], align 16
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i64 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i64 %i.0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [100 x i64]* %A, i32 0, i64 %i.0
  store i64 %i.0, i64* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i64 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [100 x i64]* %A, i32 0, i64 53
  %0 = load i64* %arrayidx2, align 8
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc9, %for.end
  %b.0 = phi i64 [ %0, %for.end ], [ %b.1, %for.inc9 ]
  %i.1 = phi i64 [ 0, %for.end ], [ %inc10, %for.inc9 ]
  %sum.0 = phi i64 [ 0, %for.end ], [ %add, %for.inc9 ]
  %cmp4 = icmp slt i64 %i.1, 100
  br i1 %cmp4, label %for.body5, label %for.end11

for.body5:                                        ; preds = %for.cond3
  %arrayidx6 = getelementptr inbounds [100 x i64]* %A, i32 0, i64 %i.1
  %1 = load i64* %arrayidx6, align 8
  %add = add nsw i64 %sum.0, %1
  %cmp7 = icmp slt i64 %add, %b.0
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %for.body5
  br label %if.end

if.else:                                          ; preds = %for.body5
  %mul8 = mul nsw i64 %b.0, %add
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %b.1 = phi i64 [ %b.0, %if.then ], [ %mul8, %if.else ]
  br label %for.inc9

for.inc9:                                         ; preds = %if.end
  %inc10 = add nsw i64 %i.1, 1
  br label %for.cond3

for.end11:                                        ; preds = %for.cond3
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i64 %b.0)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"}
