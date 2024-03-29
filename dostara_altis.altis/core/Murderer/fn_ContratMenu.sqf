#include "..\..\macro.h"
/*
    File: fn_ContratMenu.sqf
    Author: R. `KronosD` R.
    
    Description:
    Disposition de tout les infos dispo.
*/
disableSerialization;
private["_name","_job","_price","_type","_display","_list"];
params[
	["_name","",[""]],
	["_job","",[""]],
	["_price","",[""]],
	["_type","",[""]]
];
waitUntil {!isNull (findDisplay 5500)};
_display = findDisplay 5500;
_list = _display displayCtrl 5501;
_contrat = [_name,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContract",2];

lbClear _list;
{
	_name = _x select 0;
	_list lbAdd format ["%1",_name];
	_list lbSetData [(lbSize _list)-1,str(_x)];

}forEach _contrat;

(getControl(5500,5502)) ctrlSetStructuredText parseText format[
	(_name)+ " €%1<br/>
	" +(_job)+ " €%2<br/>
	" +(_price)+ " %3<br/>
	" +(_type)+ " %4<br/>
	"
];

[_name,_job,_price,_type,getPlayerUID player,player] remoteExecCall ["ASSA_fnc_GetContract",2];
