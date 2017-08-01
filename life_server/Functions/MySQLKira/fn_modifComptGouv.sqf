/*
	File:  fn_modifComptGouv.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. SCALAR(montant)

	RETURNS:
	NONE

	CALL:
	[SCALAR] call KIRA_fnc_modifComptGouv
*/
_amount = param[0,0,[0]];

_gouv = Bourse_Object getVariable ["MontantGouvernement",0];
_gouv = _gouv - _amount;
Bourse_Object setVariable ["MontantGouvernement",_gouv];