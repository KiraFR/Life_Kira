class Life_AccountMenu {
	idd = 1600;
	name = "life_AccountMenu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_accountgest;";
	
	class controlsBackground 
	{
		class Background: Life_RscText
		{
			idc = -1;
			x = 0.0124999;
			y = 0.166143;
			w = 0.975;
			h = 0.58;
			colorBackground[] = {0,0,0,0.7};
		};
		class Title: Life_RscText
		{
			idc = -1;
			text = "Gestion des comptes";
			x = 0.0125;
			y = 0.12;
			w = 0.975;
			h = 0.04;
			colorBackground[] = {0.38,0.7,0.88,1};
		};

		class ListAccBackground: Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,1};
			text = "";
			x = 0.0500001;
			y = 0.26;
			w = 0.9;
			h = 0.36;
		};
		class ListTitleBackground: Life_RscText
		{
			idc = -1;
			colorBackground[] = {0,0,0,1};
			text = "";
			x = 0.0500001;
			y = 0.2;
			w = 0.9;
			h = 0.04;
		};
	};
	class controls 
	{
		class ListAcc: Life_RscListNBox
		{
			idc = 1601;
			sizeEx = 0.035;
			columns[] = {0,0.15,0.3, 0.45, 0.625, 0.75};
			onLBSelChanged = "ctrlEnable[1603,true];ctrlEnable[1604,true];";
			x = 0.0500001;
			y = 0.26;
			w = 0.9;
			h = 0.36;
		};
		class ListTitle: Life_RscListNBox
		{
			idc = 1605;
			sizeEx = 0.035;
			columns[] = {0,0.15,0.3, 0.45, 0.625, 0.75};
			x = 0.0500001;
			y = 0.2;
			w = 0.9;
			h = 0.04;
		};
		class closer: Life_RscButtonMenu
		{
			idc = 1602;
			text = "Fermer";
			onButtonClick = "closeDialog 0;";
			x = 0.0125;
			y = 0.747715;
			w = 0.125;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
		class DefineDefaultAccount: Life_RscButtonMenu
		{
			idc = 1603;
			text = "Definir comme Default";
			onButtonClick = "[(lbCurSel 1601)] spawn life_fnc_SetAccountDefault;";
			x = 0.15;
			y = 0.66;
			w = 0.3125;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
		class Delete: Life_RscButtonMenu
		{
			idc = 1604;
			text = "Supprimer le compte";
			onButtonClick = "[(lbCurSel 1601)] spawn life_fnc_DeleteAccount;";
			x = 0.55;
			y = 0.66;
			w = 0.3125;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
	};
};