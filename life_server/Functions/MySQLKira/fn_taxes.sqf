/*
	File:  fn_taxes.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme


	PARAMETRES:
	1. SCALAR(cash)
	2. SCALAR(banque)
	3. SCALAR(montant)
	4. SCALAR(Taxes)
	5. STRING(type)
	6. STRING(UID)

	RETURNS:
	NONE

	CALL:
	[SCALAR,SCALAR,SCALAR,SCALAR,STRING,STRING] call KIRA_fnc_taxes
*/
params[
	["_cash",0,[0]],
	["_bank",0,[0]],
	["_montant",0,[0]],
	["_Taxes",0,[0]],
	["_type","",[""]],
	["_uid","",[""]]
];
if(_uid == "" OR _cash == 0 OR _type == "" OR _montant == 0 OR _bank == 0) exitWith{};
_query = format["INSERT INTO logs (pid,cash,bank,montant,taxes,type) VALUES('%1',%2,%3,%4,%5,""%6"");
				 UPDATE banque SET bankacc=bankacc+%5 WHERE numcompte='GD0000001'",_uid,_cash,_bank,_montant,_Taxes,_type];
[_query,1] call DB_fnc_asyncCall;


// je verrais comment fonctionne les comptes gouvernement.
//Bourse_Object getVariable ["MontantGouv",0];