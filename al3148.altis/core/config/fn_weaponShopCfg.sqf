#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["HandGrenade_Stone","Flashbang",1700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 2): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["30Rnd_mas_9x21_Stanag",nil,130],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 3): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Police Officer Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250]
					]
				];
			};
		};
	};

	case "cop_ser":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 4): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Sergent Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_lie":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 5): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Lieutenant Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_capi":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 6): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["arifle_mas_arx_l",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_com":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 7): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["arifle_mas_arx_l",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_comi":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (__GETC__(life_coplevel) == 8): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["arifle_mas_arx_l",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};

	case "cop_gdo":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			case (license_cop_swat): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Groupe de Defense et D'opération",
					[
						["arifle_mas_mp5",nil,30000],
						["arifle_mas_m1014",nil,30000],
						["arifle_mas_hk416",nil,35000],
						["arifle_mas_hk416_gl",nil,30000],
						["arifle_mas_hk416c",nil,30000],
						["arifle_mas_arx_l",nil,30000],
						["LMG_mas_M249_F",nil,30000],
						["srifle_mas_sr25",nil,30000],
						["srifle_mas_m107",nil,30000],
						["srifle_mas_hk417",nil,30000],
						["arifle_mas_hk417c",nil,30000],
						["arifle_mas_hk417_m203c",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["optic_mas_Holosight_blk",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Hamr",nil,2500],
						["optic_mas_aim",nil,2750],
						["optic_mas_zeiss",nil,2750],
						["optic_mas_acog_eo",nil,2750],
						["7Rnd_mas_12Gauge_Pellets",nil,130],
						["7Rnd_mas_12Gauge_Slug",nil,130],
						["30Rnd_mas_556x45_Stanag",nil,130],
						["200Rnd_mas_556x45_Stanag",nil,130],
						["5Rnd_mas_127x99_Stanag",nil,130],
						["20Rnd_mas_762x51_Stanag",nil,130],
						["3Rnd_UGL_FlareWhite_F",nil,250],
						["FirstAidKit",nil,130],
						["ToolKit",nil,130],
						["Radio",nil,130]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_TRG20_F",nil,25000],
						["arifle_Katiba_F",nil,30000],
						["srifle_DMR_01_F",nil,50000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
