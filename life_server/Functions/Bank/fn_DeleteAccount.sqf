#include "..\..\macro.h"
/*
	File: fn_DeleteAccount.sqf
	Author: R. `KronosD` R..

	Description:
	Lit merde
*/
params[
	"_id"
];
_remove = format ["DELETE FROM banque WHERE id='%1',numcompte='%2'",_id,_num];
[_remove,1] call DB_fnc_asyncCall;