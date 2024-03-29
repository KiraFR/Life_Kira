#include "..\..\macro.h"
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
						["HandGrenade_Stone","Flashbang",15],
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
				["Fourniture du SIM",
					[
					    ["ACE_Chemlight_HiYellow",nil,2],
					    ["ACE_EarPlugs",nil,2],
						["Binocular",nil,50],
						["NVGoggles_OPFOR",nil,550],
						["hgun_Pistol_Signal_F",nil,100],
						["6Rnd_GreenSignal_F",nil,5],
						["tf_anprc152",nil,30],
						["ItemGPS",nil,100],
						["ItemMap",nil,30],
						["I_IR_Grenade",nil,50],
						["Medikit",nil,200],
						["ToolKit",nil,60],
						["FirstAidKit",nil,20]
					]
				];
			};
		};
	};

	case "cop_recrue":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
					]
				];
			};
		};
	};

	case "cop_officier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Police Officer Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
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
			default
			{
				["Altis Sergent Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
					]
				];
			};
		};
	};

	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Lieutenant Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
					]
				];
			};
		};
	};

	case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
					]
				];
			};
		};
	};

	case "cop_commandant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
					]
				];
			};
		};
	};

	case "cop_comissaire":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'etes pas un flic !"};
			default
			{
				["Altis Patrol Officer Shop",
					[
					    ["ACE_Chemlight_HiWhite",nil,2],
                        ["ACE_EarPlugs",nil,2],
					    ["ACE_CableTie",nil,1],
					    ["Chemlight_blue",nil,2],
                        ["Binocular",nil,50],
                        ["NVGoggles_OPFOR",nil,550],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,5],
                        ["tf_anprc152",nil,30],
                        ["ItemGPS",nil,100],
                        ["ItemMap",nil,30],
                        ["I_IR_Grenade",nil,50],
                        ["Medikit",nil,200],
                        ["ToolKit",nil,60],
						["arifle_mas_mp5",nil,350],
						["30Rnd_mas_9x21_Stanag",nil,10],
						["hgun_mas_usp_F",nil,210],
						["12Rnd_mas_45acp_Mag",nil,5],
						["arifle_mas_hk416",nil,570],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["arifle_mas_hk416c",nil,550],
						["30Rnd_mas_556x45_Stanag",nil,10],
						["optic_mas_Holosight_blk",nil,100],
						["optic_Holosight",nil,120],
						["optic_Hamr",nil,150],
						["optic_mas_aim",nil,120]
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
			case (!license_cop_gdo): {"Vous n'etes pas du bon niveau !"};
			default
			{
				["Groupe de Defense et D'opération",
					[
						["arifle_mas_mp5",nil,0],
						["arifle_mas_hk416",nil,0],
						["arifle_mas_hk416c",nil,0],
						["LMG_mas_M249_F",nil,0],
						["srifle_mas_sr25",nil,0],
						["srifle_mas_m107",nil,0],
						["srifle_mas_hk417",nil,0],
						["arifle_mas_hk417c",nil,0],
						["arifle_mas_hk417_m203c",nil,0],
						["HandGrenade_Stone","Flashbang",0],
						["optic_mas_Holosight_blk",nil,0],
						["optic_Holosight",nil,0],
						["optic_Hamr",nil,0],
						["optic_mas_aim",nil,0],
						["optic_mas_zeiss",nil,0],
						["optic_mas_acog_eo",nil,0],
						["7Rnd_mas_12Gauge_Pellets",nil,0],
						["7Rnd_mas_12Gauge_Slug",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
						["200Rnd_mas_556x45_Stanag",nil,0],
						["5Rnd_mas_127x99_Stanag",nil,0],
						["20Rnd_mas_762x51_Stanag",nil,0],
						["3Rnd_UGL_FlareWhite_F",nil,0],
						["NVGoggles_mas_h",nil,0],
						["FirstAidKit",nil,0],
						["ACE_CableTie",nil,0],
						["ToolKit",nil,0],
						["tf_anprc152",nil,0]
					]
				];
			};
		};
	};

	case "PetiteF":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_petiteF): {"Vous n'avez l'autorisation pour trafiquer des armes!"};
			default
			{
				["Contrebandier Petite Frappe",
					[
						["arifle_TRG20_F",nil,555],
						["arifle_TRG21_F",nil,627],
						["arifle_SDAR_F",nil,426],
						["SMG_01_F",nil,492],
						["hgun_P07_F",nil,328],
						["hgun_P07_khk_F",nil,328],
						["arifle_Mk20_plain_F",nil,587],
						["arifle_Mk20_F",nil,587],
						["hgun_ACPC2_F",nil,224],
						["optic_ACO_grn",nil,25],
						["30Rnd_45ACP_Mag_SMG_01",nil,36],
						["30Rnd_556x45_Stanag",nil,20],
						["10Rnd_9x21_Mag",nil,10],
						["9Rnd_45ACP_Mag",nil,9],
						["12Rnd_mas_45acp_Mag",nil,12]
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
			case (!license_civ_rebel): {"Vous n'avez l'autorisation pour trafiquer des armes!"};
			default
			{
				["Contrebandier Organisme Criminel",
					[
						["arifle_MX_F",nil,1482],
						["arifle_MX_khk_F",nil,1482],
						["arifle_TRG20_F",nil,555],
						["arifle_TRG21_F",nil,627],
						["arifle_SDAR_F",nil,426],
						["SMG_01_F",nil,492],
						["hgun_P07_F",nil,328],
						["hgun_P07_khk_F",nil,328],
						["arifle_Mk20_plain_F",nil,587],
						["arifle_Mk20_F",nil,587],
						["hgun_ACPC2_F",nil,224],
						["hgun_mas_uzi_F",nil,379],
						["arifle_mas_m16a2",nil,971],
						["arifle_mas_m16",nil,854],
						["arifle_Katiba_GL_F",nil,2012],
						["arifle_Katiba_F",nil,1326],
						["hgun_mas_glocksf_F",nil,396],
						["arifle_AKS_F",nil,520],
						["arifle_mas_aks74u",nil,520],
						["arifle_mas_aks74",nil,520],
						["arifle_mas_aks_74_sf",nil,520],
						["arifle_mas_ak_74",nil,674],
						["arifle_ARX_blk_F",nil,1184],
						["arifle_ARX_ghex_F",nil,1184],
						["arifle_ARX_hex_F",nil,1184],
						["optic_Hamr",nil,100],
						["optic_ACO_grn",nil,25],
						["optic_MRCO",nil,100],
						["optic_Arco",nil,100],
						["optic_ERCO_blk_F",nil,100],
						["30Rnd_45ACP_Mag_SMG_01",nil,36],
						["30Rnd_556x45_Stanag",nil,20],
						["10Rnd_9x21_Mag",nil,10],
						["9Rnd_45ACP_Mag",nil,9],
						["30Rnd_65x39_caseless_green",nil,45],
						["30Rnd_mas_556x45_Stanag",nil,25],
						["25Rnd_mas_9x19_Mag",nil,28],
						["12Rnd_mas_45acp_Mag",nil,12],
						["30Rnd_545x39_Mag_F",nil,18]
					]
				];
			};
		};
	};

	case "Terroriste":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_Terroristes): {"Vous n'avez l'autorisation pour trafiquer des armes!"};
			default
			{
				["Contrebandier Terroriste",
					[
						["arifle_AK12_F",nil,5861],
						["arifle_mas_ak_74m",nil,781],
						["arifle_mas_ak_74m_c",nil,781],
						["arifle_mas_ak_74m_sf",nil,781],
						["arifle_AKM_F",nil,1569],
						["arifle_mas_akm",nil,1569],
						["arifle_TRG20_F",nil,555],
						["arifle_TRG20_F",nil,555],
						["arifle_TRG21_F",nil,627],
						["arifle_SDAR_F",nil,426],
						["SMG_01_F",nil,492],
						["hgun_P07_F",nil,328],
						["hgun_P07_khk_F",nil,328],
						["arifle_Mk20_plain_F",nil,587],
						["arifle_Mk20_F",nil,587],
						["hgun_ACPC2_F",nil,224],
						["hgun_mas_uzi_F",nil,379],
						["arifle_mas_m16a2",nil,971],
						["arifle_mas_m16",nil,854],
						["arifle_Katiba_GL_F",nil,2012],
						["arifle_Katiba_F",nil,1326],
						["hgun_mas_glocksf_F",nil,396],
						["arifle_AKS_F",nil,520],
						["arifle_mas_aks74u",nil,520],
						["arifle_mas_aks74",nil,520],
						["arifle_mas_aks_74_sf",nil,520],
						["arifle_mas_ak_74",nil,674],
						["arifle_ARX_blk_F",nil,1184],
						["arifle_ARX_ghex_F",nil,1184],
						["arifle_ARX_hex_F",nil,1184],
						["optic_Hamr",nil,100],
						["optic_ACO_grn",nil,25],
						["optic_MRCO",nil,100],
						["optic_DMS",nil,100],
						["optic_Arco",nil,100],
						["optic_ERCO_blk_F",nil,100],
						["30Rnd_45ACP_Mag_SMG_01",nil,36],
						["30Rnd_556x45_Stanag",nil,20],
						["10Rnd_9x21_Mag",nil,10],
						["9Rnd_45ACP_Mag",nil,9],
						["30Rnd_762x39_Mag_F",nil,68],
						["30Rnd_mas_545x39_mag",nil,23],
						["akm 30Rnd_762x39_Mag_F",nil,58],
						["30Rnd_mas_762x39_mag",nil,58],
						["30Rnd_65x39_caseless_mag",nil,28],
						["30Rnd_65x39_caseless_green",nil,45],
						["30Rnd_mas_556x45_Stanag",nil,25],
						["25Rnd_mas_9x19_Mag",nil,28],
						["12Rnd_mas_45acp_Mag",nil,12],
						["30Rnd_545x39_Mag_F",nil,18]
					]
				];
			};
		};
	};

	case "Contrebande":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Farce et Attrape",
					[
						["hgun_mas_acp_F",nil,421],
						["hgun_P07_F",nil,357],
						["hgun_P07_khk_F",nil,357],
						["12Rnd_mas_45acp_Mag",nil,12],
						["16Rnd_9x21_Mag",nil,13]
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
			case (!license_civ_gun): {"Vous n'avez pas la license requise !"};
			default
			{
				["Billy fait de la thune",
					[
						["hgun_mas_bhp_F",nil,259],
						["hgun_mas_grach_F",nil,219],
						["hgun_Pistol_01_F",nil,269],
						["hgun_Pistol_Signal_F",nil,120],
						["V_Rangemaster_belt",nil,400],
						["15Rnd_mas_9x21_Mag",nil,15],
						["10Rnd_9x21_Mag",nil,12],
						["6Rnd_GreenSignal_F",nil,50]
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
			    ["Chemlight_green",nil,4],
			    ["Chemlight_red",nil,4],
				["Binocular",nil,67],
				["ItemWatch",nil,54],
				["ItemMap",nil,32],
				["ItemGPS",nil,146],
				["ToolKit",nil,95],
				["NVGoggles",nil,621],
				["tf_anprc148jem",nil,36],
				["ACE_Flashlight_XL50",nil,24]
			]
		];
	};
};
