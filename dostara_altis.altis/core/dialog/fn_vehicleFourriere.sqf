/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Vehicle Garage, why did I spawn this in an action its self?
*/
private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

life_fourriere_sp = [(_spawnPos modelToWorld [-10,0,0]),(getDir _spawnPos)-90];
life_fourriere_type = _type;
[getPlayerUID player,playerSide,_type,player] RemoteExecCall ["TON_fnc_getVehicles_fourriere",2];
createDialog "Life_fourriere_Menu";
disableSerialization;
ctrlSetText[18002,(localize "STR_ANOTF_QueryFourriere")];