#include "..\macro.h"
/*
  File : fn_initPlayerVars.sqf
  Author : Is there really an author ?

  Description : Initialize variable of players
*/
_unit = player;
_unit setVariable ["restrained", false, true];
_unit setVariable ["Escorting", false, true];
_unit setVariable ["transporting", false, true];
_unit setVariable ["steam64ID", getPlayerUID player];
_unit setVariable ["realname", profileName, true];

if (playerSide isEqualTo west) then {
  _unit setVariable ["rank", (__GETC__(life_coplevel)), true];
};
