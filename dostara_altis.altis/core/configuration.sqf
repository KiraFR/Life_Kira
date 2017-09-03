#include "..\macro.h"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
Time_Bourse = time;
life_bourse_completed = false;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_action_gathering = false;
life_is_alive = false;
life_listMessage = [];
life_drop_weapons_onDeath = true;
//Persistent Saving
CONSTANT(life_save_civ,TRUE); //Save weapons for civs?
CONSTANT(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
CONSTANT(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
CONSTANT(life_revive_fee,250); //Fee for players to pay when revived.

//House Limit
CONSTANT(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
CONSTANT(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
CONSTANT(life_gangUpgradeBase,10000); //MASDASDASD
CONSTANT(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
/*
*****************************
****** Kira Variables *****
*****************************
*/
life_pPermis = 0;
life_amende = 550;
life_nbrFoisPermis = 0;
life_waitpermis = false;
life_maxPoints = 2;
nbNotif = 0;
life_prix_Numero = 42;
life_shopList = ["civ_car","civ_truck","civ_air","civ_ship_peche","civ_ship_plaisance"];
life_gathering = false;
/*
*****************************
****** KronosD Variables *****
*****************************
*/
life_AccOffshore = 0;
life_AccN = 0;
life_EnterAcc = false;
life_OrgaAcc = false;
life_nbAcc = 0;
/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
CONSTANT(life_paycheck_period,15);
CONSTANT(life_impound_car,350);
CONSTANT(life_impound_boat,250);
CONSTANT(life_impound_air,850);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		BANK = 0; //Starting Bank Money
		CASH = 300; //Starting Cash Money
	};
	case civilian:
	{
		BANK = 0; //Starting Bank Money
		CASH = 300; //Starting Cash Money
	};

	case independent: {
		BANK = 0; //Starting Cash Money
		CASH = 300;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
CONSTANT(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
    "life_inv_orange",
    "life_inv_peche",
    "life_inv_eau",
    "life_inv_Jus_Multifruit",
    "life_inv_wrap",
    "life_inv_burger",
    "life_inv_soda",
    "life_inv_seau",
    "life_inv_pelle",
    "life_inv_pioche",
    "life_inv_harpon",
    "life_inv_herse",
    "life_inv_filet_a",
    "life_inv_filet_p",
    "life_inv_filet_e",
    "life_inv_outil_crochetage",
    "life_inv_grand_coffre",
    "life_inv_petit_coffre",
    "life_ressource_pommes",
    "life_ressource_raisin",
    "life_ressource_jus_pomme",
    "life_ressource_jus_raisin",
    "life_ressource_cidre",
    "life_ressource_vin",
    "life_ressource_biere",
    "life_ressource_whisky",
    "life_ressource_cafe",
    "life_ressource_tabac",
    "life_ressource_saupe",
    "life_ressource_girelle",
    "life_ressource_maquereau",
    "life_ressource_thon",
    "life_ressource_mulet",
    "life_ressource_roussette",
    "life_ressource_soupe_poisson",
    "life_ressource_aluminium",
    "life_ressource_argent",
    "life_ressource_bois",
    "life_ressource_charbons",
    "life_ressource_chaux",
    "life_ressource_cuivre",
    "life_ressource_fer",
    "life_ressource_petrole",
    "life_ressource_pierres_precieuses",
    "life_ressource_sable",
    "life_ressource_sel",
    "life_ressource_verre",
    "life_ressource_acier",
    "life_ressource_bijoux",
    "life_ressource_ciment",
    "life_ressource_essence",
    "life_ressource_cannabis",
    "life_ressource_coca",
    "life_ressource_opium",
    "life_ressource_cocaine",
    "life_ressource_heroine",
    "life_ressource_shit",
    "life_ressource_meth",
    "life_ressource_pharmceutique",
    "life_ressource_speedball",
    "life_ressource_tortue",
    "life_ressource_calcaire",
    "life_ressource_aluminium_brut",
    "life_ressource_argent_brut",
    "life_ressource_cuivre_brut",
    "life_ressource_fer_brut"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} forEach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_gdo","cop"],
	["license_cop_cg","cop"],
	["license_cop_prefet","cop"],
	["license_med_prefet","med"],
	["license_med_air","med"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_petiteF","civ"],
	["license_civ_coke","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_home","civ"],
	["license_civ_opium","civ"],
	["license_civ_vin","civ"],
	["license_civ_fermenta","civ"],
	["license_civ_gouv","civ"],
	["license_civ_ebou","civ"],

	["license_civ_ASG","civ"],
	["license_civ_AMC","civ"],
	["license_civ_AMG","civ"],
	["license_civ_ASP","civ"],

	["license_civ_diamond","civ"],
    ["license_civ_acier","civ"],
    ["license_civ_pprecieuse","civ"],
    ["license_civ_fonderie","civ"],
    ["license_civ_chaux","civ"],
    ["license_civ_presseur","civ"],
    ["license_civ_fermenta","civ"],
    ["license_civ_vin","civ"],
    ["license_civ_fishsoup","civ"],
    ["license_civ_aluminium","civ"],
    ["license_civ_silver","civ"],

    ["license_civ_wood_01","civ"],
    ["license_civ_wood_02","civ"],
    ["license_civ_wood_03","civ"],
    ["license_civ_wood_04","civ"],

    ["license_civ_petrol","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} forEach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [
	["Cannabis",0],
	["Coca",0],
	["Opium",0],
	["Cocaine",0],
	["Heroine",0],
	["Shit",0],
	["Meth",0]
];


/*
	Sell / buy arrays
*/
sell_array =
[
	["Orange",5],
    ["Peche",5],
    ["Bouteille_d_eau" ,10],
    ["Jus_Multifruit",15],
    ["Wrap_Poulet",10],
    ["Big_Burger",15],
    ["Soda_Extra_Energy_Drink",50],
    ["Seau",45],
    ["Pelle",45],
    ["Pioche",55],
    ["Herse",20],
    ["harpon",57],
    ["Outil_Crochetage",200],

    ["filet_a",57],
    ["filet_p",240],
    ["filet_e",1430],

    ["Grand_Coffre",-1],
    ["Petit_Coffre",-1],

    ["Pommes",-1],
    ["Raisin",-1],
    ["Jus_de_pommes" ,-1],
    ["Jus_de_raisin" ,-1],
    ["Cidre",-1],
    ["Vin",-1],
    ["Biere",-1],
    ["Whisky",-1],
    ["Cafe",-1],
    ["Tabac",-1],
    ["Saupe",-1],
    ["Girelle",-1],
    ["Maquereau",-1],
    ["Mulet",-1],
    ["Thon",-1],
    ["Roussette",-1],
    ["Soupe_de_poisson",-1],
    ["Aluminium",-1],
    ["Argent",-1],
    ["Bois",-1],
    ["Charbons",-1],
    ["Chaux",-1],
    ["Cuivre" ,-1],
    ["Fer",-1],
    ["Petrole",-1],
    ["Pierres_Precieuses_Brut",-1],
    ["Pierres_Precieuses",-1],
    ["Sable",-1],
    ["Sel",-1],
    ["Verre",-1],
    ["Acier",-1],
    ["Bijoux",-1],
    ["Ciment",-1],
    ["Essence",-1],
    ["Cannabis",-1],
    ["Coca",-1],
    ["Opium",-1],
    ["Cocaine",-1],
    ["Heroine",-1],
    ["Shit",-1],
    ["Meth",-1],
    ["Pharmaceutique",-1],
    ["Speed_Ball",-1],
    ["Tortue",-1]
];
CONSTANT(sell_array,sell_array);

//Bouse
//buy_array =  [];

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
CONSTANT(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",20],
	["C_Hatchback_01_F",20],
	["C_Offroad_01_F", 20],
	["B_G_Offroad_01_F",20],
	["C_SUV_01_F",20],
	["C_Van_01_transport_F",100],
	["C_Hatchback_01_sport_F",20],
	["C_Van_01_fuel_F",100],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",100],
	["I_Truck_02_transport_F",100],
	["I_Truck_02_covered_F",100],
	["B_Truck_01_transport_F",100],
	["B_Truck_01_box_F", 100],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",45000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500],


	//nos veh
	["dh2o_smart",20],
	["dh2o_tatra_613",20],
	["ivory_e36",20],
	["ivory_190e",20],
	["ivory_evox",20],
	["ivory_wrx",20],
	["ivory_gti",20],
	["ivory_isf",20],
	["ivory_elise",20],
	["ivory_supra",20],
	["ivory_suburban",20],
	["ivory_supra_topsecret",20],
	["ivory_rs4",20],
	["ivory_m3",20],
	["ivory_r34",20],
	["ivory_gt500",20],
	["ivory_c",20],
	["ivory_mp4",20],
	["ivory_lfa",20],
	["ivory_veyron",20],
	["ivory_f1",20]
];
CONSTANT(life_garage_prices,life_garage_prices);

life_fourriere_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",45000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500]
];
CONSTANT(life_fourriere_prices,life_fourriere_prices);
