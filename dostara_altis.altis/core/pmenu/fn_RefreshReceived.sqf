#include "..\..\macro.h"
/*
	File: fn_RefreshReceived.sqf
	Author: J `Kira` D

	Description:
	update les chiffres
*/
params ["_type","_data"];
switch _type do {
	//joueurs
	case 0:{
			BANK = _data;
			[] call life_fnc_hudUpdate;
			hint "les impôts sont tombés.";
	};
	// entreprise
	case 1:{
		_gang = (group Player) getVariable "gang_name";
		if(!(isNil "_gang")) then {
			{
				_good = (group Player) getVariable "gang_id";
				if(_good == _x select 0) then{
					(group Player) setVariable ["gang_bank",(_x select 1),true];
				};
			}forEach _data;
		};
	};
	// gang
	case 2:{
		diag_log format ["_data avant : %1",_data];
		_gang = (group Player) getVariable "gang_name";
		if(!(isNil "_gang")) then {
			{
				diag_log format ["_x select 0: %1",_x select 0];
				_good = (group Player) getVariable "gang_id";
				if(_good == _x select 0) then{
					(group Player) setVariable ["gang_bank",(_x select 1),true];
				};
			}forEach _data;
		};
	};
};
