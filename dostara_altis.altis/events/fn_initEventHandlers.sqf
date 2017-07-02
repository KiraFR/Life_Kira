/*
	Master eventhandler file
*/

"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
player addEventHandler ["Fired", life_fnc_onFired];
player addEventHandler ["HandleRating", {0}];
player addEventHandler ["InventoryClosed", life_fnc_onInventoryClosed];
player addEventHandler ["InventoryOpened", life_fnc_onInventoryOpened];
player addEventHandler ["Killed", life_fnc_onKilled];
player addEventHandler ["Take", life_fnc_onTake];
