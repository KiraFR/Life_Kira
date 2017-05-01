class Life_call_menu
{
	idd = 3250;
	name="Life_call_menu";
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "[0] spawn Call_fnc_callP;";
	
	class controlsBackground
	{
		class backGround: Life_RscText
		{
			idc = -1;
			x = 0.225;
			y = 0.36;
			w = 0.5375;
			h = 0.18;
			colorBackground[] = {0,0,0,0.8};
		};
		class Title: Life_RscText
		{
			idc = -1;
			text = "Appeler un contact";
			x = 0.225;
			y = 0.32;
			w = 0.5375;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
	};
	
	class controls
	{
		class ListPlayer: Life_RscCombo
		{
			idc = 3251;
			x = 0.275;
			y = 0.44;
			w = 0.4375;
			h = 0.04;
		};
		class callbutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "Appeler";
			onButtonClick = "call Call_fnc_calling;";
			x = 0.225;
			y = 0.544;
			w = 0.1375;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};

		class callbutton2: Life_RscButtonMenu
		{
			idc = -1;
			text = "Raccocher";
			onButtonClick = "[true] call Call_fnc_stopAppel;";
			x = 0.225;
			y = 0.6;
			w = 0.1375;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};

		class closebutton: Life_RscButtonMenu
		{
			idc = -1;
			text = "fermer";
			onButtonClick = "closeDialog 0;";
			x = 0.6225;
			y = 0.544;
			w = 0.1375;
			h = 0.04;
			colorBackground[] = {0,0,0,1};
		};
	};
};