_hLocation = [] execVM "locationLists.sqf";
_hLoot     = [] execVM "loot\lists.sqf";
_hHostiles = [] execVM "hostiles\lists.sqf";
waitUntil {
    scriptDone _hLocation &&
    scriptDone _hLoot &&
    scriptDone _hHostiles
};
_hConfig   = [] execVM "editMe.sqf";
waitUntil { scriptDone _hConfig };

_basepoint = [] execVM "bulwark\createBase.sqf";
waitUntil { scriptDone _basepoint };

publicVariable "bulwarkBox";
publicVariable "PARATROOP_CLASS";
publicVariable "BULWARK_SUPPORTITEMS";
publicVariable "BULWARK_BUILDITEMS";
publicVariable "PLAYER_STARTWEAPON";
publicVariable "PLAYER_STARTMAP";
publicVariable "PISTOL_HOSTILES";
publicVariable "DOWN_TIME";

_dayTimeHours = DAYTIMETO - DAYTIMEFROM;
_randTime = floor random _dayTimeHours;
_timeToSet = DAYTIMEFROM + _randTime;
setDate [2018, 7, 1, _timeToSet, 0];

[] execVM "revivePlayers.sqf";
[bulwarkRoomPos] execVM "missionLoop.sqf";

[] execVM "areaEnforcement.sqf";
