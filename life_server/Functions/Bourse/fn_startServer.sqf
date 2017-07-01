/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private ["_timeStamp","_script"];
[] call bourse_fnc_createObject;
waitUntil {if (Bourse_Start) exitWith {true};false};
[] spawn bourse_fnc_saveBourse;
[] spawn bourse_fnc_saveObject;