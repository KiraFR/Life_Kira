/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;
private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["realname",profileName,true];
_unit setVariable["ACE_medical_bloodVolume",100,true];
if (_unit getVariable ["ACE_captives_isHandcuffed", false]) then {[_unit, false] call ACE_captives_setHandcuffed;};
if (_unit getVariable ["ACE_captives_isSurrendering", false]) then {[_unit, false] call ACE_captives_setSurrendered;};
 if (_unit getVariable ["ACE_captives_isEscorting", false]) then {_unit setVariable["ACE_captives_isEscorting",false,true];};
if (_unit getVariable ["ACE_isUnconscious", false]) then {_unit setVariable["ACE_isUnconscious",false,true];};
_unit setVariable ["realname",profileName,true];
_unit addRating 9999999999999999;
player playMoveNow "amovppnemstpsraswrfldnon";
[] call life_fnc_setupActions;
[_unit,life_sidechat,playerSide] RemoteExecCall ["TON_fnc_managesc",2];