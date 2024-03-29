#include "..\..\macro.h"
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Sends specific information to the server to update on the player,
	meant to keep the network traffic down with large sums of data flowing
	through life_fnc_MP
*/
private["_mode","_packet","_array","_flag"];
_mode = param[0,0,[0]];
_packet = [steamid,playerSide,nil,_mode];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};

switch(_mode) do {
	case 0: {
		_packet set[2,CASH];
	};

	case 1: {
		_packet set[2,BANK];
	};

	case 2: {
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} forEach life_licenses;

		_packet set[2,_array];
	};

	case 3: {
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
	};

	case 4: {
		//Not yet implemented
	};

	case 5: {
		_packet set[2,life_is_arrested];
	};

	case 6: {
		_packet set[2,CASH];
		_packet set[4,BANK];
	};
	case 8: {
		_packet set[2,life_nbrFoisPermis];
		_packet set[4,life_pPermis];
	};
	case 9: {
		_packet set[2,life_pPermis];
	};
	case 10: {
		_packet set[2,waitsleep];
		_packet set[4,life_waitpermis];
	};
	case 11: {
		_packet set[2,waitsleep];
	};
	case 12: {  
	_civPosition = position player;
	_packet set[2,_civPosition];
	_packet set[4,life_is_alive];
};
};

_packet remoteExecCall ["DB_fnc_updatePartial",2];
