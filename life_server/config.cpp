class DefaultEventhandlers;
class CfgPatches
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"TAW_Tonic"};
	};
};

class CfgFunctions
{

	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
			class logs {};
			class SyncAccountDB {};
		};
	};

	class MySQLKira
	{
		tag = "KIRA";
		class MySQLKira
		{
			file = "\life_server\Functions\MySQLKira";
			class isConnected {};
			class transfertS {};
			class HCheckNearS {};
			class phoneNum {};
			class creerNumero {};
			class impot{};
			class saveTestament{};
			class queryAccountRequest{};
			class taxes{};
			class modifComptGouv{};
			class HAttackedPhone{};
		};
	};

	class bourse
	{
		tag = "bourse";
		class bourse
		{
			file = "\life_server\Functions\Bourse";
            class startServer {};
            class setObject {};
            class createObject {};
            class saveBourse {};
            class saveObject {};
            class ressources {};
            class vente {};
            class returnBourse {};
            class forceSaveObject {};
		};
	};

	class gouv
    {
    	tag = "gouv";
    	class gouv
    	{
    		file = "\life_server\Functions\Gouv";
            class SetGouv {};
    	};
    };

	class Life_System
	{
		tag = "life";
		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
		};

		class Client_Code
		{
			file = "\life_server\Functions\Client";
		};
	};

	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class getVehicles_fourriere {};
			class fourriereStore {};
			class getVehiclesCop {};
			class insureCar {};
		};

		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
		};

		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};
	};
	class BanqueKronosD {
		tag = "BQKS";
		class Banque_KronosD {
			file = "\life_server\Functions\Bank";
			class CreateAccount {};
			class DeleteAccount {};
			class GetAccount {};
			class SetDefaultAccount {};
		};
	};
	class AssasinDosta
	{
			tag = "ASSA";
			file = "\life_server\Functions\Murder"
			class GetContract {};
			class GetContractA {};
			class TransferToMurd {};
			class AcceptContrat {};
			class GetMurderer {};
			class StopContrat {};
			class ContratHarass {};
			class ContratKid {};
			class ContratMurd {};
	};
};



class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};

	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};

class CfgDifficultyPresets
{
	defaultPreset = Custom;
 
	// Parameters that affect difficulty and which are shared among presets
	myArmorCoef = 1;
	groupArmorCoef = 1;
 
	//Parameters that affect the Limited distance choice for Group Indicators, Friendly Name Tags, Enemy Name Tags and Detected Mines.
	//They determine on which distance the indicators are fully visible and how many more meters it takes until the indicator fades-out completely.
	fadeDistanceStart = 40.0;
	fadeDistanceSpan = 10.0;
 
	recoilCoef = 1;
	visionAidCoef = 0.8;
	divingLimitMultiplier = 1.0;		//Multiplier to limit capacity of lungs for soldiers.
 
	animSpeedCoef = 0;
	cancelThreshold = 0;			//Threshold used for interrupting action.
	showCadetHints = 1; // (0 = disabled, 1 = enabled)
	showCadetWP = 1; // (0 = disabled, 1 = enabled)
 
	class Custom
	{
		displayName = "";	    //Name of the difficulty preset.
        optionDescription = "";                                      //Description
		optionPicture = "\A3\Ui_f\data\Logos\arma3_white_ca.paa"; //Picture
        levelAI = "AILevelMedium";//Level of AI skill
 
                //All options of the Custom preset are set by the engine. The values in config
		class Options
		{
			// Simulation
			reducedDamage = 0;    // Reduced damage (0 = disabled, 1 = enabled)
 
			// Situational awareness
			groupIndicators = 0;      // Group indicators   (0 = never, 1 = limited distance, 2 = always)
			friendlyTags = 0;         // Friendly name tags (0 = never, 1 = limited distance, 2 = always)
			enemyTags = 0;            // Enemy name tags    (0 = never, 1 = limited distance, 2 = always)
			detectedMines = 0;        // Detected mines     (0 = never, 1 = limited distance, 2 = always)
			commands = 0;             // Commands           (0 = never, 1 = fade out, 2 = always)
			waypoints = 2;            // Waypoints          (0 = never, 1 = fade out, 2 = always)
            tacticalPing = 0;       //Tactical Ping (0 = disabled, 1 = enabled)
 
			// Personal awareness
			weaponInfo = 1;           // Weapon info        (0 = never, 1 = fade out, 2 = always)
			stanceIndicator = 0;      // Stance indicator   (0 = never, 1 = fade out, 2 = always)
			staminaBar = 0;       // Stamina bar (0 = disabled, 1 = enabled)
			weaponCrosshair = 0;  // Weapon crosshair (0 = disabled, 1 = enabled)
			visionAid = 0;        // Vision aid (0 = disabled, 1 = enabled)
 
			// View
			thirdPersonView = 1;  // 3rd person view (0 = disabled, 1 = enabled)
			cameraShake = 0;      // Camera shake (0 = disabled, 1 = enabled)
 
			// Multiplayer
			scoreTable = 0;       // Score table (0 = disabled, 1 = enabled)
			deathMessages = 0;    // Killed by (0 = disabled, 1 = enabled)
			vonID = 0;            // VON ID (0 = disabled, 1 = enabled)
 
			// Misc
			mapContent = 0;       // Extended map content (0 = disabled, 1 = enabled)
			autoReport = 0;       // Automatic reporting (0 = disabled, 1 = enabled)
			multipleSaves = 0;    // Multiple saves (0 = disabled, 1 = enabled)
		};
	};
};