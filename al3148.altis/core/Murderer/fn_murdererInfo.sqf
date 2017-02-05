/*
    File: fn_murdererInfo.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
params[
	["_name","",[""]],
	["_job","",[""]],
	["_price","",[""]]
];
_list =[
	
	_name,
	_job,
	_price
];

[_name,_job,_price,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContract",2];