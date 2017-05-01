/*
	File: fn_calling.sqf
	auteur: J. `Kira` D.
	
	Description:
	Appeler un joueur
	
	PARAMETRES:
	AUCUN

	CALL:
	call Call_fnc_calling;
*/
_player = call compile format["%1",lbData[3251,(lbCurSel 3251)]];
if(TF_tangent_sw_pressed) then {call TFAR_fnc_onSwTangentReleased;};
[player] remoteExec ["Call_fnc_acceptCall",_player];