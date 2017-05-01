#define ST_CENTER           0x02

class Life_atm_management {
    idd = 2700;
    name= "life_atm_menu";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.35;
            y = 0.2;
            w = 0.3;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.35;
            y = 0.2 + (11 / 250);
            w = 0.3;
            h = 0.652 - (22 / 250);
        };
        class BackgroundTransferTitle: Life_RscText
        {
            idc = 1000;
            text = "Transfer Menu";
            x = 0.075;
            y = 0.2;
            w = 0.3;
            h = 0.04;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
        };
        class BackgroundTransfer: Life_RscText
        {
            idc = 1001;
            x = 0.075;
            y = 0.24;
            w = 0.3;
            h = 0.44;
            colorBackground[] = {-1,-1,-1,0.7};
        };
    };

    class controls {
        class CashTitle: Life_RscStructuredText {
            idc = 2701;
            text = "";
            x = 0.39;
            y = 0.26;
            w = 0.3;
            h = .14;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_ATM_Title";
            x = 0.35;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class WithdrawButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_ATM_Withdraw";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_bankWithdraw";
            x = 0.425;
            y = 0.46;
            w = (6 / 40);
            h = (1 / 25);
        };

        class DepositButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_ATM_Deposit";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_bankDeposit";
            x = 0.425;
            y = 0.512;
            w = (6 / 40);
            h = (1 / 25);
        };

        class moneyEdit: Life_RscEdit {
            idc = 2702;
            text = "1";
            sizeEx = 0.030;
            x = 0.4;
            y = 0.41;
            w = 0.2;
            h = 0.03;
        };

        class GangWithdraw : Life_RscButtonMenu {
            idc = 2705;
            text = "$STR_ATM_WithdrawGang";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_gangWithdraw";
            x = 0.365;
            y = 0.7;
            w = 0.275;
        };

        class GangDeposit : Life_RscButtonMenu {
            idc = 2706;
            text = "$STR_ATM_DepositGang";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_gangDeposit";
            x = 0.365;
            y = 0.752;
            w = 0.275;
        };

        class CloseButtonKey: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = 0.35;
            y = 0.812;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class ListAccount: Life_RscListbox
        {
            idc = 2780;
            x = 0.1;
            y = 0.28;
            w = 0.25;
            h = 0.36;
        };
        class AddAccount: Life_RscButtonMenu
        {   
            style = ST_CENTER;
            onButtonClick = "[]spawn life_add_TAccount";
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
            idc = 2710;
            x = 0.0375;
            y = 0.24;
            w = 0.0375;
            h = 0.04;
        };
        class EditAccount: Life_RscButtonMenu
        {   
            style = ST_CENTER;
            onButtonClick = "";
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
            idc = 2711;
            x = 0.0375;
            y = 0.285809;
            w = 0.0375;
            h = 0.04;
        };
        class DelAccount: Life_RscButtonMenu
        {   
            style = ST_CENTER;
            onButtonClick = "";
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
            idc = 2712;
            x = 0.0372252;
            y = 0.328638;
            w = 0.0375;
            h = 0.04;
        };
        class TransferButton: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_ATM_Transfer";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.7};
            onButtonClick = "[] call life_fnc_bankTransfer";
            x = 0.125;
            y = 0.68;
            w = 0.2;
            h = 0.04;
        };

    };
};
class Life_add_TAccount {
    idd = 41100;
    name= "life_add_TAccount";
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
            idc = 41101;
            text = "Ajouter un compte de Tranfere";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };
        
        class TextToSend : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 41102;
            text = "Nom de la personne";
            x = 0.1;
            y = 0.25;
            w = 0.6;
            h = (1 / 25);
        };
        
        class textEdit : Life_RscEdit {
        
        idc = 41103;
        
        text = "";
        sizeEx = 0.030;
        x = 0.11; y = 0.3;
        w = 0.62; h = (1 / 25);
        
        };
        
        class TextToSendii : Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = 41117;
            text = "Numero du compte";
            
            x = 0.10;
            y = 0.35;
            w = 0.6;
            h = (1 / 25);
        };
        
        class textEditii : Life_RscEdit
        {
            idc = 41104;
            text = "";
            sizeEx = 0.030;
            x = 0.11; y = 0.4;
            w = 0.62; h = (1 / 25);
        };
        
        class AddContact : life_RscButtonMenu
        {
            idc = 41122;
            text = "Ajouter Compte";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 1.0};
            onButtonClick = "";
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