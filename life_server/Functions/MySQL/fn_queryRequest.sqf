#include "\life_server\script_macros.hpp"
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
private["_uid","_side","_query","_numAnnuResult","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
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
					// 10 (en partant de 0)
	case west: {_returnCount = 8; format["SELECT playerid, name, cash, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist FROM players WHERE playerid='%1'",_uid];};
					// 9 (en partant de 0)
	case civilian: {_returnCount = 9; format["SELECT playerid, name, cash, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, civPosition, alive FROM players WHERE playerid='%1'",_uid];};
					// 9 (en partant de 0)
	case independent: {_returnCount = 7; format["SELECT playerid, name, cash, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear FROM players WHERE playerid='%1'",_uid];};
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

//Convert tinyint to boolean
_old = _queryResult select 5;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[5,_old];

//Parse data for specific side.
switch (_side) do {
	case west: {
		_queryResult set[8,([_queryResult select 8,1] call DB_fnc_bool)];

		//Telephone
		_numAnnu = format["SELECT numero FROM phonenumber WHERE pid_owner='%1' AND active='1'",_uid];
		_numAnnuResult = [_numAnnu,2] call DB_fnc_asyncCall;
		if(count _numAnnuResult > 0)then {
			if(typeName _numAnnuResult == "ARRAY")then{_numAnnuResult = _numAnnuResult select 0;};
			_queryResult pushBack _numAnnuResult; // select 9
		}else{
			_numAnnuResult = "";
			_queryResult pushBack _numAnnuResult; // select 9
		};
		_compteBanque = [_uid] call KIRA_fnc_queryAccountRequest;
		_queryResult pushBack _compteBanque; //10
		_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
		_queryResult pushBack _keyArr; //11
	};

	case civilian: {
		_queryResult set[6,([_queryResult select 6,1] call DB_fnc_bool)];
		diag_log (_queryResult select 8);
		_queryResult set[8,call compile format["%1", (_queryResult select 8)]];
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];

		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};

		_house = missionNamespace getVariable[format["houses_%1",_uid],[]];
		_queryResult pushBack _house; // select 10



		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_gang = missionNamespace getVariable[format["gang_%1",_uid],[]];
		_queryResult pushBack _gang; // select 11

		//Telephone
		_numAnnu = format["SELECT numero FROM phonenumber WHERE pid_owner='%1' AND active='1'",_uid];
		_numAnnuResult = [_numAnnu,2] call DB_fnc_asyncCall;
		if(count _numAnnuResult > 0)then {
			if(typeName _numAnnuResult == "ARRAY")then{_numAnnuResult = _numAnnuResult select 0;};
			_queryResult pushBack _numAnnuResult; // select 12
		}else{
			_numAnnuResult = "";
			_queryResult pushBack _numAnnuResult; // select 12
		};



		_Permis = format["SELECT Ppermis, nbrPermis, PermisDispo, waitTime FROM permis WHERE uid='%1'",_uid];
		_PermisResult = [_Permis,2] call DB_fnc_asyncCall;
		if(count _PermisResult > 0)then {
			_queryResult pushBack (_PermisResult select 0); //13
			_queryResult pushBack (_PermisResult select 1); //14
			_queryResult pushBack (_PermisResult select 2); //15
			_queryResult pushBack (_PermisResult select 3); //16
		};
		_compteBanque = [_uid] call KIRA_fnc_queryAccountRequest;
		_queryResult pushBack _compteBanque; //17
		_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
		_queryResult pushBack _keyArr; //18
	};
	case independent:{

		//Telephone
		_numAnnu = format["SELECT numero FROM phonenumber WHERE pid_owner='%1' AND active='1'",_uid];
		_numAnnuResult = [_numAnnu,2] call DB_fnc_asyncCall;
		if(count _numAnnuResult > 0)then {
			if(typeName _numAnnuResult == "ARRAY")then{_numAnnuResult = _numAnnuResult select 0;};
			_queryResult pushBack _numAnnuResult; // select 8
		}else{
			_numAnnuResult = format["0%1",_numAnnuResult];
			_queryResult pushBack _numAnnuResult; // select 8
		};

		_compteBanque = [_uid] call KIRA_fnc_queryAccountRequest;
		_queryResult pushBack _compteBanque; //9
		_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
		_queryResult pushBack _keyArr; //10
	};
};

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];