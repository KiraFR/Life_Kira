/*
    File: fn_onPlayerDisconnected.sqf
    Author: 

    Description:
    
*/
_unit = _this select 0;

//SyncData Deconnexion

[] spawn SOCK_fnc_syncData;
[] call SOCK_fnc_updateBanque;