//RemoteExec Macros
#define RSERV 2 //Only server
#define RCLIENT -2 //Except server
#define RANY 0 //Global

#define CONSTANT(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define EXTDB "extDB3" callExtension
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define FETCH_CONST(var) (call var)
#define CONSTVAR(var) var = compileFinal (if (var isEqualType "") then {var} else {str(var)})