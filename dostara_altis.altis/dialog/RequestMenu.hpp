class Life_RequestMenu {
	idd = 5500;
	name= "Life_RequestAccept";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_ContratMenu;";

class controlsBackground {

			class TitleBackground: Life_RscText
			{
				idc = -1;
				text = "Menu des demandes"; 
				x = -0.575;
				y = 0.04;
				w = 0.9;
				h = 0.04;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			};
			class Background: Life_RscText
			{
				idc = -1;
				x = -0.575;
				y = 0.08;
				w = 0.9;
				h = 0.64;
				colorBackground[] = {-1,-1,-1,0.7};
			};
		};

class controls {
			class ListName: Life_RscListbox
			{
				idc = 5501;
				x = -0.5375;
				y = 0.12;
				w = 0.325;
				h = 0.54;
			};
			class ListInfo: Life_RscStructuredText
			{
				idc = 5502;
				x = -0.175;
				y = 0.12;
				w = 0.4625;
				h = 0.32;
			};
			class ButtonAccept: Life_RscButtonMenu
			{
				idc = 5502;
				text = "      Accepter";
				OnButtonClick = "call life_fnc_AcceptContrat;";
				x = -0.0625;
				y = 0.54;
				w = 0.2125;
				h = 0.06;
				colorBackground[] = {0.09,0.57,0,0.7};
			};
		};
	};