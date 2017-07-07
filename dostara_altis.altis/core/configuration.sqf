#include "..\macro.h"
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
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
CONSTANT(life_paycheck_period,5); //Five minutes
CASH = 10000;
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
		CASH = 15000; //Starting Cash Money
		life_paycheck = 500; //Paycheck Amount
	};
	case civilian:
	{
		BANK = 0; //Starting Bank Money
		CASH = 10000; //Starting Cash Money
		life_paycheck = 350; //Paycheck Amount
	};

	case independent: {
		BANK = 0; //Starting Cash Money
		CASH = 10000;
		life_paycheck = 450;
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
    "life_inv_jus_multifruits",
    "life_inv_wrap",
    "life_inv_burger",
    "life_inv_soda",
    "life_inv_seau",
    "life_inv_pelle",
    "life_inv_pioche",
    "life_resource_pommes",
    "life_resource_raisin",
    "life_resource_jus_pomme",
    "life_resource_jus_raisin",
    "life_resource_cidre",
    "life_resource_vin",
    "life_resource_biere",
    "life_resource_whisky",
    "life_resource_cafe",
    "life_resource_tabac",
    "life_resource_saupe",
    "life_resource_girelle",
    "life_resource_maquereau",
    "life_resource_thon",
    "life_resource_mulet",
    "life_resource_roussette",
    "life_resource_soupe_poisson",
    "life_resource_aluminium",
    "life_resource_argent",
    "life_resource_bois",
    "life_resource_charbons",
    "life_resource_chaux",
    "life_resource_cuivre",
    "life_resource_fer",
    "life_resource_petrole",
    "life_resource_pierres_precieuses",
    "life_resource_sable",
    "life_resource_sel",
    "life_resource_varre",
    "life_resource_acier",
    "life_resource_bijoux",
    "life_resource_ciment",
    "life_resource_essence",
    "life_resource_cannabis",
    "life_resource_coca",
    "life_resource_opium",
    "life_resource_cocaine",
    "life_resource_heroine",
    "life_resource_shit",
    "life_resource_meth",
    "life_resource_pharmceutique",
    "life_resource_speedball",
    "life_resource_tortue"

];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} forEach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_gdo","cop"],
	["license_cop_cg","cop"],
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
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_opium","civ"],
	["license_civ_vin","civ"],
	["licence_civ_fermenta","civ"],
	["licence_civ_gouv","civ"],
	["license_civ_ebou","civ"],

	["licence_civ_ASG","civ"],
	["licence_civ_AMC","civ"],
	["licence_civ_AMG","civ"],
	["licence_civ_ASP","civ"]

];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} forEach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["opium",2300],["turtle",3000],["blastingcharge",10000],["boltcutter",500]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["Orange",5],
    ["Peche",5],
    ["Bouteille_d_eau" ,10],
    ["Jus_Multisfruits",15],
    ["Wrap_Poulet",10],
    ["Big_Burger",15],
    ["Soda_Extra_Energy_Drink",50],
    ["Seau",45],
    ["Pelle",45],
    ["Pioche",55],
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
    ["Thon",-1],
    ["Mulet",-1],
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
    ["Pierres_Precieuses",-1],
    ["Sable",-1],
    ["Sel",-1],
    ["Verre",-1],
    ["Acier",-1],
    ["Bijoux",-1],
    ["Ciment",-1],
    ["Essence",-1],
    ["Canabis",-1],
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
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
CONSTANT(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
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
CONSTANT(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",10000]
];
CONSTANT(life_garage_sell,life_garage_sell);


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
