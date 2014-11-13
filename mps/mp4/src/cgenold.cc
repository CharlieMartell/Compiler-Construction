//**************************************************************
//
// Code generator SKELETON
//
// Read the comments carefully and add code to build an LLVM program
//**************************************************************

#define EXTERN
#include "cgen.h"
#include <string>
#include <sstream>
//#include "coolrt.h"

//
extern int cgen_debug;

////////////////////////////////////////////////////////////////////
//
// Symbols
//
// For convenience, a large number of symbols are predefined here.
// These symbols include the primitive type and method names, as well
// as fixed names used by the runtime system.  Feel free to add your
// own definitions as you see fit.
//
//////////////////////////////////////////////////////////////////////
EXTERN Symbol
// required classes
Object,
IO,
String,
Int,
Bool,
Main,

// class methods
cool_abort,
type_name,
cool_copy,
out_string,
out_int,
in_string,
in_int,
length,
concat,
substr,

// class members
val,

// special symbols
No_class, 	// symbol that can't be the name of any user-defined class
No_type, 	// If e : No_type, then no code is generated for e.
SELF_TYPE, 	// Special code is generated for new SELF_TYPE.
self, 	// self generates code differently than other references

// extras
arg,
arg2,
prim_string,
prim_int,
prim_bool;


//********************************************************
//
// PREDEFINED FUNCTIONS:
//
// The following functions are already coded, you should
// not need to modify them, although you may if necessary.
//
//********************************************************

//
// Initializing the predefined symbols.
//
static void initialize_constants(void){
	Object      = idtable.add_string("Object");
	IO          = idtable.add_string("IO");
	String      = idtable.add_string("String");
	Int         = idtable.add_string("Int");
	Bool        = idtable.add_string("Bool");
	Main        = idtable.add_string("Main");

	cool_abort  = idtable.add_string("abort");
	type_name   = idtable.add_string("type_name");
	cool_copy   = idtable.add_string("copy");
	out_string  = idtable.add_string("out_string");
	out_int     = idtable.add_string("out_int");
	in_string   = idtable.add_string("in_string");
	in_int      = idtable.add_string("in_int");
	length      = idtable.add_string("length");
	concat      = idtable.add_string("concat");
	substr      = idtable.add_string("substr");

	val         = idtable.add_string("val");

	No_class    = idtable.add_string("_no_class");
	No_type     = idtable.add_string("_no_type");
	SELF_TYPE   = idtable.add_string("SELF_TYPE");
	self        = idtable.add_string("self");

	arg         = idtable.add_string("arg");
	arg2        = idtable.add_string("arg2");
	prim_string	= idtable.add_string("sbyte*");
	prim_int	= idtable.add_string("int");
	prim_bool	= idtable.add_string("bool");
}

//*********************************************************
//
// Define method for code generation
//
// This is the method called by the compiler driver
// `cgtest.cc'. cgen takes an `ostream' to which the assembly will be
// emitted, and it passes this and the class list of the
// code generator tree to the constructor for `CgenClassTable'.
// That constructor performs all of the work of the code
// generator.
//
//*********************************************************
void program_class::cgen(ostream &os){
	initialize_constants();
	class_table = new CgenClassTable(classes,os);
}


// Create definitions for all String constants
void StrTable::code_string_table(ostream& s, CgenClassTable* ct){
	for (List<StringEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream& s, CgenClassTable* ct){
	for (List<IntEntry> *l = tbl; l; l = l->tl()) {
		l->hd()->code_def(s, ct);
	}
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP3
//
void CgenClassTable::setup_external_functions(){
	ValuePrinter vp;
	// setup function: external int strcmp(sbyte*, sbyte*)
	op_type i32_type(INT32), i8ptr_type(INT8_PTR), vararg_type(VAR_ARG);
	vector<op_type> strcmp_args;
	strcmp_args.push_back(i8ptr_type);
	strcmp_args.push_back(i8ptr_type);
	vp.declare(*ct_stream, i32_type, "strcmp", strcmp_args);

	// setup function: external int printf(sbyte*, ...)
	vector<op_type> printf_args;
	printf_args.push_back(i8ptr_type);
	printf_args.push_back(vararg_type);
	vp.declare(*ct_stream, i32_type, "printf", printf_args);

	// setup function: external void abort(void)
	op_type void_type(VOID);
	vector<op_type> abort_args;
	vp.declare(*ct_stream, void_type, "abort", abort_args);

	// setup function: external i8* malloc(i32)
	vector<op_type> malloc_args;
	malloc_args.push_back(i32_type);
	vp.declare(*ct_stream, i8ptr_type, "malloc", malloc_args);

#ifdef MP4
	//ADD CODE HERE
	//Setup external functions for built in object class functions

	op_type obj_ptr_type("Object*"), str_ptr_type("String*"), i1_type(INT1),
			io_ptr_type("IO*"), int_ptr_type("Int*"), bool_ptr_type("Bool*");
	// setup function: declare %Object* @Object_new()
	vector<op_type> obj_new_args;
	vp.declare(*ct_stream, obj_ptr_type, "Object_new", obj_new_args);

	// setup function: declare %Object* @Object_abort(%Object*)
	vector<op_type> obj_abort_args;
	obj_abort_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, obj_ptr_type, "Object_abort", obj_abort_args);

	// setup function: declare %String* @Object_type_name(%Object*)
	vector<op_type> obj_type_args;
	obj_type_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "Object_type_name", obj_type_args);

	// setup function: declare %Object* @Object_copy(%Object*)
	vector<op_type> obj_copy_args;
	obj_copy_args.push_back(obj_ptr_type);
	vp.declare(*ct_stream, obj_ptr_type, "Object_copy", obj_copy_args);

	// setup function: declare %IO* @IO_new()
	vector<op_type> io_new_args;
	vp.declare(*ct_stream, io_ptr_type, "IO_new", io_new_args);

	// setup function: declare %IO* @IO_out_string(%IO*, %String*)
	vector<op_type> io_out_string_args;
	io_out_string_args.push_back(io_ptr_type);
	io_out_string_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, io_ptr_type, "IO_out_string", io_out_string_args);

	// setup function: declare %IO* @IO_out_int(%IO*, i32)
	vector<op_type> io_out_int_args;
	io_out_int_args.push_back(io_ptr_type);
	io_out_int_args.push_back(i32_type);
	vp.declare(*ct_stream, io_ptr_type, "IO_out_int", io_out_int_args);

	// setup function: declare %String* @IO_in_string(%IO*)
	vector<op_type> io_in_string_args;
	io_in_string_args.push_back(io_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "IO_in_string", io_in_string_args);

	// setup function: declare i32 @IO_in_int(%IO*)
	vector<op_type> io_in_int_args;
	io_in_int_args.push_back(io_ptr_type);
	vp.declare(*ct_stream, i32_type, "IO_in_int", io_in_int_args);

	// setup function: declare %String* @String_new()
	vector<op_type> string_new_args;
	vp.declare(*ct_stream, str_ptr_type, "String_new", string_new_args);

	// setup function: declare i32 @String_length(%String*)
	vector<op_type> str_len_args;
	str_len_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, i32_type, "String_length", str_len_args);

	// setup function: declare %String* @String_concat(%String*, %String*)
	vector<op_type> str_concat_args;
	str_concat_args.push_back(str_ptr_type);
	str_concat_args.push_back(str_ptr_type);
	vp.declare(*ct_stream, str_ptr_type, "String_concat", str_concat_args);

	// setup function: declare %String* @String_substr(%String*, i32, i32)
	vector<op_type> str_substr_args;
	str_substr_args.push_back(str_ptr_type);
	str_substr_args.push_back(i32_type);
	str_substr_args.push_back(i32_type);
	vp.declare(*ct_stream, str_ptr_type, "String_substr", str_substr_args);

	// setup function: declare %Int* @Int_new()
	vector<op_type> int_new_args;
	vp.declare(*ct_stream, int_ptr_type, "Int_new", int_new_args);

	// setup function: declare void @Int_init(%Int*, i32)
	vector<op_type> int_init_args;
	int_init_args.push_back(int_ptr_type);
	int_init_args.push_back(i32_type);
	vp.declare(*ct_stream, void_type, "Int_init", int_init_args);

	// setup function: declare %Bool* @Bool_new()
	vector<op_type> bool_new_args;
	vp.declare(*ct_stream, bool_ptr_type, "Bool_new", bool_new_args);

	// setup function: declare void @Bool_init(%Bool*, i1)
	vector<op_type> bool_init_args;
	bool_init_args.push_back(bool_ptr_type);
	bool_init_args.push_back(i1_type);
	vp.declare(*ct_stream, void_type, "Int_init", bool_init_args);

#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes(){
	// The tree package uses these globals to annotate the classes built below.
	curr_lineno  = 0;
	Symbol filename = stringtable.add_string("<basic class>");

	//
	// A few special class names are installed in the lookup table but not
	// the class list.  Thus, these classes exist, but are not part of the
	// inheritance hierarchy.

	// No_class serves as the parent of Object and the other special classes.
	Class_ noclasscls = class_(No_class,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(noclasscls, CgenNode::Basic, this));
	delete noclasscls;

#ifdef MP4
	// SELF_TYPE is the self class; it cannot be redefined or inherited.
	Class_ selftypecls = class_(SELF_TYPE,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(selftypecls, CgenNode::Basic, this));
	delete selftypecls;
	//
	// Primitive types masquerading as classes.  This is done so we can
	// get the necessary Symbols for the innards of String, Int, and Bool
	//
	Class_ primstringcls = class_(prim_string,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primstringcls, CgenNode::Basic, this));
	delete primstringcls;
#endif
	Class_ primintcls = class_(prim_int,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primintcls, CgenNode::Basic, this));
	delete primintcls;
	Class_ primboolcls = class_(prim_bool,No_class,nil_Features(),filename);
	install_special_class(new CgenNode(primboolcls, CgenNode::Basic, this));
	delete primboolcls;
	//
	// The Object class has no parent class. Its methods are
	//        cool_abort() : Object    aborts the program
	//        type_name() : Str    returns a string representation of class name
	//        copy() : SELF_TYPE       returns a copy of the object
	//
	// There is no need for method bodies in the basic classes---these
	// are already built in to the runtime system.
	//
	Class_ objcls =
			class_(Object,
					No_class,
					append_Features(
							append_Features(
									single_Features(method(cool_abort, nil_Formals(),
											Object, no_expr())),
											single_Features(method(type_name, nil_Formals(),
													String, no_expr()))),
													single_Features(method(cool_copy, nil_Formals(),
															SELF_TYPE, no_expr()))),
															filename);
	install_class(new CgenNode(objcls, CgenNode::Basic, this));
	delete objcls;

	//
	// The Int class has no methods and only a single attribute, the
	// "val" for the integer.
	//
	Class_ intcls=
			class_(Int,
					Object,
					single_Features(attr(val, prim_int, no_expr())),
					filename);
	install_class(new CgenNode(intcls, CgenNode::Basic, this));
	delete intcls;

	//
	// Bool also has only the "val" slot.
	//
	Class_ boolcls=
			class_(Bool,
					Object,
					single_Features(attr(val, prim_bool, no_expr())),
					filename);
	install_class(new CgenNode(boolcls, CgenNode::Basic, this));
	delete boolcls;

#ifdef MP4
	//
	// The class String has a number of slots and operations:
	//       val                                  the string itself
	//       length() : Int                       length of the string
	//       concat(arg: Str) : Str               string concatenation
	//       substr(arg: Int, arg2: Int): Str     substring
	//
	Class_ stringcls =
			class_(String,
					Object,
					append_Features(
							append_Features(
									append_Features(
											single_Features(attr(val, prim_string, no_expr())),
											single_Features(method(length, nil_Formals(),
													Int, no_expr()))),
													single_Features(method(concat,
															single_Formals(formal(arg, String)),
															String,
															no_expr()))),
															single_Features(method(substr,
																	append_Formals(
																			single_Formals(formal(arg, Int)),
																			single_Formals(formal(arg2, Int))),
																			String,
																			no_expr()))),
																			filename);
	install_class(new CgenNode(stringcls, CgenNode::Basic, this));
	delete stringcls;
#endif

#ifdef MP4
	//
	// The IO class inherits from Object. Its methods are
	//        out_string(Str) : SELF_TYPE          writes a string to the output
	//        out_int(Int) : SELF_TYPE               "    an int    "  "     "
	//        in_string() : Str                    reads a string from the input
	//        in_int() : Int                         "   an int     "  "     "
	//
	Class_ iocls =
			class_(IO,
					Object,
					append_Features(
							append_Features(
									append_Features(
											single_Features(method(out_string,
													single_Formals(formal(arg, String)),
													SELF_TYPE, no_expr())),
													single_Features(method(out_int, single_Formals(formal(arg, Int)),
															SELF_TYPE, no_expr()))),
															single_Features(method(in_string, nil_Formals(), String,
																	no_expr()))),
																	single_Features(method(in_int, nil_Formals(), Int, no_expr()))),
																	filename);
	install_class(new CgenNode(iocls, CgenNode::Basic, this));
	delete iocls;
#endif
}

//
// install_classes enters a list of classes in the symbol table.
//
void CgenClassTable::install_classes(Classes cs){
	for (int i = cs->first(); cs->more(i); i = cs->next(i)) {
		install_class(new CgenNode(cs->nth(i),CgenNode::NotBasic,this));
	}
}

//
// Add this CgenNode to the class list and the lookup table
//
void CgenClassTable::install_class(CgenNode *nd){
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of classes
	// and the symbol table.
	nds = new List<CgenNode>(nd,nds);
	addid(name,nd);
}

//
// Add this CgenNode to the special class list and the lookup table
//
void CgenClassTable::install_special_class(CgenNode *nd){
	Symbol name = nd->get_name();

	if (probe(name))
		return;

	// The class name is legal, so add it to the list of special classes
	// and the symbol table.
	special_nds = new List<CgenNode>(nd, special_nds);
	addid(name,nd);
}

//
// CgenClassTable::build_inheritance_tree
//
void CgenClassTable::build_inheritance_tree(){
	for(List<CgenNode> *l = nds; l; l = l->tl())
		set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd){
	CgenNode *parent_node = probe(nd->get_parent());
	nd->set_parentnd(parent_node);
	parent_node->add_child(nd);
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root(){
	return probe(Object);
}

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP3 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP4

CgenNode* CgenClassTable::getMainmain(CgenNode* c){
	if (c && ! c->basic())
		return c;                       // Found it!

	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl()) {
		if (CgenNode* foundMain = this->getMainmain(child->hd()))
			return foundMain;           // Propagate it up the recursive calls
	}

	return 0;                           // Make the recursion continue
}

#endif

//-------------------------------------------------------------------
//
// END OF PREDEFINED FUNCTIONS
//
//-------------------------------------------------------------------


///////////////////////////////////////////////////////////////////////////////
//
// coding string, int, and boolean constants
//
// Cool has three kinds of constants: strings, ints, and booleans.
// This section defines code generation for each type.
//
// All string constants are listed in the global "stringtable" and have
// type stringEntry.  stringEntry methods are defined both for string
// constant definitions and references.
//
// All integer constants are listed in the global "inttable" and have
// type IntEntry.  IntEntry methods are defined for Int
// constant definitions and references.
//
// Since there are only two Bool values, there is no need for a table.
// The two booleans are represented by instances of the class BoolConst,
// which defines the definition and reference methods for Bools.
//
///////////////////////////////////////////////////////////////////////////////

//
// Create global definitions for constant Cool objects
//
void CgenClassTable::code_constants(){
#ifdef MP4

#endif
}

// generate code to define a global string constant
void StringEntry::code_def(ostream& s, CgenClassTable* ct)
{
#ifdef MP4
	// ADD CODE HERE
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream& s, CgenClassTable* ct){
	// Leave this method blank, since we are not going to use global
	// declarations for int constants.
}

//////////////////////////////////////////////////////////////////////////////
//
//  CgenClassTable methods
//
//////////////////////////////////////////////////////////////////////////////

//
// CgenClassTable constructor orchestrates all code generation
//
CgenClassTable::CgenClassTable(Classes classes, ostream& s)
: nds(0){
	if (cgen_debug) std::cerr << "Building CgenClassTable\n";
	ct_stream = &s;
	// Make sure we have a scope, both for classes and for constants
	enterscope();

	// Create an inheritance tree with one CgenNode per class.
	install_basic_classes();
	install_classes(classes);
	build_inheritance_tree();

	// First pass
	setup();

	// Second pass
	code_module();
	// Done with code generation: exit scopes
	exitscope();

}

CgenClassTable::~CgenClassTable()
{

}

// The code generation first pass.  Define these two functions to traverse
// the tree and setup each CgenNode
void CgenClassTable::setup()
{
	setup_external_functions();
	setup_classes(root(), 0);
}


void CgenClassTable::setup_classes(CgenNode *c, int depth)
{
	// MAY ADD CODE HERE
	// if you want to give classes more setup information

	c->setup(current_tag++, depth);
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
		setup_classes(child->hd(), depth + 1);

	c->set_max_child(current_tag-1);

	/*
	if (cgen_debug)
		std::cerr << "Class " << c->get_name() << " assigned tag "
			<< c->get_tag() << ", max child " << c->get_max_child()
			<< ", depth " << c->get_depth() << endl;
	 */
}


// The code generation second pass. Add code here to traverse the tree and
// emit code for each CgenNode
void CgenClassTable::code_module()
{
	code_constants();

#ifndef MP4
	// This must be after code_module() since that emits constants
	// needed by the code() method for expressions
	CgenNode* mainNode = getMainmain(root());
	mainNode->codeGenMainmain(*ct_stream);
#endif
	code_main();

#ifdef MP4
	code_classes(root());
#else
#endif
}


#ifdef MP4
void CgenClassTable::code_classes(CgenNode *c)
{

}
#endif



// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
	ValuePrinter vp(*ct_stream);
	//return value
	op_type i32_type(INT32);

	//argument for declare type
	vector<op_type> main_args_types;
	vector<operand> main_args;

	// Define a function main that has no parameters and returns an i32
	vp.define(i32_type, "main", main_args);

	// Define an entry basic block
	string mainString("entry");
	vp.begin_block(mainString);
	operand result = vp.call(main_args_types, i32_type, "Main_main", true, main_args);
	// Call Main_main(). This returns int for phase 1, Object for phase 2

#ifndef MP4
	// Get the address of the string "Main_main() returned %d\n" using
	vector<op_type> printf_args_types;
	vector<operand> printf_args;

	op_arr_type op_type_array2(INT8_PTR, strToPass.length()+1);
	global_value ptrString(op_type_array2, ".str", strConst);
	op_type i8_ptr(INT8_PTR);
	operand pointer = vp.getelementptr(ptrString, int_value(0), int_value(0), i8_ptr);
	// Call printf with the string address of "Main_main() returned %d\n"
	// and the return value of Main_main() as its arguments
	printf_args_types.push_back(i8_ptr);
	op_type varArg(VAR_ARG);
	printf_args_types.push_back(varArg);
	printf_args.push_back(pointer);
	printf_args.push_back(result);
	operand callprintf = vp.call(printf_args_types, i32_type, "printf", true, printf_args);
	// Insert return
	vp.ret(int_value(0));

#else
	// Phase 2
#endif
	vp.end_define();
}


///////////////////////////////////////////////////////////////////////
//
// CgenNode methods
//
///////////////////////////////////////////////////////////////////////

CgenNode::CgenNode(Class_ nd, Basicness bstatus, CgenClassTable *ct)
: class__class((const class__class &) *nd),
  parentnd(0),
  children(0),
  basic_status(bstatus),
  class_table(ct),
  tag(-1)
{
	// ADD CODE HERE
}

void CgenNode::add_child(CgenNode *n)
{
	children = new List<CgenNode>(n,children);
}

void CgenNode::set_parentnd(CgenNode *p)
{
	assert(parentnd == NULL);
	assert(p != NULL);
	parentnd = p;
}

//
// Class setup.  You may need to add parameters to this function so that
// the classtable can provide setup information (such as the class tag
// that should be used by this class).
//
// Things that setup should do:
//  - layout the features of the class
//  - create the types for the class and its vtable
//  - create global definitions used by the class such as the class vtable
//
void CgenNode::add_attr_type(string type, string id){
	this->attr_types.push_back(type);
	this->attr_types.push_back(id);
}
void CgenNode::setup(int tag, int depth){
#ifdef MP4
	just_checking = false;
	//this->method_op_types.clear();
	op_type i32_type(INT32), i1_type(INT1), i8_ptr_type(INT8_PTR);
	std::string name_type(name->get_string());
	name_type = name_type + "* () ";
	op_type cool_type(name_type, 1);
	//push back the types common to all vtables
	this->method_op_types.push_back(i32_type);
	this->method_op_types.push_back(i32_type);
	this->method_op_types.push_back(i8_ptr_type);
	this->method_op_types.push_back(cool_type);
	//Make new environment
	CgenEnvironment* env = new CgenEnvironment(*(get_classtable()->ct_stream), this);
	//Make new ValuePrinter
	ValuePrinter vp(*(env->cur_stream));

	string strToPass(name->get_string());
	op_arr_type op_type_array(INT8, strToPass.length()+1);
	const_value strConst(op_type_array, strToPass, true);
	vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);


	op_type obj_vtable_type(std::string(name->get_string()) + "_vtable", 1);
	vector<op_type> type_def_vec;
	type_def_vec.push_back(obj_vtable_type);
	layout_features();
	for(size_t i = 0; i < this->attr_ret_types.size(); i++){
		type_def_vec.push_back(this->attr_ret_types.at(i));
		//std::cerr << " iterations: " << i << " types: " << this->attr_ret_types.at(i).get_name() << "\n";
	}
	vp.type_define(name->get_string(), type_def_vec);

//	if(this->name->get_string() != "Object"){
//		std::string func_decl_str;
//		if(std::string(return_type->get_string()) != std::string("SELF_TYPE"))
//			func_decl_str = return_type->get_string();
//		else
//			func_decl_str = cls->get_type_name();
//		func_decl_str = func_decl_str + "* (";
//		func_decl_str = func_decl_str + class_param.get_name();
//		func_decl_str = func_decl_str + "*) ";
//		op_type to_push(func_decl_str, 1);
//		cls->method_op_types.push_back(to_push);
//	}
	handle_inheritance();
	vp.type_define(std::string(name->get_string()) + "_vtable", this->method_op_types);

	//vtable prototypes:
//	for(size_t i = 0; i < this->assign_vals.size(); i++){
//		std::cerr << "Name: " << this->assign_vals.at(i).get_name() <<"  " << i<< endl;
//	}
	op_type proto_const_op(std::string(std::string(name->get_string()) + std::string("_vtable")));
	global_value prototype_glbl(proto_const_op, std::string(name->get_string()) + std::string("_vtable_prototype"));
	vp.init_struct_constant(prototype_glbl, this->method_op_types, this->assign_vals);


#endif
}
void CgenNode::handle_inheritance(){
#ifdef MP4
	if(get_parentnd()->get_type_name() != "_no_class"){
		CgenNode* parent_node = get_parentnd();
		for(size_t i = 0; i < parent_node->class_ret_types.size(); i++){
			op_type class_param(parent_node->get_type_name());
			std::string func_decl_str;
			if(std::string(parent_node->class_ret_types.at(i)) != std::string("SELF_TYPE"))
					func_decl_str = parent_node->class_ret_types.at(i);
				else
					func_decl_str = this->get_type_name();
				func_decl_str = func_decl_str + "* (";
				func_decl_str = func_decl_str + class_param.get_name();
				func_decl_str = func_decl_str + "*) ";
				op_type to_push(func_decl_str, 1);
				this->method_op_types.push_back(to_push);
		}
	}
#endif
}
//void CgenNode::setup(int tag, int depth){
//#ifdef MP4
//	op_type i32_type(INT32), i1_type(INT1), i8_ptr_type(INT8_PTR);
//	op_type obj_empty_ptr_type("Object* () ", 1), obj_prototype("Object_vtable"),
//			obj_obj_ptr_type("Object* (%Object*) ", 1), str_obj_ptr_type("String* (%Object*) ", 1),
//			int_empty_ptr_type("Int* () ", 1), int_int_ptr_type("Int* (%Int*) ", 1),
//			str_int_ptr_type("String* (%Int*) ", 1), obj_int_ptr_type("Object* (%Int*) ", 1),
//			bool_empty_ptr_type("Bool* () ", 1), bool_bool_ptr_type("Bool* (%Bool*) ", 1),
//			str_bool_ptr_type("String* (%Bool*) ", 1), obj_bool_ptr_type("Object* (%Bool*) ", 1),
//			str_empty_ptr_type("String* () ", 1), str_str_ptr_type("String* (%String*) ", 1),
//			int_str_ptr_type("i32 (%String*) *"), obj_str_ptr_type("Object* (%String*) ", 1),
//			str_param_str_str_ptr_type("String* (%String*,%String*) ", 1),
//			str_param_str_int_int_ptr_type("String* (%String*,i32,i32) ", 1);
//	//Make new environment
//	CgenEnvironment* env = new CgenEnvironment(*(get_classtable()->ct_stream), this);
//	//Make new ValuePrinter
//	ValuePrinter vp(*(env->cur_stream));
//	layout_features();
//	vector<op_type> first_type;
//	op_type new_type(std::string(name->get_string()) + "_vtable", 1);
//	first_type.push_back(new_type);
//	if(std::string(name->get_string()) == std::string("Object")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
//
////		%Object = type {
////			%Object_vtable*
////		}
//		vp.type_define(name->get_string(), first_type);
//
////		%Object_vtable = type {
////			i32,
////			i32,
////			i8*,
////			%Object* () *,
////			%Object* (%Object*) *,
////			%String* (%Object*) *,
////			%Object* (%Object*) *
////		}
//		vector<op_type> object_vtable_types;
//		object_vtable_types.push_back(i32_type);
//		object_vtable_types.push_back(i32_type);
//		object_vtable_types.push_back(i8_ptr_type);
//		object_vtable_types.push_back(obj_empty_ptr_type);
//		object_vtable_types.push_back(obj_obj_ptr_type);
//		object_vtable_types.push_back(str_obj_ptr_type);
//		object_vtable_types.push_back(obj_obj_ptr_type);
//		vp.type_define(std::string(name->get_string()) + "_vtable", object_vtable_types);
//
////		@Object_vtable_prototype = constant %Object_vtable {
////			i32 0,
////			i32 ptrtoint (%Object* getelementptr (%Object* null, i32 1) to i32),
////			i8* getelementptr ([7 x i8]* @str.Object, i32 0, i32 0),
////			%Object* () * @Object_new,
////			%Object* (%Object*) * @Object_abort,
////			%String* (%Object*) * @Object_type_name,
////			%Object* (%Object*) * @Object_copy
////		}
//
//		vector<const_value> init_values;
////		string obj_const_str("Object_vtable");
////		op_arr_type object_init_type(INT8, obj_const_str.length()+1);
////		const_value obj_init_const(object_init_type, obj_const_str, false);
////		init_values.push_back(obj_init_const);
//		const_value first_const(i32_type, "", false);
//		init_values.push_back(first_const);
//		operand obj_op(obj_prototype, "Object_vtable_prototype");
//		vp.init_struct_constant(obj_op, object_vtable_types, init_values);
//
//
//
//	}
//	else if(std::string(name->get_string()) == std::string("Int")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
////		%Int = type {
////			%Int_vtable*,
////			i32
////		}
//
//		first_type.push_back(INT32);
//		vp.type_define(name->get_string(), first_type);
//
////		%Int_vtable = type {
////			i32,
////			i32,
////			i8*,
////			%Int* () *,
////			%Object* (%Int*) *,
////			%String* (%Int*) *,
////			%Int* (%Int*) *
////		}
//		vector<op_type> int_vtable_types;
//		int_vtable_types.push_back(i32_type);
//		int_vtable_types.push_back(i32_type);
//		int_vtable_types.push_back(i8_ptr_type);
//		int_vtable_types.push_back(int_empty_ptr_type);
//		int_vtable_types.push_back(obj_int_ptr_type);
//		int_vtable_types.push_back(str_int_ptr_type);
//		int_vtable_types.push_back(int_int_ptr_type);
//		vp.type_define(std::string(name->get_string()) + "_vtable", int_vtable_types);
//
//	}
//	else if(std::string(name->get_string()) == std::string("Bool")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
//
////		%Bool = type {
////			%Bool_vtable*,
////			i1
////		}
//		first_type.push_back(INT1);
//		vp.type_define(name->get_string(), first_type);
//
////		%Bool_vtable = type {
////			i32,
////			i32,
////			i8*,
////			%Bool* () *,
////			%Object* (%Bool*) *,
////			%String* (%Bool*) *,
////			%Bool* (%Bool*) *
////		}
//		vector<op_type> bool_vtable_types;
//		bool_vtable_types.push_back(i32_type);
//		bool_vtable_types.push_back(i32_type);
//		bool_vtable_types.push_back(i8_ptr_type);
//		bool_vtable_types.push_back(bool_empty_ptr_type);
//		bool_vtable_types.push_back(obj_bool_ptr_type);
//		bool_vtable_types.push_back(str_bool_ptr_type);
//		bool_vtable_types.push_back(bool_bool_ptr_type);
//		vp.type_define(std::string(name->get_string()) + "_vtable", bool_vtable_types);
//
//	}
//	else if(std::string(name->get_string()) == std::string("String")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
//
////		%String = type {
////			%String_vtable*,
////			i8*
////		}
//		first_type.push_back(INT8_PTR);
//		vp.type_define(name->get_string(), first_type);
//
////		%String_vtable = type {
////			i32,
////			i32,
////			i8*,
////			%String* () *,
////			%Object* (%String*) *,
////			%String* (%String*) *,
////			%String* (%String*) *,
////			i32 (%String*) *,
////			%String* (%String*,%String*) *,
////			%String* (%String*,i32,i32) *
////		}
//		vector<op_type> string_vtable_types;
//		string_vtable_types.push_back(i32_type);
//		string_vtable_types.push_back(i32_type);
//		string_vtable_types.push_back(i8_ptr_type);
//		string_vtable_types.push_back(str_empty_ptr_type);
//		string_vtable_types.push_back(obj_str_ptr_type);
//		string_vtable_types.push_back(str_str_ptr_type);
//		string_vtable_types.push_back(str_str_ptr_type);
//		string_vtable_types.push_back(int_str_ptr_type);
//		string_vtable_types.push_back(str_param_str_str_ptr_type);
//		string_vtable_types.push_back(str_param_str_int_int_ptr_type);
//		vp.type_define(std::string(name->get_string()) + "_vtable", string_vtable_types);
//	}
//	else if(std::string(name->get_string()) == std::string("IO")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
//
////		%IO = type {
////			%IO_vtable*
////		}
//		vp.type_define(name->get_string(), first_type);
//
//	}
//	else if(std::string(name->get_string()) == std::string("Main")){
//		//@str.Object = internal constant [7 x i8] c"Object\00"
//		string strToPass(name->get_string());
//		op_arr_type op_type_array(INT8, strToPass.length()+1);
//		const_value strConst(op_type_array, strToPass, true);
//		vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);
//
//		vp.type_define(name->get_string(), first_type);
//
//	}
//
//
//#endif
//}

#ifdef MP4
//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class(){
	// No code generation for basic classes. The runtime will handle that.
	if (basic())
		return;
}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features(){
	int i = features->first();
	while(features->more(i)){
		features->nth(i)->layout_feature(this);
		i = features->next(i);
	}
}
#else

//
// code-gen function main() in class Main
//
void CgenNode::codeGenMainmain(std::ostream &o)
{
	ValuePrinter vp(o);
	// In Phase 1, this can only be class Main.  Get method_class for main().
	assert(std::string(this->name->get_string()) == std::string("Main"));
	method_class* mainMethod = (method_class*) features->nth(features->first());

	// ADD CODE HERE TO GENERATE THE FUNCTION int Mainmain().
	// Generally what you need to do are:
	// -- setup or create the environment, env, for translating this method
	// -- invoke mainMethod->code(env) to translate the method

	CgenEnvironment *newEnv = new CgenEnvironment(o, this);
	vector<operand> main_args;
	op_type i32_type(INT32);
	vp.define(i32_type, "Main_main", main_args);
	vp.begin_block("entry");
	mainMethod->code(newEnv);
	vp.end_define();
}

#endif

//
// CgenEnvironment functions
//

//
// Class CgenEnvironment should be constructed by a class prior to code
// generation for each method.  You may need to add parameters to this
// constructor.
//
CgenEnvironment::CgenEnvironment(std::ostream &o, CgenNode *c)
{
	cur_class = c;
	cur_stream = &o;
	var_table.enterscope();
	tmp_count = 0;
	block_count = ok_count = -1;
}

// Look up a CgenNode given a symbol
CgenNode *CgenEnvironment::type_to_class(Symbol t) {
	return t == SELF_TYPE ? get_class()
			: get_class()->get_classtable()->lookup(t);
}

// Provided CgenEnvironment methods
// Generate unique string names
std::string CgenEnvironment::new_name() {
	std::stringstream s;
	s << tmp_count++;
	return "tmp." + s.str();
}

std::string CgenEnvironment::new_ok_label() {
	std::stringstream s;
	s << ok_count;
	return "ok." + s.str();
}
const std::string CgenEnvironment::new_label(const std::string& prefix,
		bool increment) {
	std::string suffix = itos(block_count);
	block_count += increment;
	return prefix + suffix;
}

void CgenEnvironment::add_local(Symbol name, operand &vb) {
	var_table.enterscope();
	var_table.addid(name, &vb);
}
void CgenEnvironment::cc_add_symbol(Symbol name, operand &vb) {
	var_table.addid(name, &vb);
}

void CgenEnvironment::kill_local() {
	var_table.exitscope();
}


////////////////////////////////////////////////////////////////////////////
//
// APS class methods
//
////////////////////////////////////////////////////////////////////////////

//******************************************************************
//
//   Fill in the following methods to produce code for the
//   appropriate expression.  You may add or remove parameters
//   as you wish, but if you do, remember to change the parameters
//   of the declarations in `cool-tree.handcode.h'.
//
//*****************************************************************

// conform - If necessary, emit a bitcast or boxing/unboxing operations
// to convert an object to a new type. This can assume the object
// is known to be (dynamically) compatible with the target type.
// It should only be called when this condition holds.
// (It's needed by the supplied code for typecase)
operand conform(operand src, op_type type, CgenEnvironment *env) {
	// ADD CODE HERE
	return operand();
}

// Retrieve the class tag from an object record.
// src is the object we need the tag from.
// src_class is the CgenNode for the *static* class of the expression.
// You need to look up and return the class tag for it's dynamic value
operand get_class_tag(operand src, CgenNode *src_cls, CgenEnvironment *env) {
	// ADD CODE HERE
	return operand();
}

string process_ret_type(string x){
	if(x == "Bool" || x == "bool")
		return "i1";
	else if(x == "Int" || x == "int")
		return "i32";
	else if(x == "String")
		return "i8*";
	else
		return  x + "*";
}
//
// Create a method body
//
void method_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "method\n";
	//Return before abort so you dont end up aborting
	vp.ret(expr->code(env));
	//Setup the abort call at the end of each method
	vp.begin_block("abort");
	vector<op_type> abort_args_types;
	vector<operand> abort_args;
	operand ab_call = vp.call(abort_args_types, VOID, "abort", true, abort_args);
	vp.unreachable();
}

//
// Codegen for expressions.  Note that each expression has a value.
//

operand assign_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "assign\n";
	//Get the operand from the var table
	operand assign_operand = *(env->var_table.lookup(name));
	operand expr_operand = expr->code(env);
	//Store the new value into the var table
	vp.store(*(env->cur_stream), expr_operand, assign_operand);
	return expr_operand;
}

operand cond_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "cond\n";
	ValuePrinter vp(*(env->cur_stream));
	operand second_reg;
	string result1, result2, result3;
	//This is somewhat "hacky" in order to keep track of the type
	//for what I need to alloc for I evaluate the code and move the
	//stream buffer back (but angrave 241 professor would be pleased).
	std::fpos<std::char_traits<char>::state_type> pos = env->cur_stream->tellp();
	operand get_type_op = then_exp->code(env);
	env->cur_stream->seekp(pos);
	second_reg = vp.alloca_mem(get_type_op.get_type());
	//I was getting errors with the default count in env so implemented new
	env->block_count++;
	result1 = env->new_label("end.", false);
	result2 = env->new_label("true.", false);
	result3 = env->new_label("false.", false);
	//based on pred->code(env) go to either true or false block
	vp.branch_cond(*(env->cur_stream), pred->code(env), result2/*true*/, result3/*false*/);
	//true
	vp.begin_block(result2);
	operand then_op = then_exp->code(env);
	vp.store(*(env->cur_stream), then_op, second_reg);
	vp.branch_uncond(*(env->cur_stream), result1);
	//false
	vp.begin_block(result3);
	operand else_op = else_exp->code(env);
	vp.store(*(env->cur_stream), else_op, second_reg);
	vp.branch_uncond(*(env->cur_stream), result1);
	//end
	vp.begin_block(result1);
	operand final_ret_op = vp.load(second_reg);
	return final_ret_op;

}

operand loop_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "loop\n";
	ValuePrinter vp(*(env->cur_stream));
	string result1, result2, result3;
	//Needed new block counter
	env->block_count++;
	//create new labels
	result1 = env->new_label("loop.", false);
	result2 = env->new_label("true.", false);
	result3 = env->new_label("false.", false);
	//branch unconditionally to the evaluation part
	vp.branch_uncond(*(env->cur_stream), result1);
	vp.begin_block(result1);
	operand pred_op = pred->code(env);
	vp.branch_cond(*(env->cur_stream), pred_op, result2, result3);
	vp.begin_block(result2);
	///evaluate body of the loop
	operand ret_op = body->code(env);
	//go back in loop
	vp.branch_uncond(*(env->cur_stream), result1);
	vp.begin_block(result3);
	return ret_op;

}

operand block_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "block\n";
	int i = body->first();
	operand complete_block;
	//loop through the blocks untill more(i)
	while(body->more(i)){
		complete_block = body->nth(i)->code(env);
		i = body->next(i);
	}
	//return the last code evaluation in the block
	return complete_block;
}

operand let_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "let\n";
	op_type type = INT32;
	string tempString(type_decl->get_string());
	//compare the typedecl to bool and int to know how much mem to alloc
	if(tempString.compare("Bool") == 0){
		type = INT1;}
	else if(tempString.compare("Int") == 0){
		type = INT32;}
	//assign the init code to new operand
	operand new_op = init->code(env);
	//create temp fot the identier
	string iden_temp(identifier->get_string());
	operand identifier_op(type, iden_temp);
	//allocate memory for the type assigned
	operand new_var = vp.alloca_mem(type);
	//add what we just allocated memory for into the var table.
	env->add_local(identifier, new_var);

	//check if the <- expr is empty if not evaluate if it is store
	//default values of false and 0 for bool and int respectively into
	//the value.
	if(!(new_op.get_type().get_id() == EMPTY))
		vp.store(*(env->cur_stream), new_op, new_var);
	else{
		string val;
		if(type.get_id() == INT1)
			val = "false";
		else if(type.get_id() == INT32)
			val = "0";
		vp.store(*(env->cur_stream), const_value(type, val, true), new_var);
	}
	//return the body->code(env)
	return body->code(env);
}

operand plus_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "plus\n";
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//Simple to run the addition based on properties of ast
	operand plus_op = vp.add(e1_code, e2_code);
	return plus_op;
}

operand sub_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "sub\n";
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//Simple to run the subtration based on properties of ast
	operand sub_op = vp.sub(e1_code, e2_code);
	return sub_op;
}

operand mul_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "mul\n";
	ValuePrinter vp(*(env->cur_stream));
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//Simple to run the multiplication based on properties of ast
	operand mul_op = vp.mul(e1_code, e2_code);
	return mul_op;
}

operand divide_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "div\n";
	ValuePrinter vp(*(env->cur_stream));
	env->ok_count++;
	string ok_label_new = env->new_ok_label();
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//if what you are dividing by is 0 go to abort because you
	//cannot divide by 0
	operand eq_op = vp.icmp(EQ, e2_code, int_value(0));
	vp.branch_cond(eq_op, "abort", ok_label_new);

	//if it is not 0 just run divide method.
	vp.begin_block(ok_label_new);
	operand div_op = vp.div(e1_code, e2_code);

	return div_op;
}

operand neg_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "neg\n";
	operand e1_code = e1->code(env);
	//Negate the value by subtracting it from 0
	operand negated = vp.sub(int_value(0), e1_code);
	return negated;
}

operand lt_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "lt\n";
	ValuePrinter vp(*(env->cur_stream));
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//compare the value using icmp
	operand lt_op = vp.icmp(LT, e1_code, e2_code);
	return lt_op;
}

operand eq_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "eq\n";
	ValuePrinter vp(*(env->cur_stream));
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//check if the two values are eq using icmp
	operand eq_op = vp.icmp(EQ, e1_code, e2_code);
	return eq_op;
}

operand leq_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "leq\n";
	ValuePrinter vp(*(env->cur_stream));
	operand e1_code = e1->code(env);
	operand e2_code = e2->code(env);
	//check if the first value is <= the second
	operand leq_op = vp.icmp(LE, e1_code, e2_code);
	return leq_op;
}

operand comp_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "complement\n";
	ValuePrinter vp(*(env->cur_stream));
	operand e1_code = e1->code(env);
	// xor with true to give the opposite value ie: true->false
	operand comp_op = vp.xor_in(e1_code, bool_value(true, true));
	return comp_op;
}
//INITIALIZE CONSTANTS
operand int_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "Integer Constant\n";
	int_value int_const(atoi(token->get_string()));
	return int_const;
}

operand bool_const_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "bool Constant\n";
	bool_value bool_const(val, false);
	return bool_const;
}

operand object_class::code(CgenEnvironment *env)
{
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "Object\n";
	operand *ret_op;
	ret_op = env->lookup(name);
	return vp.load(*ret_op);

}

operand no_expr_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "No_expr\n";
	operand nothing;
	return nothing;
}

//*****************************************************************
// The next few functions are for node types not supported in Phase 1
// but these functions must be defined because they are declared as
// methods via the Expression_SHARED_EXTRAS hack.
//*****************************************************************

operand static_dispatch_class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "static dispatch\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return nothing" WITH SOMETHING
	// MORE MEANINGFUL
#endif
	return nothing;
}

operand string_const_class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "string_const\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return nothing" WITH SOMETHING
	// MORE MEANINGFUL
#endif
	return nothing;
}

operand dispatch_class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "dispatch\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return nothing" WITH SOMETHING
	// MORE MEANINGFUL
#endif
	return nothing;
}

operand typcase_class::code(CgenEnvironment *env) {
	if (cgen_debug)
		std::cerr << "typecase::code()\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	ValuePrinter vp;
	ostream *o = env->cur_stream;
	CgenClassTable *ct = env->get_class()->get_classtable();

	string header_label = env->new_label("case.hdr.", false);
	string exit_label = env->new_label("case.exit.", false);
	operand code_val = expr->code(env);
	operand expr_val = code_val;
	string code_val_t = code_val.get_typename();
	op_type join_type = env->type_to_class(type)->get_type_name();
	CgenNode *cls = env->type_to_class(expr->get_type());
	// Check for case on void
	if ((code_val_t != string("%Int*")) && (code_val_t != string("%Bool*"))) {
		op_type bool_type(INT1), empty_type;
		null_value null_op(code_val.get_type());
		operand icmp_result(bool_type, env->new_name());
		vp.icmp(*o, EQ, code_val, null_op, icmp_result);
		string ok_label = env->new_ok_label();
		vp.branch_cond(*o, icmp_result, "abort", ok_label);
		*o << "\n" << ok_label << ":\n";
	}
	operand tag = get_class_tag(expr_val, cls, env);
	vp.branch_uncond(*o, header_label);
	string prev_label = header_label;
	*o << "\n" << header_label << ":\n";
	branch_class *b = (branch_class *)cases->nth(cases->first());
	string case_result_type = b->get_expr()->get_type()->get_string();
	if (case_result_type == "SELF_TYPE")
		case_result_type = env->get_class()->get_type_name();
	op_type alloca_type(case_result_type, 1);
	operand alloca_final(alloca_type, env->new_name());
	env->branch_operand = alloca_final;
	vp.alloca_mem(*o, alloca_type, alloca_final);
	std::vector<operand> values;
	std::vector<string> labels;
	env->next_label = exit_label;
	bool done;
	for (int i=ct->get_num_classes()-1; i >= 0; --i) {
		for (int j=cases->first(); cases->more(j); j = cases->next(j)) {
			if (i == ct->lookup(cases->nth(j)->get_type_decl())->get_tag()) {
				done = i;
				string prefix = string("case.") + itos(i) + ".";
				string case_label = env->new_label(prefix, false);
				vp.branch_uncond(*o, case_label);
				*o << "\n" << case_label << ":\n";
				operand val = cases->nth(j)->code(expr_val, tag, join_type, env);
				values.push_back(val);
			}
		}
	}
	vp.branch_uncond(*o, "abort");
	env->new_label("", true);
	*o << "\n" << exit_label << ":\n";
	operand final_result(alloca_type, env->new_name());
	alloca_final.set_type(alloca_final.get_type().get_ptr_type());
	vp.load(*o, alloca_final, final_result);
	alloca_final.set_type(alloca_final.get_type().get_deref_type());

	if (cgen_debug)
		cerr << "Done typcase::code()\n";
	return final_result;
#endif
}

operand new__class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "newClass\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return nothing" WITH SOMETHING
	// MORE MEANINGFUL
#endif
	return nothing;;
}

operand isvoid_class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "isvoid\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	// ADD CODE HERE AND REPLACE "return nothing" WITH SOMETHING
	// MORE MEANINGFUL
#endif
	return nothing;;
}

// Create the LLVM Function corresponding to this method.
void method_class::layout_feature(CgenNode *cls){
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
//	cls->ft_name = name->get_string();
//	cls->ft_return_type = return_type->get_string();
//	cls->ft_type = cls->get_type_name();
//	cls->ft_type_decl = "";
	//std::cerr << "ZZZZ ft name: " << cls->ft_name << "  ft ret type:  " << cls->ft_return_type << "  ft_type:   " << cls->ft_type << endl;
//	for(int x = formals->first(); formals->more(x); x = formals->next(x)){
//		cls->formal_types.push_back(formals->nth(x)->get_type_decl());
//		cls->formal_names.push_back(formals->nth(x)->get_name());
//	}
//	if(cls->just_checking == true)
//			return;
//	CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
//	std::cerr << "Class: " << cls->get_type_name() << "  Name:  " << name->get_string() << "  Ret type:  "<< return_type->get_string() <<endl;
//	op_type class_param(cls->get_type_name());
//	if(cls->get_parentnd()->get_type_name() != "_no_class"){
//		vector<op_type> inherited(cls->get_parentnd_op_types(cls, class_param));
//		for(size_t i = 0; i < inherited.size() -1; i++)
//			cls->method_op_types.push_back(inherited.at(i));
//	}
//	else{
//		std::string func_decl_str;
//		if(std::string(return_type->get_string()) != std::string("SELF_TYPE"))
//			func_decl_str = return_type->get_string();
//		else
//			func_decl_str = cls->get_type_name();
//		func_decl_str = func_decl_str + "* (";
//		func_decl_str = func_decl_str + class_param.get_name();
//		func_decl_str = func_decl_str + "*) ";
//		op_type to_push(func_decl_str, 1);
//		cls->method_op_types.push_back(to_push);
//	}
	for(int x = formals->first(); formals->more(x); x = formals->next(x)){
		op_type class_ret_type;
		if(std::string(this->formals->nth(x)->get_type_decl()->get_string()) == std::string("Int")
			|| std::string(this->formals->nth(x)->get_type_decl()->get_string()) == std::string("int"))
				class_ret_type= INT32;
			else if(std::string(this->formals->nth(x)->get_type_decl()->get_string()) == std::string("Bool")
			|| std::string(this->formals->nth(x)->get_type_decl()->get_string()) == std::string("bool"))
				class_ret_type = INT1;
			else if(std::string(this->formals->nth(x)->get_type_decl()->get_string()) == std::string("sbyte*"))
				class_ret_type = INT8_PTR;
			else
				class_ret_type = op_type(this->formals->nth(x)->get_name()->get_string());
		cls->formal_types.push_back(class_ret_type);
		cls->formal_names.push_back(class_ret_type);
	}
	CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
//	operand x = expr->code(env);
//	cls->assign_vals.push_back(x);

	cls->class_ret_types.push_back(return_type->get_string());

	op_type class_param(cls->get_type_name());
	std::string func_decl_str = cls->get_type_name();
	if(std::string(return_type->get_string()) != std::string("SELF_TYPE"))
		func_decl_str = return_type->get_string();

	func_decl_str = func_decl_str + " (";
	if(cls->formal_types.size() < 2)
		func_decl_str = func_decl_str + class_param.get_name();
	else{
		for(size_t i = 0; i < cls->formal_types.size(); i++){
			if(i == (cls->formal_types.size() - 1))
				func_decl_str = func_decl_str + cls->formal_types.at(i).get_name();
			else
				func_decl_str = func_decl_str + cls->formal_types.at(i).get_name() + ",";
		}
	}
	func_decl_str = func_decl_str + "*) ";
	op_type to_push(func_decl_str, 1);
	cls->method_op_types.push_back(to_push);

#endif
}


//vector<op_type> CgenNode::get_parentnd_op_types(CgenNode *cls, op_type opt){
//	vector<op_type> temp_vec;
//	vector<op_type> temper_vec;
////	std::cerr << "im is:  " << cls->get_type_name() << endl;
////	std::cerr << "my parent is:  " << cls->get_parentnd()->get_type_name() << endl;
//	just_checking = true;
//	if(cls->get_parentnd()->get_type_name() != "_no_class"){
//		for(int x = cls->get_parentnd()->features->first(); cls->get_parentnd()->features->more(x); x = cls->get_parentnd()->features->next(x))
//		{
//			features->nth(x)->layout_feature(cls->get_parentnd());
//			if(CgenNode::ft_return_type != "" || CgenNode::ft_type_decl != "" || CgenNode::ft_name != ""){
//				std::cerr << "parent class  "<< cls->get_parentnd()->get_type_name() << "   current class:  "<< cls->get_type_name() << "  Properties of parents features: \n"<<" ft name: "
//						<< CgenNode::ft_name << "  ft ret type:  " << CgenNode::ft_return_type << "  ft_type_decl   " << CgenNode::ft_type_decl <<"  ft_type:   "
//						<< CgenNode::ft_type << "\n";
////				for(size_t i = 0; i < CgenNode::formal_types.size() -1; i++){
////					std::cerr << "  formal type: " << CgenNode::formal_types.at(i);
////				}
//				std::string func_decl_str;
//				if(CgenNode::ft_return_type != "")
//				{
//					if(std::string(CgenNode::ft_return_type) != std::string("SELF_TYPE"))
//						func_decl_str = CgenNode::ft_return_type;
//					else
//						func_decl_str = cls->get_type_name();
//				}
//				else
//				{
//					if(std::string(CgenNode::ft_type_decl) != std::string("SELF_TYPE"))
//						if(CgenNode::ft_type_decl == "sbyte*")
//						{
//							op_type int_ptr_type("Int", 1);
//							func_decl_str = int_ptr_type.get_name();
//						}
//						else
//							func_decl_str = CgenNode::ft_type_decl;
//					else
//						func_decl_str = cls->get_type_name();
//				}
//				func_decl_str = func_decl_str + "* (";
//				func_decl_str = func_decl_str + opt.get_name();
//				func_decl_str = func_decl_str + "*) ";
//				op_type to_push(func_decl_str, 1);
//				std::cerr << "adding:  " << to_push.get_name() << "\n";
//				temp_vec.push_back(to_push);
//				CgenNode::ft_name = "";
//				CgenNode::ft_type_decl = "";
//				CgenNode::ft_type = "";
//				CgenNode::ft_return_type = "";
//			}
//
//		}
//		just_checking = false;
//		return temp_vec;
//	}
//}


// If the source tag is >= the branch tag and <= (max child of the branch class) tag,
// then the branch is a superclass of the source
operand branch_class::code(operand expr_val, operand tag,
		op_type join_type, CgenEnvironment *env) {
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	operand empty;
	ostream *o = env->cur_stream;
	ValuePrinter vp(*o);
	if  (cgen_debug)
		cerr << "In branch_class::code()\n";

	CgenNode *cls = env->get_class()->get_classtable()->lookup(type_decl);
	int my_tag = cls->get_tag();
	int max_child = cls->get_max_child();

	// Generate unique labels for branching into >= branch tag and <= max child
	string sg_label = env->new_label(string("src_gte_br") + "." + itos(my_tag) + ".", false);
	string sl_label = env->new_label(string("src_lte_mc") + "." + itos(my_tag) + ".", false);
	string exit_label = env->new_label(string("br_exit") + "." + itos(my_tag) + ".", false);

	op_type bool_type(INT1);
	int_value my_tag_val(my_tag);
	op_type old_tag_t(tag.get_type()), i32_t(INT32);
	tag.set_type(i32_t);

	// Compare the source tag to the class tag
	operand icmp_result = vp.icmp(LT, tag, my_tag_val);
	vp.branch_cond(icmp_result, exit_label, sg_label);
	*o << "\n" << sg_label << ":\n";
	int_value max_child_val(max_child);

	// Compare the source tag to max child
	operand icmp2_result = vp.icmp(GT, tag, max_child_val);
	vp.branch_cond(icmp2_result, exit_label, sl_label);
	*o << "\n" << sl_label << ":\n";
	tag.set_type(old_tag_t);

	// Handle casts of *arbitrary* types to Int or Bool.  We need to:
	// (a) cast expr_val to boxed type (struct Int* or struct Bool*)
	// (b) unwrap value field from the boxed type
	// At run-time, if source object is not Int or Bool, this will never
	// be invoked (assuming no bugs in the type checker).
	if (cls->get_type_name() == "Int" || cls->get_type_name() == "Bool") {
		op_type lbl_t(cls->get_type_name(), 1);
		expr_val = conform(expr_val, lbl_t, env);
	}
	op_type alloc_type(cls->get_type_name(), 1);
	operand alloc_op = vp.alloca_mem(alloc_type);
	operand conf_result = conform(expr_val, alloc_type,  env);
	vp.store(conf_result, alloc_op);
	env->add_local(name, alloc_op);
	operand val = conform(expr->code(env), join_type.get_ptr_type(), env);
	operand conformed = conform(val, env->branch_operand.get_type(), env);
	env->branch_operand.set_type(env->branch_operand.get_type().get_ptr_type());
	vp.store(conformed, env->branch_operand);
	env->branch_operand.set_type(env->branch_operand.get_type().get_deref_type());
	env->kill_local();
	vp.branch_uncond(env->next_label);
	*o << "\n" << exit_label << ":\n";
	if (cgen_debug)
		cerr << "Done branch_class::code()\n";
	return conformed;
#endif
}

// Assign this attribute a slot in the class structure
void attr_class::layout_feature(CgenNode *cls)
{
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	//std::cerr << "Class: " << cls->get_type_name() << "  Name:  " << name->get_string() << "  type decl:  "<< type_decl->get_string() <<endl;
//	cls->ft_name = name->get_string();
//	cls->ft_type_decl = type_decl->get_string();
//	cls->ft_type = cls->get_type_name();
//	cls->ft_return_type = "";
//	if(cls->just_checking == true)
//			return;
//	if(std::string(type_decl->get_string()) == std::string("Int")
//	|| std::string(type_decl->get_string()) == std::string("int")){
//		op_type class_ret_type(INT32);
//		cls->class_ret_types.push_back(class_ret_type);
//	}
//	else if(std::string(type_decl->get_string()) == std::string("Bool")
//	|| std::string(type_decl->get_string()) == std::string("bool")){
//		op_type class_ret_type(INT1);
//		cls->class_ret_types.push_back(class_ret_type);
//	}
//	else if(std::string(type_decl->get_string()) == std::string("sbyte*")){
//			op_type class_ret_type(INT8_PTR);
//			cls->class_ret_types.push_back(class_ret_type);
//		}
//	else{
//		op_type class_ret_type(type_decl->get_string());
//		cls->class_ret_types.push_back(class_ret_type);
//	}
//	if(cls->get_parentnd()->get_type_name() != "_no_class"){
//		return;
//	}
//	else{
//		op_type class_param(cls->get_type_name());
//		std::string func_decl_str;
//		if(std::string(type_decl->get_string()) != std::string("SELF_TYPE"))
//			func_decl_str = type_decl->get_string();
//		else
//			func_decl_str = cls->get_type_name();
//		func_decl_str = func_decl_str + "* (";
//		func_decl_str = func_decl_str + class_param.get_name();
//		func_decl_str = func_decl_str + "*) ";
//		op_type to_push(func_decl_str, 1);
//		cls->method_op_types.push_back(to_push);
//	}
//
	//NOTE: I do not use this yet
	cls->add_attr_type(process_ret_type(type->get_string()), name->get_string());

	CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
	if(std::string(type_decl->get_string()) == std::string("Int")
	|| std::string(type_decl->get_string()) == std::string("int")){
		op_type class_ret_type(INT32);
		cls->class_ret_types.push_back("Int*");
		cls->attr_ret_types.push_back(class_ret_type);
	}
	else if(std::string(type_decl->get_string()) == std::string("Bool")
	|| std::string(type_decl->get_string()) == std::string("bool")){
		op_type class_ret_type(INT1);
		cls->class_ret_types.push_back("Bool*");
		cls->attr_ret_types.push_back(class_ret_type);
	}
	else if(std::string(type_decl->get_string()) == std::string("sbyte*")){
		op_type class_ret_type(INT8_PTR);
		cls->class_ret_types.push_back("String*");
		cls->attr_ret_types.push_back(class_ret_type);
	}
	else{
		op_type class_ret_type(type_decl->get_string());
		cls->class_ret_types.push_back(type_decl->get_string());
		cls->attr_ret_types.push_back(class_ret_type);
	}

	operand x = init->code(env);
	const_value const_x(x.get_type(), x.get_name(), false);
	cls->assign_vals.push_back(const_x);

	op_type class_param(cls->get_type_name());
	std::string func_decl_str;
	if(std::string(type_decl->get_string()) != std::string("SELF_TYPE"))
		func_decl_str = process_ret_type(type_decl->get_string());
	else
		func_decl_str = cls->get_type_name();
	func_decl_str = func_decl_str + " (";
	func_decl_str = func_decl_str + class_param.get_name();
	func_decl_str = func_decl_str + "*) ";
	op_type to_push(func_decl_str, 1);
	cls->method_op_types.push_back(to_push);

#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else
	std::cerr <<  "this got called"<<endl;
#endif
}

