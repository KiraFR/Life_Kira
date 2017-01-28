/*
    File: fn_murdererMenu.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
if(__GETC__(life_murderlevel) == 0)exitWith {closeDialog 0;};
private["_display","_list","_name",];
waitUntil {!isNull (findDisplay 4800)};
_display = findDisplay 4800;
_list = _display displayCtrl 4803;
_contrat = [getPlayerUID player, _name] remoteExecCall ["ASSA_fnc_GetContract",2];

lbClear _list;
{
	_name = _x select 0;
	_list lbAdd format ["%1",_name];
	_list lbSetData [(lbSize _list)-1,str(_x)];

}foreach _contrat;
if(__GETC__(life_murderlevel) == 0)exitWith {closeDialog 0;};