/*
	Master eventhandler file
*/
player addEventHandler ["Fired", {_this call life_fnc_onFired}];
player addEventHandler ["InventoryClosed", {_this call life_fnc_onInventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call life_fnc_onInventoryOpened}];
player addEventHandler ["Killed", {_this spawn life_fnc_onKilled}];
player addEventHandler ["Take", {_this call life_fnc_onTake}];

"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
