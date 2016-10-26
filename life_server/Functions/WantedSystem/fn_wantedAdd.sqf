/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
params[
	["_uid","",[""]],
	["_name","",[""]],
	["_type","",[""]],
	["_customBounty",-1,[0]]
];
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Homicide involontaire",6500]};
	case "187": {_type = ["Homicide",8500]};
	case "901": {_type = ["Evasion",4500]};
	case "261": {_type = ["Viol",5000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Tentative de Viol",3000]};
	case "215": {_type = ["Tentative de Vol",2000]};
	case "213": {_type = ["Utilisation d'explosifs illégaux",10000]};
	case "211": {_type = ["Braquage",1000]};
	case "207": {_type = ["Kidnapping",3500]};
	case "207A": {_type = ["Tentative de Kidnapping",2000]};
	case "487": {_type = ["Trouble de l'ordre public",1500]};
	case "488": {_type = ["Conduite sans feux",2000]};
	case "480": {_type = ["Délit de fuite",1300]};
	case "481": {_type = ["Possession de drogue",1000]};
	case "482": {_type = ["Conduite sans permis",5000]};
	case "483": {_type = ["Trafique de drogue",9500]};
	case "459": {_type = ["Cambriolage",6500]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
}
	else
{
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};

diag_log format["WANTED_LIST = %1", life_wanted_list];
_query = format["UPDATE wanted set list = '%1'",life_wanted_list];
_queryResult = [_query,1] call DB_fnc_asyncCall;