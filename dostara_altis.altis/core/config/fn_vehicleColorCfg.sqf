/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path","_dirivory"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];
_dirivory = "\ivory_skin\skins\";

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"]
		];
	};

	case "O_Heli_Transport_04_medevac_F":
	{
		_path = "\VHL_Dostara\SIM\TARU\";
		_ret =
		[
			[_path + "DownTaru.paa","fed",_path + "TaruUp.paa",_path + "TaruPod1.paa",_path + "TaruPod2.paa"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"]
		];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","fed"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"]
		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};

	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"]
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["#(argb,8,8,3)color(1,1,1,0.8)","med"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["#(argb,8,8,3)color(1,1,1,0.8)","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "ivory_gt500":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_rs4":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_m3":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_wrx":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_evox":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_c":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_e36":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_veyron":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_suburban":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_isf":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_elise":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};

	case "ivory_f1":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_mp4":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_190e":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_r34":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_supra":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_supra_topsecret":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_gti":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
	case "ivory_lfa":
	{
		_ret =
		[
		[_dirivory + "yellow_co.paa","civ"],
		[_dirivory + "skin_black_co.paa","civ"],
		[_dirivory + "aqua_co.paa","civ"],
		[_dirivory + "skin_blue_co.paa","civ"],
		[_dirivory + "skin_pink_co.paa","civ"],
		[_dirivory + "red_co.paa","civ"],
		[_dirivory + "burgundy_co.paa","civ"],
		[_dirivory + "cardinal_co.paa","civ"],
		[_dirivory + "dark_green_co.paa","civ"],
		[_dirivory + "gold_co.paa","civ"],
		[_dirivory + "green_co.paa","civ"],
		[_dirivory + "grey_co.paa","civ"],
		[_dirivory + "lavender_co.paa","civ"],
		[_dirivory + "light_blue_co.paa","civ"],
		[_dirivory + "light_yellow_co.paa","civ"],
		[_dirivory + "lime_co.paa","civ"],
		[_dirivory + "marina_blue_co.paa","civ"],
		[_dirivory + "navy_blue_co.paa","civ"],
		[_dirivory + "orange_co.paa","civ"],
		[_dirivory + "sand_co.paa","civ"],
		[_dirivory + "silver_co.paa","civ"],
		[_dirivory + "skin_white_co.paa","civ"]
		];
	};
};

_ret;
