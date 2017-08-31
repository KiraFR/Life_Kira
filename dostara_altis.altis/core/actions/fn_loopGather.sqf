/*
	File: fn_loopGather.sqf
	Auteur: J. `Kira` D.

	Description:
	flemme

	PARAMETRES:
	1. STRING(RESSOURCE)

	RETURNS:
	NONE

	CALL:
	[STRING] spawn life_fnc_loopGather
*/
private ["_gather","_val"];
private _zone = param[0,"",[""]];
while{life_gathering} do {
	if(player distance (getMarkerPos _zone) > 30)exitWith{life_gathering = false;};
	if(!alive player)exitWith{life_gathering = false;};
	private _lis = "";
	private _hasObject = true;
	private _object = "";
	switch(true) do {
		case (_zone in ["Ress_Pomme_01","Ress_Pomme_02"]): {_gather = "Pommes"; _val = 3; _object = "Seau";};
		case (_zone in ["Ress_Pêche_01","Ress_Pêche_02"]): {_gather = "Peche"; _val = 3; _object = "Seau";};
		case (_zone in ["Ress_Orange_01","Ress_Orange_02"]): {_gather = "Orange"; _val = 3; _object = "Seau";};
		case (_zone in ["Ress_Raisin_01","Ress_Raisin_02"]): {_gather = "Raisin"; _val = 3; _object = "Seau";};
		case (_zone in ["Ress_Petrole_01"]): {_gather = "Petrole"; _val = 3; _object = "Seau";};

		case (_zone in ["Ress_Bois_01"]): {_gather = "Bois"; _val = floor(random(4));_lis = "license_civ_wood_01";};
		case (_zone in ["Ress_Bois_02"]): {_gather = "Bois"; _val = floor(random(4));_lis = "license_civ_wood_02";};
		case (_zone in ["Ress_Bois_03"]): {_gather = "Bois"; _val = floor(random(4));_lis = "license_civ_wood_03";};
		case (_zone in ["Ress_Bois_04"]): {_gather = "Bois"; _val = floor(random(4));_lis = "license_civ_wood_04";};

		case (_zone in ["Ress_Sable_02","Ress_Sable_01"]): {_gather = "Sable"; _val = floor(random(5)); _object = "Pelle";};
		case (_zone in ["Ress_Alu_01","Ress_Alu_02"]): {_gather = "Aluminium_Brut"; _val = floor(random(3)); _object = "Pioche";};
		case (_zone in ["Ress_Calcaire_01","Ress_Calcaire_02"]): {_gather = "Calcaire"; _val = floor(random(3)); _object = "Pelle";};
		case (_zone in ["Ress_Charbon_01","Ress_Charbon_02"]): {_gather = "Charbons"; _val = floor(random(3)); _object = "Pelle";};
		case (_zone in ["Ress_Cuivre_01","Ress_Cuivre_02"]): {_gather = "Cuivre_Brut"; _val = floor(random(3)); _object = "Pioche";};
		case (_zone in ["Ress_Fer_01","Ress_Fer_02"]): {_gather = "Fer_Brut"; _val = floor(random(3)); _object = "Pioche";};
		case (_zone in ["Ress_Sel_01"]): {_gather = "Sel"; _val = floor(random(3)); _object = "Pelle";};
		case (_zone in ["Ress_PP_01"]): {_gather = "Pierres_Precieuses_Brut"; _val = floor(random(3)); _object = "Pioche";};
		case (_zone in ["Ress_Argent_01"]): {_gather = "Argent_Brut"; _val = floor(random(3)); _object = "Pioche";};
		case (_zone in ["Cannabis_01","Cannabis_02","Cannabis_03"]): {_gather = "Cannabis"; _val = floor(random(3));};
		case (_zone in ["Coca_01","Coca_02"]): {_gather = "Coca"; _val = floor(random(3));};
		case (_zone in ["Pavot_01","Pavot_02"]): {_gather = "Opium"; _val = floor(random(3));};
		default {""};
	};
	//gather check??
	if(vehicle player != player) exitWith {life_gathering = false;};
	if(_val == 0) exitWith{hint "Votre récolte n'est pas bonne, vous avez jeté ce que vous avez recolté.";life_gathering = false;};

	if (_lis != "") then {
		_hasLicense = missionNamespace getVariable _lis;
	    if (!_hasLicense) exitWith {
	        hint format["Vous n'avez pas la licence %1 pour récolter la ressource : %2.",([_lis] call life_fnc_varToStr),_gather];
	        life_gathering = false;
	    };
	};

	if (!(_object == "")) then {
	    _var = [_object,0] call life_fnc_varHandle;
	    if((missionNamespace getVariable _var) <= 0) exitWith {
	    	_hasObject = false;
	    	hint format["Vous n'avez pas de %1 pour récolter la ressource : %2.",_object,_gather];
	    	life_gathering = false;
	    };
	};

	if(!_hasObject)exitWith{hint format["Vous n'avez pas de %1 pour récolter la ressource : %2.",_object,_gather];life_gathering = false;};
	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull";life_gathering = false;};
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
};