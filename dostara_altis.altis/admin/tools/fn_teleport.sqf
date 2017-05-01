/*
	File: fn_teleport.sqf
*/
cutText ["Clique quelque part sur la map", "PLAIN"];
onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";