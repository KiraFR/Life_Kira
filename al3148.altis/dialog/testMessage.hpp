class Life_my_smartphone_test {
	idd = 14000;
	name = "life_my_telephone_menu_test";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn Kira_fnc_test;";

	class controlsBackground {
		class BackgroundTel: Life_RscText
		{
			idc = 14001;
			x = -0.4125;
			y = 0.06;
			w = 0.455;
			h = 1.16;
			colorBackground[] = {0,0,0,0.7};
		};

		class TitleBackground: Life_RscText
		{
			idc = 14003;
			x = -0.4125;
			y = 0;
			w = 0.455;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};
	
	class controls {
		class ListMessage: Life_RscControlsGroup {
			idc = 14002;
			x = -0.4025;
			y = 0.52;
			w = 0.445;
			h = 0.66;


			class HScrollbar : HScrollbar {
			height = 0;
			};
			
			
			class controls {
			
				class showText : Life_RscStructuredText {
					idc = 14006;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = 0.04
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.435;
					h = 1;//h = 2.15;
				};
			
			};

		};
		
		class Title: Life_RscText
		{
			idc = 14004;
			x = -0.3875;
			y = -0.08;
			w = 0.375;
			h = 0.04;
		};
		class Close: Life_RscButtonMenu
		{
			idc = 14005;
			text = "Fermer";
			x = -0.4125;
			y = 1.22;
			w = 0.1375;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
		};
	};
};