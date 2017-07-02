#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets a variable on the given object from the server,
	workaround for brokenness of ARMA 3, yes Brokenness is a word!
*/
private["_obj","_varValue","_global","_varName"];
params[
	["_obj",ObjNull,[ObjNull]],
	["_varName","",[""]],
	"_varValue",
	["_global",false,[true]]
];

if(isNull _obj OR _varName == "") exitWith {}; //Bad.
_obj setVariable[_varName,_varValue,_global];