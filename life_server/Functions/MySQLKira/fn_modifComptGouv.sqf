/*
	File:  fn_modifComptGouv.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. BOOL (Addition/soustraction)
	2. SCALAR(montant)

	RETURNS:
	NONE

	CALL:
	[BOOL,SCALAR] call KIRA_fnc_modifComptGouv
*/
private _math = param[0,false,[false]]; //true = addition, false = soustraction
private _amount = param[1,0,[0]];
private _gouv = Bourse_Object getVariable ["MontantGouvernement",0];

if(_math)then{
	_gouv = _gouv + _amount;
}else{
	_gouv = _gouv - _amount;
};
Bourse_Object setVariable ["MontantGouvernement",_gouv];