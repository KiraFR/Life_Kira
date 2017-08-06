//[] spawn  {
//	private["_fnc_food","_fnc_water"];
//	_fnc_food =
//	{
//		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
//		else
//		{
//		life_hunger = life_hunger - 10;
//		[] call life_fnc_hudUpdate;
//		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
//		switch(life_hunger) do {
//			case 30: {hint localize "STR_NOTF_EatMSG_1";};
//			case 20: {hint localize "STR_NOTF_EatMSG_2";};
//			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
//			};
//		};
//	};
//
//	_fnc_water =
//	{
//		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
//		else
//		{
//			life_thirst = life_thirst - 10;
//			[] call life_fnc_hudUpdate;
//			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
//			switch(life_thirst) do
//			{
//				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
//				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
//				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
//			};
//		};
//	};
//
//	while{true} do
//	{
//		sleep 600;
//		[] call _fnc_water;
//		sleep 250;
//		[] call _fnc_food;
//	};
//};

//[] spawn
//{
//    while{true} do {
//        Sleep 120;
//        [player,"life_fnc_bourseUpdate"] remoteExecCall ["Bourse_fnc_ReturnBourse",2];
//    };
//};

//[] spawn
//{
//	private["_bp","_load","_cfg"];
//	while{true} do
//	{
//		waitUntil {backpack player != ""};
//		_bp = backpack player;
//		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
//		_load = round(_cfg / 8);
//		life_maxWeight = life_maxWeightT + _load;
//		waitUntil {backpack player != _bp};
//		if(backpack player == "") then
//		{
//			life_maxWeight = life_maxWeightT;
//		};
//	};
//};

//[] spawn
//{
//	while{true} do
//	{
//		sleep 910;
//		[] spawn SOCK_fnc_syncData;
//		[] call SOCK_fnc_updateBanque;
//	};
//};

//[] spawn
//{
//	while {true} do
//	{
//		sleep 1.5;
//		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
//			player forceWalk true;
//			player setFatigue 1;
//			hint localize "STR_NOTF_MaxWeight";
//		} else {
//			if(isForcedWalk player) then {
//				player forceWalk false;
//			};
//		};
//	};
//};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn {
	while {true} do {
		if(life_waitpermis) then {
			waitsleep = 0;
			while {waitsleep < 30} do{
				sleep 60;
				waitsleep = waitsleep + 1;

				switch (waitsleep) do {
					case 15:{
						hint "Il vous reste 15min a attendre.";
						[11] call SOCK_fnc_updatePartial;
					};
					case 25:{
						hint "Il vous reste 5min a attendre.";
						[11] call SOCK_fnc_updatePartial;
					};
					case 30:{
						life_waitpermis = false;
						hint "Vous pouvez maintenant racheter vos permis.";
						[10] call SOCK_fnc_updatePartial;
					};
				};
			};
		};
	};
};

//[]spawn {
//	while{true} do {
//		if(life_hunger <30) then {
//			sleep random(30);
//			player say3D "ventre";
//		};
//	};
//};