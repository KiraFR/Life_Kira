/*
	File: fn_gatherVinu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gathers apples?
*/
private["_sum"];
_sum = ["vinu",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText[format[(localize "STR_NOTF_Gathering"),localize "STR_Item_Vinu"],"PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 2;
	if(([true,"vinu",_sum] call life_fnc_handleInv)) then
	{
		titleText[format[(localize "STR_NOTF_Picked"),_sum,localize "STR_Item_Vinu"],"PLAIN"];
	};
}
	else
{
	hint localize "STR_NOTF_InvFull";
};

life_action_inUse = false;