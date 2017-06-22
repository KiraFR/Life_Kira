#include "..\macro.h"
/*
  File : fn_initialization.sqf
  Author : Is there really an author ?

  Description : Initialize the player depending his side
*/
switch playerSide do {
	case west: {_handle = [] spawn side_fnc_initCop;};
	case independent: {_handle = [] spawn side_fnc_initMedic;};
	case civilian: {_handle = [] spawn side_fnc_initCiv;};
  waitUntil {scriptDone _handle};
};

player setVariable ["restrained",false,true];
player setVariable ["Escorting",false,true];
player setVariable ["transporting",false,true];
player setVariable ["steam64ID",getPlayerUID player];
player setVariable ["realname",profileName,true];

player addRating 99999999;
