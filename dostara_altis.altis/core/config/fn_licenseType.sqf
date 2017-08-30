/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver";}; //Drivers License cost
			case "boat": {_var = "license_civ_boat";}; //Boating license cost
			case "pilot": {_var = "license_civ_air";}; //Pilot/air license cost
			case "gun": {_var = "license_civ_gun";}; //Firearm/gun license cost
			case "dive": {_var = "license_civ_dive";}; //Diving license cost
			case "oil": {_var = "license_civ_oil";}; //Oil processing license cost
			case "cair": {_var = "license_cop_air";}; //Cop Pilot License cost
			case "gdo": {_var = "license_cop_gdo";}; //Swat License cost
			case "cg": {_var = "license_cop_cg";}; //Coast guard license cost
			case "prefet": {_var = "license_cop_prefet";}; //Prefet license cost
			case "prefetmed": {_var = "license_med_prefet";}; //Prefet license cost
			case "heroin": {_var = "license_civ_heroin";}; //Heroin processing license cost
			case "marijuana": {_var = "license_civ_marijuana";}; //Marijuana processing license cost
			case "medmarijuana": {_var = "license_civ_medmarijuana";}; //Medical Marijuana processing license cost
			case "gang": {_var = "license_civ_gang";}; //Gang license cost
			case "rebel": {_var = "license_civ_rebel";}; //Rebel License
			case "petiteF": {_var = "license_civ_petiteF";}; //Rebel License
			case "truck":{_var = "license_civ_truck";}; //Truck License
			case "salt": {_var = "license_civ_salt";};
			case "cocaine": {_var = "license_civ_coke";};
			case "sand": {_var = "license_civ_sand";};
			case "iron": {_var = "license_civ_iron";};
			case "copper": {_var = "license_civ_copper";};
			case "cement": {_var = "license_civ_cement";};
			case "mair": {_var = "license_med_air";};
			case "home": {_var = "license_civ_home";};
			case "gouvernement": {_var = "license_civ_gouv";};
			case "eboueur": {_var = "license_civ_ebou";};
			case "opium": {_var = "license_civ_opium";};
			case "vin": {_var = "license_civ_vin";};

			case "ASG": {_var = "license_civ_ASG";};
            case "AMC": {_var = "license_civ_AMC";};
            case "AMG": {_var = "license_civ_AMG";};
            case "ASP": {_var = "license_civ_ASP";};

			//New License # KronosD
			case "diamond": {_var = "license_civ_diamond";};
			case "acier": {_var = "license_civ_acier";};
			case "PPrecieuse": {_var = "license_civ_pprecieuse";};
			case "fonderie": {_var = "license_civ_fonderie";};
			case "fonderieExp": {_var = "license_civ_fonderieExp";};
			case "chaux": {_var = "license_civ_chaux";};
			case "presseur": {_var = "license_civ_presseur";};
			case "fermenta": {_var = "license_civ_fermenta";};
			case "vin": {_var = "license_civ_vin";};
			case "fishsoup": {_var = "license_civ_fishsoup";};

			case "silver": {_var = "license_civ_silver";};
			case "aluminium": {_var = "license_civ_aluminium";};

			case "wood_01": {_var = "license_civ_wood_01";};
			case "wood_02": {_var = "license_civ_wood_02";};
			case "wood_03": {_var = "license_civ_wood_03";};
			case "wood_04": {_var = "license_civ_wood_04";};

			case "petrol": {_var = "license_civ_petrol";};

			default {_var = "";};
		};
	};

	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver";}; //Drivers License cost
			case "license_civ_boat": {_var = "boat";}; //Boating license cost
			case "license_civ_air": {_var = "pilot";}; //Pilot/air license cost
			case "license_civ_gun": {_var = "gun";}; //Firearm/gun license cost
			case "license_civ_dive": {_var = "dive";}; //Diving license cost
			case "license_civ_oil": {_var = "oil";}; //Oil processing license cost
			case "license_cop_air": {_var = "cair";}; //Cop Pilot License cost
			case "license_cop_gdo": {_var = "gdo";}; //Swat License cost
			case "license_cop_cg": {_var = "cg";}; //Coast guard license cost
			case "license_cop_prefet": {_var = "prefet";}; //Coast guard license cost
			case "license_med_prefet": {_var = "prefetmed";}; //Coast guard license cost
			case "license_civ_heroin": {_var = "heroin";}; //Heroin processing license cost
			case "license_civ_marijuana": {_var = "marijuana";}; //Marijuana processing license cost
			case "license_civ_medmarijuana": {_var = "medmarijuana";}; //Medical Marijuana processing license cost
			case "license_civ_gang": {_var = "gang";}; //Gang license cost
			case "license_civ_rebel": {_var = "rebel";}; //Rebel License
			case "license_civ_petiteF": {_var = "petiteF";}; //Rebel License
			case "license_civ_truck":{_var = "truck";}; //Truck License
			case "license_civ_salt": {_var = "salt";};
			case "license_civ_coke": {_var = "cocaine";};
			case "license_civ_sand": {_var = "sand";};
			case "license_civ_iron": {_var = "iron";};
			case "license_civ_copper": {_var = "copper";};
			case "license_civ_cement": {_var = "cement";};
			case "license_med_air": {_var = "mair";};
			case "license_civ_home": {_var = "home";};
			case "license_civ_gouv": {_var = "gouvernement";};
			case "license_cop_prefet": {_var = "Prefet";};
			case "license_civ_ebou": {_var = "eboueur";};
			case "license_civ_opium": {_var = "opium";};

			case "license_civ_ASG": {_var = "ASG";};
			case "license_civ_AMC": {_var = "AMC";};
			case "license_civ_AMG": {_var = "AMG";};
			case "license_civ_ASP": {_var = "ASP";};

			case "license_civ_diamond": {_var = "diamond";};
			case "license_civ_acier": {_var = "acier";};
			case "license_civ_pprecieuse": {_var = "PPrecieuse";};
			case "license_civ_fonderie": {_var = "fonderie";};
			case "license_civ_fonderieExp": {_var = "fonderieExp";};
			case "license_civ_chaux": {_var = "chaux";};
			case "license_civ_presseur": {_var = "presseur";};
			case "license_civ_fermenta": {_var = "fermenta";};
			case "license_civ_vin": {_var = "vin";};
			case "license_civ_fishsoup": {_var = "fishsoup";};

			case "license_civ_silver": {_var = "silver";};
			case "license_civ_aluminium": {_var = "aluminium";};

            case "license_civ_wood_01": {_var = "wood_01";};
            case "license_civ_wood_02": {_var = "wood_02";};
            case "license_civ_wood_03": {_var = "wood_03";};
            case "license_civ_wood_04": {_var = "wood_04";};

            case "license_civ_petrol": {_var = "petrol";};

			default {_var = "";};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;
