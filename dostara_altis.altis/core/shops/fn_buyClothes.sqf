#include "..\..\macro.h"
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
} forEach life_clothing_purchase;

if(_price > CASH) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
CASH = CASH - _price;

life_clothesPurchased = true;
closeDialog 0;
