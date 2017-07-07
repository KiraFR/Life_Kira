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
            case "Orange" : {"life_inv_orange"};
            case "Peche" : {"life_inv_peche"};
            case "Bouteille_d_eau" : {"life_inv_eau"};
            case "Jus_Multisfruits" : {"life_inv_jus_multifruits"};
            case "Wrap_Poulet" : {"life_inv_wrap"};
            case "Big_Burger" : {"life_inv_burger"};
            case "Soda_Extra_Energy_Drink" : {"life_inv_soda"};
            case "Seau" : {"life_inv_seau"};
            case "Pelle" : {"life_inv_pelle"};
            case "Pioche" : {"life_inv_pioche"};
            case "Pommes" : {"life_resource_pommes"};
            case "Raisin" : {"life_resource_raisin"};
            case "Jus_de_pommes" : {"life_resource_jus_pomme"};
            case "Jus_de_raisin" : {"life_resource_jus_raisin"};
            case "Cidre" : {"life_resource_cidre"};
            case "Vin" : {"life_resource_vin"};
            case "Biere" : {"life_resource_biere"};
            case "Whisky" : {"life_resource_whisky"};
            case "Cafe" : {"life_resource_cafe"};
            case "Tabac" : {"life_resource_tabac"};
            case "Saupe" : {"life_resource_saupe"};
            case "Girelle" : {"life_resource_girelle"};
            case "Maquereau" : {"life_resource_maquereau"};
            case "Thon" : {"life_resource_thon"};
            case "Mulet" : {"life_resource_mulet"};
            case "Roussette" : {"life_resource_roussette"};
            case "Soupe_de_poisson" : {"life_resource_soupe_poisson"};
            case "Aluminium" : {"life_resource_aluminium"};
            case "Argent" : {"life_resource_argent"};
            case "Bois" : {"life_resource_bois"};
            case "Charbons" : {"life_resource_charbons"};
            case "Chaux" : {"life_resource_chaux"};
            case "Cuivre" : {"life_resource_cuivre"};
            case "Fer" : {"life_resource_fer"};
            case "Petrole" : {"life_resource_petrole"};
            case "Pierres_Precieuses" : {"life_resource_pierres_precieuses"};
            case "Sable" : {"life_resource_sable"};
            case "Sel" : {"life_resource_sel"};
            case "Verre" : {"life_resource_verre"};
            case "Acier" : {"life_resource_acier"};
            case "Bijoux" : {"life_resource_bijoux"};
            case "Ciment" : {"life_resource_ciment"};
            case "Essence" : {"life_resource_essence"};
            case "Canabis" : {"life_resource_cannabis"};
            case "Coca" : {"life_resource_coca"};
            case "Opium" : {"life_resource_opium"};
            case "Cocaine" : {"life_resource_cocaine"};
            case "Heroine" : {"life_resource_heroine"};
            case "Shit" : {"life_resource_shit"};
            case "Meth" : {"life_resource_meth"};
            case "Pharmaceutique" : {"life_resource_pharmceutique"};
            case "Speed_Ball" : {"life_resource_speedball"};
            case "Tortue" : {"life_resource_tortue"};

		};
	};
	
	case 1:
	{
		switch (_var) do
		{
            case "life_inv_orange" : {"Orange"};
            case "life_inv_peche" : {"Peche"};
            case "life_inv_eau" : {"Bouteille_d_eau"};
            case "life_inv_jus_multifruits" : {"Jus_Multisfruits"};
            case "life_inv_wrap" : {"Wrap_Poulet"};
            case "life_inv_burger" : {"Big_Burger"};
            case "life_inv_soda" : {"Soda_Extra_Energy_Drink"};
            case "life_inv_seau" : {"Seau"};
            case "life_inv_pelle" : {"Pelle"};
            case "life_inv_pioche" : {"Pioche"};
            case "life_resource_pommes" : {"Pommes"};
            case "life_resource_raisin" : {"Raisin"};
            case "life_resource_jus_pomme" : {"Jus_de_pommes"};
            case "life_resource_jus_raisin" : {"Jus_de_raisin"};
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
            case "life_resource_soupe_poisson" : {"Soupe_de_poisson"};
            case "life_resource_aluminium" : {"Aluminium"};
            case "life_resource_argent" : {"Argent"};
            case "life_resource_bois" : {"Bois"};
            case "life_resource_charbons" : {"Charbons"};
            case "life_resource_chaux" : {"Chaux"};
            case "life_resource_cuivre" : {"Cuivre"};
            case "life_resource_fer" : {"Fer"};
            case "life_resource_petrole" : {"Petrole"};
            case "life_resource_pierres_precieuses" : {"Pierres_Precieuses"};
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
            case "life_resource_speedball" : {"Speed_Ball"};
            case "life_resource_tortue" : {"Tortue"};
		};
	};
};
