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
		[[0,getPlayerUID player,player],"IMPT_fnc_impot",false,false] spawn life_fnc_MP;
	};
	//entreprise
	case 1:{
		[[1,getPlayerUID player,player],"IMPT_fnc_impot",false,false] spawn life_fnc_MP;
	};
};