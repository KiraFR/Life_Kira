#include "..\macro.h"
/*
	File: fn_lbAccounts.sqf
	Modifié par: R. `KronosD` R.

	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
private["_tab","_default","_offshore"];
disableSerialization;
_AccountList = getControl(1600,1601);
list_compte = _this;
diag_log format["%1",list_compte];

{
	_default = _x select 5;
	_offshore = _x select 3;
	_rowData = [_x select 0,_x select 4];
	_tab = [
		_x select 1,
		_x select 2,
		if (_offshore == 1) then {"Oui"} else {"Non"},
		"Non",
		format["%1€",_x select 4],
		if (_default == 1) then {"Oui"} else {"Non"}];
	_AccountList lnbAddRow _tab;
	_AccountList lnbSetData [[((lnbSize _AccountList) select 0)-1,0],str(_rowData)];
}forEach list_compte;
