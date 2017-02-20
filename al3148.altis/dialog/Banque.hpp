class Life_AccountReq {
	idd = 11000;
	name= "life_AccountRequest";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		class Background: Life_RscText
		{
			idc = 1000;
			text = "";
			x = 0.1875;
			y = 0.3;
			w = 0.6375;
			h = 0.46;
			colorBackground[] = {0,0,0,0.7};
		};
		class TitleBox: Life_RscText
		{
			idc = 1001;
			text = "Creation d'un compte en banque";
			x = 0.1875;
			y = 0.26;
			w = 0.6375;
			h = 0.04;
			colorBackground[] = {0.38,0.7,0.88,0.7};
		};
	};
	class controls
	{
		class close: Life_RscButtonMenu
		{
			idc = 11001;
			text = "FERMER"; 
            onButtonClick = "closeDialog 0;";
			x = 0.1875;
			y = 0.76;
			w = 0.15;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
		class Create: Life_RscButtonMenu
		{
			idc = 11002;
			text = "Soumettre";
            onButtonClick = "2 spawn life_fnc_requestAccount;";
			x = 0.675;
			y = 0.76;
			w = 0.15;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
		class Reglement: Life_RscStructuredText
		{
			idc = 11003;
			text = "Vous ne pouvez avoir qu'un seul compte";
			x = 0.2;
			y = 0.32;
			w = 0.6125;
			h = 0.24;
			colorBackground[] = {0,0,0,0.9};
		};
		class TextCheckB: Life_RscText
		{
			idc = 11004;
			text = "Entreprise ?"; 
			x = 0.204489;
			y = 0.58819;
			w = 0.175;
			h = 0.06;
            sizeEx = 0.04;
		};
		class EntrepriseCheckbox: Life_Checkbox
		{
			idc = 11005;
            type = 77;
			x = 0.375;
			y = 0.6;
			w = 0.0375;
			h = 0.04;
		};
		class TextEdit: Life_RscText
		{
			idc = 11006;
			text = "Nom du compte :"; 
			x = 0.206409;
			y = 0.66;
			w = 0.2125;
			h = 0.06;
            sizeEx = 0.04;
		};
		class EditName: Life_RscEdit
		{
			idc = 11007;
			text = ""; 
			x = 0.4375;
			y = 0.67181;
			w = 0.365705;
			h = 0.04819;
			colorBackground[] = {0,0,0,1};
		};
	};
};
