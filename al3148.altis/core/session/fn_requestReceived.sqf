#include <macro.h>
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
life_cash = parseNumber (_this select 2);

life_gear = _this select 8;
[] call life_fnc_loadGear;

_libank = _this select 28;
if(count _libank > 0) then{
	if(typeName (_libank select 1) == "STRING") then{
		life_atmcash = parseNumber (_libank select 1);
	}else{
		life_atmcash = (_libank select 1);
	};
	life_dflt = _libank select 0;
};

__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,0);

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
	_licence = [licence_civ_gouv ,license_civ_ebou];
	{if(_x) then {life_paycheck = 0;};} foreach _licence;
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);

		life_pPermis = _this select 12;
		life_nbrFoisPermis = _this select 13;
		_PermisDispo = _this select 14;

		if(_PermisDispo == 1)then{
			life_waitpermis = true;
		}else{
			life_waitpermis = false;
		};
		waitsleep = _this select 15;
		life_houses = _this select 18;

		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _This select 19;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
	};
};

life_num = _this select 20;
life_repertoire = _this select 22;

if(count (_this select 25) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 25);
};

switch (true) do {
	case (life_atmcash < 100000):{life_paycheck = 500;};
	case (life_atmcash > 100000):{life_paycheck = 200;};
	case (life_atmcash > 200000):{life_paycheck = 100;};
	case (life_atmcash > 300000):{life_paycheck = 50;};
	case (life_atmcash > 400000):{life_paycheck = 25;};
	case (life_atmcash > 500000):{life_paycheck = 0;};
	case (PlayerSide == west || PlayerSide == independent):{life_paycheck = 1200;};
};

life_nbAcc = _this select 26;
if((_this select 27) == 1) then {
	life_EnterAcc = true;
}else {
	life_EnterAcc = false;
};


life_session_completed = true;