class Life_Formcontrat {
	idd = 5000;
	name= "Life_listcontrat";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn life_fnc_keyMenu;";
	
	class controlsBackground {

		class TitleBackground: Life_RscText
		{
			idc = -1;
			text = "Formulaire D'assasinat";
			x = 0.1375;
			y = -0.14;
			w = 0.7625;
			h = 0.04;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class Background: Life_RscText
		{
			idc = -1;
			x = 0.1375;
			y = -0.14;
			w = 0.7625;
			h = 1.02;
			colorBackground[] = {-1,-1,-1,0.7};
		};
		class Notes_1: Life_RscText
		{
			idc = -1;
			text = "Notes: Votre nom sera affiche  , attention vous vous engager dans une voie dangereuse !";
			x = 0.1875;
			y = 0.82;
			w = 0.675;
			h = 0.04;
			sizeEx = 0.9;
		};
		class Notes_2: Life_RscText
		{
			idc = -1;
			text = "Notes: Votre nom sera affiche  , attention vous vous engager dans une voie dangereuse !";
			x = 0.1875;
			y = -0.08;
			w = 0.675;
			h = 0.04;
			sizeEx = 0.9;
		};
	};
	class controls {
		class Text_NP: Life_RscText
		{
			idc = 5001;
			text = "Nom Prenom :";
			x = 0.2;
			y = 0.04;
			w = 0.3;
			h = 0.04;
		};
		class Box_NP: Life_RscEdit
		{
			idc = 5002;
			text = "Ecrivez ";
			x = 0.2;
			y = 0.08;
			w = 0.4875;
			h = 0.04;
			tooltip = "Si vous ne disposez pas du nom votre demande ne sera pas envoye !";
		};
		class Advert_NP: Life_RscText
		{
			idc = 5003;
			text = "Notes:  Soyez sur des majsucules que le Nom et Prenom comporte !";
			x = 0.2;
			y = -0.02;
			w = 0.6625;
			h = 0.04;
			sizeEx = 0.9;
		};
		class Text_Prof: Life_RscText
		{
			idc = 5003;
			text = "Profession (Optionel) :";
			x = 0.2;
			y = 0.16;
			w = 0.4125;
			h = 0.04;
		};
		class Box_Prof: Life_RscEdit
		{
			idc = 5004;
			text = "Ecrivez ";
			x = 0.2;
			y = 0.2;
			w = 0.4875;
			h = 0.04;
			tooltip = "Ceci n'est pas obligatoire";
		};
		class ButtonSoumettre: Life_RscButtonMenu
		{
			idc = 5005;
			text = "           Soumettre le contrat";
			OnButtonClick = "99 call life_fnc_SumContract;";
			x = 0.2875;
			y = 0.72;
			w = 0.4625;
			h = 0.08;
			colorBackground[] = {0.9,0.2,0,0.6};
		};
		class Kidnapp: Life_RscText
		{
			idc = 5006;
			text = "Kidnapper :";
			x = 0.2;
			y = 0.32;
			w = 0.2875;
			h = 0.04;
		};
		class Checkbox_Kidnapp: Life_Checkbox
		{
			idc = 5007;
			x = 0.375;
			y = 0.32;
			w = 0.0375;
			h = 0.04;
		};
		class Murder: Life_RscText
		{
			idc = 5008;
			text = "Assasinat :";
			x = 0.2;
			y = 0.44;
			w = 0.2875;
			h = 0.04;
		};
		class Checkbox_Murder: Life_Checkbox
		{
			idc = 5009;
			x = 0.375;
			y = 0.44;
			w = 0.0375;
			h = 0.04;
		};
		class Harass: Life_RscText
		{
			idc = 5010;
			text = "Harceler :";
			x = 0.2;
			y = 0.56;
			w = 0.2875;
			h = 0.04;
		};
		class CheckBox_Harass: Life_Checkbox
		{
			idc = 5011;
			x = 0.375;
			y = 0.56;
			w = 0.0375;
			h = 0.04;
		};
	};
};