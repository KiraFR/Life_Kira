/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
["ACE_Captives_setHandcuffed", [player, false], [player]] call CBA_fnc_targetEvent;
[_unit, false] call ACE_captives_fnc_setSurrendered;
_unit setVariable ["ACE_captives_isEscorting", false, true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
life_is_arrested = true;
removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);

[player,_bad] RemoteExecCall ["life_fnc_jailSys",0];
[5] call SOCK_fnc_updatePartial;