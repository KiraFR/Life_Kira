#include "\life_server\script_macros.hpp"
/*
	File: fn_managesc.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	User management of whether or not they want to be on a sidechat for their side.
*/
private["_unit","_bool","_side"];
params[
	["_unit",ObjNull,[ObjNull]],
	["_bool",false,[false]],
	["_side",civilian,[west]]
];

if(isNull _unit) exitWith {};

switch (_side) do
{
	case west:
	{
		if(_bool) then
		{
			life_radio_west radioChannelAdd [_unit];
		}
			else
		{
			life_radio_west radioChannelRemove [_unit];
		};
	};
	
	case civilian:
	{
		if(_bool) then
		{
			life_radio_civ radioChannelAdd [_unit];
		}
			else
		{
			life_radio_civ radioChannelRemove [_unit];
		};
	};
	
	case independent:
	{
		if(_bool) then
		{
			life_radio_indep radioChannelAdd [_unit];
		}
			else
		{
			life_radio_indep radioChannelRemove [_unit];
		};
	};
};