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
#include<typeinfo>

#define SSTR( x ) dynamic_cast< std::ostringstream & >( \
        ( std::ostringstream() << std::dec << x ) ).str()
int count = 0;
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


//My Functions

string CgenNode::new_process_ret_type(string x){
	if(x == "Bool" || x == "bool")
		return "i1";
	else if(x == "Int" || x == "int")
		return "i32";
	else if(x == "String")
		return "i8*";
	return "%" + x + "*";
}

op_type CgenNode::process_ret_type(string x){
	if(x == "SELF_TYPE"){
		op_type temp(this->get_type_name());
		return temp;
	}
	else if(x == "Bool" || x == "bool")
		return INT1;
	else if(x == "Int" || x == "int")
		return INT32;
	else if(x == "String")
		return INT8_PTR;
	op_type temp(x + "*");
	return temp;
}

op_type CgenNode::process_ret_ptr_type(string x){
	if(x == "SELF_TYPE"){
		op_type temp(this->get_type_name());
		return temp;
	}
	else if(x == "Bool" || x == "bool")
		return INT1_PTR;
	else if(x == "Int" || x == "int")
		return INT32_PTR;
	else if(x == "String")
		return INT8_PPTR;
	op_type temp(x + "*");
	return temp;
}

op_type CgenNode::process_formal_type(string x){
	if(x == "SELF_TYPE"){
		op_type temp(this->get_type_name());
		return temp;
	}
	else if(x == "Bool" || x == "bool")
		return INT1;
	else if(x == "Int" || x == "int")
		return INT32;
	else if(x == "String")
		return INT8_PTR;
	op_type temp(x);
	return temp;
}

op_type CgenEnvironment::get_op_type(string x){
	if(x == "i32")
		return op_type(INT32);
	else if(x == "i1")
		return op_type(INT1);
	else if(x == "i8*")
		return op_type(INT8_PTR);
	return op_type(x.substr(1));
}

op_type method_type_gen(string x){
	if(x == "Bool" || x == "bool")
		return INT1;
	else if(x == "Int" || x == "int")
		return INT32;
	//not sure about string
	else if(x == "String")
		return INT8_PTR;
	op_type temp(x + "*");
	return temp;
}

void CgenNode::setup_ret_types(Symbol type_decl, CgenNode* cls){
	op_type i32_type(INT32), i1_type(INT1), i8_ptr_type(INT8_PTR);
	op_type new_type(std::string(type_decl->get_string()) + std::string("*"));
	if(std::string(type_decl->get_string()) != std::string("Object")
	&& std::string(type_decl->get_string()) != std::string("String")
	&& std::string(type_decl->get_string()) != std::string("IO")
	&& std::string(type_decl->get_string()) != std::string("Main")
	&& std::string(type_decl->get_string()) != std::string("SELF_TYPE")){
		if(std::string(type_decl->get_string()) == std::string("Int")
			|| std::string(type_decl->get_string()) == std::string("int"))
			cls->attr_only_ret_types.push_back(i32_type);
		else if(std::string(type_decl->get_string()) == std::string("Bool")
			|| std::string(type_decl->get_string()) == std::string("bool"))
			cls->attr_only_ret_types.push_back(i1_type);
		else if(std::string(type_decl->get_string()) == std::string("sbyte*"))
			cls->attr_only_ret_types.push_back(i8_ptr_type);
		else
			cls->attr_only_ret_types.push_back(new_type);
	}
}

string remove_class(string x){
	std::stringstream test(x);
	int begin_length;
	std::string segment;
	std::getline(test, segment, '_');
	begin_length = segment.length();
	return x.substr(begin_length+1);
}

void CgenEnvironment::remove_space(string& str)
{
    int len = str.length();
    int j = 0;

    for (int i = 0; i < len;)
    {
        if (str.at(i) == ' ')
        {
            i++;
            continue;
        }

        str.at(j++) = str.at(i++);
    }
    str.resize(j);
}

vector<op_type> CgenEnvironment::parse_args(string x){
//	%Main*(%Main*, i32 ) *
//	%Main*, i32
	vector<op_type> ret_vec;

	if(x.find('(', 0) == std::string::npos){
		ret_vec.push_back(op_type(x));
		return ret_vec;
	}
	std::stringstream test(x);

	std::string segment;
	std::getline(test, segment, '(');
	std::string segment2;
	std::getline(test, segment2, ')');
	string params = x.substr(segment.length()+1, x.length() - 1 - (segment2.length() + 1));
//	std::cerr << "x " <<  x << endl;
//	std::cerr << "params " <<  params << endl;
	this->remove_space(params);
	int pos = 0;

	char str[params.length()];
	strcpy(str,params.c_str());
	char * pch;
	pch = strtok(str,",");
	while (pch != NULL)
	{
		op_type temp_type = get_op_type(pch);
		std::cerr << "temp_type " <<  temp_type.get_name() << endl;
		ret_vec.push_back(temp_type);
		pch = strtok(NULL, ",");
	}
//	while(params.find(',', pos) != std::string::npos){
//		string param_string = params.substr(pos, params.find(',', pos));
//		op_type temp_type = get_op_type(param_string);
//		pos = params.find(',', pos);
//		ret_vec.push_back(temp_type);
//	}
//	string param_string = params.substr(pos,params.find(')'));
//	op_type temp_type = get_op_type(param_string);
//	std::cerr << "params " <<  params << endl;
//	std::cerr << "pos: " <<  pos << endl;
//	std::cerr << "temp_type2: " <<  temp_type.get_name() << endl;
//	ret_vec.push_back(temp_type);
	return ret_vec;
}

void CgenNode::check_inherited(){

	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));

	op_type cool_type(std::string(std::string(name->get_string()) + std::string("* () ")), 1);
	string parent_no_self_type = (this->get_parentnd()->name->get_string() == "SELF_TYPE") ? this->get_parentnd()->get_type_name() : this->get_parentnd()->name->get_string();
	string no_self_type = (name->get_string() == "SELF_TYPE") ? this->get_type_name() : name->get_string();
	//add inherited functions to vtable and check to make sure you don't override them
	if(!(this->get_parentnd()->basic())){
		for(size_t i = 0; i < this->get_parentnd()->new_vtable_types.size(); i++){
			op_type vt_ft_func(this->get_parentnd()->new_vtable_return_types.at(i) + "*");
			vector<op_type> empty;
			op_type mytype(no_self_type + "*");
			empty.push_back(mytype);
			op_func_type vt_ft_op_func_ptr_type(vt_ft_func, empty);
			vtable_types.push_back(vt_ft_op_func_ptr_type);

			string inherited_string = "bitcast (%";
			inherited_string = inherited_string + this->get_parentnd()->new_vtable_return_types.at(i);
			inherited_string = inherited_string + "* (%";
			inherited_string = inherited_string + parent_no_self_type;
			inherited_string = inherited_string + "*) * ";
			inherited_string = inherited_string + this->get_parentnd()->new_vtable_values.at(i).get_name();
			inherited_string = inherited_string + " to %";
			inherited_string = inherited_string + this->get_parentnd()->new_vtable_return_types.at(i);
			inherited_string = inherited_string + "* (%";
			inherited_string = inherited_string + no_self_type;
			inherited_string = inherited_string + "*) *)";
			const_value inherited_const(INT32, inherited_string, false);
			this->vtable_values.push_back(inherited_const);
			this->function_names.push_back(remove_class(this->get_parentnd()->new_vtable_values.at(i).get_name()));
		}
	}
	else{
		//Add the basic classes inherited functions
		if(this->get_parentnd()->get_type_name() == "IO"){
			//TYPES with self
			//%SELF_TYPE* (%SELF_TYPE*,%String*) *
			vector<op_type> io_self_out_string_op_type_vec;
			op_type io_self_out_string_func_io(std::string(name->get_string()) + "*");
			op_type io_self_out_string_func_str("String*");
			io_self_out_string_op_type_vec.push_back(io_self_out_string_func_io);
			io_self_out_string_op_type_vec.push_back(io_self_out_string_func_str);
			op_func_type io_self_out_string_op_func_ptr_type(io_self_out_string_func_io, io_self_out_string_op_type_vec);
			this->io_self_vtable_types.push_back(io_self_out_string_op_func_ptr_type);

			//%SELF_TYPE* (%SELF_TYPE*,i32) *
			vector<op_type> io_self_out_int_op_type_vec;
			op_type io_self_out_int_func_io(std::string(name->get_string()) + "*");
			io_self_out_int_op_type_vec.push_back(io_self_out_int_func_io);
			io_self_out_int_op_type_vec.push_back(INT32);
			op_func_type io_self_out_int_op_func_ptr_type(io_self_out_int_func_io, io_self_out_int_op_type_vec);
			this->io_self_vtable_types.push_back(io_self_out_int_op_func_ptr_type);

			//%String* (%SELF_TYPE*) *
			vector<op_type> io_self_in_string_op_type_vec;
			op_type io_self_in_string_func_io(std::string(name->get_string()) + "*");
			op_type io_self_in_string_func_str("String*");
			io_self_in_string_op_type_vec.push_back(io_self_in_string_func_io);
			op_func_type io_self_in_string_op_func_ptr_type(io_self_in_string_func_str, io_self_in_string_op_type_vec);
			this->io_self_vtable_types.push_back(io_self_in_string_op_func_ptr_type);

			//i32 (%SELF_TYPE*) *
			vector<op_type> io_self_in_int_op_type_vec;
			op_type io_self_in_int_func_io(std::string(name->get_string()) + "*");
			io_self_in_int_op_type_vec.push_back(io_self_in_int_func_io);
			op_func_type io_self_in_int_op_func_ptr_type(INT32, io_self_in_int_op_type_vec);
			this->io_self_vtable_types.push_back(io_self_in_int_op_func_ptr_type);

			//TYPES inherited
			//%IO* (%IO*,%String*) *
			vector<op_type> io_out_string_op_type_vec;
			op_type io_out_string_func_io("IO*");
			op_type io_out_string_func_str("String*");
			io_out_string_op_type_vec.push_back(io_out_string_func_io);
			io_out_string_op_type_vec.push_back(io_out_string_func_str);
			op_func_type io_out_string_op_func_ptr_type(io_out_string_func_io, io_out_string_op_type_vec);
			this->io_vtable_types.push_back(io_out_string_op_func_ptr_type);

			//%IO* (%IO*,i32) *
			vector<op_type> io_out_int_op_type_vec;
			op_type io_out_int_func_io("IO*");
			io_out_int_op_type_vec.push_back(io_out_int_func_io);
			io_out_int_op_type_vec.push_back(INT32);
			op_func_type io_out_int_op_func_ptr_type(io_out_int_func_io, io_out_int_op_type_vec);
			this->io_vtable_types.push_back(io_out_int_op_func_ptr_type);

			//%String* (%IO*) *
			vector<op_type> io_in_string_op_type_vec;
			op_type io_in_string_func_io("IO*");
			op_type io_in_string_func_str("String*");
			io_in_string_op_type_vec.push_back(io_in_string_func_io);
			op_func_type io_in_string_op_func_ptr_type(io_in_string_func_str, io_in_string_op_type_vec);
			this->io_vtable_types.push_back(io_in_string_op_func_ptr_type);

			//i32 (%IO*) *
			vector<op_type> io_in_int_op_type_vec;
			op_type io_in_int_func_io("IO*");
			io_in_int_op_type_vec.push_back(io_in_int_func_io);
			op_func_type io_in_int_op_func_ptr_type(INT32, io_in_int_op_type_vec);
			this->io_vtable_types.push_back(io_in_int_op_func_ptr_type);

			//VALUES
			//@IO_out_string
			string out_string_io = "IO_out_string";
			global_value out_string_glbl(cool_type, out_string_io);
			const_value out_string_const(cool_type, out_string_glbl.get_name(), false);
			this->io_vtable_values.push_back(out_string_const);

			//@IO_out_int
			string out_int_io = "IO_out_int";
			global_value out_int_glbl(cool_type, out_int_io);
			const_value out_int_const(cool_type, out_int_glbl.get_name(), false);
			this->io_vtable_values.push_back(out_int_const);

			//@IO_in_string
			string in_string_io = "IO_in_string";
			global_value in_string_glbl(cool_type, in_string_io);
			const_value in_string_const(cool_type, in_string_glbl.get_name(), false);
			this->io_vtable_values.push_back(in_string_const);

			//@IO_in_int
			string in_int_io = "IO_in_int";
			global_value in_int_glbl(cool_type, in_int_io);
			const_value in_int_const(cool_type, in_int_glbl.get_name(), false);
			this->io_vtable_values.push_back(in_int_const);

			for(size_t i = 0; i < this->io_vtable_types.size(); i++){
				//bitcast (%IO* (%IO*,%String*) * @IO_out_string to %Main* (%Main*,%String*) *),
				string bitcast_val = "bitcast (";
						bitcast_val = bitcast_val + this->io_vtable_types.at(i).get_name();
						bitcast_val = bitcast_val + " ";
						bitcast_val = bitcast_val + this->io_vtable_values.at(i).get_name();
						bitcast_val = bitcast_val + " to ";
						bitcast_val = bitcast_val + this->io_self_vtable_types.at(i).get_name();
						bitcast_val = bitcast_val + ")";
				const_value old_type_val(io_vtable_types.at(i), bitcast_val, false);
				this->vtable_types.push_back(this->io_self_vtable_types.at(i));
				this->vtable_values.push_back(old_type_val);
				this->function_names.push_back(remove_class(this->io_vtable_values.at(i).get_name()));
			}
		}
	}
}

void CgenNode::handle_vtable_defaults(){
    op_type i32_type(INT32), i1_type(INT1), i8_ptr_type(INT8_PTR);
	std::string name_type(name->get_string());
	op_type cool_type(std::string(std::string(name->get_string()) + std::string("* () ")), 1);

	//Handle the vtable
	this->vtable_types.push_back(i32_type);
	this->vtable_types.push_back(i32_type);
	this->vtable_types.push_back(i8_ptr_type);
	this->vtable_types.push_back(cool_type);

	//Handle the vtable_prototype
	//i32 #,
//	string type_name = name->get_string();
//	int count = (type_name == "Object") ? 0
//			: (type_name == "Int") ? 1
//			: (type_name == "Bool")? 2
//			: (type_name == "String") ? 3
//			: (type_name == "IO") ? 4
//			: (type_name == "Main") ? 5 : -1;

	const_value id_const(i32_type, SSTR(count++), false);
	this->vtable_values.push_back(id_const);
	this->function_names.push_back("counter");

	//i32 ptrtoint (%Class* getelementptr (%Class* null, i32 1) to i32),
	string ptr_string = "ptrtoint (%" + this->get_type_name() + "* getelementptr (%" + this->get_type_name() + "* null, i32 1) to i32)";
	const_value address_const(i32_type, ptr_string, false);
	this->vtable_values.push_back(address_const);
	this->function_names.push_back("memory address");

	//i8* getelementptr ([class.length+1 x i8]* @str.Class, i32 0, i32 0),
	int class_length = ((int)(this->get_type_name().length()) + 1);

	string element_ptr_string = "getelementptr ([";
	element_ptr_string = element_ptr_string + SSTR(class_length);
	element_ptr_string = element_ptr_string + " x i8]* @str.";
	element_ptr_string = element_ptr_string + this->get_type_name();
	element_ptr_string = element_ptr_string + ", i32 0, i32 0)";
	const_value name_const(i8_ptr_type, element_ptr_string, false);
	this->vtable_values.push_back(name_const);
	this->function_names.push_back("main pointer func");

	//%Class* () * @Class_new,
	string new_string = this->get_type_name();
	new_string = new_string + "_new";
	global_value new_glbl(cool_type, new_string);
	const_value new_const(cool_type, new_glbl.get_name(), false);
	this->vtable_values.push_back(new_const);
	this->function_names.push_back("class new func");

	//Layout basic Object functions
	if(this->get_type_name() == "Object")
	{
		//TYPES
		//%Object* (%Object*) *
		vector<op_type> obj_abort_op_type_vec;
		op_type obj_abort_func("Object*");
		obj_abort_op_type_vec.push_back(obj_abort_func);
		op_func_type obj_abort_op_func_ptr_type(obj_abort_func, obj_abort_op_type_vec);
		this->vtable_types.push_back(obj_abort_op_func_ptr_type);

		//%String* (%Object*) *
		vector<op_type> obj_type_name_op_type_vec;
		op_type obj_type_name_func_obj("Object*");
		op_type obj_type_name_func_str("String*");
		obj_type_name_op_type_vec.push_back(obj_type_name_func_obj);
		op_func_type obj_type_name_op_func_ptr_type(obj_type_name_func_str, obj_type_name_op_type_vec);
		this->vtable_types.push_back(obj_type_name_op_func_ptr_type);

		//%Object* (%Object*) *
		vector<op_type> obj_copy_op_type_vec;
		op_type obj_copy_func("Object*");
		obj_copy_op_type_vec.push_back(obj_copy_func);
		op_func_type obj_copy_op_func_ptr_type(obj_copy_func, obj_copy_op_type_vec);
		this->vtable_types.push_back(obj_copy_op_func_ptr_type);

		//VALUES
		//@Object_abort
		string abort_string = this->get_type_name();
		abort_string = abort_string + "_abort";
		global_value abort_glbl(cool_type, abort_string);
		const_value abort_const(cool_type, abort_glbl.get_name(), false);
		this->vtable_values.push_back(abort_const);

		//@Object_type_name
		string type_name_string = this->get_type_name();
		type_name_string = type_name_string + "_type_name";
		global_value type_name_glbl(cool_type, type_name_string);
		const_value type_name_const(cool_type, type_name_glbl.get_name(), false);
		this->vtable_values.push_back(type_name_const);

		//@Object_copy
		string copy_string = this->get_type_name();
		copy_string = copy_string + "_copy";
		global_value copy_glbl(cool_type, copy_string);
		const_value copy_const(cool_type, copy_glbl.get_name(), false);
		this->vtable_values.push_back(copy_const);
	}
	else{
		string no_self_type = (name->get_string() == "SELF_TYPE") ? this->get_type_name() : name->get_string();
		//%Object* (%SELF_TYPE*) *
		vector<op_type> obj_abort_op_type_vec;
		op_type obj_abort_func_obj("Object*");
		op_type obj_abort_func_self(no_self_type + "*");
		obj_abort_op_type_vec.push_back(obj_abort_func_self);
		op_func_type obj_abort_op_func_ptr_type(obj_abort_func_obj, obj_abort_op_type_vec);
		this->vtable_types.push_back(obj_abort_op_func_ptr_type);

		//%String* (%SELF_TYPE*) *
		vector<op_type> obj_type_name_op_type_vec;
		op_type obj_type_name_func_str("String*");
		op_type obj_type_name_func_self(no_self_type + "*");
		obj_type_name_op_type_vec.push_back(obj_type_name_func_self);
		op_func_type obj_type_name_op_func_ptr_type(obj_type_name_func_str, obj_type_name_op_type_vec);
		this->vtable_types.push_back(obj_type_name_op_func_ptr_type);

		//%SELF_TYPE* (%SELF_TYPE*) *
		vector<op_type> obj_copy_op_type_vec;
		op_type obj_copy_func_self(no_self_type + "*");
		obj_copy_op_type_vec.push_back(obj_copy_func_self);
		op_func_type obj_copy_op_func_ptr_type(obj_copy_func_self, obj_copy_op_type_vec);
		this->vtable_types.push_back(obj_copy_op_func_ptr_type);

		//VALUES
		//bitcast (%Object* (%Object*) * @Object_abort to %Object* (%SELF_TYPE*) *)
		//NOTE: I know this method uses provided functionality of casted value,
		//however it doesnt actually do anything useful!
//		op_type res_type("Object*");
//		vector<op_type> arg_types;
//		arg_types.push_back(no_self_type + "*");
//		op_func_ptr_type cast_to(res_type, arg_types);
//		op_type pre_res_type("Object*");
//		op_type pre_arg_type(no_self_type + "*");
//		op_func_ptr_type pre_cast_to(res_type, pre_arg_type);
//
//		global_value abort_global(res_type, "Object_abort");
//		casted_value abort_casted(cast_to, abort_global.get_name(), pre_arg_type);
//		const_value abort_const(cool_type, abort_casted.get_name(), false);
		string abort_string = "bitcast (%Object* (%Object*) * @Object_abort to %Object* (%";
		abort_string = abort_string + no_self_type;
		abort_string = abort_string + "*) *)";
		const_value abort_const(cool_type, abort_string, false);
		this->vtable_values.push_back(abort_const);
		this->function_names.push_back("abort");

		//bitcast (%String* (%Object*) * @Object_type_name to %String* (%SELF_TYPE*) *)
		string type_name_string = "bitcast (%String* (%Object*) * @Object_type_name to %String* (%";
		type_name_string = type_name_string + no_self_type;
		type_name_string = type_name_string + "*) *)";
		const_value type_name_const(cool_type, type_name_string, false);
		this->vtable_values.push_back(type_name_const);
		this->function_names.push_back("type_name");

		//bitcast (%Object* (%Object*) * @Object_copy to %SELF_TYPE* (%SELF_TYPE*) *)
		string copy_string = "bitcast (%Object* (%Object*) * @Object_copy to %";
		copy_string = copy_string + no_self_type;
		copy_string = copy_string + "* (%";
		copy_string = copy_string + no_self_type;
		copy_string = copy_string + "*) *)";
		const_value copy_const(cool_type, copy_string, false);
		this->vtable_values.push_back(copy_const);
		this->function_names.push_back("copy");
	}

	//Layout basic String Functions
	if(this->get_type_name() == "String"){
		//TYPES
		//i32 (%String*) *
		vector<op_type> str_len_op_type_vec;
		op_type str_len_func("String*");
		str_len_op_type_vec.push_back(str_len_func);
		op_func_type str_len_op_func_ptr_type(INT32, str_len_op_type_vec);
		this->vtable_types.push_back(str_len_op_func_ptr_type);

		//%String* (%String*,%String*) *
		vector<op_type> str_concat_op_type_vec;
		op_type str_concat_func("String*");
		str_concat_op_type_vec.push_back(str_concat_func);
		str_concat_op_type_vec.push_back(str_concat_func);
		op_func_type str_concat_op_func_ptr_type(str_concat_func, str_concat_op_type_vec);
		this->vtable_types.push_back(str_concat_op_func_ptr_type);

		//%String* (%String*,i32,i32) *
		vector<op_type> str_substr_op_type_vec;
		op_type str_substr_func("String*");
		str_substr_op_type_vec.push_back(str_substr_func);
		str_substr_op_type_vec.push_back(INT32);
		str_substr_op_type_vec.push_back(INT32);
		op_func_type str_substr_op_func_ptr_type(str_substr_func, str_substr_op_type_vec);
		this->vtable_types.push_back(str_substr_op_func_ptr_type);

		//VALUES
		//@String_length
		string length_string = this->get_type_name();
		length_string = length_string + "_length";
		global_value length_glbl(cool_type, length_string);
		const_value length_const(cool_type, length_glbl.get_name(), false);
		this->vtable_values.push_back(length_const);

		//@String_concat
		string concat_string = this->get_type_name();
		concat_string = concat_string + "_concat";
		global_value concat_glbl(cool_type, concat_string);
		const_value concat_const(cool_type, concat_glbl.get_name(), false);
		this->vtable_values.push_back(concat_const);

		//@String_substr
		string substr_string = this->get_type_name();
		substr_string = substr_string + "_substr";
		global_value substr_glbl(cool_type, substr_string);
		const_value substr_const(cool_type, substr_glbl.get_name(), false);
		this->vtable_values.push_back(substr_const);
	}

//	%IO* (%IO*,%String*) * @IO_out_string,
//	%IO* (%IO*,i32) * @IO_out_int,
//	%String* (%IO*) * @IO_in_string,
//	i32 (%IO*) * @IO_in_int
	//Layout basic IO Functions
	if(this->get_type_name() == "IO"){
		//TYPES
		//%IO* (%IO*,%String*) *
		vector<op_type> io_out_string_op_type_vec;
		op_type io_out_string_func_io("IO*");
		op_type io_out_string_func_str("String*");
		io_out_string_op_type_vec.push_back(io_out_string_func_io);
		io_out_string_op_type_vec.push_back(io_out_string_func_str);
		op_func_type io_out_string_op_func_ptr_type(io_out_string_func_io, io_out_string_op_type_vec);
		this->vtable_types.push_back(io_out_string_op_func_ptr_type);

		//%IO* (%IO*,i32) *
		vector<op_type> io_out_int_op_type_vec;
		op_type io_out_int_func_io("IO*");
		io_out_int_op_type_vec.push_back(io_out_int_func_io);
		io_out_int_op_type_vec.push_back(INT32);
		op_func_type io_out_int_op_func_ptr_type(io_out_int_func_io, io_out_int_op_type_vec);
		this->vtable_types.push_back(io_out_int_op_func_ptr_type);

		//%String* (%IO*) *
		vector<op_type> io_in_string_op_type_vec;
		op_type io_in_string_func_io("IO*");
		op_type io_in_string_func_str("String*");
		io_in_string_op_type_vec.push_back(io_in_string_func_io);
		op_func_type io_in_string_op_func_ptr_type(io_in_string_func_str, io_in_string_op_type_vec);
		this->vtable_types.push_back(io_in_string_op_func_ptr_type);

		//i32 (%IO*) *
		vector<op_type> io_in_int_op_type_vec;
		op_type io_in_int_func_io("IO*");
		io_in_int_op_type_vec.push_back(io_in_int_func_io);
		op_func_type io_in_int_op_func_ptr_type(INT32, io_in_int_op_type_vec);
		this->vtable_types.push_back(io_in_int_op_func_ptr_type);

		//VALUES
		//@IO_out_string
		string out_string_io = this->get_type_name();
		out_string_io = out_string_io + "_out_string";
		global_value out_string_glbl(cool_type, out_string_io);
		const_value out_string_const(cool_type, out_string_glbl.get_name(), false);
		this->vtable_values.push_back(out_string_const);

		//@IO_out_int
		string out_int_io = this->get_type_name();
		out_int_io = out_int_io + "_out_int";
		global_value out_int_glbl(cool_type, out_int_io);
		const_value out_int_const(cool_type, out_int_glbl.get_name(), false);
		this->vtable_values.push_back(out_int_const);

		//@IO_in_string
		string in_string_io = this->get_type_name();
		in_string_io = in_string_io + "_in_string";
		global_value in_string_glbl(cool_type, in_string_io);
		const_value in_string_const(cool_type, in_string_glbl.get_name(), false);
		this->vtable_values.push_back(in_string_const);

		//@IO_in_int
		string in_int_io = this->get_type_name();
		in_int_io = in_int_io + "_in_int";
		global_value in_int_glbl(cool_type, in_int_io);
		const_value in_int_const(cool_type, in_int_glbl.get_name(), false);
		this->vtable_values.push_back(in_int_const);
	}

}

void CgenNode::add_attr_type(Symbol type, Symbol id){
	this->attr_types.push_back(type);
	this->attr_types.push_back(id);
}

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
static void initialize_constants(void)
{
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
void program_class::cgen(ostream &os)
{
    initialize_constants();
    class_table = new CgenClassTable(classes,os);
}

// Create definitions for all String constants
void StrTable::code_string_table(ostream& s, CgenClassTable* ct)
{
    for (List<StringEntry> *l = tbl; l; l = l->tl()) {
	l->hd()->code_def(s, ct);
    }
}

// Create definitions for all Int constants
void IntTable::code_string_table(ostream& s, CgenClassTable* ct)
{
    for (List<IntEntry> *l = tbl; l; l = l->tl()) {
	l->hd()->code_def(s, ct);
    }
}

//
// Sets up declarations for extra functions needed for code generation
// You should not need to modify this code for MP3
//
void CgenClassTable::setup_external_functions()
{
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
	vp.declare(*ct_stream, void_type, "Bool_init", bool_init_args);
#endif
}

// Creates AST nodes for the basic classes and installs them in the class list
void CgenClassTable::install_basic_classes()
{
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
void CgenClassTable::install_classes(Classes cs)
{
    for (int i = cs->first(); cs->more(i); i = cs->next(i)) {
	install_class(new CgenNode(cs->nth(i),CgenNode::NotBasic,this));
    }
}

//
// Add this CgenNode to the class list and the lookup table
//
void CgenClassTable::install_class(CgenNode *nd)
{
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
void CgenClassTable::install_special_class(CgenNode *nd)
{
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
void CgenClassTable::build_inheritance_tree()
{
    for(List<CgenNode> *l = nds; l; l = l->tl())
	set_relations(l->hd());
}

//
// CgenClassTable::set_relations
//
// Takes a CgenNode and locates its, and its parent's, inheritance nodes
// via the class table.  Parent and child pointers are added as appropriate.
//
void CgenClassTable::set_relations(CgenNode *nd)
{
    CgenNode *parent_node = probe(nd->get_parent());
    nd->set_parentnd(parent_node);
    parent_node->add_child(nd);
}

// Get the root of the class tree.
CgenNode *CgenClassTable::root()
{
    return probe(Object);
}

//////////////////////////////////////////////////////////////////////
//
// Special-case functions used for the method Int Main::main() for
// MP3 only.
//
//////////////////////////////////////////////////////////////////////

#ifndef MP4

CgenNode* CgenClassTable::getMainmain(CgenNode* c)
{
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
void CgenClassTable::code_constants()
{
#ifdef MP4
	//Make new environment
	CgenEnvironment* env = new CgenEnvironment(*(this->ct_stream), root());
	//Make new ValuePrinter
	ValuePrinter vp(*(env->cur_stream));
	int i;
	for(i = stringtable.first(); stringtable.more(i); i = stringtable.next(i)){}
	for(int x = i - 1; x >= stringtable.first(); x--){
		Symbol str_from_table = stringtable.lookup(x);

		//@str.COUNT_CONSTANTS = internal constant [STRING.LENGTH x i8] c"STRING\00"
		op_arr_type op_type_array(INT8, std::string(str_from_table->get_string()).length()+1);
		const_value strConst(op_type_array, str_from_table->get_string(), true);
		std::string first_string = "str.";
		first_string = first_string + SSTR(x);
		vp.init_constant(first_string, strConst);

//		@String.1 = constant %String {
//			%String_vtable* @String_vtable_prototype,
//			i8* getelementptr ([14 x i8]* @str.1, i32 0, i32 0)
//		}
		//Types
		vector<op_type> str_op_types;
		op_type str_vtab_ptr("String_vtable*");
		str_op_types.push_back(str_vtab_ptr);
		op_type i8_ptr_type(INT8_PTR);
		str_op_types.push_back(i8_ptr_type);

		//Values
		vector<const_value> str_const_values;
		const_value str_vtab_proto_const(str_vtab_ptr, std::string("@String_vtable_prototype"), false);
		str_const_values.push_back(str_vtab_proto_const);

		std::string get_element_ptr_string = "@";
		get_element_ptr_string = get_element_ptr_string + first_string;
		const_value str_getelement_ptr_const(op_type_array, get_element_ptr_string, false);
		str_const_values.push_back(str_getelement_ptr_const);


		//i8* getelementptr ([14 x i8]* @str.1, i32 0, i32 0)
//		embed_getelementptr(
//			*(env->cur_stream),
//			operand(op_type(op_type_array.get_name() + "*") , "@" + first_string),
//			int_value(0),
//			int_value(0));

		std::string second_string = "String.";
		second_string = second_string + SSTR(x);
		global_value string_global(op_type("String"), second_string);
		vp.init_struct_constant(string_global, str_op_types, str_const_values);
	}

#endif
}

// generate code to define a global string constant
void StringEntry::code_def(ostream& s, CgenClassTable* ct)
{
#ifdef MP4
	// NOTE: I chose to leave this blank too because it makes code_constants
	// useless if you do not...
#endif
}

// generate code to define a global int constant
void IntEntry::code_def(ostream& s, CgenClassTable* ct)
{
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
: nds(0)
{
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

//	std::cerr << "Class " << c->get_name() << " assigned tag "
//		<< c->get_tag() << ", max child " << c->get_max_child()
//		<< "\n";

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
    //Code the main functions
    code_main();

#ifdef MP4
    //code the individual classes
    code_classes(root());
#else
#endif
}

#ifdef MP4
void CgenClassTable::code_classes(CgenNode *c)
{
	c->code_class();
	List<CgenNode> *children = c->get_children();
	for (List<CgenNode> *child = children; child; child = child->tl())
		code_classes(child->hd());
}
#endif

//
// Create LLVM entry point. This function will initiate our Cool program
// by generating the code to execute (new Main).main()
//
void CgenClassTable::code_main()
{
	ValuePrinter vp(*ct_stream);

//	define i32 @main() {
//	entry:
//		%main.obj = call %Main*()* @Main_new( )
//		%main.retval = call RETURN_TYPE(%Main*)* @Main_main( %Main* %main.obj )
//		ret i32 0
//	}

	//define i32 @main()
	op_type i32_type(INT32);
	vector<operand> main_args;
	vector<op_type> main_args_types;
	vp.define(i32_type, "main", main_args);

	//entry:
	string mainString("entry");
	vp.begin_block(mainString);

	//%main.obj = call %Main*()* @Main_new( )
	op_type no_op_type;
	main_args_types.push_back(no_op_type);
	operand no_op;
	main_args.push_back(no_op);
	op_type main_type("Main*");
	operand main_obj_operand(main_type,"main.obj");
	vp.call(*ct_stream,
			main_args_types,
			"Main_new",
			true,
			main_args,
			main_obj_operand);

	//%main.retval = call RETURN_TYPE(%Main*)* @Main_main( %Main* %main.obj )
	op_type main_ret_type("Object*");
	List<CgenNode> *children = root()->get_children();
//	for (List<CgenNode> *child = children; child; child = child->tl()){
//		std::cerr << "CGENNODE NAME: " << child->hd()->get_type_name() << "\n";
//		if(child->hd()->get_type_name() == "Main"){
//			for(size_t i = 0; i < child->hd()->vtable_values.size(); i++){
//				std::cerr << "CGENNODE: " << child->hd()->get_type_name() << " vtable_values " << child->hd()->vtable_values.at(i).get_value()<<  "\n";
//				if(child->hd()->vtable_values.at(i).get_value() == "@Main_main"){
//					op_type main_main_ret_type = child->hd()->vtable_types.at(i);
//					std::cerr << "MAIN MAIN RET TYPE: " << main_main_ret_type.get_name() << "\n";
//					string original = main_main_ret_type.get_name();
//					string ret_type_only;
//					stringstream ssNew(original);
//					ssNew >> ret_type_only;
//					//std::cerr << "NEW RET TYPE: " << ret_type_only << "\n";
//					op_type ret_temp_type = get_main_main_ret_type(ret_type_only);
//					main_ret_type = ret_temp_type;
//				}
//			}
//		}
//	}
	operand main_retval_operand(main_ret_type,"main.retval");
	vector<operand> main_retval_args;
	main_retval_args.push_back(main_obj_operand);
	vector<op_type> main_retval_args_types;
	main_retval_args_types.push_back(main_type);
	vp.call(*ct_stream,
			main_retval_args_types,
			"Main_main",
			true,
			main_retval_args,
			main_retval_operand);

	//ret i32 0
	int_value zero_operand(0);
	vp.ret(zero_operand);


#ifndef MP4
//  // Get the address of the string "Main_main() returned %d\n" using
//  vector<op_type> printf_args_types;
//  vector<operand> printf_args;
//
//  op_arr_type op_type_array2(INT8_PTR, strToPass.length()+1);
//  global_value ptrString(op_type_array2, ".str", strConst);
//  op_type i8_ptr(INT8_PTR);
//  operand pointer = vp.getelementptr(ptrString, int_value(0), int_value(0), i8_ptr);
//  // Call printf with the string address of "Main_main() returned %d\n"
//  // and the return value of Main_main() as its arguments
//  printf_args_types.push_back(i8_ptr);
//  op_type varArg(VAR_ARG);
//  printf_args_types.push_back(varArg);
//  printf_args.push_back(pointer);
//  printf_args.push_back(result);
//  operand callprintf = vp.call(printf_args_types, i32_type, "printf", true, printf_args);
//  // Insert return
//  vp.ret(int_value(0));

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
  parentnd(0), children(0), basic_status(bstatus), class_table(ct), tag(-1)
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

void CgenNode::setup(int tag, int depth)
{
#ifdef MP4
    this->handle_vtable_defaults();
    this->layout_features();

	//check if you inherit and if so add to attr_only_ret_types
	if(!(this->get_parentnd()->basic())){
		op_type temp(std::string(this->get_parentnd()->get_type_name()) + std::string("*"));
		this->attr_only_ret_types.push_back(temp);
	}


	//Make new ValuePrinter
	ValuePrinter vp(*(this->get_classtable()->ct_stream));

	//@str.Main = internal constant [5 x i8] c"Main\00"
	string strToPass(name->get_string());
	op_arr_type op_type_array(INT8, strToPass.length()+1);
	const_value strConst(op_type_array, strToPass, true);
	vp.init_constant(std::string("str.") + std::string(name->get_string()), strConst);

	//Add inherited classes
	if(!basic())
		this->check_inherited();
	//after adding basic classes to vtables add new ones
	for(size_t i = 0; i < this->new_vtable_types.size(); i++)
		vtable_types.push_back(this->new_vtable_types.at(i));
	for(size_t i = 0; i < this->new_vtable_values.size(); i++){
		vtable_values.push_back(this->new_vtable_values.at(i));
		this->function_names.push_back(remove_class(this->new_vtable_values.at(i).get_value()));
	}


	op_type obj_vtable_type(std::string(name->get_string()) + "_vtable", 1);
	vector<op_type> type_def_vec;

	type_def_vec.push_back(obj_vtable_type);
	for(size_t i = 0; i < this->attr_only_ret_types.size(); i++)
		type_def_vec.push_back(this->attr_only_ret_types.at(i));
	vp.type_define(name->get_string(), type_def_vec);

	vp.type_define(std::string(name->get_string()) + "_vtable", this->vtable_types);

	op_type proto_const_op(std::string(std::string(name->get_string()) + std::string("_vtable")));
	global_value prototype_glbl(proto_const_op, std::string(name->get_string()) + std::string("_vtable_prototype"));
	vp.init_struct_constant(prototype_glbl, this->vtable_types, this->vtable_values);



#endif
}

#ifdef MP4
//
// Class codegen. This should performed after every class has been setup.
// Generate code for each method of the class.
//
void CgenNode::code_class()
{
	// No code generation for basic classes. The runtime will handle that.
	if (basic())
		return;

	//std::cerr << "SETTING UP CODE FOR: " << this->get_type_name() << "\n";
	//define %RETURN_TYPE* @CLASS_FUNCTION(SELF_PARAM, OTHERPARAMS) {
	//%return_type*
	CgenEnvironment *env = new CgenEnvironment(*(this->get_classtable()->ct_stream), this);
	ValuePrinter vp(*(env->cur_stream));

	//Code methods only!
	env->methods_only = true;
	int i = features->first();
	while(features->more(i)){
		features->nth(i)->code(env);
		i = features->next(i);
	}

	//Now Setup the class_new
	op_type class_ptr_type(this->get_type_name() + "*");
	vector<operand> class_args;
	vp.define(class_ptr_type, this->get_type_name() + "_new", class_args);

	// Define an entry basic block
	string classString("entry");
	vp.begin_block(classString);

//	define %Main* @Main_new() {
//
//	entry:
//		%tmp.8 = getelementptr %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
//		%tmp.9 = load i32* %tmp.8
//		%tmp.10 = call i8*(i32 )* @malloc( i32 %tmp.9 )
//		%tmp.11 = bitcast i8* %tmp.10 to %Main*
//		%tmp.12 = getelementptr %Main* %tmp.11, i32 0, i32 0
//		store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.12
//		%tmp.13 = alloca %Main*
//		store %Main* %tmp.11, %Main** %tmp.13
//		ret %Main* %tmp.11
//
//	abort:
//		call void @abort(  )
//		unreachable
//	}
	//%tmp.8 = getelementptr %Main_vtable* @Main_vtable_prototype, i32 0, i32 1
	op_type class_vtable_ptr_type(this->get_type_name() + "_vtable*");
	global_value class_vtable_ptr_operand(class_vtable_ptr_type, this->get_type_name() + "_vtable_prototype");
	int_value zero_int_op(0);
	int_value one_int_op(1);
	op_type i32_ptr_type(INT32_PTR);
	operand vtable_op = vp.getelementptr(
			class_vtable_ptr_operand,
			zero_int_op,
			one_int_op,
			i32_ptr_type);

	//%tmp.9 = load i32* %tmp.8
	operand load_return = vp.load(vtable_op);

	//%tmp.10 = call i8*(i32 )* @malloc( i32 %tmp.9 )
	op_type i8_ptr_type(INT8_PTR);
	vector<op_type> args_types;
	op_type i32_type(INT32);
	args_types.push_back(i32_type);
	vector<operand> args;
	args.push_back(load_return);
	operand call_return = vp.call(
			args_types,
			i8_ptr_type,
			"malloc",
			true,
			args);

	//%tmp.11 = bitcast i8* %tmp.10 to %Main*
	operand bitcast_result = vp.bitcast(call_return, class_ptr_type);
	//store result of bitcast
	env->bitcast_res = bitcast_result;

	//%tmp.12 = getelementptr %Main* %tmp.11, i32 0, i32 0
	op_type class_element_ptr_result_type(this->get_type_name() + "_vtable**");
	operand *class_element_ptr_result = new operand(vp.getelementptr(
			bitcast_result,
			zero_int_op,
			zero_int_op,
			class_element_ptr_result_type));

	//store %Main_vtable* @Main_vtable_prototype, %Main_vtable** %tmp.12
	vp.store(class_vtable_ptr_operand, *class_element_ptr_result);

	//%tmp.13 = alloca %Main*
	operand *alloca_result = new operand(vp.alloca_mem(class_ptr_type));

	//store %Main* %tmp.11, %Main** %tmp.13
	vp.store(bitcast_result, *alloca_result);
	//TODO:figure out what to store here
	env->add_local(self, alloca_result);

	//Code attr only!
	env->methods_only = false;
	int x = features->first();
	while(features->more(x)){
		features->nth(x)->code(env);
		x = features->next(x);
	}

	//ret %Main* %tmp.11
	vp.ret(bitcast_result);

	//abort:
	//	call void @abort(  )
	//	unreachable
	//}
	vp.begin_block("abort");
	vector<op_type> abort_args_types;
	vector<operand> abort_args;
	operand ab_call = vp.call(abort_args_types, VOID, "abort", true, abort_args);
	vp.unreachable();

	vp.end_define();
}

// Laying out the features involves creating a Function for each method
// and assigning each attribute a slot in the class structure.
void CgenNode::layout_features()
{
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
void CgenEnvironment::add_local(Symbol name, operand *vb) {
	var_table.enterscope();
	var_table.addid(name, vb);
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

//
// Create a method body
//
void method_class::code(CgenEnvironment *env)
{
	if(!(env->methods_only))
		return;
	ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "method\n";

//	define %Alpha* @Alpha_getSelf(%Alpha* %self) {
//
//	entry:
//		%tmp.0 = alloca %Alpha*
//		store %Alpha* %self, %Alpha** %tmp.0
//		%tmp.1 = load %Alpha** %tmp.0
//		ret %Alpha* %tmp.1
//
//	abort:
//		call void @abort(  )
//		unreachable
//	}
//	class Alpha
//	{
//	   getSelf() : Alpha {self};
//	};

	//define RETURN_TYPE @CLASS_FEATURENAME(SELF< .. OTHER PARAMS) {
	op_type ret_type = method_type_gen(return_type->get_string());
	string fn_name = std::string(env->get_class()->get_type_name()) + "_" + std::string(name->get_string());

	op_type class_type(env->get_class()->get_type_name() + "*");
	operand self_arg(class_type, "self");
	env->fn_args.push_back(self_arg);
	env->symbol_vec.push_back(self);
	for(int x = formals->first(); formals->more(x); x = formals->next(x)){
		op_type formal_type = env->get_class()->process_formal_type(this->formals->nth(x)->get_type_decl()->get_string());
		operand formal_temp_op(formal_type,  std::string(this->formals->nth(x)->get_name()->get_string()));
		env->fn_args.push_back(formal_temp_op);
		env->symbol_vec.push_back(this->formals->nth(x)->get_name());
	}

	vp.define(ret_type, fn_name, env->fn_args);

	//entry:
	vp.begin_block("entry");

	operand *alloca_result;

	//GO ONTO OTHER FORMALS
	for(size_t i = 0; i < env->fn_args.size(); i++){
		//%tmp.0 = alloca %Main*
		alloca_result = new operand(vp.alloca_mem(env->fn_args.at(i).get_type()));
		//std::cerr << "symbol vec at i " << symbol_vec.at(i)->get_string() <<endl;
		if(std::string(env->symbol_vec.at(i)->get_string()) == std::string("self")){
			op_type *temp_type = new op_type(alloca_result->get_type());
			temp_type->set_id(OBJ_PPTR);
			*alloca_result = operand(*temp_type, alloca_result->get_name().substr(1));
		}
		env->add_local(env->symbol_vec.at(i), alloca_result);
		//store %Main* %self, %Main** %tmp.0
		vp.store(env->fn_args.at(i), *alloca_result);
	}
	std::cerr <<"calling code env from "<< name->get_string() <<endl;
	operand result = expr->code(env);
	std::cerr <<"done calling "<<endl;
	if(result.get_type().get_name() != ret_type.get_name())
		result = vp.bitcast(result, ret_type);

	vp.ret(result);

	//Setup the abort call at the end of each method
	vp.begin_block("abort");
	vector<op_type> abort_args_types;
	vector<operand> abort_args;
	operand ab_call = vp.call(abort_args_types, VOID, "abort", true, abort_args);
	vp.unreachable();

	vp.end_define();
}

operand assign_class::code(CgenEnvironment *env)
{
  ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "assign\n";
	operand *self_op = env->lookup(self);

	operand expr_operand = expr->code(env);
	//Load what you stored in code_class
	operand load_result = vp.load(*self_op);


	//getelementptr of what you just loaded!
	//%tmp.2 = getelementptr %Main* %tmp.1, i32 0, i32 1
	int_value zero_op(0);
	int_value one_op(1);
	op_type store_type(expr_operand.get_type().get_ptr_type());
	operand elementptr_result_type = vp.getelementptr(
			load_result,
			zero_op,
			one_op,
			store_type
			);

  //Get the operand from the var table
//  operand assign_operand = *(env->var_table.lookup(name));

//  std::cerr << "----------------------------------" <<"\n\n";
//  std::cerr << "Symbol name: " << name->get_string() <<"\n";
//  std::cerr << "Expr_operand tn: " << expr_operand.get_typename() <<"\n";
//  std::cerr << "Expr_operand n: " << expr_operand.get_name() <<"\n";
//  std::cerr << "assign_operand tn: " << assign_operand.get_typename() <<"\n";
//  std::cerr << "assign_operand n: " << assign_operand.get_name() <<"\n";
//  std::cerr << "\n\n----------------------------------" <<"\n";


  vp.store(*(env->cur_stream), expr_operand, elementptr_result_type);
  return expr_operand;
}

operand cond_class::code(CgenEnvironment *env)
{
  if (cgen_debug) std::cerr << "cond\n";
  ValuePrinter vp(*(env->cur_stream));
  operand second_reg;
  string result1, result2, result3;
  second_reg = vp.alloca_mem(env->get_class()->process_formal_type(then_exp->get_type()->get_string()));
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
  //create temp for the identifier
  string iden_temp(identifier->get_string());
  operand identifier_op(type, iden_temp);
  //allocate memory for the type assigned
  operand *new_var = new operand(vp.alloca_mem(type));
  //add what we just allocated memory for into the var table.
  env->add_local(identifier, new_var);

  //check if the <- expr is empty if not evaluate if it is store
  //default values of false and 0 for bool and int respectively into
  //the value.
  if(!(new_op.get_type().get_id() == EMPTY))
    vp.store(*(env->cur_stream), new_op, *new_var);
  else{
    string val;
    if(type.get_id() == INT1)
      val = "false";
    else if(type.get_id() == INT32)
      val = "0";
    vp.store(*(env->cur_stream), const_value(type, val, true), *new_var);
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
	operand *self_op = env->lookup(name);

	if(std::string(self_op->get_name()) == std::string("%empty for now"))
		self_op = env->lookup(self);

	std::cerr << "loading:  " << name->get_string() << " " <<   self_op->get_name() << " " << self_op->get_typename()<<endl;
	std::cerr << "loading:  " << self_op->get_type().get_id() << endl;
	operand load_result = vp.load(*self_op);
	bool is_local = false;
	for(int i = 1; i < env->symbol_vec.size();i++){
		if(std::string(env->symbol_vec.at(i)->get_string())
			== std::string(name->get_string())){
			std::cerr << "symbol vec at i "<<env->symbol_vec.at(i)->get_string() << " " << name->get_string() <<endl;
			is_local = true;
			break;
		}
	}
	if(!is_local){
		//%tmp.2 = getelementptr %Main* %tmp.1, i32 0, i32 1
		int_value zero_op(0);
		int_value one_op(1);
		operand *name_op = env->lookup(name);
		op_type store_type(name_op->get_type());
		operand *elementptr_result = new operand(
				vp.getelementptr(
					load_result,
					zero_op,
					one_op,
					store_type
					)
				);

		std::cerr << "OBJECT NAME: " <<  name->get_string() << endl;
		env->add_local(SELF_TYPE, elementptr_result);
	}
	else{
		env->add_local(SELF_TYPE, self_op);
	}

//	  std::cerr << "-------------DUMPING SELFOP---------------------" <<"\n\n";
//	  std::cerr << "self_op name: " << self_op->get_name() <<"\n";
//	  std::cerr << "self_op tn: " << self_op->get_typename() <<"\n";
//	  std::cerr << "self op type : " << self_op->get_type().get_name() <<"\n";
//	  std::cerr << "\n\n----------------------------------" <<"\n";

  return load_result;
}

operand no_expr_class::code(CgenEnvironment *env)
{
	if (cgen_debug) std::cerr << "No_expr\n";
  operand nothing;
  return nothing;
}

operand static_dispatch_class::code(CgenEnvironment *env)
{
	operand nothing;
	if (cgen_debug) std::cerr << "static dispatch\n";
#ifndef MP4
	assert(0 && "Unsupported case for phase 1");
#else

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

//	method
//	block
//	assign
//	Integer Constant
//	Object
//	dispatch
//	Object
//	attribute!
//	Integer Constant
//
//	%tmp.0 = alloca %Main*
//	store %Main* %self, %Main** %tmp.0
	//assign + int const
//	%tmp.1 = load %Main** %tmp.0
//	%tmp.2 = getelementptr %Main* %tmp.1, i32 0, i32 1
//	store i32 878, i32* %tmp.2
	//object
//	%tmp.3 = load %Main** %tmp.0
//	%tmp.4 = getelementptr %Main* %tmp.3, i32 0, i32 1
	//dispatch
//	%tmp.5 = load i32* %tmp.4
//	%tmp.6 = load %Main** %tmp.0
//	%tmp.7 = getelementptr %Main* %tmp.6, i32 0, i32 1
//	%tmp.8 = load i32* %tmp.7
//	%tmp.9 = load %Main** %tmp.0
//	%tmp.10 = icmp eq %Main* %tmp.9, null
//	br i1 %tmp.10, label %abort, label %ok.0

//	ok.0:
//	%tmp.11 = getelementptr %Main* %tmp.9, i32 0, i32 0
//	%tmp.12 = load %Main_vtable** %tmp.11
//	%tmp.13 = getelementptr %Main_vtable* %tmp.12, i32 0, i32 8
//	%tmp.14 = load %Main* (%Main*,i32) ** %tmp.13
//	%tmp.15 = call %Main*(%Main*, i32 )* %tmp.14( %Main* %tmp.9, i32 %tmp.8 )
//	%tmp.16 = load %Main** %tmp.0
//	%tmp.17 = bitcast %Main* %tmp.16 to %Object*
//	ret %Object* %tmp.17

//	class Main inherits IO
//	{
//	   x : Int <- 5;
//	   main() : Object {		method/block
//			{
//				x<-878; 		assign/int const
//				x; 				object
//				out_int(x);		dispatch
//				self;			Object
//			}
//		};
//	};

	ValuePrinter vp(*(env->cur_stream));
//	std::cerr << "DISPATCH NAME: " <<  name->get_string() << endl;
//	std::cerr << "DISPATCH expr: " <<  expr->get_type()->get_string() << endl;

	//if(std::string(expr->get_type()->get_string()) != std::string("SELF_TYPE")){
	op_type param_op_type;
	int i = actual->first();
	vector<operand> args;
	while(actual->more(i)){
		param_op_type = (env->get_class()->process_ret_type(actual->nth(i)->get_type()->get_string()));
		operand *temp_param_op = env->lookup(expr->get_type());
		operand param_op(param_op_type.get_ptr_type(), temp_param_op->get_name().substr(1, temp_param_op->get_name().length()-1));
		operand load_op_result = vp.load(param_op);
		actual->nth(i)->code(env);
		i = actual->next(i);
	}
	//do second load i32
	operand *temp_param_op = env->lookup(expr->get_type());
	operand param_op(param_op_type.get_ptr_type(), temp_param_op->get_name().substr(1, temp_param_op->get_name().length()-1));
	operand load_op_result = vp.load(param_op);

	env->ok_count++;
	operand expr_op = expr->code(env);

	args.push_back(expr_op);
	args.push_back(load_op_result);

	op_type bool_type(INT1);
	null_value null_op(expr_op.get_type());
	operand icmp_result = vp.icmp(EQ,
			expr_op,
			null_op);

	string ok_label = env->new_ok_label();
	vp.branch_cond(
			*(env->cur_stream),
			icmp_result,
			"abort",
			ok_label
			);


	//ok label
	vp.begin_block(ok_label);
	//	%tmp.11 = getelementptr %Main* %tmp.9, i32 0, i32 0
	//	%tmp.12 = load %Main_vtable** %tmp.11
	//	%tmp.13 = getelementptr %Main_vtable* %tmp.12, i32 0, i32 8
	//	%tmp.14 = load %Main* (%Main*,i32) ** %tmp.13
	//	%tmp.15 = call %Main*(%Main*, i32 )* %tmp.14( %Main* %tmp.9, i32 %tmp.8 )
	int_value zero_val(0);
	string vtable_ptr_string(env->get_class()->get_type_name() + "_vtable**");
	op_type vtable_ptr_type(vtable_ptr_string);
	vtable_ptr_type.set_id(OBJ_PPTR);
	operand get_main_vtable = vp.getelementptr(
										expr_op,
										zero_val,
										zero_val,
										vtable_ptr_type
										);

	//	%tmp.12 = load %Main_vtable** %tmp.11
	operand vtable_load_result = vp.load(get_main_vtable);

	//	%tmp.13 = getelementptr %Main_vtable* %tmp.12, i32 0, i32 8
	operand get_offset;
	for(int i = 0; i < env->get_class()->function_names.size();i++){
		std::cerr << "ZZZZZZ: "<< env->get_class()->function_names.at(i)<<endl;
		if(std::string(env->get_class()->function_names.at(i)) == std::string(name->get_string())){
			std::cerr << env->get_class()->function_names.at(i) << " matched in get_offset " << name->get_string()<< " offset: " << i <<endl;
			int_value offset_val(i);
			get_offset = vp.getelementptr(
										vtable_load_result,
										zero_val,
										offset_val,
										vtable_ptr_type
										);
		}
	}
	//	%tmp.14 = load %Main* (%Main*,i32) ** %tmp.13
	operand *load_func_op;
	op_type func_type_ptr;
	op_type *func_type;
	for(int i = 0; i < env->get_class()->function_names.size();i++){
		std::cerr << env->get_class()->function_names.at(i)<<endl;
		if(std::string(env->get_class()->function_names.at(i)) == std::string(name->get_string())){
			std::cerr << env->get_class()->function_names.at(i) << " matched " << name->get_string()<< endl;
			func_type_ptr = op_type(env->get_class()->vtable_types.at(i).get_name().substr(1),1);
			func_type = new op_type(env->get_class()->vtable_types.at(i).get_name());
			func_type_ptr.set_id(OBJ_PPTR);
			load_func_op = new operand(func_type_ptr, get_offset.get_name().substr(1));
			break;
		}
	}
	operand load_func_result = vp.load(*load_func_op);

	//	%tmp.15 = call %Main*(%Main*, i32 )* %tmp.14( %Main* %tmp.9, i32 %tmp.8 )
	vector<op_type> arg_types = env->parse_args(func_type->get_name());
//	for(int i = 0; i < param_op_vec.size(); i++)
//		arg_types.push_back(param_op_vec.at(i).get_type());
	op_type class_type(env->get_class()->get_type_name() + "*");
	operand call_result = vp.call(
								arg_types,
								class_type,
								load_func_result.get_name().substr(1),
								false,
								args);
	return call_result;

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
	//%tmp.1 = call %Alpha* @Alpha_new(  )
	ValuePrinter vp(*(env->cur_stream));
	vector<op_type> arg_types;
	op_type no_op_type;
	arg_types.push_back(no_op_type);
	vector<operand> args;
	operand no_op;
	args.push_back(no_op);
	operand temp_result_op(op_type("Not sure yet"),
			env->get_class()->get_type_name() + "*");
	operand *result_op = new operand(temp_result_op);
	vp.call(*(env->cur_stream),
			arg_types,
			env->get_class()->get_type_name() + "_new",
			false,
			args,
			*result_op
			);
	env->add_local(type_name, result_op);
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
void method_class::layout_feature(CgenNode *cls)
{
#ifndef MP4
    assert(0 && "Unsupported case for phase 1");
#else
    //Establish environment
    CgenEnvironment* env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
    //add all information about formals to vectors

    vector<op_type> temp_formal_vec;
    temp_formal_vec.push_back(cls->process_ret_type(cls->get_type_name()));
    operand formal_self_op(cls->process_ret_type(cls->get_type_name()), name->get_string());
    cls->formal_ops.push_back(formal_self_op);
    for(int x = formals->first(); formals->more(x); x = formals->next(x)){
    	op_type temp_type(cls->process_ret_type(this->formals->nth(x)->get_type_decl()->get_string()));
    	temp_formal_vec.push_back(temp_type);
    	operand formal_temp_op(temp_type, /*maybe process ret_type here*/this->formals->nth(x)->get_name()->get_string());
    	cls->formal_ops.push_back(formal_temp_op);
    }

	//add the id and type of the feature to attr_types
	cls->add_attr_type(return_type, name);

	//add the return_type to vtable
	//cls->setup_ret_types(return_type, cls);

	//If it is not a basic class add its features to the Main__main vtable
	if(cls->get_type_name() != "Object"
		&& cls->get_type_name() != "Bool"
		&& cls->get_type_name() != "Int"
		&& cls->get_type_name() != "String"
		&& cls->get_type_name() != "IO")
	{
		//add the new feature to vtable
		op_type vt_ft_func(cls->process_ret_type(return_type->get_string()));
		op_func_type vt_ft_op_func_ptr_type(vt_ft_func, temp_formal_vec);
		cls->new_vtable_types.push_back(vt_ft_op_func_ptr_type);
		cls->new_vtable_return_types.push_back(return_type->get_string());

		//add the new feature to vtable prototype
		std::string vtp_ft_string = cls->get_type_name();
		vtp_ft_string = vtp_ft_string + "_";
		vtp_ft_string = vtp_ft_string + name->get_string();
		op_type vtp_ft_op_type(vtp_ft_string);
		global_value vtp_ft_glbl(vtp_ft_op_type, vtp_ft_string);
		const_value vtp_ft_const(vtp_ft_op_type, vtp_ft_glbl.get_name(), false);
		cls->new_vtable_values.push_back(vtp_ft_const);
	}

#endif
}

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
	operand *alloc_op = new operand(vp.alloca_mem(alloc_type));
	operand conf_result = conform(expr_val, alloc_type,  env);
	vp.store(conf_result, *alloc_op);
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
   //setup an environment
   CgenEnvironment*  env = new CgenEnvironment(*(cls->get_classtable()->ct_stream), cls);
   //get the return type and correctly process it
   //string ret_type = type_decl->get_string();

   //add the type and name to attr_type and attr_id vectors
   //cls->add_attr_type(cls->process_ret_type(type_decl->get_string()), name->get_string());

   //Means we have expressions to assign
//   if(std::string(init->get_type()->get_string()).length() > 0){
//	   operand init_op = init->code(env);
//	   cls->attr_ret_vals.push_back(init_op.get_name());
//   }

   cls->setup_ret_types(type_decl, cls);

#endif
}

void attr_class::code(CgenEnvironment *env)
{
#ifndef MP4
    assert(0 && "Unsupported case for phase 1");
#else
    //NOTE: each attr has getelementptr -> store
    if(env->methods_only){
//    	  std::cerr << "----------------------------------" <<"\n\n";
//    	  std::cerr << "Symbol name: " << name->get_string() <<"\n";
//    	  std::cerr << "type_decl: " << type_decl->get_string() <<"\n";
//    	  std::cerr << "init ret type: " << init->get_type() <<"\n";
//    	  std::cerr << "\n----------------------------------" <<"\n";
    	op_type type_decl_op_type(env->get_class()->process_ret_ptr_type(type_decl->get_string()));
    	operand temp_empty_op(type_decl_op_type, "empty for now");
    	operand *empty_op = new operand(temp_empty_op);
    	env->add_local(name, empty_op);
		  std::cerr << "----------------------------------" <<"\n\n";
		  std::cerr << "Symbol name: " << name->get_string() <<"\n";
		  std::cerr << "type_decl: " << type_decl->get_string() <<"\n";
		  std::cerr << "init ret type: " << init->get_type() <<"\n";
		  std::cerr << "\n----------------------------------" <<"\n";
    	return;
    }
    ValuePrinter vp(*(env->cur_stream));
	if (cgen_debug) std::cerr << "attribute!\n";

	//std::cerr << "ATTR CLASS name: " << name->get_string() <<"\n";
	//std::cerr << "CUR CLASS name: " << env->get_class()->get_type_name() <<"\n";

	//evaluate the expression
	operand *attr_expr_operand = new operand(init->code(env));
	//std::cerr << "attr_expr_operand name: " << attr_expr_operand->get_name() <<"\n";
	//std::cerr << "attr_expr_operand name: " << attr_expr_operand->get_typename() <<"\n";

	//	%tmp.24 = getelementptr %Main* %tmp.21, i32 0, i32 1
	//	store i32 5, i32* %tmp.24
	//	ret %Main* %tmp.21

	operand *self_from_var = env->lookup(self);
	operand new_op(op_type(INT32_PTR), self_from_var->get_name());

	int_value zero_int_op(0);
	int_value one_int_op(1);
	op_type expr_op_type(attr_expr_operand->get_type().get_ptr_type());
	op_type attr_op_type(std::string(env->get_class()->get_type_name()) + "*");
	operand attr_operand(attr_op_type, env->bitcast_res.get_name().substr(1,env->bitcast_res.get_name().length()-1));
	operand attr_ret_op = vp.getelementptr(
			attr_operand,
			zero_int_op,
			one_int_op,
			expr_op_type);

	vp.store(*(env->cur_stream),
			*attr_expr_operand,
			attr_ret_op);

#endif
}


