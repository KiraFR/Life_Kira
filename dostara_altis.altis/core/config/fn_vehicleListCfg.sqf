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
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["VL_SIM",10000],
			["VSAV_SIM",25000]
		];
	};

	case "med_air_hs": {
		_return = [
			["O_Heli_Transport_04_medevac_F",50000]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["C_Hatchback_01_F",2500],
			["C_Offroad_01_F",5000],
			["C_SUV_01_F",5000],
			["C_Van_01_transport_F",35000],
			["ivory_rs4",80000],
			["ivory_c",200000],
			["ivory_e36",15900],
			["ivory_veyron",1100000],
			["ivory_suburban",60000],
			["ivory_isf",40000],
			["ivory_elise",40000],
			["ivory_f1",12000000],
			["ivory_mp4",357000],
			["ivory_190e",19999],
			["ivory_evox",20999],
			["ivory_r34",108000],
			["ivory_gt500",147000],
			["ivory_supra",40000],
			["ivory_supra_topsecret",50000],
			["ivory_gti",38750],
			["ivory_m3",90500],
			["ivory_lfa",575000],
			["ivory_wrx",35000]

		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",15000],
			["I_Truck_02_covered_F",120000]

		];
	};


	case "reb_car":
	{
		_return =
		[
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",150000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
		};
	};

	case "cop_car":
	{
		_return pushBack
		["DAR_ChargerPolice",5000],
		["DAR_ExplorerPolice",5000],
		["M3_POLICE",5000]
		if(license_cop_gdo) then
		{
			_return pushBack
			["Gurkha_f5",30000];
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "cop_air":
	{
		_return pushBack
		["HummingBird_Police",12500],
		["HummingBird_GDO",12500]
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack
			["EC635_Police",75000];
		};
	};

	case "cop_airhq":
	{
		_return pushBack
		["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
			_return pushBack
			["B_MRAP_01_hmg_F",750000];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
