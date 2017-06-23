#include "..\macro.h"
/*
    File: fn_AcceptContrat.sqf
    Author: R. `KronosD` R.

    Description:
    Disposition de tout les infos dispo.
*/
private["_uid","_targetname"];
disableSerialization;
_accountList = getControl(5500,5501);
_targetname = call compile format["%1",lnbData[5501,[_this select 0,0]]];

diag_log format["%1",_name];
_targetname = _targetname select 0;
[steamid, _targetname] RemoteExecCall ["ASSA_fnc_AcceptContrat",2];
