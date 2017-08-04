#include "..\..\macro.h"
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
CASH = parseNumber (_this select 2);

life_gear = _this select 7;
[] call life_fnc_loadGear;

CONSTANT(life_adminlevel,(_this select 3));
CONSTANT(life_donator,0);

//Loop through licenses
if(count (_this select 5) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} forEach (_this select 5);
	_licence = [license_civ_gouv ,license_civ_ebou];
	{if(_x) exitWith {life_paycheck = 0;};} forEach _licence;
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		CONSTANT(life_coplevel, parseNumber(_this select 6));
		CONSTANT(life_medicLevel,0);
		life_blacklisted = _this select 8;
		_num = _this select 9;
		if(_num != "")then{player setVariable ["phoneNumber",_num,true];};

		_bank = _this select 10;
		_nbBank = _bank select 1;
		if(_nbBank > 0)then{[(_bank select 0)] call life_fnc_loadAccount;};


		if(count (_this select 11) > 0) then {
			{life_vehicles pushBack _x;} forEach (_this select 11);
		};
	};

	case civilian: {
		civ_position = _this select 8;
		life_is_alive = _this select 9;
		life_is_arrested = _this select 6;
		CONSTANT(life_coplevel, 0);
		CONSTANT(life_medicLevel, 0);

		life_houses = _this select 10;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		}forEach life_houses;

		life_gangData = _This select 11;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;

		_num = _this select 12;
		if(_num != "")then{player setVariable ["phoneNumber",_num,true];};

		life_pPermis = _this select 13;
		life_nbrFoisPermis = _this select 14;
		_PermisDispo = _this select 15;
		if(isNil "_PermisDispo") then {
			if(_PermisDispo == 1)then{
				life_waitpermis = true;
			}else{
				life_waitpermis = false;
			};
			waitsleep = _this select 16;
		};

		_bank = _this select 17;
		_nbBank = _bank select 1;
		if(_nbBank > 0)then{[(_bank select 0)] call life_fnc_loadAccount;};

		if(count (_this select 18) > 0) then {
			{life_vehicles pushBack _x;} forEach (_this select 18);
		};
	};

	case independent: {
		CONSTANT(life_medicLevel, parseNumber(_this select 6));
		CONSTANT(life_coplevel,0);

		_num = _this select 8;
		if(_num != "")then{player setVariable ["phoneNumber",_num,true];};

		_bank = _this select 9;
		_nbBank = _bank select 1;
		if(_nbBank > 0)then{[(_bank select 0)] call life_fnc_loadAccount;};

		if(count (_this select 10) > 0) then {
			{life_vehicles pushBack _x;} forEach (_this select 10);
		};
	};
};

life_session_completed = true;
