/*
	File: fn_loop.sqf
*/
while {true} do
{
  waitUntil {alive vehicle player};
 [] execVM "admin\fn_activate.sqf";


  waitUntil {!alive player};
};