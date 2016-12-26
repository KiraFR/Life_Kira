#include "..\..\macro.h"
/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
params[
	["_uid","",[""]],
	["_side",sideUnknown,[civilian]],
	["_ownerID",ObjNull,[ObjNull]]
];

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: {_returnCount = 10; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 9; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 9; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear FROM players WHERE playerid='%1'",_uid];};
};


_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;
if(Debug) then {
	diag_log "------------- Client Query Request -------------";
	diag_log format["QUERY: %1",_query];
	diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
	diag_log format["Result: %1",_queryResult];
	diag_log "------------------------------------------------";
};
if(typeName _queryResult == "STRING") exitWith {

	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if(count _queryResult == 0) exitWith {
	[] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

//Parse data for specific side.
switch (_side) do {
	case west: {
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];
		 // LOGS
        _list = [_queryResult select 1,_queryResult select 3,_queryResult select 2];
        //  UID , SIDE  , Informations , Type
        [_uid,west,_list,0] spawn DB_fnc_logs;
	};
	
	case civilian: {
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult set[18,missionNamespace getVariable[format["houses_%1",_uid],[]]];
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult set[19,missionNamespace getVariable[format["gang_%1",_uid],[]]];
		
		/*_Permis = format["SELECT Ppermis, nbrPermis, PermisDispo, waitTime FROM permis WHERE uid='%1'",_uid];
		_PermisResult = [_Permis,2] call DB_fnc_asyncCall;
		if(count _PermisResult > 0)then {
			_queryResult set [12,_PermisResult select 0];
			_queryResult set [13,_PermisResult select 1];
			_queryResult set [14,_PermisResult select 2];
			_queryResult set [15,_PermisResult select 3];
		};
		// LOGS
        _list = [_queryResult select 1,_queryResult select 3,_queryResult select 2];
        //  UID , SIDE  , Informations , Type
        [_uid,civilian,_list,0] spawn DB_fnc_logs;*/
	};
	case independent:{
		// LOGS
        //_list = [_queryResult select 1,_queryResult select 3,_queryResult select 2];
        //  UID , SIDE, Informations , Type
        //[_uid,independent,_list,0] spawn DB_fnc_logs;
	};
};


/*
//Telephone
_numAnnu = format["SELECT numero,annuaire FROM phonenumber WHERE pid_owner='%1'",_uid];
_numAnnuResult = [_numAnnu,2] call DB_fnc_asyncCall;
if(count _numAnnuResult != 0)then {
	_queryResult set [20,_numAnnuResult select 0];
	_queryResult set [21,_numAnnuResult select 1];
};

_numreper = format["SELECT nam_contact, num_contact, pid_contact, id FROM numberrepertoire WHERE pid_owner='%1'",_uid];
_numreperResult = [_numreper,2,true] call DB_fnc_asyncCall;
_queryResult set [22,_numreperResult];
*/
_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[25,_keyArr];
/*
_nbAcc = format["SELECT id FROM banque WHERE playerid='%1'",_uid];
_nbAccResult = [_nbAcc,2,true] call DB_fnc_asyncCall;
_queryResult set [26,(count _nbAccResult)];

_nbAccEntre = format["SELECT id FROM banque WHERE playerid='%1' AND entreprise='1'",_uid];
_nbAccEntreResult = [_nbAccEntre,2] call DB_fnc_asyncCall;
if(count _nbAccEntreResult == 0) then{
	_queryResult set [27,0];
}else{
	_queryResult set [27,1]
};

_dfltAcc = format["SELECT id, bankacc FROM banque WHERE playerid='%1' AND dflt='1'",_uid];
_dfltAcc = [_dfltAcc,2] call DB_fnc_asyncCall;
_queryResult set [28,_dfltAcc];
*/
diag_log format["%1",_queryResult];
_queryResult remoteExecCall ["SOCK_fnc_requestReceived",_ownerID];