 #include "\life_server\script_macros.hpp"
/*
	File: fn_ContratMurd.sqf
	Author: R. `KronosD` R.

	Description:
	Ajoute du contrat dans la base de donné
*/
params[
	["_uid","",[""]],
	["_job","",[""]],
	["_name","",[""]],
	["_price","",[""]],
	["_type","",[""]],
	["_side","",[""]]
];
if((_uid == "") OR (_name == "")) exitWith {};

_insertContrat = format["INSERT INTO assasin (deuid, targetname, targetjob, price, deside, type) VALUES('%1','%3','%2','%4','%5','%6')",_uid,_job,_name,_price,_side,_type];
[_insertContrat,1] call DB_fnc_asyncCall;