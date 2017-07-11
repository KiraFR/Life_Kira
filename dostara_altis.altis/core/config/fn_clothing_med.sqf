/*
	File: fn_clothing_dive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Diving Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["Kronos_Medic_02",nil,100],
			["Kronos_Medic_01",nil,100],
			["U_B_Wetsuit",nil,200]
		];
	};
	
	//Hats
	case 1:
	{
		[
		    ["KronosD_Medic_helmet",nil,100],
            ["KronosD_Medic_Caquette",nil,10],
            ["KronosD_Medic_BR",nil,10],
            ["KronosD_Medic_BN",nil,10],
            ["KronosD_Medic_BBLEU",nil,10],
            ["KronosD_Medic_BL",nil,10],
            ["KronosD_Medic_BBLANC",nil,10]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
            ["G_Shades_Blue",nil,20],
            ["G_Sport_Blackred",nil,20],
            ["G_Sport_Checkered",nil,20],
            ["G_Sport_Blackyellow",nil,20],
            ["G_Sport_BlackWhite",nil,20],
            ["G_Aviator",nil,75],
            ["G_Squares",nil,10],
            ["G_Lowprofile",nil,30],
            ["G_Combat",nil,55],
            ["G_Diving",nil,50]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		["SIM_SAC",nil,100]
		];
	};
};