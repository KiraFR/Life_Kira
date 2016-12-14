/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_k"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_k = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;



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
		[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit],2] remoteExecCall ["TON_fnc_logKill",RSERV];
	};
	case (vehicle _k != _k):
	{
		if(typeOf _kVeh isKindOf "Air") then{
			[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _vehName],4] remoteExecCall ["TON_fnc_logKill",RSERV];
		}else{
			[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _vehName],3] remoteExecCall ["TON_fnc_logKill",RSERV];
		};
	};
	default
	{//		UIDU 				SIDEU 			NAMEU 									POSU 				NAMEK 						 UIDK 			 SIDEK 			POSK 	WEAPONK	   DISK
		[getPlayerUID _unit, side _unit, [_unit getVariable["realname",name player], position _unit, _k getVariable["realname",name _k], getPlayerUID _k, side _k, position _k, _kWep, _distance],5] remoteExecCall ["TON_fnc_logKill",RSERV];
	};
};

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this};
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

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