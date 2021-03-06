/*
 * Author: KoffeinFlummi, jodav, CAA-Picard
 *
 * Initializes the respawn module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
if !(isServer) exitWith {};

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

AGM_Respawn_Module = true;

[_logic, "AGM_Respawn_SavePreDeathGear", "SavePreDeathGear"] call AGM_Core_fnc_readBooleanParameterFromModule;

diag_log text "[AGM]: Respawn Module Initialized.";
