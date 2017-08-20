/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Returns the license price.
*/
private["_type","_ret"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do{
	case "driver": {_ret = (500 * (life_nbrFoisPermis + 1));};
	case "boat": {_ret = 1000;}; //Boating license cost
	case "pilot": {_ret = 20000;}; //Pilot/air license cost
	case "gun": {_ret = 3600;}; //Firearm/gun license cost
	case "dive": {_ret = 400;}; //Diving license cost
	case "oil": {_ret = 2600;}; //Oil processing license cost
	case "cair": {_ret = 20000;}; //Cop Pilot License cost
	case "swat": {_ret = 35000;}; //Swat License cost
	case "cg": {_ret = 8000;}; //Coast guard license cost
	case "heroin": {_ret = 25000;}; //Heroin processing license cost
	case "marijuana": {_ret = 19500;}; //Marijuana processing license cost
	case "medmarijuana": {_ret = 1500;}; //Medical Marijuana processing license cost
	case "gang": {_ret = 10000;}; //Gang license cost
	case "rebel": {_ret = 75000;}; //Rebel license cost
	case "truck": {_ret = (20000 * (life_nbrFoisPermis + 1));};
	case "diamond": {_ret = 4350;};
	case "salt": {_ret = 12000;};
	case "cocaine": {_ret = 30000;};
	case "sand": {_ret = 460;};
	case "iron": {_ret = 690;};
	case "copper": {_ret = 570;};
	case "cement": {_ret = 1600;};
	case "mair": {_ret = 15000;};
	case "home": {_ret = 100;};
	case "opium": {_ret = 150000;};
	case "vin": {_ret = 1000;};
	case "pprecieuse": {_ret = 3240;};
	case "fonderie": {_ret = 800;};
	case "fonderieExp": {_ret = 4300;};
	case "chaux": {_ret = 430;};
	case "presseur": {_ret = 230;};
	case "fishsoup": {_ret = 500;};
	case "acier": {_ret = 2300;};
	case "fermenta": {_ret = 1000;};
	case "silver": {_ret = 2400;};
    case "aluminium": {_ret = 1100;};
};
_ret;