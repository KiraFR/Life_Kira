#include "..\..\macro.h"
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do {
	case "kart_shop":{
		_return = [
			["C_Kart_01_F",6450],
			["C_Kart_01_Blu_F",6450],
			["C_Kart_01_Fuel_F",6450],
			["C_Kart_01_Red_F",6450],
			["C_Kart_01_Vrana_F",6450]
		];
	};

	case "med_shop":{
		_return = [
			["brancardch",1000],
			["VL_SIM",9800],
			["VSAV_SIM",62350]
		];
	};

	case "med_air_hs":{
		_return = [
			["O_Heli_Transport_04_medevac_F",140000]
		];
	};

	case "civ_car":{
		_return = [
			["dh2o_smart",200],
			["dh2o_tatra_613",350],
			["C_Hatchback_01_F",2500],
			["C_SUV_01_F",5000],
			["C_Offroad_01_F",5000],
			["C_Van_01_transport_F",15000],
			["ivory_e36",15900],
			["ivory_190e",19999],
			["ivory_evox",21000],
			["ivory_wrx",35000],
			["ivory_gti",38750],
			["ivory_isf",40000],
			["ivory_elise",41250],
			["ivory_supra",42000],
			["ivory_suburban",60000],
			["ivory_supra_topsecret",74000],
			["ivory_rs4",80000],
			["ivory_m3",90500],
			["ivory_r34",108000],
			["ivory_gt500",147000],
			["ivory_c",200000],
			["ivory_mp4",357000],
			["ivory_lfa",575000],
			["ivory_veyron",1100000],
			["ivory_f1",12000000]
		];
	};

	case "civ_truck":{
		_return =[
			["C_Van_01_box_F",35000],
			["I_Truck_02_covered_F",120000]
		];
	};

	case "cop_car":{
		_return = [
			["DAR_ChargerPolice",5000],
			["DAR_ExplorerPolice",15000],
			["M3_POLICE",80000],
			["ivory_wrx_unmarked",27900],
			["ivory_isf_unmarked",32400],
			["ivory_rs4_unmarked",61100],
			["ivory_m3_unmarked",74800],
			["Gurkha_f5",48000]
		];
	};

	case "civ_air":{
		_return =[
			["B_Heli_Light_01_F",103200],
			["O_Heli_Light_02_unarmed_F",177500]
		];
	};

	case "cop_air":{
		_return = [
			["HummingBird_Police",100000],
			["HummingBird_GDO",100000],
		 	["EC635_Police",120000]
		];
	};

	case "civ_ship_peche":{
		_return =[];
	};

	case "civ_ship_plaisance":{
		_return =[
			["C_Rubberboat",1300],
			["C_Scooter_Transport_01_F",8000],
			["C_Boat_Civil_01_F",14300],
			["C_Boat_Transport_02_F",20000],
			["faa_ar_lcm",30600]
		];
	};

	case "cop_ship":{
		_return =[
			["B_Boat_Transport_01_F",1000],
			["C_Boat_Civil_01_police_F",15000],
			["B_G_Boat_Transport_02_F",18000],
			["B_SDV_01_F",37000]
		];
	};


	case "med_ship":{
		_return =[
			["B_Lifeboat",1000],
			["C_Boat_Civil_01_rescue_F",15000],
			["B_G_Boat_Transport_02_F",18000],
			["B_SDV_01_F",37000]
		];
	};
};

_return;