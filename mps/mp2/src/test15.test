-- test of dispatch
class A { };

class B {
   g() : Int {
	case self of
		x : B => 1;
	esac
   };
};

class Main {
    f(x : Int) : B { { new A; new B; } };

    h() : Int { self@Main.f(3)@B.g() };

    main(): Int { 1 };
};
