/*
	File: fn_stopAppel.sqf
	Auteur: J. `Kira` D.
	
	Description:
	stop l'appel

	CALL: 
	call Call_fnc_stopAppel;
*/
params[["_first",false,[false]]];
if((player getVariable ["tf_sendingDistanceMultiplicator",1]) != 1) then {
	player setVariable ["tf_sendingDistanceMultiplicator",1,true];
};
if((player getVariable ["tf_receivingDistanceMultiplicator",1]) != 1) then {
	player setVariable ["tf_receivingDistanceMultiplicator",1,true];
};
if((player getVariable ["tf_terrain_interception_coefficient",7]) != 7) then {
	player setVariable ["tf_terrain_interception_coefficient",7,true];
};
if(TF_tangent_sw_pressed) then {call TFAR_fnc_onSwTangentReleased;};
if(_first) then {[false] remoteExecCall ["Call_fnc_stopAppel",(missionNamespace getVariable "contact")];};
missionNamespace setVariable ["enCours",false];
missionNamespace setVariable ["contact",objNull];
missionNamespace setVariable ["FrequenceAppel",30];
_radio = call TFAR_fnc_activeSwRadio;
[_radio,(_radio call TFAR_fnc_getSwChannel) + 1,(missionNamespace getVariable "FrequenceAppel")] call TFAR_fnc_SetChannelFrequency;
