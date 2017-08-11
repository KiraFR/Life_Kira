/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {50};
	case "I_Truck_02_covered_F": {850};
	case "C_Hatchback_01_F": {30};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {300};
	case "C_Van_01_box_F": {460};
	case "C_Boat_Civil_01_F": {85};
	case "C_Boat_Civil_01_police_F": {85};
	case "C_Boat_Civil_01_rescue_F": {85};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "B_Heli_Light_01_F": {90};
	case "O_Heli_Light_02_unarmed_F": {210};
	case "I_Heli_Transport_02_F": {375};
	case "C_Rubberboat": {45};
	case "O_Boat_Armed_01_hmg_F": {175};
	case "B_Boat_Armed_01_minigun_F": {175};
	case "I_Boat_Armed_01_minigun_F": {175};
	case "B_G_Boat_Transport_01_F": {45};
	case "B_Boat_Transport_01_F": {45};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	case "ivory_rs4": {30};
	case "ivory_c": {30};
	case "ivory_e36": {30};
	case "ivory_veyron": {30};
	case "ivory_suburban": {30};
	case "ivory_isf": {30};
	case "ivory_elise": {30};
	case "ivory_f1": {30};
	case "ivory_mp4": {30};
	case "ivory_190e": {30};
	case "ivory_evox": {30};
	case "ivory_r34": {30};
	case "ivory_gt500": {30};
	case "ivory_supra": {30};
	case "ivory_supra_topsecret": {30};
	case "ivory_gti": {30};
	case "ivory_m3": {30};
	case "ivory_lfa": {30};
	case "ivory_wrx": {30};
	case "dh2o_smart": {10};

//House

	case "Land_i_House_Big_02_V1_F": {2700};
	case "Land_i_House_Big_02_V2_F": {2700};
	case "Land_i_House_Big_02_V3_F": {2700};
	case "Land_i_House_Big_01_V1_F": {4200};
	case "Land_i_House_Big_01_V2_F": {4200};
	case "Land_i_House_Big_01_V3_F": {4200};
	case "Land_i_House_Small_01_V1_F": {1500};
	case "Land_i_House_Small_01_V2_F": {1500};
	case "Land_i_House_Small_01_V3_F": {1500};
	case "Land_i_House_Small_02_V1_F": {1500};
	case "Land_i_House_Small_02_V2_F": {1500};
	case "Land_i_House_Small_02_V3_F": {1500};
	case "Land_i_House_Small_03_V1_F": {2700};
	case "Land_i_Stone_HouseSmall_V2_F": {1000};
	case "Land_i_Stone_HouseSmall_V1_F": {1000};
	case "Land_i_Stone_HouseSmall_V3_F": {1000};
	case "Land_i_Shed_Ind_F": {10000};
	default {-1};
};
