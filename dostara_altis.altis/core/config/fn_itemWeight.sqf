/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "apple": {1};
	case "peach": {1};
	case "orange": {1};
	case "raisin": {1};
	case "oil": {2};
	case "heroine": {1};
	case "vin": {1};
	case "Calcaire" : {2};
	case "ArgentB" : {3};
	case "AluminiumB" : {3};
	case "Jus_MultiFruit" : {1};
	case "Jus_De_Pomme" : {1};
	case "Jus_De_Raisin" : {1};
	case "Cidre" : {1};
	case "Vin" : {1};
	case "Biere" : {1};
	case "Tabac" : {1};
	case "coffee": {1};
    case "Wisky" : {1};
    case "Aluminium" : {2};
	case "Bois" : {5};
	case "Argent" : {1};
	case "Charbon" : {2};
	case "Chaux" : {1};
	case "Acier" : {6};
	case "Shit" : {1};
	case "Meth" : {1};
	case "Pharmaceutique" : {1};
	case "Speedball" : {1};
	case "rock": {1};
	case "rockB": {3};
	case "copperB": {3};
	case "FerB": {4};
	case "cocaine": {1};
	case "coca": {1};
	case "cannabis": {1};
	case "opium": {1};
	case "water": {1};
	case "rabbit": {1};

	case "salema": {1}; // Saupe
	case "ornate": {1}; // Girelle
	case "mackerel": {2}; // Maquereau
	case "tuna": {3}; // Thon
	case "mullet": {2}; // Mullet
	case "catshark": {3}; // Roussette


	case "turtle": {6};
	case "fishing": {2};
	case "fishsoup": {2};
	case "donuts": {1};
	case "fuelF": {1};
	case "money": {0};
	case "pickaxe": {2};
	case "shovel": {2};
	case "bucket": {2};
	case "cement": {3};
	case "copper_r": {2};
	case "iron_r": {2};
	case "sand": {2};
	case "salt_r": {1};
	case "glass": {1};
	case "spikeStrip": {15};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	default {1};
};