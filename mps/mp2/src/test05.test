class A {
  -- implicit (self) dispatch without actuals
  foo () : Int { bar() };

  -- implicit (self) dispatch with actuals
  f () : Int { b(1, 2) };

  bar () : A { self };
};

class B inherits A {
  -- dynamic dispatch (& associativity)
  -- new expression
  foo () : Int { (new B).bar().foo() };

  -- static dispatch
  bar () : A { self@A.bar() };
};
