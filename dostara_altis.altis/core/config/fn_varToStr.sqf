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

    case "life_inv_orange" : {"Orange"};
    case "life_inv_peche" : {"Peche"};
    case "life_inv_eau" : {"Bouteille d'eau"};
    case "life_inv_jus_multifruits" : {"Jus Multisfruits"};
    case "life_inv_wrap" : {"Wrap Poulet"};
    case "life_inv_burger" : {"Big Burger"};
    case "life_inv_soda" : {"Soda Extra Energy Drink"};
    case "life_inv_seau" : {"Seau"};
    case "life_inv_pelle" : {"Pelle"};
    case "life_inv_pioche" : {"Pioche"};
    case "life_resource_pommes" : {"Pommes"};
    case "life_resource_raisin" : {"Raisin"};
    case "life_resource_jus_pomme" : {"Jus de pommes"};
    case "life_resource_jus_raisin" : {"Jus de raisin"};
    case "life_resource_cidre" : {"Cidre"};
    case "life_resource_vin" : {"Vin"};
    case "life_resource_biere" : {"Biere"};
    case "life_resource_whisky" : {"Whisky"};
    case "life_resource_cafe" : {"Cafe"};
    case "life_resource_tabac" : {"Tabac"};
    case "life_resource_saupe" : {"Saupe"};
    case "life_resource_girelle" : {"Girelle"};
    case "life_resource_maquereau" : {"Maquereau"};
    case "life_resource_thon" : {"Thon"};
    case "life_resource_mulet" : {"Mulet"};
    case "life_resource_roussette" : {"Roussette"};
    case "life_resource_soupe_poisson" : {"Soupe de poisson"};
    case "life_resource_aluminium" : {"Aluminium"};
    case "life_resource_argent" : {"Argent"};
    case "life_resource_bois" : {"Bois"};
    case "life_resource_charbons" : {"Charbons"};
    case "life_resource_chaux" : {"Chaux"};
    case "life_resource_cuivre" : {"Cuivre"};
    case "life_resource_fer" : {"Fer"};
    case "life_resource_petrole" : {"Petrole"};
    case "life_resource_pierres_precieuses" : {"Pierres Precieuses"};
    case "life_resource_sable" : {"Sable"};
    case "life_resource_sel" : {"Sel"};
    case "life_resource_verre" : {"Verre"};
    case "life_resource_acier" : {"Acier"};
    case "life_resource_bijoux" : {"Bijoux"};
    case "life_resource_ciment" : {"Ciment"};
    case "life_resource_essence" : {"Essence"};
    case "life_resource_cannabis" : {"Canabis"};
    case "life_resource_coca" : {"Coca"};
    case "life_resource_opium" : {"Opium"};
    case "life_resource_cocaine" : {"Cocaine"};
    case "life_resource_heroine" : {"Heroine"};
    case "life_resource_shit" : {"Shit"};
    case "life_resource_meth" : {"Meth"};
    case "life_resource_pharmceutique" : {"Pharmaceutique"};
    case "life_resource_speedball" : {"Speed Ball"};
    case "life_resource_tortue" : {"Tortue"};
    case "life_resource_calcaire" : {"Calcaire"};
    case "life_resource_aluminium_brut" : {"Aluminium Brut"};
    case "life_resource_argent_brut" : {"Argent Brut"};
    case "life_resource_cuivre_brut" : {"Cuivre Brut"};
    case "life_resource_fer_brut" : {"Fer Brut"};


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
	case "license_civ_Terroristes": {"Terroriste"};
	case "license_civ_petiteF": {"Petite Frappe"};
	case "license_civ_truck": {(localize "STR_License_Truck")};
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
	case "licence_civ_vin": {(localize "STR_License_Vin")};

	//New License

	case "license_civ_Acier": {(localize "STR_License_Acier")};
	case "license_civ_PPrecieuse": {"Taille de piere precieuse"};
	case "license_civ_diamond": {(localize "STR_License_Diamond")}; // Bijoux
	case "licence_civ_fonderie": {(localize "STR_License_Fonderie")};
	case "licence_civ_fonderieExp": {(localize "STR_License_FonderieExp")};
	case "licence_civ_Chaux": {(localize "STR_License_Usine")};
	case "license_civ_presseur": {(localize "STR_License_presseur")};
	case "licence_civ_fermenta": {(localize "STR_License_Cidre")};
	case "licence_civ_fishsoup": {"Licence Soupe de poisson"};
};
