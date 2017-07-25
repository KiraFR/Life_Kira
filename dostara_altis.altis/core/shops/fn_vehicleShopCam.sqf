/*
	File: fn_vehicleShopCam.sqf
	Author: J. "Kira" D.
	
	Description:
	Camera
*/
private["_spawnPos"];
disableSerialization;

_className = lbData[2302,(lbCurSel 2302)];
_colorIndex = lbValue[2304,(lbCurSel 2304)];
deleteVehicle vehPreview;
_spawnPoints = life_veh_shop select 1;
if(typeName _spawnPoints == "ARRAY")then{
    _spawnPos = _spawnPoints select 0;
}else {
    _spawnPos = _spawnPoints;
};

//creation du vehicule
vehPreview = _className createVehicleLocal (getMarkerPos _spawnPos);
vehPreview lock true;
vehPreview allowDamage false;
vehPreview enableSimulation false;
[vehPreview,_colorIndex] call life_fnc_colorVehicle;

0 spawn
{
    // Until we left the visualization.
    for "_i" from 0 to 1 step 0 do {
        private ["_objet","_distance"];

        // Waiting for a view object.
        waitUntil {!isNull vehPreview};

        _objet = vehPreview;

        _distance = 3.25 * (
                [boundingBoxReal _objet select 0 select 0, boundingBoxReal _objet select 0 select 2]
            distance
                [boundingBoxReal _objet select 1 select 0, boundingBoxReal _objet select 1 select 2]
        );

        life_shop_cam camSetTarget _objet;
        life_shop_cam camSetPos (_objet modelToWorld [_distance * sin azimut, _distance * cos azimut, _distance * 0.33]);
        life_shop_cam camCommit 0;

        // rotation
        for "_i" from 0 to 1 step 0 do {
            if (!(vehPreview isEqualTo _objet)) exitWith {};
            if ((isNil azimut)) exitWith {};
            azimut = azimut + 1.00;

            life_shop_cam camSetPos (_objet modelToWorld [_distance * sin azimut, _distance * cos azimut, _distance * 0.33]);
            life_shop_cam camCommit 0.05;

            sleep 0.05;
        };
    };
};