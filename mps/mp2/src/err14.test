-- Invalid class followed by two valid classes followed by an invalid class
-- Parser should print and recover from the error in class A, parse classes
--   B and C successfully, and then print another error in class D
-- Parser can recover by synchronizing on next token "class"

class A {
  foo(z : Int,) : Int { 1 };
};

-- implicit inherited class: Object
class B { };

-- explicit inherited class
class C inherits B { };

-- wrong punctuation
class D {
  z . Int;
};
