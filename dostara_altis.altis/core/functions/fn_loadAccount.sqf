#include "..\..\macro.h"
/*
	File:  fn_loadAccount.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. ARRAY(tout les compte)
		select 0: courant.
		select 1: entreprise.
		select 2: offshore

	RETURNS:
	NONE

	CALL:
	[ARRAY] call KIRA_fnc_loadAccount
*/
private["_accCourant","_accOffshore","_cpt","_nb"];
_array = param[0,[],[[]]];
_array params [
	["_courant",[],[[]]],
	["_entreprise",[],[[]]],
	["_offshore",[],[[]]],
	["_organisme",[],[[]]]
];
_cpt = 0;
if(count _courant > 0) then{
	_accCourant = missionNamespace getVariable ["AccountBanque",[]];
	_nb = missionNameSpace getVariable ["life_AccN",0];
	{
		_default = [_x select 3] call life_fnc_bool;
		if(_default)then{
			BANK = if(typeName (_x select 2) == "STRING") then{
				parseNumber(_x select 2);
			}else{
				(_x select 2);
			};
		};
		_tab = [_x select 0,_x select 1,_x select 2,_default,_x select 4];
		_accCourant pushBack _tab;
		if(([_x select 1] call life_fnc_typeCompte) == 2)then{_nb = _nb +1;};
	}foreach _courant;
	missionNamespace setVariable ["AccountBanque",_accCourant];
	missionNameSpace setVariable ["life_AccN",_nb];
	_cpt = _cpt + _nb;
};

if(count _offshore > 0) then{
	_nb = missionNameSpace getVariable ["life_AccOffshore",0];
	{
		_tab = [_x select 0,_x select 1,_x select 2,([_x select 3] call life_fnc_bool),_x select 4];
		_accCourant pushBack _tab;
		_nb = _nb +1;
	}foreach _offshore;
	missionNamespace setVariable ["AccountBanque",_accCourant];
	missionNameSpace setVariable ["life_AccOffshore",_nb];
	_cpt = _cpt + _nb;
};
if(count _entreprise > 0) then{
	_accCourant pushBack _entreprise;
	missionNamespace setVariable ["AccountBanque",_accCourant];
	missionNameSpace setVariable ["life_EnterAcc",true];
};
if(count _organisme > 0) then{
	_accCourant = _accCourant + _organisme;
	missionNamespace setVariable ["AccountBanque",_accCourant];
	missionNameSpace setVariable ["life_OrgaAcc",true];
};
missionNameSpace setVariable ["life_nbAcc",_cpt];
