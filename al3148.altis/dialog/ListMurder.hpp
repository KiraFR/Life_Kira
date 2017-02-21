class Life_listcontrat {
	idd = 4800;
	name= "Life_listcontrat";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_murdererMenu;";
	
class controlsBackground {

			class Background: Life_RscText
			{
				idc = -1;
				x = 0.125;
				y = 0.12;
				w = 0.775;
				h = 0.8;
				colorText[] = {-1,-1,-1,0.5};
				colorBackground[] = {-1,-1,-1,0.5};
			};
			class BackgroundTitle: Life_RscText
			{
				idc = -1;
				text = "Liste des demandes d'assasinat"; 
				x = 0.125;
				y = 0.12;
				w = 0.775;
				h = 0.04;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			};
			class TitleList: Life_RscText
			{
				idc = -1;
				text = "Nom de la Victime"; 
				x = 0.1625;
				y = 0.2;
				w = 0.275;
				h = 0.04;
				colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			};
		};

		class controls {
			
			class ListName: Life_RscListbox 
			{
				idc = 4803;
				x = 0.1625;
				y = 0.24;
				w = 0.275;
				h = 0.66;
			};
			class ListInfos: Life_RscStructuredText
			{
				idc = 4804;
				x = 0.475;
				y = 0.24;
				w = 0.4;
				h = 0.48;
			};
		};
	};
