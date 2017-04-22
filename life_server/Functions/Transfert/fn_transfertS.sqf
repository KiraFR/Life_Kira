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
private["_queryResult","_taxes","_amountSender","_amount","_unit"];
params[["_amount",0,[0]],["_numAcc","",[""]],["_amountSender",0,[0]],["_numAccSender","",[""]],["_taxes",0,[0]],["_player",objNull,[objNull]]];

_queryResult = [format["SELECT playerid FROM banque WHERE numcompte='%1'",_numAcc],2] call DB_fnc_asyncCall;
if(count _queryResult == 0) exitWith{
	[(_amount+_taxes),_numAccSender] remoteExecCall ["KIRA_fnc_rembourser",_player];
};
if(typeName _queryResult == "ARRAY")then{_queryResult = _queryResult select 0;};
_amount = [_amount] call DB_fnc_numberSafe;
_amountSender = [_amountSender] call DB_fnc_numberSafe;
_taxes = [_taxes] call DB_fnc_numberSafe;

_selectSender =format["SELECT playerid FROM banque WHERE numcompte='%1'",_numAccSender];
_selectReceiv =format["SELECT playerid FROM banque WHERE numcompte='%1'",_numAcc];

_query = format["UPDATE banque SET bankacc=bankacc+%2 WHERE numcompte='%1';
				 INSERT INTO logsTransfert (uidSender, amountSender, uidReceiv, amountReceiv,type) VALUES((%3),'%4',(%5),'%6',""Transfert Banque"");
				 UPDATE gouvernement SET bankAcc=bankAcc+%7 WHERE nameGouv='Dostara';"
				 ,_numAcc,_amount,_selectSender,_amountSender,_selectReceiv,_amount,_taxes];

[_query,1] call DB_fnc_asyncCall;


_unit = [_queryResult] call KIRA_fnc_isConnected;
if(isNull _unit)exitWith{};
[_amount,_numAcc,false] remoteExecCall ["KIRA_fnc_saveMoney",_unit];