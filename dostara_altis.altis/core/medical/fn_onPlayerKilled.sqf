/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_k"];
disableSerialization;
_unit = param[_this,0,ObjNull,[ObjNull]];
_k = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if ((vehicle _unit) != _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

_unit setVariable ["name",profileName,true];
_unit setVariable ["steam64id",(getPlayerUID player),true];
if (_unit getVariable ["ACE_captives_isHandcuffed", false]) then {
	[_unit, false] call ACE_captives_setHandcuffed;
};
if (_unit getVariable ["ACE_captives_isSurrendering", false]) then {
	[_unit, false] call ACE_captives_setSurrendered;
};
if (_unit getVariable ["ACE_captives_isEscorting", false]) then {
	_unit setVariable["ACE_captives_isEscorting",false,true];
};
if (_unit getVariable ["ACE_isUnconscious", false]) then {
	_unit setVariable["ACE_isUnconscious",false,true];
};

_distance = _k distance _unit;
_distance = floor(_distance);

_kWep = currentWeapon _k;
_weaponName = (configFile >> "cfgWeapons" >> _kWep);
_weaponName = format["%1",getText(_weaponName >> "displayName")];
_kWep = format["%1",_weaponName];

_kVeh = vehicle _k;
_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _kVeh) >> "displayName");

switch (true) do 
{
	case (_unit == _k):
	{
		[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit],2] remoteExecCall ["DB_fnc_logs",RSERV];
	};
	case (vehicle _k != _k):
	{
		if(typeOf _kVeh isKindOf "Air") then{
			[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _vehName],4] remoteExecCall ["DB_fnc_logs",RSERV];
		}else{
			[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _vehName],3] remoteExecCall ["DB_fnc_logs",RSERV];
		};
	};
	default
	{//		UIDU 				SIDEU 			NAMEU 									POSU 				NAMEK 						 UIDK 			 SIDEK 			POSK 	WEAPONK	   DISK
		[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _kWep, _distance],5] remoteExecCall ["DB_fnc_logs",RSERV];
	};
};

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Killed by cop stuff...
if(side _k == west && playerSide != west) then {
	life_copRecieve = _k;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_cash] call life_fnc_numberText]] RemoteExecCall ["life_fnc_broadcast",0];
		life_cash = 0;
	};
};


_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
[player,life_sidechat,playerSide] RemoteExecCall ["TON_fnc_managesc",2];

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;