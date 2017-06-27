/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oil": {"life_inv_oil"};
			case "fuelF": {"life_inv_fuelF"};
			case "heroine": {"life_inv_heroine"};
			case "cannabis": {"life_inv_cannabis"};
			case "opium": {"life_inv_opium"};
			case "vin": {"life_inv_vin"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "Fishsoup": {"life_inv_Fishsoup"};
			case "donuts": {"life_inv_donuts"};
			case "money": {"life_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "shovel": {"life_inv_shovel"};
			case "bucket": {"life_inv_bucket"};
			case "copperB": {"life_inv_copperB"};
			case "FerB": {"life_inv_FerB"};
			case "iron_r": {"life_inv_iron_r"};
			case "copper_r": {"life_inv_copper_r"};
			case "salt_r": {"life_inv_salt_r"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "rock": {"life_inv_rock"};
			case "rockB": {"life_inv_rockB"};
			case "cocaine": {"life_inv_cocaine"};
			case "coca": {"life_inv_coca"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "Calcaire" : {"life_inv_Calcaire"};
			case "ArgentB" : {"life_inv_ArgentB"};
			case "AluminiumB" : {"life_inv_AluminiumB"};
			case "Orange" : {"life_inv_Orange"};
			case "Raisin" : {"life_inv_Raisin"};
			case "Jus_MultiFruit" : {"life_inv_Jus_MultiFruit"};
			case "Jus_De_Pomme" : {"life_inv_Jus_De_Pomme"};
			case "Jus_De_Raisin" : {"life_inv_Jus_De_Raisin"};
			case "Cidre" : {"life_inv_Cidre"};
			case "Vin" : {"life_inv_Vin"};
			case "Biere" : {"life_inv_Wisky"};
			case "Tabac" : {"life_inv_Tabac"};
            case "Aluminium" : {"life_inv_Aluminium"};
			case "Bois" : {"life_inv_Bois"};
			case "Argent" : {"life_inv_Argent"};
			case "Charbon" : {"life_inv_Charbon"};
			case "Chaux" : {"life_inv_Chaux"};
			case "Acier" : {"life_inv_Acier"};
			case "Shit" : {"life_inv_Shit"};
			case "Meth" : {"life_inv_Meth"};
			case "Pharmaceutique" : {"life_inv_Pharmaceutique"};
			case "Speedball" : {"life_inv_Speedball"};
		    case "Wisky" : {"life_inv_Wisky"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oil": {"oil"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_inv_heroine": {"heroine"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_opium": {"opium"};
			case "life_inv_vin": {"vin"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishing": {"fishingpoles"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_Fishsoup": {"Fishsoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_shovel": {"shovel"};
			case "life_inv_bucket": {"bucket"};
			case "life_inv_copperB": {"copperB"};
			case "life_inv_FerB": {"FerB"};
			case "life_inv_iron_r": {"iron_r"};
			case "life_inv_copper_r": {"copper_r"};
			case "life_inv_salt_r": {"salt_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_glass": {"glass"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_peach": {"peach"};
			case "life_inv_rock": {"rock"};
			case "life_inv_rockB": {"rockB"};
			case "life_inv_cocaine": {"cocaine"};
			case "life_inv_coca": {"coca"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_ArgentB" : {"ArgentB"};
			case "life_inv_AluminiumB" : {"AluminiumB"};
			case "life_inv_Calcaire" : {"Calcaire"};
			case "life_inv_Orange" : {"Orange"};
            case "life_inv_Raisin" : {"Raisin"};
            case "life_inv_Jus_MultiFruit" : {"Jus_MultiFruit"};
            case "life_inv_Jus_De_Pomme" : {"Jus_De_Pomme"};
            case "life_inv_Jus_De_Raisin" : {"Jus_De_Raisin"};
            case "life_inv_Cidre" : {"Cidre"};
            case "life_inv_Vin" : {"Vin"};
            case "life_inv_Biere" : {"Biere"};
            case "life_inv_Aluminium" : {"Aluminium"};
            case "life_inv_Tabac" : {"Tabac"};
            case "life_inv_Bois" : {"Bois"};
			case "life_inv_Argent" : {"Argent"};
            case "life_inv_Charbon" : {"Charbon"};
            case "life_inv_Chaux" : {"Chaux"};
            case "life_inv_Acier" : {"Acier"};
            case "life_inv_Shit" : {"Shit"};
            case "life_inv_Meth" : {"Meth"};
            case "life_inv_Pharmaceutique" : {"Pharmaceutique"};
            case "life_inv_Speedball" : {"Speedball"};
            case "life_inv_Wisky" : {"Wisky"};

		};
	};
};
