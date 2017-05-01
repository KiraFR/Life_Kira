/*
    File: fn_AcceptContrat.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private["_uid","_targetname"];
disableSerialization;
_display = findDisplay 5500;
_AccountList = _display displayCtrl 5501;
_uid = getPlayerUID player;
_targetname = call compile format["%1",lnbData[5501,[_this select 0,0]]];

diag_log format["%1",_name];
_targetname = _targetname select 0;
[_uid,_targetname] RemoteExecCall ["ASSA_fnc_AcceptContrat",2];

