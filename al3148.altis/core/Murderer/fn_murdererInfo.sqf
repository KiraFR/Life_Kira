/*
    File: fn_murdererInfo.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
params[ ["_name","",[""]],["_job","",[""]]];
_price = [] call life_fnc_calculatePrice;
_list =[_name,_job,format["%1",_price]];

[_name,_job,getPlayerUID player, player] remoteExecCall ["ASSA_fnc_GetContract",2];
