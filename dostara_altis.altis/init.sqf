if(!isDedicated) then { X_Client = true;};

life_versionInfo = "BASED ON Altis Life RPG v3.1.4.8, EDITED FOR DOSTARA.FR";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
