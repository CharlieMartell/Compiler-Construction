; ModuleID = '<stdin>'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64"
target triple = "i686-pc-linux-gnu"

define i32 @foo(i32 %x) {
entry:
  %tmp2 = add i32 %x, 10
  br label %return

return:                                           ; preds = %entry
  ret i32 %x
}
