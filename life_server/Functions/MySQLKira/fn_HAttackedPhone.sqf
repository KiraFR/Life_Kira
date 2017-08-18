#include <macro.h>
/*
	File:  fn_HAttackedPhone.sqf
	Auteur: J. `Kira` D.
	
	Description:
	desactiver un telephone
	
	PARAMETRES:
	NONE 
	
	RETURNS: 
	NONE 

	CALL: 
	call KIRA_fnc_HAttackedPhone
*/
params[
	["_num","",[""]],
	["_unit",objNull,[objNull]]
];

_query = format["UPDATE phonenumber SET attacked='1' WHERE num='%1'",_num];
[_query,1] call DB_fnc_asyncCall;

[] remoteExec ["KIRA_fnc_HDisablePhone",_unit];