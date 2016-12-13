/*
	File: fn_lbAccounts.sqf
	Modifié par: R. `KronosD` R.
	
	Description:
	Kira: plein de Listes + modification dialog, j'ai pris celui de l'allemand et l'a bien modifié
*/
Private["_tab","_default"];
disableSerialization;
waitUntil {!isNull findDisplay 16000};
_display = findDisplay 16000;
_AccountList = _display displayCtrl 16501;

{
	_default = _x select 6;
	_tab = [_x select 1,_x select 2,_x select 3,_x select 4,_x select 5];
	if(_default == 1) then{"Oui" pushBack _tab;}else{"Non" pushBack _tab;};
	
	diag_log format["%1",_tab];
	_AccountList lnbAddRow _tab;
	_AccountList lnbSetData [[((lnbSize _AccountList) select 0)-1,0],str([value select 0,value select 5])]
}foreach list_compte;