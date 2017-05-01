class Life_impot {
	idd = 6000;
	name= "Life_impot";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {0.55,0.04,0, "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.64;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.64;
			h = (1 / 25) + 0.03;
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 6001;
			text = "Impot";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class impotMenage : life_RscButtonMenu
		{
			idc = 6002;
			text = "Menages";
			colorBackground[] = {0.55,0.04,0, 0.5};
			onButtonClick = "[0] spawn life_fnc_sendImpot";
			
			x = 0.11; 
			y = 0.26;
			w = 0.2;
			h = (1 / 25);
		};
		
		class impotEntreprise : life_RscButtonMenu
		{
			idc = 6003;
			text = "Entreprises";
			colorBackground[] = {0.55,0.04,0, 0.5};
			onButtonClick = "[1] spawn life_fnc_sendImpot";
			
			sizeEx = 0.030;
			x = 0.32; 
			y = 0.26;
			w = 0.2; 
			h = (1 / 25);
		};

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.317;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};
