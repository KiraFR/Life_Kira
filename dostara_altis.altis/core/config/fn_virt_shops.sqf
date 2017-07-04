/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["Orange","Raisin","turtlesoup","Jus_MultiFruit","Jus_De_Pomme","Jus_De_Raisin","water","rabbit","apple","redgull","tbacon","pickaxe","shovel","bucket","fuelF","peach","boltcutter","storagesmall","storagebig"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","pickaxe","shovel","bucket","fuelF","peach","boltcutter","blastingcharge"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","lockpick","pickaxe","shovel","bucket","fuelF","peach"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "coffee": {["Stratis Coffee Club",["Tabac","coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana","opium","Shit","Meth","Speedball","coca"]]};
	case "Caviste": {["Caviste",["vin","cidre"]]};
	case "build": {["Builder",["Bois","Chaux","copper_r","iron_r","sand","glass","Acier","cement"]]};
	case "Eluxe": {["Export Luxe",["Argent","rock","bijoux"]]};
	case "ECombustible": {["Oil Trader",["Bois","Charbon","fuelF","oil"]]};
	case "fishmarket": {["Poissonnerie",["salema","ornate","mackerel","mullet","tuna","catshark","salt_r"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r","Aluminium","Acier"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
};
