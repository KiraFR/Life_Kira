/*
	File: fn_sendImpot.sqf
	Author: J `Kira` D
	
	Description:
	Envoi les info pour les impots.
*/

params["_type"];
switch(_type) do {
	//joueur
	case 0:{
		[0,getPlayerUID player,player] RemoteExecCall ["IMPT_fnc_impot",2];
	};
	//entreprise
	case 1:{
		[1,getPlayerUID player,player]RemoteExecCall ["IMPT_fnc_impot",2];
	};
};