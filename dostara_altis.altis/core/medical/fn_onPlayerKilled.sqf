#include "..\..\script_macros.hpp"
/*
    File: fn_onPlayerKilled.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    When the player dies collect various information about that player
    and pull up the death dialog / camera functionality.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_killer",objNull,[objNull]]
];
disableSerialization;

if  !((vehicle _unit) isEqualTo _unit) then {
    UnAssignVehicle _unit;
    _unit action ["getOut", vehicle _unit];
    _unit setPosATL [(getPosATL _unit select 0) + 3, (getPosATL _unit select 1) + 1, 0];
};

//Set some vars
_unit setVariable ["Revive",true,true];
_unit setVariable ["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable ["restrained",false,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["transporting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["steam64id",(getPlayerUID player),true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn {
    private ["_maxTime","_RespawnBtn","_Timer"];
    disableSerialization;
    _RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
    _Timer = ((findDisplay 7300) displayCtrl 7301);
    if (life_respawn_timer < 5) then {
        _maxTime = time + 5;
    } else {
        _maxTime = time + life_respawn_timer;
    };
    _RespawnBtn ctrlEnable false;
    waitUntil {_Timer ctrlSetText format [localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS"] call BIS_fnc_secondsToString];
    round(_maxTime - time) <= 0 || isNull _this};
    _RespawnBtn ctrlEnable true;
    _Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

_unit spawn {
    private ["_requestBtn","_requestTime"];
    disableSerialization;
    _requestBtn = ((findDisplay 7300) displayCtrl 7303);
    _requestBtn ctrlEnable false;
    _requestTime = time + 5;
    waitUntil {round(_requestTime - time) <= 0 || isNull _this};
    _requestBtn ctrlEnable true;
};

[] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn {
    private ["_unit"];
    _unit = _this select 0;
    waitUntil {if (speed _unit isEqualTo 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

life_save_gear = [player] call life_fnc_fetchDeadGear;

if (life_drop_weapons_onDeath) then {
    _unit removeWeapon (primaryWeapon _unit);
    _unit removeWeapon (handgunWeapon _unit);
    _unit removeWeapon (secondaryWeapon _unit);
};

//Killed by cop stuff...
if (side _killer isEqualTo west && !(playerSide isEqualTo west)) then {
    life_copRecieve = _killer;
    //Did I rob the federal reserve?
    if (!life_use_atm && {life_cash > 0}) then {
        [format [localize "STR_Cop_RobberDead",[life_cash] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        life_cash = 0;
    };
};

[_unit] call life_fnc_dropItems;

life_action_inUse = false;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;
life_is_alive = false;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;