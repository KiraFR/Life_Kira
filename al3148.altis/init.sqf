enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

private["_value","_invalidCharacters","_array"];
_value = name player;
_invalidCharacters = ["'","&",'"',"<",">","(",")","[","]"];
_array = [_value] call KRON_StrToArray;
_return = true;
{
	if(_x in _invalidCharacters) exitWith
	{
		_return = false; 
	};
} foreach _array;
if(!_return) exitWith {
	["invalidCharactersInName",false,true] call BIS_fnc_endMission;
	sleep 35;
};
