#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group"];
params[
	["_ownerID",ObjNull,[ObjNull]],
	["_uid","",[""]],
	["_gangName","",[""]]
];
_group = group _ownerID;

if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_query = format["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
	[1,"There is already a gang created with that name please pick another name."] RemoteExecCall ["life_fnc_broadcast",_ownerID];
	["life_action_gangInUse",nil,missionNamespace] RemoteExecCall ["life_fnc_netSetVar",_ownerID];
};

_query = format["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];

_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
	[1,"You are currently already active in a gang, please leave the gang first."] RemoteExecCall ["life_fnc_broadcast",_ownerID];
	["life_action_gangInUse",nil,missionNamespace] RemoteExecCall ["life_fnc_netSetVar",_ownerID];
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];

_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [_uid];

if(count _queryResult != 0) then {
	_query = format["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["INSERT INTO gangs (owner, name, members) VALUES('%1','%2','%3')",_uid,_gangName,_gangMembers];
};

_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_maxMembers",8,true];
_group setVariable ["gang_members",[_uid],true];
[_group] remoteExecCall ["life_fnc_gangCreated",_ownerID];

sleep 0.35;
_query = format["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable["gang_id",(_queryResult select 0),true];
