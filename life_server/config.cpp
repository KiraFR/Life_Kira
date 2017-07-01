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
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};

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
            class resources {};
            class vente {};
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
			class huntingZone {};
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
