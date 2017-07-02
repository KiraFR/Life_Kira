life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};
	[[player,life_sidechat,playerSide],""TON_fnc_managesc"",false,false] spawn life_fnc_MP;
	[] call life_fnc_settingsMenu;
";

publicVariable "life_fnc_sidechat";

TON_fnc_index =
compileFinal "
	params ['_item','_stack'];
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} forEach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	params ['_ret'];
	if(isNull _ret) exitWith {};
	
	[[life_atmcash,life_cash,owner player,player],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
	if(isNil '_ret') exitWith {};
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	params ['_val','_from'];
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == '') exitWith {};
	life_atmcash = life_atmcash + _val;
	hint format[''%1 has wire transferred $%2 to you.',_from,[_val] call life_fnc_numberText];

";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private['_valid','_value','_compare'];
	_value = _this select 0;
	_valid = ['0','1','2','3','4','5','6','7','8','9'];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	
	{
		if!(_x in _valid) then {
			_return = false;
		};
	} forEach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	params ['_unit','_group'];
	if(isNil '_unit' OR isNil '_group') exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint 'You have been kicked out of the gang.';
	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	params ['_vehicle','_unit','_giver'];
	if(isNil '_unit' OR isNil '_giver') exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> 'CfgVehicles' >> (typeOf _vehicle) >> 'displayName');
		hint format['%1 has gave you keys for a %2',_giver,_name];
		life_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] spawn life_fnc_MP;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	params ['_unit','_group'];
	if(isNil '_unit' OR isNil '_group') exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		_group selectLeader _unit;
		hint ""You have been made the new leader."";
	};
";

publicVariable "TON_fnc_clientGangLeader";