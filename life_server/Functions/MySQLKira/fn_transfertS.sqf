/*
	File: fn_transfertS.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme


	PARAMETRES:

	RETURNS:
	NONE

	CALL:
	[] call KIRA_fnc_transfertS
*/
params[
	["_amount",0,[0]],
	["_numAcc","",[""]],
	["_numAccSender","",[""]],
	["_taxes",0,[0]],
	["_player",objNull,[objNull]]
];
diag_log format["1 - %1",_this];
private _queryResult = [format["SELECT playerid FROM banque WHERE numcompte='%1'",_numAcc],2] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith {[_amount,_taxes,_numAccSender] remoteExecCall ["KIRA_fnc_rembourser",_player];};
if(typeName _queryResult == "ARRAY")then{_queryResult = _queryResult select 0;};
diag_log format["2 - %1",_this];
[_amount,_numAccSender,_taxes,false] remoteExecCall ["KIRA_fnc_saveMoney",_player];
private _unit = [_queryResult] call KIRA_fnc_isConnected;
if(isNull _unit) exitWith {
	_query = format["UPDATE banque SET bankacc=bankacc+%1 WHERE numcompte='%2'",_amount,_numAcc];
	[_query,1] call DB_fnc_asyncCall;
};
diag_log format["3 - %1",_this];
[_amount,_numAcc,_taxes,true] remoteExecCall ["KIRA_fnc_saveMoney",_unit];