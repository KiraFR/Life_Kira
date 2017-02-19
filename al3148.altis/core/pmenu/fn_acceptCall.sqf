#include "..\..\macro.h"
/*
	File: fn_acceptCall.sqf
	Modifié par: J. `Kira` D.
	
	Description:
	Appeler un joueur
*/
params[
	["_type",0,[0]],
	["_unit",objNull,[objNull]]
];
switch(_type) do {
	case 0 :{
		[_unit] spawn {
			_result = [format["%1 vous appelle, lui repondre ?",name _this], "Êtes vous sur ?", true, true] call BIS_fnc_GUImessage;
			if(_result) then {
				_this setVariable ["tf_isSpeaking", true];
				["OnSpeak", _this, [_this, true]] call TFAR_fnc_fireEventHandlers;
				[1,player] remoteExecCall ["life_fnc_acceptCall",(owner _this)];
			};
		};
	};
	case 1 : {
		_unit setVariable ["tf_isSpeaking", true];
		["OnSpeak", _unit, [_unit, true]] call TFAR_fnc_fireEventHandlers;
	};
	case 2 : {
		_unit setVariable ["tf_isSpeaking", false];
		["OnSpeak", _unit, [_unit, false]] call TFAR_fnc_fireEventHandlers;
		[3,player] remoteExecCall ["life_fnc_acceptCall",(owner _unit)];
	};
	case 3 :{
		_unit setVariable ["tf_isSpeaking", false];
		["OnSpeak", _unit, [_unit, false]] call TFAR_fnc_fireEventHandlers;
	};
};