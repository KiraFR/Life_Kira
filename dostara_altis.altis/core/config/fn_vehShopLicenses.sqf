/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.

	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "dh2o_smart") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": 			{_ret = license_med_prefet;};
	case "kart_shop": 			{_ret = license_civ_driver;};
	case "med_air_hs": 			{_ret = license_med_prefet;};
	case "civ_car":				{_ret = license_civ_driver;};
	case "civ_ship": 			{_ret = license_civ_boat;};
	case "civ_air": 			{_ret = license_civ_air;};
	case "cop_air": 			{_ret = license_cop_prefet;};
	case "civ_truck":			{_ret = license_civ_truck;};
	case "cop_car": 			{_ret = license_cop_prefet;};
	case "civ_ship_plaisance":  {_ret = license_civ_boat;};
	case "cop_ship":			{_ret = license_cop_prefet;};
};

_ret;