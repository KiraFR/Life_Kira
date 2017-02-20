#include "..\..\macro.h"
/*
	File: fn_appelEnCours.sqf
	Auteur: J. `Kira` D.
	
	Description:
	Appel en cours
	
	PARAMETRES:
	1: BOOLEAN
		
	CALL: 
	[BOOLEAN] call Call_fnc_appelEnCours
*/
private["_radio","_channel"];
_radio = call TFAR_fnc_activeSwRadio;
_channel = (_radio call TFAR_fnc_getSwChannel) + 1;
hint (missionNamespace getVariable "FrequenceAppel");
if(missionNamespace getVariable "enCours") then {
	while {missionNamespace getVariable "enCours"} do{
		if(([_radio,_channel] call TFAR_fnc_GetChannelFrequency) isEqualTo (missionNamespace getVariable "FrequenceAppel")) then{
			if((player getVariable ["tf_sendingDistanceMultiplicator",1]) != 40) then {
				player setVariable ["tf_sendingDistanceMultiplicator",40,true];
			};
			if((player getVariable ["tf_receivingDistanceMultiplicator",1]) != 1) then {
				player setVariable ["tf_receivingDistanceMultiplicator",1,true];
			};
			if((player getVariable ["tf_terrain_interception_coefficient",7]) != 5) then {
				player setVariable ["tf_terrain_interception_coefficient",5,true];
			};
			if(!TF_tangent_sw_pressed) then {call TFAR_fnc_onSwTangentPressed;call TFAR_fnc_HideHint};
			if(!(missionNamespace getVariable "enCours")) then {hint "raccroché."};
		}else{
			[_radio,_channel,missionNamespace getVariable "FrequenceAppel"] call TFAR_fnc_SetChannelFrequency;
		};
	};
};