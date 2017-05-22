#define F(NAME,TARGET) class NAME { \
	allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2

class CfgRemoteExec {
	class Functions {
		mode = 1;
		jip = 0;

		F(life_fnc_update,CLIENT)
		F(life_fnc_broadcast,CLIENT)
		F(life_fnc_RefreshReceived,CLIENT)
		F(life_fnc_netSetVar,CLIENT)
		F(life_fnc_gangDisbanded,CLIENT)
		F(life_fnc_jailMe,CLIENT)
		F(SOCK_fnc_dataQuery,CLIENT)
		F(SOCK_fnc_requestReceived,CLIENT)
		F(SOCK_fnc_insertPlayerInfo,CLIENT)
		F(HC_fnc_silentSync,CLIENT)
		F(life_fnc_impoundMenu,CLIENT)
		F(life_fnc_fourriereMenu,CLIENT)
		F(life_fnc_adminid,CLIENT)
		F(life_fnc_netSetVar,CLIENT)
		F(life_fnc_colorVehicle,CLIENT)
		F(life_fnc_spikeStripEffect,CLIENT)
		F(life_fnc_vehicleAnimate,CLIENT)
		F(life_fnc_addVehicle2Chain,CLIENT)
		F(life_fnc_simDisable,CLIENT)
		F(life_fnc_copSiren,CLIENT)
		F(life_fnc_medicSiren,CLIENT)
		F(life_fnc_lockVehicle,CLIENT)
		F(life_fnc_setTexture,CLIENT)
		F(life_fnc_removeLicenses,CLIENT)
		F(life_fnc_flashbang,CLIENT)
		F(life_fnc_giveDiff,CLIENT)
		F(life_fnc_gangInvite,CLIENT)
		F(TON_fnc_clientGangKick,CLIENT)
		F(TON_fnc_addHouse,CLIENT)
		F(life_fnc_lightHouse,CLIENT)
		F(clientGangLeader,CLIENT)
		F(life_fnc_demoChargeTimer,CLIENT)
		F(TON_fnc_clientGetKey,CLIENT)
		F(life_fnc_receiveMoney,CLIENT)
		F(life_fnc_soundDevice,CLIENT)
		F(life_fnc_setFuel,CLIENT)
		F(life_fnc_copMedicRequest,CLIENT)
		F(life_fnc_corpse,CLIENT)
		F(life_fnc_revived,CLIENT)
		F(life_fnc_receiveItem,CLIENT)
		F(life_fnc_createMarker,CLIENT)
		F(life_fnc_clientMessage,CLIENT)
		F(TON_fnc_clientWireTransfer,CLIENT)
		F(life_fnc_animSync,CLIENT)
		F(life_fnc_lbAccounts,CLIENT)
		F(Call_fnc_acceptcall,CLIENT)
		F(Call_fnc_stopAppel,CLIENT)
		F(Call_fnc_refuseCall,CLIENT)
		F(Call_fnc_calling_received,CLIENT)
		F(KIRA_fnc_receivedMsg,CLIENT)
		F(KIRA_fnc_HRadioPlayer,CLIENT)
		F(life_fnc_play3D,CLIENT)
		F(KIRA_fnc_receiveTestament,CLIENT)

		F(TON_fnc_managesc,SERVER)
		F(TON_fnc_updateHouseContainers,SERVER)
		F(TON_fnc_insertGang,SERVER)
		F(TON_fnc_removeGang,SERVER)
		F(TON_fnc_updateGang,SERVER)
		F(TON_fnc_sellHouse,SERVER)
		F(TON_fnc_managesc,SERVER)
		F(TON_fnc_playerLogged,SERVER)
		F(life_fnc_fedSuccess,SERVER)
		F(DB_fnc_updatePartial,SERVER)
		F(DB_fnc_updateRequest,SERVER)
		F(DB_fnc_queryRequest,SERVER)
		F(DB_fnc_insertRequest,SERVER)
		F(DB_fnc_logs,SERVER)
		F(IMPT_fnc_impot,SERVER)
		F(TON_fnc_updateGang,SERVER)
		F(TON_fnc_setObjVar,SERVER)
		F(TON_fnc_keyManagement,SERVER)
		F(TON_fnc_vehicleCreate,SERVER)
		F(TON_fnc_updateHouseTrunk,SERVER)
		F(TON_fnc_cleanupRequest,SERVER)
		F(TON_fnc_spikeStrip,SERVER)
		F(TON_fnc_vehicleDelete,SERVER)
		F(TON_fnc_spawnVehicle,SERVER)
		F(TON_fnc_getVehicles_fourriere,SERVER)
		F(TON_fnc_getVehicles,SERVER)
		F(KIRA_fnc_transfertS,SERVER)
		F(KIRA_fnc_impotPaye,SERVER)
		F(KIRA_fnc_phoneNum,SERVER)
		F(KIRA_fnc_HCheckNearS,SERVER)
		F(KIRA_fnc_InsertFormNot,SERVER)

		
		F(BQKS_fnc_CreateAccount,SERVER)
		F(BQKS_fnc_CreateAccountOff,SERVER)
		F(BQKS_fnc_CreateAccountEntre,SERVER)
		F(BQKS_fnc_GetAccount,SERVER)
		F(BQKS_fnc_DeleteAccount,SERVER)
		F(BQKS_fnc_SetDefaultAccount,SERVER)
		
		F(ASSA_fnc_GetContractA,SERVER)
		F(ASSA_fnc_GetContract,SERVER)
		F(ASSA_fnc_ContratKid,SERVER)
		F(ASSA_fnc_ContratMurd,SERVER)
		F(ASSA_fnc_ContratHarass,SERVER)
		F(ASSA_fnc_StopContrat,SERVER)
		F(ASSA_fnc_GetContractActif,SERVER)
		F(ASSA_fnc_AcceptContrat,SERVER)
		F(ASSA_fnc_TransferToMurd,SERVER)
		
        //Bourse
        F(life_fnc_vente,SERVER)
        F(life_fnc_virt_sellBourse,CLIENT)

		/* changement telephone Kira V3
			F(SMPH_fnc_findContact,SERVER)
		*/
	};

	class Commands {
		mode = 1;
		jip = 0;

		F(setFuel,ANYONE)
		F(addWeapon,ANYONE)
		F(addMagazine,ANYONE)
		F(addPrimaryWeaponItem,ANYONE)
		F(addHandgunItem,ANYONE)
		F(life_fnc_jumpFnc,ANYONE)
		F(life_fnc_jumpFnc,ANYONE)
		
		F(join,ANYONE)
	};
};
