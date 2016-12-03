class Life_AccountReq {
	idd = 11000;
	name= "life_AccountRequest";
	movingEnable = false;
	enableSimulation = true;

	class BackgroundControls
	
			class TitleBox: RscText
			{
				idc = -1;
				text = "Creation d'un compte en banque";
				x = 0;
				y = 0;
				w = 0.3;
				h = 0.04;
				colorBackground[] = {0.38,0.7,0.88,0.7};
			};
			class Background: Life_RscText
			{
				idc = -1;
				x = 7.45058e-009;
				y = 0.04;
				w = 0.3;
				h = 0.72;
				colorBackground[] = {-1,-1,-1,0.7};
			};
	class controls
	
			class Validate_Button: Life_RscButtonMenu
			{
				idc = 11400;
				text = "Soumettre";
				onButtonClick = "if(cbChecked (findDisplay 11000 displayCtrl 11040))then{[3] call life_fnc_RequestAccount}else{[1] call life_fnc_RequestAccount};"
				x = 0.0375;
				y = 0.66;
				w = 0.225;
				h = 0.06;
			};
			class Expli: Life_RscStructuredText
			{
				idc = 11100;
				text = "Si vous etes une entreprise veulliez cocher la case entreprises.";
				x = 0.025;
				y = 0.08;
				w = 0.25;
				h = 0.12;
				colorBackground[] = {-1,-1,-1,0.5};
			};
			class Entreprise: Life_RscText
			{
				idc = 11002;
				text = ": Entreprise";
				x = 0.0699495;
				y = 0.278316;
				w = 0.1625;
				h = 0.04;
			};
			class CheckEnter: Life_Checkbox
			{
				idc = 11040;
				type = 77;
				x = 0.05;
				y = 0.285051;
				sizeEx = 0.04;
				onCheckBoxesSelChanged = "";
				tooltip = "Definir sur entreprise";
			};
			class Price: Life_RscStructuredText
			{
				idc = 11101;
				x = 0.0375;
				y = 0.6;
				w = 0.225;
				h = 0.04;
				colorBackground[] = {-1,-1,-1,0.7};
			};
};
