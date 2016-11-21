#include "..\..\macro.h"
/*
	File: fn_impot.sqf
	Author: J `Kira` D
	
	Description:
	fais les impôts
*/
private["_all","_queryCashR","_queryuidGR","_bankE","_bankG","_listG","_who"];
params ["_type","_uid","_owner"];
_all = 0;
_listG = [];
_queryuidGR = ["SELECT LAST(total) FROM gouv",2] call DB_fnc_asyncCall;
_queryuidGR = _queryuidGR select 0;
switch(_type) do {

	//joueur
	case 0: {
		//
			{
				if(side _x == civilian && getPlayerUID _x != _uid) then{
					_queryCash = format["SELECT bankacc FROM players WHERE playerid='%1'",getPlayerUID _x];
					_queryCashR = [_queryCash,2] call DB_fnc_asyncCall;
					_queryCashR = _queryCashR select 0;
					if(_queryCashR < 1000000) exitWith{};
					if((1000000 < _queryCashR) && (_queryCashR < 5000000)) then {
						_one = _queryCashR * 1/100;
						_queryCashR = _queryCashR - _one;
						_all = _all + _one;
					};
					if((5000000 < _queryCashR) && (_queryCashR < 10000000)) then {
						_three = _queryCashR * 3/100;
						_queryCashR = _queryCashR - _three;
						_all = _all + _three;
					};
					if(10000000 < _queryCashR) then {
						_six = _queryCashR * 6/100;
						_queryCashR = _queryCashR - _six;
						_all = _all + _six;
					};
					_query = format["UPDATE players SET bankacc='%1' WHERE playerid='%2'",_queryCashR,getPlayerUID _x];
					[_query,1] call DB_fnc_asyncCall;
					_ownerID = owner _x;
					[0,_queryCashR] RemoteExecCall ["life_fnc_RefreshReceived",_ownerID];
				};
			}forEach playableUnits;
		_who = "civ";
	};

	//entreprise
	case 1:{
		_queryEntre = "SELECT id,bank FROM gangs WHERE active = '1' AND entreprise='1'";
		_queryEntreR = [_queryEntre,2,true] call DB_fnc_asyncCall;
		{
			_bankE = _x select 1;
			switch(true) do {
				case ((1000000 < _bankE) && (_bankE < 5000000)):{
					_two = _bankE * 2/100;
					_bankE = _bankE - _two;
					_all = _all + _two;
				};
				case ((5000000 < _bankE) && (_bankE < 10000000)):{
					_four = _bankE * 4/100;
					_bankE = _bankE - _four;
					_all = _all + _four;
				};
				case (10000000 < _bankE):{
					_eight = _bankE * 8/100;
					_bankE = _bankE - _eight;
					_all = _all + _eight;
				};
				default{};
			};
			_query = format["UPDATE gangs SET bank='%1' WHERE id='%2'",_bankE,_x select 0];
			[_query,1] call DB_fnc_asyncCall;
			_list = [_x select 0,_bankE];
			_listG pushBack _list;
		}foreach _queryEntreR;
		[1,_listG] RemoteExecCall ["life_fnc_RefreshReceived",RCLIENT];
		_who = "entreprise";
	};
};
_total = _queryuidGR + _all;
_query = format["INSERT INTO gouv (par,montant, type, pour, total) VALUE ('%1','%2,'""Impot""','%3','%4') WHERE playerid='%1'",_uid,_all,_who,_total];
[_query,1] call DB_fnc_asyncCall;
[0,_all] RemoteExecCall ["life_fnc_RefreshReceived",(owner _owner)];