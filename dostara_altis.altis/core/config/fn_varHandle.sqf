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
            case "Pommes" : {"life_ressource_pommes"};
            case "Raisin" : {"life_ressource_raisin"};
            case "Jus_de_pommes" : {"life_ressource_jus_pomme"};
            case "Jus_de_raisin" : {"life_ressource_jus_raisin"};
            case "Cidre" : {"life_ressource_cidre"};
            case "Vin" : {"life_ressource_vin"};
            case "Biere" : {"life_ressource_biere"};
            case "Whisky" : {"life_ressource_whisky"};
            case "Cafe" : {"life_ressource_cafe"};
            case "Tabac" : {"life_ressource_tabac"};
            case "Saupe" : {"life_ressource_saupe"};
            case "Girelle" : {"life_ressource_girelle"};
            case "Maquereau" : {"life_ressource_maquereau"};
            case "Thon" : {"life_ressource_thon"};
            case "Mulet" : {"life_ressource_mulet"};
            case "Roussette" : {"life_ressource_roussette"};
            case "Soupe_de_poisson" : {"life_ressource_soupe_poisson"};
            case "Aluminium" : {"life_ressource_aluminium"};
            case "Argent" : {"life_ressource_argent"};
            case "Bois" : {"life_ressource_bois"};
            case "Charbons" : {"life_ressource_charbons"};
            case "Chaux" : {"life_ressource_chaux"};
            case "Cuivre" : {"life_ressource_cuivre"};
            case "Fer" : {"life_ressource_fer"};
            case "Petrole" : {"life_ressource_petrole"};
            case "Pierres_Precieuses" : {"life_ressource_pierres_precieuses"};
            case "Sable" : {"life_ressource_sable"};
            case "Sel" : {"life_ressource_sel"};
            case "Verre" : {"life_ressource_verre"};
            case "Acier" : {"life_ressource_acier"};
            case "Bijoux" : {"life_ressource_bijoux"};
            case "Ciment" : {"life_ressource_ciment"};
            case "Essence" : {"life_ressource_essence"};
            case "Canabis" : {"life_ressource_cannabis"};
            case "Coca" : {"life_ressource_coca"};
            case "Opium" : {"life_ressource_opium"};
            case "Cocaine" : {"life_ressource_cocaine"};
            case "Heroine" : {"life_ressource_heroine"};
            case "Shit" : {"life_ressource_shit"};
            case "Meth" : {"life_ressource_meth"};
            case "Pharmaceutique" : {"life_ressource_pharmceutique"};
            case "Speed_Ball" : {"life_ressource_speedball"};
            case "Tortue" : {"life_ressource_tortue"};

            case "Calcaire" : {"life_ressource_calcaire"};
            case "Aluminium_Brut" : {"life_ressource_aluminium_brut"};
            case "Argent_Brut" : {"life_ressource_argent_brut"};
            case "Cuivre_Brut" : {"life_ressource_cuivre_brut"};
            case "Fer_Brut" : {"life_ressource_fer_brut"};

            case "Grand_Coffre" : {"life_inv_grand_coffre"};
            case "Petit_Coffre" : {"life_inv_petit_coffre"};
            case "Herse" : {"life_inv_herse"};
            case "Outil_Crochetage" : {"life_inv_outil_crochetage"};
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
            case "life_ressource_pommes" : {"Pommes"};
            case "life_ressource_raisin" : {"Raisin"};
            case "life_ressource_jus_pomme" : {"Jus_de_pommes"};
            case "life_ressource_jus_raisin" : {"Jus_de_raisin"};
            case "life_ressource_cidre" : {"Cidre"};
            case "life_ressource_vin" : {"Vin"};
            case "life_ressource_biere" : {"Biere"};
            case "life_ressource_whisky" : {"Whisky"};
            case "life_ressource_cafe" : {"Cafe"};
            case "life_ressource_tabac" : {"Tabac"};
            case "life_ressource_saupe" : {"Saupe"};
            case "life_ressource_girelle" : {"Girelle"};
            case "life_ressource_maquereau" : {"Maquereau"};
            case "life_ressource_thon" : {"Thon"};
            case "life_ressource_mulet" : {"Mulet"};
            case "life_ressource_roussette" : {"Roussette"};
            case "life_ressource_soupe_poisson" : {"Soupe_de_poisson"};
            case "life_ressource_aluminium" : {"Aluminium"};
            case "life_ressource_argent" : {"Argent"};
            case "life_ressource_bois" : {"Bois"};
            case "life_ressource_charbons" : {"Charbons"};
            case "life_ressource_chaux" : {"Chaux"};
            case "life_ressource_cuivre" : {"Cuivre"};
            case "life_ressource_fer" : {"Fer"};
            case "life_ressource_petrole" : {"Petrole"};
            case "life_ressource_pierres_precieuses" : {"Pierres_Precieuses"};
            case "life_ressource_sable" : {"Sable"};
            case "life_ressource_sel" : {"Sel"};
            case "life_ressource_verre" : {"Verre"};
            case "life_ressource_acier" : {"Acier"};
            case "life_ressource_bijoux" : {"Bijoux"};
            case "life_ressource_ciment" : {"Ciment"};
            case "life_ressource_essence" : {"Essence"};
            case "life_ressource_cannabis" : {"Canabis"};
            case "life_ressource_coca" : {"Coca"};
            case "life_ressource_opium" : {"Opium"};
            case "life_ressource_cocaine" : {"Cocaine"};
            case "life_ressource_heroine" : {"Heroine"};
            case "life_ressource_shit" : {"Shit"};
            case "life_ressource_meth" : {"Meth"};
            case "life_ressource_pharmceutique" : {"Pharmaceutique"};
            case "life_ressource_speedball" : {"Speed_Ball"};
            case "life_ressource_tortue" : {"Tortue"};

            case "life_ressource_calcaire" : {"Calcaire"};
            case "life_ressource_aluminium_brut" : {"Aluminium_Brut"};
            case "life_ressource_argent_brut" : {"Argent_Brut"};
            case "life_ressource_cuivre_brut" : {"Cuivre_Brut"};
            case "life_ressource_fer_brut" : {"Fer_Brut"};

            case "life_inv_grand_coffre" : {"Grand_Coffre"};
            case "life_inv_petit_coffre" : {"Petit_Coffre"};
            case "life_inv_herse" : {"Herse"};
            case "life_inv_outil_crochetage" : {"Outil_Crochetage"};
		};
	};
};
