#include "..\macro.h"
/*
  File : fn_initialization.sqf
  Author : Is there really an author ?

  Description : Initialize the player depending his side
*/
switch (playerSide) do {
	case west: {
		[] call side_fnc_initCop;
	};

	case independent: {
		[] call side_fnc_initMedic;
	};

	case civilian: {
		[] call side_fnc_initCiv;
	};
};

// Set unit vars
[] call side_fnc_initPlayerVars;
