/*
    File: fn_murdererMenu.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
if(life_murderlevel == 0)exitWith {closeDialog 0;};
disableSerialization;
private["_name","_job","_price","_type","_display","_list"];
params[
	["_name","",[""]],
	["_job","",[""]],
	["_price","",[""]],
	["_type","",[""]]
];
waitUntil {!isNull (findDisplay 4800)};
_display = findDisplay 4800;
_list = _display displayCtrl 4803;
_contrat = [_name,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContractA",2];

lbClear _list;
{
	_name = _x select 0;
	_list lbAdd format ["%1",_name];
	_list lbSetData [(lbSize _list)-1,str(_x)];

}foreach _contrat;

(getControl(4800,4804)) ctrlSetStructuredText parseText format[
	(_name)+ " $%1<br/>
	" +(_job)+ " $%2<br/>
	" +(_price)+ " %3<br/>
	" +(_type)+ " %4<br/>
	"
];

[_name,_job,_price,_type,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContractA",2];
if(life_murderlevel == 0)exitWith {closeDialog 0;};
