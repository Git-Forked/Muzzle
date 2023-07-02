-- Reload.lua

import "Turbine.UI";

ReloadMuzzle = Turbine.UI.Control();
ReloadMuzzle:SetWantsUpdates(true);

ReloadMuzzle.Update = function(sender, args)
	ReloadMuzzle:SetWantsUpdates(false);
	Turbine.PluginManager.UnloadScriptState('Muzzle');
	Turbine.PluginManager.LoadPlugin('Muzzle');
end
