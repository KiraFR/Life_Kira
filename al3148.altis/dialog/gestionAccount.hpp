class Life_AccountMenu {
	idd = 16000;
	name = "life_AccountMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_accountgest;[1] spawn life_fnc_accountgest;"
	
	class BackgroundControls {
	
				class Background: Life_RscText
				{
					idc = -1;
					x = 0;
					y = 0.04;
					w = 1;
					h = 0.64;
					colorBackground[] = {-1,-1,-1,0.7};
				};
				class Title_Background: Life_RscText
				{
					idc = -1;
					text = "Gestion des comptes";
					x = 0;
					y = 3.72529e-009;
					w = 1;
					h = 0.04;
					colorBackground[] = {0.38,0.7,0.88,0.7};
				};
			};	
	class controls {
	
				class MessageHeader: Life_RscListbox
				{
					idc = 16500;
					columns[] = {0,0.235,0.43,0.65};
					x = 0.05;
					y = 0.08;
					w = 0.9;
					h = 0.04;
				};
				class AccountList: Life_RscListbox
				{
					idc = 16501;
					columns[] = {0,0.235,0.43,0.65};
					x = 0.05;
					y = 0.16;
					w = 0.9;
					h = 0.44;
				};
				class Close_button: Life_RscButtonMenu
				{
					idc = 16400;
					text = "Fermer";
					x = 0;
					y = 0.68;
					w = 0.15;
					h = 0.04;
				};
				class DefineDefaultAccount: Life_RscButtonMenu
				{
					idc = 16401;
					text = "Definir comme Default";
					OnButtonClick = "call life_fnc_SetDefaultAccount";
					x = 0.7;
					y = 0.62;
					w = 0.2875;
					h = 0.04;
				};
				class Remove_Account: RscButtonMenu
				{
					idc = 16402;
					text = "Supprimer le compte";
					OnButtonClick = "call life_fnc_DeleteAccount";
					x = 0.3875;
					y = 0.62;
					w = 0.2875;
					h = 0.04;
					sizeEx = 0.04 * GUI_GRID_H;
				};
			};
};