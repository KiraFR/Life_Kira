/*
	File: fn_taxes.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. SCALAR(type)
		0. Depot
		1. Retrait
		2. virement
		3. achat
	RETURNS:
	1. SCALAR(%)

	CALL:
	[SCALAR] call life_fnc_taxes
*/
private["_dftfound"];
_type = param[0,0,[0]];
_ret = 1;
switch (_type) do {
	case 0 : {
		_ac = missionNamespace getVariable ["accountBanque",[]];
		{
			_dft = _x select 3;
			_type = [(_x select 1)] call life_fnc_typeCompte;
			if(_dft)exitWith{
				/*
					1. Epargne
					2. Courant
					3. Offshore
					4. Entreprise
					5. Organisme
				*/
				_ret = switch (_type) do {
					case 1 : {50}; //50€ et non 5000%
					case 2 : {0};
					case 3 : {0.05};
					case 4 : {0.02};
					default {0};
				};
			};
		}foreach _ac;
	}; 
	case 1 : {		
		_ac = missionNamespace getVariable ["accountBanque",[]];
		{
			_dft = _x select 3;
			_first = _x select 4;
			_type = [(_x select 1)] call life_fnc_typeCompte;
			if(_dft)exitWith{
				/*
					1. Epargne
					2. Courant
					3. Offshore
					4. Entreprise
					5. Organisme
				*/
				_ret = switch (_type) do {
					case 2 : {if(_first)then{1}else{0.05};};
					case 3 : {0.1};
					case 4 : {0.02};
					default {0};
				};
			};
		}foreach _ac;
	}; 
	case 2 : {
		_dest = param[1,"",[""]];
		_type = [_dest] call life_fnc_typeCompte;
		_ac = missionNamespace getVariable ["accountBanque",[]];
		{
			_dft = _x select 3;
			_first = _x select 4;
			_type = [(_x select 1)] call life_fnc_typeCompte;
			if(_dft)exitWith{
				/*
					1. Epargne
					2. Courant
					3. Offshore
					4. Entreprise
					5. Organisme
				*/
				_ret = switch (_type) do {
					case 1 : {false}//impossible
					case 2 : {if(_first)then{0.05}else{0.1}};
					case 3 : {
						if(_first)then{
							if(_type == 3)then{0.05}else{0.15};
						}else{
							if(_type == 3)then{0.1}else{0.2};
						};
					};
					case 4 : {0.05};
					case 5 : {0.025};
				};
			};
		}foreach _ac;
	}; 
	case 3 : {}; 
	default {_ret = 1;}; 
};

_ret;