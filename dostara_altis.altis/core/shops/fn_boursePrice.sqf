/*
	File: fn_boursePrice.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. STRING(RESSOURCE)

	RETURNS:
	NONE

	CALL:
	[STRING] call life_fnc_boursePrice
*/
private["_price"];
_rsc = param[0,"",[""]];
_ObjectBourse = Bourse_Object getVariable ["Bourse",nil];
if(isNil "_ObjectBourse") exitWith{hint "/!\ Prevenez un administrateur dès maintenant ! /!\ \n 
										 /!\ URGENCE TOTALE /!\ \n 
										 /!\ PAS DE RESSOURCE DANS L'OBJET BOURSE /!\"
								  };
{_rscBourse = _x select 0;if(_rsc == _rscBourse) exitWith {_price = _x select 1;};}foreach _ObjectBourse;
if(isNil "_price")exitWith{-1};
_price;