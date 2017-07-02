#include "..\..\macro.h"
/*
	File: fn_sirenLights.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Lets play a game! Can you guess what it does? I have faith in you, if you can't
	then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private _vehicle = param [0,objNull,[objNull]];

if(isNull _vehicle) exitWith {}; //Bad entry!

//Last chance check to prevent something from defying humanity and creating a monster.
//if(!(typeOf _vehicle in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"])) exitWith {};
if(playerSide isEqualTo west and {typeOf _vehicle != ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F"]}) exitWith {};
if(playerSide isEqualTo independent and {typeOf _vehicle != "C_Offroad_01_F"}) exitWith {};

_trueorfalse = _vehicle getVariable ["lights",false];

if(_trueorfalse) then {
	_vehicle setVariable["lights",false,true];
} else {
	_vehicle setVariable["lights",true,true];
	switch playerSide do {
		case west: {
			[_vehicle,0.22] remoteExec ["life_fnc_copLights",RCLIENT];
		};

		case independent: {
			[_vehicle,0.22] remoteExec ["life_fnc_medicLights",RCLIENT];
		};
	};
};
