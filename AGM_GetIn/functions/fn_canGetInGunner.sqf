// by commy2

private ["_player", "_vehicle", "_config", "_turret", "_configTurret", "_memoryPointGunner", "_distance"];

_player = _this select 0;
_vehicle = _this select 1;


_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_turret = [typeOf _vehicle] call AGM_Core_fnc_getTurretGunner;
if (_turret isEqualTo []) exitWith {false};

_configTurret = [_config, _turret] call AGM_Core_fnc_getTurretConfigPath;

if (count (getArray (_configTurret >> "weapons")) == 0) exitWith {false};

_memoryPointGunner = getText (_configTurret >> "memoryPointsGetInGunner");

_distance = getNumber (_config >> "getInRadius");

(isNull (gunner _vehicle) || (!alive (gunner _vehicle)))
&& {alive _vehicle}
&& {!(_vehicle lockedTurret _turret)}
&& {!(locked _vehicle >= 2)}
&& {getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "isUav") != 1}
&& {_player distance (_vehicle modeltoworld (_vehicle selectionPosition _memoryPointGunner)) < _distance || {vehicle _player == _vehicle}}
