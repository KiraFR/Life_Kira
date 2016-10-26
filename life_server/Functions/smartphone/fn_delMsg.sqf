/*
	File: fn_delMsg.sqf
	Author: J `Kira` D
	
	Description:
	flemme d'expliquer
*/
private["_query"];
params ["_id","_owner"];
_query = format["DELETE FROM `message` WHERE `id`='%1'",_id];
[_query,1] call DB_fnc_asyncCall;
[0] remoteExec ["life_fnc_cellphone",(owner _owner)];