/*
	File: fn_priceVehBuy.sqf
	Author: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. STRING(classname)

	RETURNS:
	1. SCALAR (Prix vehicule)

	CALL:
	[STRING] call life_fnc_priceVehBuy
*/
private _vehicle = param[0,"",[""]];
private _list = life_shopList;
private _index = -1;
private _price = -1;

{
	_listVeh = [_x] call life_fnc_vehicleListCfg;
	_index = [_vehicle,_listVeh] call life_fnc_index;
	if(_index != -1) exitWith{
		_price = (_listVeh select _index) select 1;
	};
}forEach _list;

if(_price == -1)exitWith{500};
_price;