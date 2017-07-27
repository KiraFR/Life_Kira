#include "..\..\macro.h"
private _ac = missionNamespace getVariable ["AccountBanque",[]];
{
	_tab = _x;
	_dft = _x select 3;
	if(_dft)exitWith{
	    _tab set [2,BANK];
	    _ac set[_forEachIndex,_tab];
	};
}forEach _ac;
missionNamespace setVariable ["AccountBanque",_ac];