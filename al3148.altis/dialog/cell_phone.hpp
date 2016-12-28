#define ST_CENTER			0x02
#define CT_BUTTON			1
#define CT_EDIT				2
#define ST_LEFT				0x00
#define CT_STRUCTURED_TEXT 	13


class Life_my_smartphone {
	idd = 3000;
	name = "life_my_telephone_menu";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[0] spawn life_fnc_cellphone;[8] spawn life_fnc_cellphone;";
	
	class controlsBackground {
	
		class Life_RscTitleBackground:Life_RscText {
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			x = 0.1;
			y = 0.2;
			w = 0.95;
			h = (1 / 25);
		};
		
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.95;
			h = 0.7 - (22 / 250);
		};
		
		class ListContactBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 3014;
			x = -0.205;
			y = 0.2 + (11 / 250);
			w = 0.3;
			h = 0.7 - (22 / 250);
		};
		
		class PlayerListTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			idc = 3013;
			x = -0.205;
			y = 0.2;
			w = 0.3;
			h = (1 / 25);
		};
		
		class MessageTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			idc = -1;
			x = 0.11;
			y = 0.2;
			w = 0.93;
			h = (1 / 25);
		};
		
		
		class RandomTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			idc = -1;
			x = 0.11;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.93;
			h = (1 / 25);
		};
		
		class buttonBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 3027;
			x = -0.244;
			y = 0.2 + (11 / 250);
			w = 0.04;
			h = 0.152;
		};
		
		class button2Background:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = 30271;
			x = -0.244;
			y = 0.2 + (11 / 250);
			w = 0.04;
			h = 0.05;
		};
	};

	class controls {
	
		class MessageTitle : Life_RscTitle {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
			idc = 3001;
			text = "";//titre bloc message
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25;
			w = 0.93;
			h = (1 / 25);
		};

		class MessageTitlecenter3 : Life_RscStructuredText {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3081;
			text = "";//titre bloc message
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25;
			w = 0.93;
			h = (1 / 25);
		};

		class MessageTitlecenter2 : Life_RscStructuredText {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3082;
			text = "";//titre bloc message
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25;
			w = 0.26;
			h = (1 / 25);
		};
	
		class RandomTitle : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 3002;
			text = "";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
			x = 0.11;
			y = 0.25 + 0.3 + (1 / 25);
			w = 0.93;
			h = (1 / 25);
		};

		class repertoireAnnuaire : Life_RscListBox {
			idc = 3003;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			onLBSelChanged = "[0,lbData[3003,(lbCurSel 3003)]] spawn life_fnc_select;";
			x = -0.197;
			y = 0.21 + (11 / 250);
			w = 0.284;
			h = 0.59;
		};
		
		class MessageList : Life_RscListNBox {
			idc = 3004;
			onLBSelChanged = "[1,(lbCurSel 3004)] spawn life_fnc_select;";
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			colorBackground[] = {0, 0, 0, 0.0};
			columns[] = {0,0.235,0.43};
			x = 0.11;
			y = 0.25 + (1 / 25);
            w = 0.93;
            h = 0.3;
		};
		
		class TextShow : Life_RscControlsGroup {
			x = 0.11;
			y = 0.25 + 0.3 + (1 / 25) + (1 / 25);
            w = 0.93;
            h = 0.15;
			
			class HScrollbar : HScrollbar {
			height = 0;
			};
			
			
			class controls {
			
				class showText : Life_RscStructuredText {
					idc = 3005;
					text = "";
					colorBackground[] = {0.28,0.28,0.28,0.28};
					size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
					shadow = 0;
					x = 0;
					y = 0;
					w = 0.93;
					h = 1;//h = 2.15;
				};
			
			};
			
		};
	
		class Ecrire : Life_RscButtonMenu {
		idc = 3006;
		text = "Ecrire";
		onButtonClick = "createDialog ""Life_smartphone_ecriture"";";
		colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
		style = ST_CENTER;
        x = 0.11;
		y = 0.25 + (1 / 25) + 0.51;
		w = 0.2;
		h = (1 / 25);
		};
		
		class Urgence : Life_RscButtonMenu {
		idc = 3061;
		text = "Urgence";
		onButtonClick = "createDialog ""Life_smartphone_urgence"";";
		colorBackground[] = {0.584, 0.086, 0.086,1.0};
		style = ST_CENTER;
        x = 0.911375;
        y = 0.25 + (1 / 25) + 0.51;
		w = 0.115625;
		h = (1 / 25);
		};	
		
		class Service : Life_RscButtonMenu {
		idc = 3061;
		text = "Service";
		onButtonClick = "createDialog ""Life_smartphone_service"";";
		colorBackground[] = {0.086, 0.086, 0.584,1.0};
		style = ST_CENTER;
        x = 0.325 + 0.535 - (6.25 / 40) + 0.085;
        y = 0.25 + (1 / 25) + 0.51;
		w = 0.115625;
		h = (1 / 25);
		};

		class Admin : Life_RscButtonMenu {
		idc = 3062;
		text = "Admin";
		onButtonClick = "createDialog ""Life_smartphone_Admin"";";
		colorBackground[] = {0.584, 0.086, 0.086,1.0};
		style = ST_CENTER;
        x = 0.62;
        y = 0.25 + (1 / 25) + 0.51;
		w = 0.163;
		h = (1 / 25);
		};
		
		class delTotaleMsg : Life_RscButtonMenu {
		idc = 3067;
		text = "Tout Supprimer";
		onButtonClick = "[0,(lbCurSel 3004)] call life_fnc_removeMsg;ctrlEnable[3006,false];";
		colorBackground[] = {0.44,0.03,0,1};
		style = ST_CENTER;
		x = 0.44;
		y = 0.25 + (1 / 25) + 0.51;
		w = 0.175;
		h = (1 / 25);
		};
		
		class Delmsg : Life_RscButtonMenu {
		idc = 3066;
		text = "Supprimer";
		onButtonClick = "[1,(lbCurSel 3004)] call life_fnc_removeMsg;ctrlEnable[3006,false];";
		colorBackground[] = {0.44,0.03,0,1};
		style = ST_CENTER;
		x = 0.315;
		y = 0.25 + (1 / 25) + 0.51;
		w = 0.12;
		h = (1 / 25);
		};
		
		class Add_ContactRepertoire : Life_RscButtonMenu {
		idc = 3007;
		style = ST_CENTER;
		onButtonClick = "createDialog ""life_add_contact""";
		animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
		animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
		colorBackground2[] = {1, 1, 1, 0};
		color[] = {1, 1, 1, 0};
		color2[] = {1, 1, 1, 0};
		colorText[] = {1, 1, 1, 0};
		colorDisabled[] = {1, 1, 1, 0};
		x = -0.24;
		y = 0.25;
		w = 0.03; 
		h = 0.041;
		};
		
		class Add_ContactAnnuaire : Life_RscButtonMenu {
		idc = 3071;
		style = ST_CENTER;
		onButtonClick = "[lbData[3003,(lbCurSel 3003)]] spawn life_fnc_addRepertoire;";
		animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
		animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
		colorBackground2[] = {1, 1, 1, 0};
		color[] = {1, 1, 1, 0};
		color2[] = {1, 1, 1, 0};
		colorText[] = {1, 1, 1, 0};
		colorDisabled[] = {1, 1, 1, 0};
		x = -0.24;
		y = 0.25;
		w = 0.03; 
		h = 0.041;
		};
		
		class Remove_Contact : Life_RscButtonMenu {
		idc = 3009;
		style = ST_CENTER;
		onButtonClick = "[9] spawn life_fnc_cellphone;";
		animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
		animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
		colorBackground2[] = {1, 1, 1, 0};
		color[] = {1, 1, 1, 0};
		color2[] = {1, 1, 1, 0};
		colorText[] = {1, 1, 1, 0};
		colorDisabled[] = {1, 1, 1, 0};
		x = -0.24;
		y = 0.35;
		w = 0.03; 
		h = 0.041;
		};
		
		class edit_Contact : Life_RscButtonMenu {
		idc = 3011;
		style = ST_CENTER;
		onButtonClick = "[2,lbData[3003,(lbCurSel 3003)]] spawn life_fnc_cellphone;";
		animTextureNormal = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDisabled = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureOver = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureFocused = "#(argb,8,8,3)color(1,1,1,0)";
		animTexturePressed = "#(argb,8,8,3)color(1,1,1,0)";
		animTextureDefault = "#(argb,8,8,3)color(1,1,1,0)";
		colorBackground2[] = {1, 1, 1, 0};
		color[] = {1, 1, 1, 0};
		color2[] = {1, 1, 1, 0};
		colorText[] = {1, 1, 1, 0};
		colorDisabled[] = {1, 1, 1, 0};
		x = -0.24;
		y = 0.3;
		w = 0.03; 
		h = 0.041;
		};
		
		class Title : Life_RscStructuredText {
		colorBackground[] = {0, 0, 0, 0};
		idc = 3008;
		text = "Altis mobile.";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		x = 0.1;
		y = 0.2;
		w = 0.95;
		h = (1 / 25);
		};

		class TitleNumero : Life_RscStructuredText {
		colorBackground[] = {0, 0, 0, 0};
		idc = 3045;
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
		x = 0.1;
		y = 0.2;
		w = 0.95;
		h = (1 / 25);
		};
		
		class AnnuaireListTitle : Life_RscTitle {
		idc = 3012;
		text = "Annuaire";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
		style = ST_CENTER;
		x = -0.205;
		y = 0.2;
		w = 0.3;
		h = (1 / 25);
		};
		
		class RepertoireListTitle : Life_RscTitle {
		idc = 30121;
		text = "Repertoire";
		sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.9)";
		style = ST_CENTER;
		x = -0.205;
		y = 0.2;
		w = 0.3;
		h = (1 / 25);
		};
		
		class addRepertoireIcon : life_RscPicture 
		{
			idc = 3023;
			text = "\agorapolis_icons\data\smartphone\ico_add.paa";
			x = -0.25;
			y = 0.237;
			w = 0.05; 
			h = 0.065;
		};
		
		class editIcon : life_RscPicture 
		{
			idc = 3024;
			text = "\agorapolis_icons\data\smartphone\ico_edit.paa";
			x = -0.25;
			y = 0.287;
			w = 0.05; 
			h = 0.065;
		};
		
		class removeIcon : life_RscPicture 
		{
			idc = 3025;
			text = "\agorapolis_icons\data\smartphone\ico_remove.paa";
			x = -0.25;
			y = 0.337;
			w = 0.05; 
			h = 0.065;
		};
		
		class CloseLoadMenu : Life_RscButtonMenu {
		idc = 3016;
		text = "Fermer";
		onButtonClick = "closeDialog 0;";
		x = 0.1;
		y = 0.9 - (1 / 25);
		w = (6.25 / 40);
		h = (1 / 25);
		};
		
		class switchAnnuaire : Life_RscButtonMenu {
		idc = 3030;
		text = "Annuaire";
		colorBackground[] = {0, 0, 0, 0};
		onButtonClick = "ctrlshow[30201,true];ctrlshow[3027,false];ctrlshow[30271,true];ctrlshow[3025,false];ctrlshow[3030,false];ctrlshow[3024,false];ctrlshow[3012,true];ctrlshow[3011,false];ctrlshow[3009,false];ctrlshow[3071,true];ctrlshow[30121,false];ctrlshow[3007,false];[5] spawn life_fnc_cellphone;";
		style = ST_CENTER;
		type = CT_BUTTON;
		x = -0.205;
		y = 0.9 - (1 / 25);
		w = 0.3;
		h = (1 / 25);
		};
		
		class switchRepertoire : Life_RscButtonMenu {
		idc = 30201;
		text = "Repertoire";
		colorBackground[] = {0, 0, 0, 0};
		onButtonClick = "ctrlshow[30201,false];ctrlshow[3027,true];ctrlshow[30271,false];ctrlshow[3025,true];ctrlshow[3030,true];ctrlshow[3024,true];ctrlshow[3011,true];ctrlshow[3009,true];ctrlshow[3071,false];ctrlshow[30121,true];ctrlshow[3012,false];ctrlshow[3007,true];[10] spawn life_fnc_cellphone;";
		style = ST_CENTER;
		type = CT_BUTTON;
		x = -0.205;
		y = 0.9 - (1 / 25);
		w = 0.3;
		h = (1 / 25);
		};
	};
};

class Life_smartphone_ecriture{
	idd = 3100;
	name = "life_my_smartphone_ecriture";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_sendMsg;";
	
	class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.35;
        };
    };
    
    class controls {
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 3101;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.95;
            h = (1 / 25);
        };

        class Absenden : Life_RscButtonMenu {
            idc = 3104;
            text = "Envoyer";
            onButtonClick = "[99] call life_fnc_cellphonesendMessage";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
            x = 0.535;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class textEdit : Life_RscEdit {
            idc = 3103;
            text = "";
            style = 16;
            type = CT_EDIT;
            sizeEx = 0.03;
            x = 0.11; y = 0.3 - 0.048;
            w = 0.58; h = 0.17;
        };
        
        class TextAnonyme : Life_RscText
        {
            idc = 3114;
            text = "Anonyme";
            
            x = 0.14;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkAnonyme : Life_Checkbox
        {
            tooltip = "Envoyer le message en Inconnu";
            idc = 3107;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "";
            x = 0.11;
            y = 0.43;
        };
        
        class TextCop : Life_RscText
        {
            idc = 3108;
            text = "En tant que Gendarme";
            
            x = 0.43;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkCop : Life_Checkbox
        {
            tooltip = "Envoyer le message en tant que Gendarme";
            idc = 3109;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "(findDisplay 88883 displayCtrl 8489) cbSetChecked false; (findDisplay 88883 displayCtrl 8490) cbSetChecked false; (findDisplay 88883 displayCtrl 8492) cbSetChecked false;";
            x = 0.40;
            y = 0.43;
        };

        class TextMed : Life_RscText
        {
            idc = 3110;
            text = "En tant que Pompier";
            
            x = 0.43;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };

        class checkMed : Life_Checkbox
        {
            tooltip = "Envoyer le message en tant que Pompier";
            idc = 3111;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "(findDisplay 88883 displayCtrl 8489) cbSetChecked false; (findDisplay 88883 displayCtrl 8490) cbSetChecked false; (findDisplay 88883 displayCtrl 8491) cbSetChecked false;";
            x = 0.40;
            y = 0.43;
        };
        
        class ListMessageAuto : Life_RscCombo
        {
            idc = 3112;
            size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            onLBSelChanged = "[0,1] spawn life_fnc_sendMsg;";
            x = 0.11;
            y = 0.48;
            w = 0.58;
            h = (1 / 25);
        };
        class Close : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            x = 0.11;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };	
};

class Life_add_contact {
	idd = 31100;
	name= "life_add_contact";
	movingEnable = 0;
	enableSimulation = 1;
	
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
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
			h = 0.3 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 31101;
			text = "Ajouter contact";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 31102;
			text = "Nom du contact";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 31103;
		
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = (1 / 25);
		
		};
		
		class TextToSendii : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 31117;
			text = "Numero du contact";
			
			x = 0.10;
			y = 0.35;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEditii : Life_RscEdit
		{
			idc = 31104;
			text = "";
			sizeEx = 0.030;
			x = 0.11; y = 0.4;
			w = 0.62; h = (1 / 25);
		};
		
		class AddContact : life_RscButtonMenu
		{
			idc = 31122;
			text = "Ajouter Contact";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
       		onButtonClick = "[] spawn life_fnc_addcontact";
			x = 0.11;
			y = 0.45;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.51 + (1 / 50);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};

class Life_Edit_contact {
	idd = 31200;
	name= "life_Edit_contact";
	movingEnable = 0;
	enableSimulation = 1;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
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
			h = 0.20 - (5 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 31201;
			text = "";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class TextToSend : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 31202;
			text = "Nom du contact";
			x = 0.1;
			y = 0.25;
			w = 0.6;
			h = (1 / 25);
		};
		
		class textEdit : Life_RscEdit {
		
		idc = 31203;
		text = "";
		sizeEx = 0.030;
		x = 0.11; y = 0.3;
		w = 0.62; h = (1 / 25);
		
		};
		
		class EditContact : life_RscButtonMenu
		{
			idc = 31222;
			text = "Edit Contact";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
       		onButtonClick = "[] spawn life_fnc_editcontactApply";
			
			x = 0.11;
			y = 0.36;
			w = 0.2;
			h = (1 / 25);
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.434;
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};


class Life_smartphone_service {
    idd = 8000;
    name= "life_my_smartphone_service";
    movingEnable = false;
    enableSimulation = true;
    onLoad = "[] spawn life_fnc_syncService;";

    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {0.086, 0.086, 0.584,1.0};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.35;
        };
    };
    
    class controls {
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 8001;
			text = "Service Message";
            x = 0.1;
            y = 0.2;
            w = 0.95;
            h = (1 / 25);
        };

          class InfoTaxi : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 888887;
            text = "";
            x = 0.1;
            y = 0.428;
            w = 0.6;
            h = (1 / 25);
        };
        
        class InfoDepanneur : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 888888;
            text = "";
            x = 0.40;
            y = 0.428;
            w = 0.6;
            h = (1 / 25);
        };
        class Absenden : Life_RscButtonMenu {
            idc = 88885;
            //text = "$STR_SMARTPHONE_ABSENDEN";
            text = "Envoyer";
            onButtonClick = "[99] call life_fnc_sendSerUrg";
            colorBackground[] = {0.086, 0.086, 0.584,1.0};
            x = 0.535;
           	y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class textEdit : Life_RscEdit {
            idc = 9003;
            text = "";
            style = 16;
            sizeEx = 0.03;
            x = 0.11; y = 0.3 - 0.048;
            w = 0.58; h = 0.17;
        };
        class Textdepan : Life_RscText
        {
            idc = -1;
            text = "Depanneurs";
            
            x = 0.43;
            y = 0.478;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkdepan : Life_Checkbox
        {
            tooltip = "Envoyer le message aux Depanneurs";
            idc = 8005;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "(findDisplay 88883 displayCtrl 8489) cbSetChecked false; (findDisplay 88883 displayCtrl 8490) cbSetChecked false; (findDisplay 88883 displayCtrl 8491) cbSetChecked false;";
            x = 0.40;
            y = 0.48;
        };
		
        class TextTaxi : Life_RscText
        {
            idc = -1;
            text = "Taxis";
            
           	x = 0.14;
            y = 0.478;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkTaxi : Life_Checkbox
        {
            tooltip = "Envoyer le message aux Taxis";
            idc = 8006;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "(findDisplay 88883 displayCtrl 8489) cbSetChecked false; (findDisplay 88883 displayCtrl 8490) cbSetChecked false; (findDisplay 88883 displayCtrl 8491) cbSetChecked false;";
           	x = 0.11;
            y = 0.48;
        };

        class Close : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.11;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};



class Life_smartphone_urgence {
    idd = 8500;
    name= "life_my_smartphone_urgence";
    movingEnable = false;
    enableSimulation = true;

    class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.35;
        };
    };
    
    class controls {
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 8001;
			//text = "$STR_SMARTPHONE_NACHRICHTTITLE";
			text = "Urgence Message";
            x = 0.1;
            y = 0.2;
            w = 0.95;
            h = (1 / 25);
        };
        class Absenden : Life_RscButtonMenu {
            idc = 88885;
            //text = "$STR_SMARTPHONE_ABSENDEN";
            text = "Envoyer";
            onButtonClick = "[99] call life_fnc_sendSerUrg";
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            x = 0.535;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class textEdit : Life_RscEdit {
            idc = 9003;
            text = "";
            style = 16;
            sizeEx = 0.03;
            x = 0.11; y = 0.3 - 0.048;
            w = 0.58; h = 0.17;
        };
        class Textgend : Life_RscText
        {
            idc = -1;
            text = "Gendarmes";
            
            x = 0.43;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkgend  : Life_Checkbox
        {
            tooltip = "Envoyer le message aux Gendarmes";
            idc = 8004;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "";
            x = 0.40;
            y = 0.43;
        };
		  class TextPomp : Life_RscText
        {
            idc = -1;
            text = "Pompiers";

            x = 0.14;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkPomp: Life_Checkbox
        {
            tooltip = "Envoyer le message aux Pompiers";
            idc = 8007;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "(findDisplay 88883 displayCtrl 8490) cbSetChecked false; (findDisplay 88883 displayCtrl 8491) cbSetChecked false; (findDisplay 88883 displayCtrl 8492) cbSetChecked false;";
            x = 0.11;
            y = 0.43;
        };


        class TxtAdmin : Life_RscText
        {
            idc = 8008;
            text = "Admins";
            
            x = 0.14;
            y = 0.478;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkAdmin  : Life_Checkbox
        {
            tooltip = "Envoyer le message aux Admins";
            idc = 8009;
            type = 77;
            sizeEx = 0.04;
            onCheckBoxesSelChanged = "";
            x = 0.11;
            y = 0.48;
        };

        class Close : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            x = 0.11;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};

class Life_smartphone_admin {
idd = 9000;
name= "life_my_smartphone_admin";
movingEnable = false;
enableSimulation = true;
onLoad = "[] spawn life_fnc_sendadmin;";

       class controlsBackground {
        class Life_RscTitleBackground:Life_RscText {
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground:Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.35;
        };
    };
    
    class controls {
        class Title : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 9001;
			text = "Admin Message";
            x = 0.1;
            y = 0.2;
            w = 0.95;
            h = (1 / 25);
        };
        class sendAdmin : Life_RscButtonMenu {
            idc = 9002;
            text = "Envoyer";
            onButtonClick = "[99] call life_fnc_sendSerUrg";
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            x = 0.535;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };
	    class ListPlayer : Life_RscCombo {
			idc = 9008;
			sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			x = 0.11;
            y = 0.48;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
		};
        class textEdit : Life_RscEdit {
            idc = 9003;
            text = "";
            style = 16;
            sizeEx = 0.03;
            x = 0.11; y = 0.3 - 0.048;
            w = 0.58; h = 0.17;
        };
        class TextAdmin : Life_RscText
        {
            idc = 9004;
            text = "En Tant qu'Admin";
            
            x = 0.14;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkAdmin  : Life_Checkbox
        {
            tooltip = "Envoyer le message aux Admins";
            idc = 9005;
            type = 77;
            sizeEx = 0.04;
            x = 0.11;
            y = 0.43;
        };
		  class TextAdminMsgAll : Life_RscText
        {
            idc = 9006;
            text = "Message Général";
            x = 0.43;
            y = 0.428;
            w = 0.1 + (6.25 / 40);
            h = (1 / 25);
        };
    
        class checkAdminMsgAll: Life_Checkbox
        {
            tooltip = "Envoyer le message à tous le monde";
            idc = 9007;
            type = 77;
            sizeEx = 0.04;
            x = 0.40;
            y = 0.43;
        };

        class Close : Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0.584, 0.086, 0.086,1.0};
            x = 0.11;
            y = 0.546 + (1 / 25) - 0.048;
            w = (6.25 / 40);
            h = (1 / 25);
        };
    };
};