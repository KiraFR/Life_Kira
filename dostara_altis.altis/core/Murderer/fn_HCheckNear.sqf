/*
	File: fn_HCheckNear.sqf
	Auteur: J. `Kira` D.
	
	Description:
	plus de radio
	
	PARAMETRES:
	NONE
	
	RETURNS: 
	NONE 

	CALL: 
	call HACK_fnc_HCheckNear
*/
private["_data"];
if((missionNamespace getVariable "HackAction") == 0) then{
	call HACK_fnc_HCallFlics;
}else{
	_chance = (missionNamespace getVariable "HackAction")*(life_chanceHack);
	_random = floor(random(100));
	if(_random < _chance)then{
		call HACK_fnc_HCallFlics;
	};
	missionNamespace setVariable ["HackAction",(missionNamespace getVariable "HackAction")-1];
};

hackerBankRequest = player;
publicVariableServer "hackerBankRequest";

if(!(isNil {missionNamespace getVariable ["listnear",[]]})) then{missionNamespace setVariable ["listnear",[]];};
"hackerBankReturn" addPublicVariableEventHandler {
_data = (_this select 1);};
_listnear = missionNamespace getVariable ["listnear",[]];

{

}forEach (_data select 0);

/*
{
	if((_x distance player) < 10) then {
			_listnear pushBack [life_numforEach(_x),name _x,life_numAccforEach(_x),_packet];
		};
	};
}forEach allUnits;
*/

hackerBankRequest = nil;