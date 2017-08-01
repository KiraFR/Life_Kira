/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Vendeur de prêt-à-porter"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		    ["TRYK_OVERALL_nok_flesh",nil,69],
            ["TRYK_OVERALL_SAGE_BLKboots_nk_blk2",nil,69],
            ["TRYK_shirts_DENIM_BK",nil,40],
            ["TRYK_shirts_DENIM_BK_Sleeve",nil,40],
            ["TRYK_shirts_DENIM_BL",nil,40],
            ["TRYK_shirts_DENIM_BWH",nil,40],
            ["TRYK_shirts_DENIM_od",nil,40],
            ["TRYK_shirts_DENIM_R",nil,40],
            ["TRYK_shirts_DENIM_RED2",nil,40],
            ["TRYK_shirts_DENIM_WH",nil,40],
            ["TRYK_shirts_DENIM_WH_Sleeve",nil,40],
            ["TRYK_shirts_DENIM_WHB",nil,40],
            ["TRYK_shirts_DENIM_ylb",nil,40],
            ["TRYK_SUITS_BLK_F",nil,97],
            ["TRYK_SUITS_BR_F",nil,87],
            ["TRYK_U_B_BLK_OD_Rollup_CombatUniform",nil,40],
            ["TRYK_U_B_BLK_T_BG_BK",nil,33],
            ["TRYK_U_B_BLK_T_BG_WH",nil,33],
            ["TRYK_U_B_BLK_T_BK",nil,33],
            ["TRYK_U_B_BLK_T_WH",nil,33],
            ["TRYK_U_B_BLK_TAN_1",nil,57],
            ["TRYK_U_B_BLK_TAN_2",nil,57],
            ["TRYK_U_B_BLK_tan_Rollup_CombatUniform",nil,40],
            ["TRYK_U_B_Denim_T_BG_BK",nil,33],
            ["TRYK_U_B_Denim_T_BG_WH",nil,33],
            ["TRYK_U_B_Denim_T_BK",nil,33],
            ["TRYK_U_B_Denim_T_WH",nil,33],
            ["TRYK_U_B_ODTAN",nil,57],
            ["TRYK_U_B_ODTAN_Tshirt",nil,57],
            ["TRYK_U_B_PCUGs_BLK_R",nil,57],
            ["TRYK_U_B_PCUGs_gry_R",nil,57],
            ["TRYK_U_B_PCUGs_OD_R",nil,57],
            //["TRYK_U_B_PCUHsW3",nil,000],
            //["TRYK_U_B_PCUHsW7",nil,000],
            //["TRYK_U_B_PCUHsW8",nil,000],
            //["TRYK_U_B_PCUHsW9",nil,000],
            ["TRYK_U_B_RED_T_BG_BR",nil,33],
            ["TRYK_U_B_RED_T_BR",nil,33],
            ["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil,40],
            ["TRYK_U_B_wh_OD_Rollup_CombatUniform",nil,40],
            ["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil,40],
            ["TRYK_U_denim_hood_3c",nil,57],
            ["TRYK_U_denim_hood_blk",nil,57],
            //["TRYK_U_denim_hood_blu",nil,57],
            //["TRYK_U_denim_hood_jersey_blk",nil,57],
            ["TRYK_U_denim_hood_mc",nil,57],
            ["TRYK_U_denim_hood_nc",nil,57],
            ["U_B_Gen_Soldier_F",nil,40],
            //["U_BG_Guerrilla2_1",nil,000],
            //["U_BG_Guerrilla2_2",nil,000],
            //["U_BG_Guerrilla2_3",nil,000],
            //["U_BG_Guerrilla3_1",nil,000],
            ["U_C_Driver_1",nil,97],
            ["U_C_Driver_1_black",nil,97],
            ["U_C_Driver_1_blue",nil,97],
            ["U_C_Driver_1_green",nil,97],
            ["U_C_Driver_1_orange",nil,97],
            ["U_C_Driver_1_red",nil,97],
            ["U_C_Driver_1_white",nil,97],
            ["U_C_Driver_1_yellow",nil,97],
            ["U_C_Driver_2",nil,97],
            ["U_C_Driver_3",nil,97],
            ["U_C_Driver_4",nil,97],
            ["U_C_Hunterbody_grn",nil,57],
            ["U_C_Man_Casual_1_F",nil,40],
            ["U_C_Man_Casual_2_F",nil,40],
            ["U_C_Man_Casual_3_F",nil,40],
            ["U_C_Man_Casual_4_F",nil,21],
            ["U_C_Man_Casual_5_F",nil,21],
            ["U_C_Man_Casual_6_F",nil,21],
            ["U_C_Man_Sport_1_F",nil,21],
            ["U_C_Man_Sport_2_F",nil,21],
            ["U_C_Man_Sport_3_F",nil,21],
            ["U_C_Poloshirt_blue",nil,21],
            ["U_C_Poloshirt_burgundy",nil,21],
            ["U_C_Poloshirt_redwhite",nil,21],
            ["U_C_Poloshirt_salmon",nil,21],
            ["U_C_Poloshirt_stripped",nil,21],
            ["U_C_Poloshirt_tricolour",nil,21],
            ["U_C_Poor_1",nil,33],
            ["U_C_WorkerCoveralls",nil,97],
            ["U_I_C_Soldier_Bandit_1_F",nil,21],
            ["U_I_C_Soldier_Bandit_2_F",nil,33],
            ["U_I_C_Soldier_Bandit_3_F",nil,33],
            ["U_I_C_Soldier_Bandit_4_F",nil,21],
            ["U_I_C_Soldier_Bandit_5_F",nil,21],
            ["U_I_G_resistanceLeader_F",nil,33],
            ["U_Marshall",nil,40],
            ["U_Orestesbody",nil,21]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",6],
			["H_Bandanna_surfer","Surfer Bandanna",6],
			["H_Bandanna_gry","Grey Bandanna",6],
			["H_Bandanna_cbr",nil,6],
			["H_Bandanna_surfer",nil,6],
			["H_Bandanna_khk","Khaki Bandanna",6],
			["H_Bandanna_sgg","Sage Bandanna",6],
			["H_StrawHat","Straw Fedora",22],
			["H_BandMask_blk","Hat & Bandanna",11],
			["H_Booniehat_tan",nil,9],
			["H_Hat_blue",nil,22],
			["H_Hat_camo",nil,22],
			["H_Hat_brown",nil,22],
			["H_Hat_checker",nil,22],
			["H_Hat_grey",nil,22],
			["H_Hat_tan",nil,22],
			["H_Cap_blu",nil,11],
			["H_Cap_grn",nil,11],
			["H_Cap_grn_BI",nil,11],
			["H_Cap_oli",nil,11],
			["H_Cap_red",nil,11],
			["H_Cap_tan",nil,11],
			["H_RacingHelmet_1_black_F",nil,280],
            ["H_RacingHelmet_1_red_F",nil,280],
            ["H_RacingHelmet_1_white_F",nil,280],
            ["H_RacingHelmet_1_blue_F",nil,280],
            ["H_RacingHelmet_1_yellow_F",nil,280],
            ["H_RacingHelmet_1_green_F",nil,280],
            ["H_RacingHelmet_1_F",nil,280],
            ["H_RacingHelmet_2_F",nil,280],
            ["H_RacingHelmet_3_F",nil,280],
            ["H_RacingHelmet_4_F",nil,280]
		];
	};
	
	//Glasses
	case 2:
	{
		[
		    ["G_Sport_Blackwhite",nil,13],
            ["G_Sport_Blackyellow",nil,13],
            ["G_Shades_Blue",nil,13],
            ["G_Shades_Black",nil,13],
            ["G_Shades_Red",nil,13],
            ["G_Shades_Green",nil,13],
            ["G_Squares_Tinted",nil,13],
            ["G_Lady_Blue",nil,13],
            ["G_Sport_Red",nil,13],
            ["G_Sport_Checkered",nil,13],
            ["G_Sport_Greenblack",nil,13],
            ["G_Sport_Blackred",nil,13],
            ["G_Lowprofile",nil,13],
            ["G_Spectacles",nil,13],
            ["G_Aviator",nil,13],
            ["G_Spectacles_Tinted",nil,13],
            ["TRYK_Shemagh_shade_MH",nil,20],
            ["TRYK_Shemagh_shade_G",nil,20],
            ["TRYK_Shemagh_shade",nil,20],
            ["TRYK_Shemagh_shade_WH",nil,20],
            ["TRYK_Shemagh_mesh",nil,20],
            ["TRYK_Shemagh_G",nil,20],
            ["TRYK_Shemagh",nil,20],
            ["TRYK_Shemagh_WH",nil,20],
			["G_Shades_Black",nil,13],
			["G_Shades_Blue",nil,13],
			["G_Sport_Blackred",nil,13],
			["G_Sport_Checkered",nil,13],
			["G_Sport_Blackyellow",nil,13],
			["G_Sport_BlackWhite",nil,13],
			["G_Squares",nil,13],
			["G_Aviator",nil,13],
			["G_Lady_Mirror",nil,13],
			["G_Lady_Dark",nil,13],
			["G_Lady_Blue",nil,13]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,26],
			["B_TacticalPack_oli",nil,38],
			["B_FieldPack_ocamo",nil,38],
			["B_Kitbag_mcamo",nil,54],
			["B_Bergen_sgg",nil,54],
			["B_Kitbag_cbr",nil,54],
			["B_Carryall_oli",nil,67],
			["B_Carryall_khk",nil,67]
		];
	};
};