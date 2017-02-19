/*
    File: fn_termContrat.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
disableSerialization;
_display = findDisplay 4900;
_AccountList = _display displayCtrl 4901;
_uid = getPlayerUID player;
_name = call compile format["%1",lnbData[4901,[_this select 0,0]]];

diag_log format["%1",_name];
_name = _name select 0;
[_uid,_name] RemoteExecCall ["ASSA_fnc_StopContrat",2];