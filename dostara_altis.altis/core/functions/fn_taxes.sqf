/*
	File: fn_taxes.sqf
	Auteur: J. `Kira` D.

	Description:
	1. Epargne
	2. Courant
	3. Offshore
	4. Entreprise
	5. Organisme

	PARAMETRES:
	1. SCALAR(type)
		0. Depot
		1. Retrait
		2. virement
	RETURNS:
	1. SCALAR(%)

	CALL:
	[SCALAR] call life_fnc_taxes
*/
private["_ret","_typeSender","_typeDest","_first"];
_typeC = param[0,0,[0]];
_ret = 0;
switch (_typeC) do {
	case 0 : {
		_ac = missionNamespace getVariable ["AccountBanque",[]];
		{
			_dft = _x select 3;
			_type = [(_x select 1)] call life_fnc_typeCompte;
			if(_dft)exitWith{
				// Pour les types, voir description
				_ret = switch (_type) do {
					case 1 : {50}; //50€ et non 5000%
					case 2 : {0};
					case 3 : {0.05};
					case 4 : {0.02};
					default {0};
				};
			};
			_ret = switch (_type) do {
				case 1 : {50}; //50€ et non 5000%
				case 2 : {0};
				case 3 : {0.05};
				case 4 : {0.02};
				default {0};
			};
		}foreach _ac;
	}; 
	case 1 : {		
		_ac = missionNamespace getVariable ["AccountBanque",[]];
		{
			_dft = _x select 3;
			_first = [(_x select 4)] call life_fnc_bool;
			_type = [(_x select 1)] call life_fnc_typeCompte;
			if(_dft)exitWith{
				// Pour les types, voir description
				_ret = switch (_type) do {
					case 2 : {if(_first)then{1}else{0.05};};
					case 3 : {0.1};
					case 4 : {0.02};
					default {0};
				};
			};
			_ret = switch (_type) do {
				case 2 : {if(_first)then{1}else{0.05};};
				case 3 : {0.1};
				case 4 : {0.02};
				default {0};
			};
		}foreach _ac;
	}; 
	case 2 : {
		_dest = param[1,"",[""]];
		_sender = param[2,"",[""]];
		_ac = missionNamespace getVariable ["AccountBanque",[]];
		{
			if(_sender == (_x select 1)) exitWith{

				// Pour les types, voir description
				_typeSender = [_sender] call life_fnc_typeCompte;
				_typeDest = [_dest] call life_fnc_typeCompte;
				_first = [(_x select 4)] call life_fnc_bool;
				diag_log str(_first);
				_ret = switch (_typeSender) do {
					case 1 : {0}; //impossible
					case 2 : {
						if(_first)then{
							0.05
						}else{
							0.1
						};
					};
					case 3 : {
						if(_first)then{
							if(_typeDest isEqualTo _typeSender)then{0.05}else{0.15};
						}else{
							if(_typeDest isEqualTo _typeSender)then{0.1}else{0.2};
						};
					};
					case 4 : {0.05};
					case 5 : {0.025};
				};
			};
		}foreach _ac;
	};
	default {_ret = 0;}; 
};
_ret;