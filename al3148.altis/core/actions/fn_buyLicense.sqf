/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};
	
if(((_license select 0) == "license_civ_driver"  || (_license select 0) == "license_civ_truck") && life_waitpermis) exitWith{
	titleText[parseText format["<t color='#FFCC00'><t size='2'><t align='center'>Vous ne pouvez pas acheter un permis maintenant,<br/><t align='left'><t size='1'> il vous reste: %1min ",(30 - waitsleep)],"PLAIN"];
};
if((_license select 0) == "license_civ_driver" || (_license select 0) == "license_civ_truck") then{
	if(!(missionNamespace getVariable "license_civ_truck") && !(missionNamespace getVariable "license_civ_driver")) then{
		life_nbrFoisPermis = life_nbrFoisPermis + 1;
		life_pPermis = 12;
		[8] call SOCK_fnc_updatePartial;
	};
};

life_cash = life_cash - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];

[getPlayerUID player, playerSide, [name player,_license select 1,_license select 0,_price],30] remoteExecCall ["DB_fnc_logs",2];