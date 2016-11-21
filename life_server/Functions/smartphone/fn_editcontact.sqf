#include "..\..\macro.h"
/*
	File: fn_editcontact.sqf
	Author: J. `Kira` D.

	Description:
	Edit le contact
*/
params[
	"_ownerID",
	"_newName",
	"_id"
];

if(isNil "_ownerID") exitwith{};
if(count _data == 0) exitWith {"L'info passe pas" remoteExec ["hint",(owner _ownerID)];};
if(_newName == "") exitWith {"le nom passe pas" remoteExec ["hint",(owner _ownerID)];};
if(_id isEqualTo 0) exitWith {"Numero passe pas" remoteExec ["hint",(owner _ownerID)];};


_edit = format ["UPDATE numberrepertoire SET nam_contact='""%1""' WHERE id='%2'",_newName,_id];
[_edit,1] call DB_fnc_asyncCall;