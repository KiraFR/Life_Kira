class Life_AccountReqOff {
	idd = 12000;
	name= "life_AccountRequestOff";
	movingEnable = false;
	enableSimulation = true;

class controlsBackground {

		class Main_BackGround: Life_RscText
			{
				idc = -1;
				x = 0;
				y = 0;
				w = 0.325;
				h = 0.8;
				colorBackground[] = {-1,-1,-1,0.7};
			};

		class Background_up: Life_RscText
			{
				idc = -1;
				text = "Creation d'un compte en banque Offshore";
				x = 0;
				y = 0;
				w = 0.325;
				h = 0.04;
				colorBackground[] = {0.38,0.7,0.88,0.7};
			};
		};

class controls {

		class Button_Validate: life_RscButtonMenu
			{
				idc = 12001;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
				onButtonClick = "[1] call life_fnc_RequestAccount";
				x = 0.075;
				y = 0.7;
				w = 0.175;
				h = 0.06;
			};
		class Text_Opt: Life_RscText
			{
				idc = 12002;
				text = "Vous allez payer un certain montant pour la cr�ation d'un compte en banque offshore ce compte ne sera pas soumis au Impots.";
				x = 0.00353535;
				y = 0.046532;
				w = 0.3125;
				h = 0.04;
			};
		class Price_Account: Life_RscText
			{
				idc = 12003;
				text = "Prix :";
				x = 0.025;
				y = 0.6;
				w = 0.2625;
				h = 0.04;
			};
		};
