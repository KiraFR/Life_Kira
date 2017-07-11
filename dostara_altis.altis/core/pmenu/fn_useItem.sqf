/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "Bouteille_d_eau" or _item == "Cafe"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["Petit_Coffre","Grand_Coffre"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "Soda_Extra_Energy_Drink"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
		if (([true,_item,1]call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 1;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffectFucked","PLAIN"];
				"redgullblur" ppEffectEnable true;
				"redgullblur" ppEffectCommit 5;
				enableCamShake true;
				"redgullblur" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
				addCamShake [5, 5, 25];
				5 fadeSound 0.6;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
				"dynamicBlur" ppEffectEnable false; // disable ppeffect
				"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
				resetCamShake; // resets the shake
				20 fadeSound 1;	 //fades the sound back to normal
			};

		};
	};

	case (_item == "Herse"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "Essence"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "Outil_Crochetage"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["Pommes","Big_Burger","Soupe_de_poisson","Wrap_Poulet","Peche"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "Vin" or _item == "Biere"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_alcohol;
			};
	};

	case (_item == "Canabis"):
	{
		if (([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_beuh;
			};
	};

	case (_item == "Heroine"):
	{
		if (([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_piqure;
			};
	};

	case (_item == "Opium"):
	{
		if (([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_opiumFume;
			};
	};

	case (_item == "Cocaine"):
	{
		if (([false,_item,1] call life_fnc_handleInv)) then
			{
				[] spawn life_fnc_rail;
			};
	};

	case (_item == "Pioche"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	case (_item == "Pelle"):
	{
		[] spawn life_ShovelUse;
	};
	case (_item == "Seau"):
	{
		[] spawn life_fnc_BucketUse;
	};

	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;