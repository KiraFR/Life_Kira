/*
	File: fn_gatherOpium.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers opium?
*/
private["_sum"];
_sum = ["opiumn",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText[format[localize "STR_NOTF_Gathering",localize "STR_Item_Opiumn"],"PLAIN"];
	titleFadeOut 5;
	sleep 5;
	if(([true,"opiumn",1] call life_fnc_handleInv)) then
	{
		titleText[format[localize "STR_NOTF_Collected",localize "STR_Item_Opiumn"],"PLAIN"];
	};
};

life_action_inUse = false;