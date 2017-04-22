/*
	File: fn_InsertFormNot.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme


	PARAMETRES:

	RETURNS:
	NONE

	CALL:
	[] call KIRA_fnc_InsertFormNot
*/
params[
	["_uid","",[""]],
	["_amount",0,[0]],
	["_to","",[""]],
	["_nomNotaire","",[""]],
	["_other","",[""]],
	["_taxe",0,[0]]
];


_query = format["INSERT INTO notaire(uidPlayer,amount,toPlayer,nomNotaire,other) VALUES(%1,%2,%3,%4,%5);
				 UPDATE gouvernement SET bankAcc=bankAcc+%6 WHERE nameGouv = 'Dostara';"];
[_query,1] call DB_fnc_asyncCall;