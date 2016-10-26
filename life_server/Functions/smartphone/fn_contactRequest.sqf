/*
	File: fn_msgRequest.sqf
	Author: J `Kira` D
	
	Description:
	flemme d'expliquer
*/
private["_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_returnToSender = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_query = format["SELECT  nam_contact, num_contact, pid_contact FROM numberrepertoire WHERE pid_owner='%1'",_uid];
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {};
[0,_queryResult] remoteExecCall ["SOCK_fnc_contactReceived",(owner _returnToSender)];
