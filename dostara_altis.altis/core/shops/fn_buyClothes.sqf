/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

/*
_detail = [uniform player] call life_fnc_fetchCfgDetails;
_uniform = getText(configFile >> (_details select 6) >> (typeOf (uniform player)) >> "DisplayName");

if(_price > life_cash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
life_cash = life_cash - _price;
//LOGS
[getPlayerUID player, playerSide, [name player, _uniform,uniform player,_price],14] remoteExecCall ["DB_fnc_logs",2];
*/

life_clothesPurchased = true;
closeDialog 0;
