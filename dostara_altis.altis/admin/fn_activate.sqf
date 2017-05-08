/*
	File: fn_activate.sqf
*/
if ((getPlayerUID player) in ["76561197964675179","76561198051885600"]) then 
{

act = player addAction ["Tools",{execVM "admin\fn_tools.sqf";}];

};