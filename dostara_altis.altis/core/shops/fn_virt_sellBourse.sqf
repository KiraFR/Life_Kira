/*
	author: Alexandre Debris
	description: none
	returns: nothing
*/
private["_type","_index","_price","_var","_amount","_name","_val"];
params["_price","_error"];

if (_error) exitWith {hint "Erreur Serveur";};
if (_price == 0) exitWith {hint "Erreur Serveur";};

if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_var = [_type,0] call life_fnc_varHandle;
_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};


_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	[] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
		//LOGS
		[getPlayerUID player, playerSide, [name player, _amount, _name, _val],13] remoteExecCall ["DB_fnc_logs",2];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
		//LOGS
		[getPlayerUID player, playerSide, [name player, _amount, _name, _price],13] remoteExecCall ["DB_fnc_logs",2];
	};
}else{
	//LOGS
	[getPlayerUID player, playerSide, [name player, _amount, _name, _price],13] remoteExecCall ["DB_fnc_logs",2];
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;