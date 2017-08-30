/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = false;};
private["_gather","_diff","_lis","_itemName","_val","_ressourceZones","_zone","_object","_hasObject"];
_ressourceZones = ["apple_1","apple_2","apple_3","apple_4","heroin_1","cocaine_1","Cannabis_01","opium_1","wine_1","wine_2","Ress_Orange_01","Ress_Orange_02","Ress_Pêche_01","Ress_Pêche_02",
					"Ress_Pomme_01","Ress_Pomme_02","Ress_Raisin_01","Ress_Raisin_02","Ress_Alu_01","Ress_Alu_02","Ress_Argent_01","Ress_Bois_01","Ress_Bois_02","Ress_Bois_03","Ress_Bois_04",
					"Ress_Charbon_01","Ress_Charbon_02","Ress_Calcaire_01","Ress_Calcaire_02","Ress_Cuivre_01","Ress_Fer_01","Ress_Fer_02","Ress_Petrole_01","Ress_PP_01","Ress_Sable_01",
					"Ress_Sable_02","Ress_Sel_01","Ress_Cuivre_02"];
_zone = "";
//Find out what zone we're near
if(life_action_inUse)exitWith{};
{
	if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} forEach _ressourceZones;
_hasObject = true;
if(_zone == "") exitWith {life_action_inUse = false;};
//Get the ressource that will be gathered from the zone name...
_lis = null;
switch(true) do {
	case (_zone in ["Ress_Pomme_01","Ress_Pomme_02"]): {_gather = "Pommes"; _val = 3; _object = "Seau";};
	case (_zone in ["Ress_Pêche_01","Ress_Pêche_02"]): {_gather = "Peche"; _val = 3; _object = "Seau";};
	case (_zone in ["Ress_Orange_01","Ress_Orange_02"]): {_gather = "Orange"; _val = 3; _object = "Seau";};
	case (_zone in ["Ress_Raisin_01","Ress_Raisin_02"]): {_gather = "Raisin"; _val = 3; _object = "Seau";};
	case (_zone in ["Ress_Petrole_01"]): {_gather = "Petrole"; _val = 3; _object = "Seau";};

	case (_zone in ["Ress_Bois_01"]): {_gather = "Bois"; _val = floor(random(4)); _object = "Hache";_lis = license_civ_wood_01;};
	case (_zone in ["Ress_Bois_02"]): {_gather = "Bois"; _val = floor(random(4)); _object = "Hache";_lis = license_civ_wood_02;};
	case (_zone in ["Ress_Bois_03"]): {_gather = "Bois"; _val = floor(random(4)); _object = "Hache";_lis = license_civ_wood_03;};
	case (_zone in ["Ress_Bois_04"]): {_gather = "Bois"; _val = floor(random(4)); _object = "Hache";_lis = license_civ_wood_04;};

	case (_zone in ["Ress_Sable_02","Ress_Sable_01"]): {_gather = "Sable"; _val = floor(random(5)); _object = "Pelle";};
	case (_zone in ["Ress_Alu_01","Ress_Alu_02"]): {_gather = "Aluminium_Brut"; _val = floor(random(3)); _object = "Pioche";};
	case (_zone in ["Ress_Calcaire_01","Ress_Calcaire_02"]): {_gather = "Calcaire"; _val = floor(random(3)); _object = "Pelle";};
	case (_zone in ["Ress_Charbon_01","Ress_Charbon_02"]): {_gather = "Charbons"; _val = floor(random(3)); _object = "Pelle";};
	case (_zone in ["Ress_Cuivre_01","Ress_Cuivre_02"]): {_gather = "Cuivre_Brut"; _val = floor(random(3)); _object = "Pioche";};
	case (_zone in ["Ress_Fer_01","Ress_Fer_02"]): {_gather = "Fer_Brut"; _val = floor(random(3)); _object = "Pioche";};
	case (_zone in ["Ress_Sel_01"]): {_gather = "Sel"; _val = floor(random(3)); _object = "Pelle";};
	case (_zone in ["Ress_PP_01"]): {_gather = "Pierres_Precieuses_Brut"; _val = floor(random(3)); _object = "Pioche";};
	case (_zone in ["Ress_Argent_01"]): {_gather = "Argent_Brut"; _val = floor(random(3)); _object = "Pioche";};
	case (_zone in ["Cannabis_01"]): {_gather = "Cannabis"; _val = floor(random(3)); _object = "";};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {};
if(_val == 0) exitWith{hint "Votre récolte n'est pas bonne, vous avez jeté ce que vous avez recolté.";};

if (_lis != null) then {
    if (!_lis) exitWith {
        hint format["Vous n'avez pas la license %1 pour récolter la ressource : %2.",([toString _lis] call life_fnc_varToStr),_gather];
    };
};

if (!(_object == "")) then {
    _var = [_object,0] call life_fnc_varHandle;
    if((missionNamespace getVariable _var) <= 0) exitWith {_hasObject = false;hint format["Vous n'avez pas de %1 pour récolter la ressource : %2.",_object,_gather];};
};

if(!_hasObject)exitWith{hint format["Vous n'avez pas de %1 pour récolter la ressource : %2.",_object,_gather];};
_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 2.5;
};

if([true,_gather,_diff] call life_fnc_handleInv) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
