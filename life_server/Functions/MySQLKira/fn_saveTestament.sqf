/*
	File: fn_saveTestament.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme


	PARAMETRES:
	1. STRING(UID PLAYER)
	2. STRING(Nom)
	3. STRING(prix)
	4. STRING(prix Notaire)
	5. STRING(Nom Notaire)
	6. STRING(description)
	7. STRING(Nom du destinataire)

	RETURNS:
	NONE

	CALL:
	[STRING,STRING,STRING,STRING,STRING,STRING,STRING] remoteExecCall KIRA_fnc_SaveTestament
*/
private["_query"];
_query = "INSERT INTO notaire(uidPlayer,nomCl,amount,realAmount,nomNotaire,description,date,toPlayer) VALUES(";

{
	_query = _query + ":" _x;
}foreach _this;
_query = _query + ");";
diag_log _query;

if(_query == "")exitWith{};
[_query,1] call DB_fnc_asyncCall;