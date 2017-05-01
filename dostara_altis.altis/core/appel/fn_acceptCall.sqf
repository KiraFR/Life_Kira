/*
	File: fn_acceptCall.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Décrocher
	
	PARAM:
	1: JOUEUR(OBJECT)
	2: FREQUENCE(STRING)

	CALL:
	[JOUEUR,FREQUENCE] spawn Call_fnc_appelEnCours;
*/
params[["_unit",objNull,[objNull]],["_frequence","",[""]]];
if(!(isNil {missionNamespace getVariable "enCours"}))then{
	if(missionNamespace getVariable "enCours") exitWith {
		[] remoteExecCall ["Call_fnc_refuseCall",_unit];
	};
};
_result = [format["%1 vous appelle, lui repondre ?",name _unit], "Êtes vous sur ?", true, true] call BIS_fnc_GUImessage;
if(_result) then {
	missionNamespace setVariable ["enCours",true];
	missionNamespace setVariable ["contact",_unit];
	missionNamespace setVariable ["FrequenceAppel",str(round(random(4999) + 45000))];
	[player,(missionNamespace getVariable "FrequenceAppel")] remoteExecCall ["Call_fnc_calling_received",_unit];
	if(TF_tangent_sw_pressed) then {call TFAR_fnc_onSwTangentReleased;};
	[] call Call_fnc_appelEnCours;
}else{
	[] remoteExecCall ["Call_fnc_refuseCall",_unit];
};