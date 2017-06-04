/*
    File: fn_listActif.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
if(life_murderlevel == 0)exitWith {closeDialog 0;};
disableSerialization;
private["_name","_display","_list"];
params[
	["_name","",[""]]
];
waitUntil {!isNull (findDisplay 4900)};
_display = findDisplay 4900;
_list = _display displayCtrl 4901;
_contrat = [_name,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContractActif",2];

lbClear _list;
{
	_name = _x select 0;
	_list lbAdd format ["%1",_name];
	_list lbSetData [(lbSize _list)-1,str(_x)];

}forEach _contrat;

[_name,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContractActif",2];
if(life_murderlevel == 0)exitWith {closeDialog 0;};