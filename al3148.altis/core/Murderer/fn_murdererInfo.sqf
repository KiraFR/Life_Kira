/*
    File: fn_murdererInfo.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
private["_display","_ret","_text","_name","job"];
_ret = _this;
disableSerialization;
_display = findDisplay 4800;
_info = _display displayCtrl 4804;
_price = call life_fnc_calculatePrice;

_list =[
	
	["%1",_name],
	["%2",_job],
	["%3",_price]
];

[_name,_job,getPlayerUID player, player] remoteExecCall ["ASSA_fnc_GetContract",2];