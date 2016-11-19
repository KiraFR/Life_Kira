/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/
private["_owner"];
_playerUID = _this select 0;
{
	if(getplayerUID _x == _playerUID)exitWith{
		_owner = owner _x;
	};
}foreach switchableUnits;
[1,DYNMARKET_Items_CurrentPriceArr] RemoteExec ["life_fnc_update",_owner];