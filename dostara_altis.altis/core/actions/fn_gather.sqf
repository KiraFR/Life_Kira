/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_3","apple_4","heroin_1","cocaine_1","weed_1","opium_1","wine_1","wine_2","Ress_Orange_01","Ress_Orange_02","Ress_Pêche_01","Ress_Pêche_02",
					"Ress_Pomme_01","Ress_Pomme_02","Ress_Raisin_01","Ress_Raisin_02","Ress_Alu_01","Ress_Alu_02","Ress_Argent_01","Ress_Bois_01","Ress_Bois_02","Ress_Bois_03","Ress_Bois_04",
					"Ress_Charbon_01","Ress_Charbon_02","Ress_Calcaire_01","Ress_Calcaire_02","Ress_Cuivre_01","Ress_Fer_01","Ress_Fer_02","Ress_Petrole_01","Ress_PP_01","Ress_Sable_01",
					"Ress_Sable_02","Ress_Sel_01"];
_zone = "";
//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} forEach _resourceZones;

if(_zone == "") exitWith {
	life_action_inUse = false;
};
//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["Ress_Pomme_01","Ress_Pomme_02"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["Ress_Pêche_01","Ress_Pêche_02"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["wine_1","wine_2"]): {_gather = "vinu"; _val = 3;};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["opium_1"]): {_gather = "opiumn"; _val = 1;};
	case (_zone in ["Ress_Bois_01","Ress_Bois_02","Ress_Bois_03","Ress_Bois_04"]): {_gather = "Bois"; _val = floor(random(4));};
	case (_zone in ["Ress_Sable_02","Ress_Sable_01"]): {_gather = "sand"; _val = floor(random(5));};
	case (_zone in ["Ress_Raisin_01","Ress_Raisin_02"]): {_gather = "sand"; _val = floor(random(5));};
	case (_zone in ["Ress_Alu_01","Ress_Alu_02"]): {_gather = "AluminiumB"; _val = floor(random(3));};
	case (_zone in ["Ress_Orange_01","Ress_Orange_02"]): {_gather = "Orange"; _val = floor(random(3));};
	case (_zone in ["Ress_Calcaire_01","Ress_Calcaire_02"]): {_gather = "Calcaire"; _val = floor(random(3));};
	case (_zone in ["Ress_Charbon_01","Ress_Charbon_02"]): {_gather = "Charbon"; _val = floor(random(3));};
	case (_zone in ["Ress_Cuivre_01"]): {_gather = "copperB"; _val = floor(random(3));};
	case (_zone in ["Ress_Fer_01","Ress_Fer_02"]): {_gather = "FerB"; _val = floor(random(3));};
	case (_zone in ["Ress_Sel_01"]): {_gather = "salt_r"; _val = floor(random(3));};
	case (_zone in ["Ress_PP_01"]): {_gather = "rockB"; _val = floor(random(3));};
	case (_zone in ["Ress_Petrole_01"]): {_gather = "oil"; _val = floor(random(3));};
	case (_zone in ["Ress_Argent_01"]): {_gather = "ArgentB"; _val = floor(random(3));};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};
if(_val == 0) exitWith{hint "Votre recolte est pas bonne, vous avez jeter ce que vous avez recolté.";};
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
