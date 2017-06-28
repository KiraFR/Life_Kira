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
private["_accCourant","_accOffshore"];
_array = param[0,[],[[]]];
_courant = _array param[0,[],[[]]];
_entreprise = _array param[1,[],[[]]];
_offshore = _array param[2,[],[[]]];
if(count _courant > 0) then{
	_accCourant = missionNamespace getVariable ["AccountBanque",[]];
	{
		_tab = [_x select 0,_x select 1,_x select 2,([_x select 3] call life_fnc_bool)];
		_accCourant pushBack _tab;
	}foreach _courant;
	missionNamespace setVariable ["AccountBanque",_accCourant];
};

if(count _entreprise > 0) then{
	_accOffshore = missionNamespace getVariable ["AccountBanqueOffshore",[]];
	{
		_tab = [_x select 0,_x select 1,_x select 2,([_x select 3] call life_fnc_bool)];
		_accOffshore pushBack _tab;
	}foreach _offshore;
	missionNamespace setVariable ["AccountBanqueOffshore",_accOffshore];
};
if(count _offshore > 0) then{missionNamespace setVariable ["AccountBanqueEntreprise",_entreprise];};