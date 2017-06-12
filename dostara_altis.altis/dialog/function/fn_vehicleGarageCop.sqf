private["_spawnPos","_dir","_type"];
_type = [_this,1,"",[""]] call BIS_fnc_param;
_spawnPos = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

life_garage_sp = [(_spawnPos modelToWorld [-10,0,0]),(getDir _spawnPos)-90];
life_garage_type = _type;
["cop",_type,player] RemoteExecCall ["TON_fnc_getVehiclesCop",2];
createDialog "Life_impoundCop_menu";
disableSerialization;
ctrlSetText[12802,(localize "STR_ANOTF_QueryGarage")];
