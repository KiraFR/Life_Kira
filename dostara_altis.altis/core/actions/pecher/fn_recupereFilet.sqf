/*
	File: fn_recupereFilet.sqf
	Author: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. OBJECT (bateau)

	RETURNS:
	NONE

	CALL:
	[OBJECT] spawn life_fnc_recupereFilet
*/
private _boat = param[0,objNull,[objNull]];
private _poissons = _boat getVariable ["poissons",[]];
private _boat_data = _boat getVariable ["Trunk",[[],0]];
private _filet = _boat getVariable ["filetInUse",""];
private _totalWeight = [_boat] call life_fnc_vehicleWeight;
private _inventaire = _boat_data param[0,[],[[]]];
private _weight = _totalWeight select 0;
private _used = _totalWeight select 1;
if !(_used isEqualTo _weight)then
{
	{
		_weightFish = [_x] call life_fnc_itemWeight;
		if((_used + _weightFish) <= _weight)then{
			_index = [_x,_inventaire] call life_fnc_index;
			if(_index == -1)then{
				_inventaire pushBack [_x,1];
			}else{
				_res = (_inventaire select _index) select 1;
				_inventaire set [_index,[_x,(_res + 1)]];
			};
			_used = _used + _weightFish;
		};
	}foreach _poissons;
	_boat setVariable ["Trunk",[_inventaire,_used],true];
	[_boat] call life_fnc_vehInventory;
}else{
	hint "Votre bateau ne peut contenir plus de poisson.";
};

_id = _boat getVariable ["idAction",nil];
_boat setVariable ['InUsefishing',nil,true];
_boat setVariable ["poissons",nil,true];
if !(isNil "_id")then{
	_boat removeAction _id;
	_boat setVariable ["idAction",nil,true];
};
[true,_filet,1] call life_fnc_handleInv;