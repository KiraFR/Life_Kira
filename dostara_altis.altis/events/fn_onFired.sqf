/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles various different ammo types being fired.
*/
params [
  ["_unit",objNull,[objNull]],
  ["_weapon","",[""]],
  ["_muzzle","",[""]],
  ["_mode","",[""]],
  ["_ammo","",[""]],
  ["_magazine","",[""]],
  ["_projectile",objNull,[objNull]],
  ["_gunner",objNull,[objNull]]
];

if(_ammoType == "GrenadeHand_stone") then {
	_projectile spawn {
		private["_position"];
		while {!isNull _this} do {
			_position = getPosATL _this;
			sleep 0.1;
		};
		[_position] RemoteExecCall ["life_fnc_flashbang",0];
	};
};
