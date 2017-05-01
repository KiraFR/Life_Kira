/*
	File: fn_tools.sqf
*/
player removeAction act;
//player addAction ["----------",{execVM "";}];
player addAction ["Teleport",{execVM "admin\tools\fn_teleport.sqf";}];