(*
   This file should be compiled together with atoi.cl.

   The Stack class implements the standard stack operations.
   For convenience, methods that perform multiple pops are also defined.
   A value of class Stack serves as the empty stack; non-empty
   stacks are built using the classes that inherit from Stack.

   The other methods are:
	show() : Display the stack.  Nothing to do for the empty stack.
	eval() : Evaluate the top of the stack.  Noop for the empty stack.
	doit() : Perform the operation on top of the stack.  A Noop
		 for the empty stack and for all other operations except
		 "e" and "d".
	setval()
        getval() : set and get the integer value on the top of the stack.
		 An error for all classes except the I class.

*)
class Stack inherits IO {

    rest : Stack;

    push(r : Stack) : Stack {
      {
	rest <- r;
	self;
      }
    };

    pop()  : Stack { rest };
    pop2() : Stack { pop().pop() };
    pop3() : Stack { pop().pop().pop() };

    show() : Stack { self };
    eval() : Stack { self };
    doit() : Stack { self };

    setval(i : Int) : Stack {
	{
	    out_string("No setval method for object on stack.\n");
	    abort();
	    self;
	}
    };

    getval() : Int {
	{
	    out_string("No getval method for object on stack.\n");
	    abort();
	    0;
	}
    };
};


(*
   The Stack class { inherited by several classes, one for each kind
   of entity that can appear on the stack.  Each of these classes
   overrides some of the methods of Stack with methods appropriate to
   that class.

   The I (integer) class holds an integer on the stack.  This { the only
   class with interesting setval and getval methods.
*)
class I inherits Stack {

    val : Int;

    setval(i : Int) : Stack { { val <- i; self; } };

    getval() : Int { val };

    show() : Stack {
	{
	    out_int(val);
            out_string("\n");
	    rest.show();
	    self;
	}
    };
};

(*
  The A class (for "add" or "+") defines the eval method to add the top
  two elements of the stack and push the result (which must be an I)
  back on the stack.
*)
class A inherits Stack {

    eval() : Stack {
     (new I).setval(pop().getval() + pop2().getval()).push(pop3())
    };

    show() : Stack {
	{
	   out_string("+\n");
	   rest.show();
	   self;
        }
    };
};


(*
  The S class (for "swap") defines the eval method to swap the top two
  elements of the stack.
*)
class S inherits Stack {

    eval() : Stack {
        let first : Stack <- pop() in (
           let second : Stack <- pop2() in (
		let rest : Stack <- pop3() in (
			second.push(first.push(rest))
		)))
    };

    show() : Stack {
        {
           out_string("s\n");
	   rest.show();
	   self;
        }
    };
};

(*
   The E class (for "evaluate") overrides the doit() method to cause evaluation
   of the item below "e" on the stack.
*)
class E inherits Stack {
    doit() : Stack { pop().eval() };
};

(*
    The D class (for "display") overrides the doit() method to print the stack
    below the "d".
*)
class D inherits Stack {
    doit() : Stack { pop().show() };
};


class Main inherits IO {

   stack : Stack <- new Stack;

(* Need a value of type A2I to use the methods in that class. *)
   dummy : A2I <- new A2I;

   s : String;

   prompt() : String {
	{
	    out_string(">");
	    in_string();
        }
   };

(*
   Repeatedly prompt for and read a command.  Push the command on the stack,
converting it to an integer if necessary.  Finally, invoke the doit() function
of the class on the top of the stack.
*)
   main() : Object {
     while not ((s <- prompt()) = "x")
      loop
	    stack <- if s = "+" then (new A) else
                     if s = "s" then (new S) else
                     if s = "d" then (new D) else
                     if s = "e" then (new E) else
                        (new I).setval(dummy.a2i(s))
	             fi fi fi fi
                     .push(stack).doit()
      pool
    };
};
