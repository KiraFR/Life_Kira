/*
    File: fn_onPlayerDisconnected.sqf
    Author: 

    Description:
    
*/
_unit = _this select 0;
[getPlayerUID _unit,civilian,name _unit,1] remoteExecCall ["DB_fnc_logs",2];

//SyncData Deconnexion

[] spawn SOCK_fnc_syncData;
[] call SOCK_fnc_updateBanque;