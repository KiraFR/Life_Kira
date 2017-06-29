/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oil": {"Petrole"};
	case "life_inv_heroine": {"Heroine"};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_shit": {"shit"};
	case "life_inv_opium": {"opium"};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_turtleD": {"Tortue morte"};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_Fishsoup": {"Soupe de Poisson"};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelF": {"Essence"};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_shovel": {(localize "STR_Item_Shovel")};
	case "life_inv_bucket": {(localize "STR_Item_Bucket")};
	case "life_inv_iron_r": {(localize "STR_Item_IronIngot")};
	case "life_inv_copper_r": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt_r": {"Sel"};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coca": {"Feuille de coca"};
	case "life_inv_cocaine": {"Cocaine"};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_copperB": {"Cuivre Brut"};
	case "life_inv_rock": {"Pierre Precieuse"};
	case "life_inv_rockB": {"Pierre Brut"};
	case "life_inv_Calcaire" : {"Calcaire"};
	case "life_inv_ArgentB" : {"Argent Brut"};
	case "life_inv_AluminiumB" : {"Aluminium Brut"};
	case "life_inv_Orange" : {(localize "STR_Item_Orange")};
    case "life_inv_Raisin" : {(localize "STR_Item_Raisin")};
    case "life_inv_Jus_MultiFruit" : {(localize "STR_Item_Jus_MultiFruit")};
    case "life_inv_Jus_De_Pomme" : {(localize "STR_Item_Jus_De_Pomme")};
    case "life_inv_Jus_De_Raisin" : {(localize "STR_Item_Jus_De_Raisin")};
    case "life_inv_Cidre" : {(localize "STR_Item_Cidre")};
    case "life_inv_Vin" : {(localize "STR_Item_Vin")};
    case "life_inv_Wisky" : {(localize "STR_Item_Wisky")};
    case "life_inv_Biere" : {(localize "STR_Item_Biere")};
    case "life_inv_Tabac" : {(localize "STR_Item_Tabac")};
    case "life_inv_Aluminium" : {(localize "STR_Item_Aluminium")};
    case "life_inv_Bois" : {"Bois"};
	case "life_inv_Argent" : {(localize "STR_Item_Argent")};
    case "life_inv_Charbon" : {(localize "STR_Item_Charbon")};
    case "life_inv_Chaux" : {(localize "STR_Item_Chaux")};
    case "life_inv_Acier" : {(localize "STR_Item_Acier")};
    case "life_inv_Shit" : {(localize "STR_Item_Shit")};
    case "life_inv_Meth" : {(localize "STR_Item_Meth")};
    case "life_inv_Pharmaceutique" : {(localize "STR_Item_Pharmaceutique")};
    case "life_inv_Speedball" : {(localize "STR_Item_Speedball")};
	case "life_inv_bijoux" : {"Bijoux"};

	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_gdo": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_opium": {(localize "STR_License_Opium")};
	case "licence_civ_gouv": {(localize "STR_License_Gouv")};
	case "licence_cop_Prefet": {(localize "STR_License_Prefet")};
    case "licence_civ_ebou": {(localize "STR_License_Ebou")};
	case "licence_civ_fermenta": {(localize "STR_License_Cidre")};
	case "licence_civ_vin": {(localize "STR_License_Vin")};
};
