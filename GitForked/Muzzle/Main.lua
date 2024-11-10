-- Muzzle (Main.lua)

-- Turbine imports
import "Turbine";
import "Turbine.Gameplay";

-- Muzzle imports
import "GitForked.Muzzle.Configuration";
import "GitForked.Muzzle.Muzzle";

playerNameColorRGBHex = "#FF007F"

Turbine.Shell.WriteLine("<rgb=#008080>Muzzle</rgb> " .. Plugins.Muzzle:GetVersion() .. " by <rgb=#008080>Git-Forked</rgb> loaded.");

function AddCallback(object, event, callback)
    if (object[event] == nil) then
        object[event] = callback;
    else
        if (type(object[event]) == "table") then
            table.insert(object[event], callback);
        else
            object[event] = {object[event], callback};
        end
    end
    return callback;
end

function chatHandler(sender, args)
    if args.ChatType == Turbine.ChatType.World then
        -- Highlight V
        playerName = GetPlayerName()
        if string.match(args.Message, playerName) then
            Turbine.Shell.WriteLine("<rgb=" .. playerNameColorRGBHex .. "> ::: " .. playerName .. " ::: " .. args.Message);
        end
        -- Highlight ^
        for _,v in pairs(Muzzle) do
            if string.match(args.Message, v) then
                if Set.Verbose == true then
                    Turbine.Shell.WriteLine("<rgb=#ff0000>Muzzled</rgb> for '<rgb=#ff69b4>" .. v .. "</rgb>': <rgb=#808080>" .. args.Message);
                end
                return;
            end
        end
        Turbine.Shell.WriteLine("<rgb=#ffffff>" .. args.Message);
    end
end

AddCallback(Turbine.Chat, "Received", chatHandler);

function ShowPlayerName()
    local player = Turbine.Gameplay.LocalPlayer:GetInstance()
    if player then
        local playerName = player:GetName()
        Turbine.Shell.WriteLine("Your player name is: <rgb=" .. playerNameColorRGBHex .. ">" .. playerName .. "</rgb>");
    else
        Turbine.Shell.WriteLine("Could not retrieve player information.");
    end
end

function GetPlayerName()
    local player = Turbine.Gameplay.LocalPlayer:GetInstance()
    if player then
        local playerName = player:GetName()
        return playerName
    else
        Turbine.Shell.WriteLine("Could not retrieve player information.");
    end
end

-- Muzzle Reload
function Reload()
    Turbine.PluginManager.LoadPlugin('Muzzle Reload');
end

function Version()
    Turbine.Shell.WriteLine("<rgb=#008080>Muzzle</rgb> " .. Plugins.Muzzle:GetVersion() .. " by <rgb=#008080>Git-Forked</rgb> is running.");
end

-- Muzzle Commands
MuzzleCommand = Turbine.ShellCommand();

function MuzzleCommand:Execute(command, arguments)
    if (arguments == "reload") then
        Turbine.Shell.WriteLine("Muzzle reloading..");
        Reload();
    end
    if (arguments == "name") then
        ShowPlayerName();
    end
    if (arguments == "version") then
        Version();
    end
    if (arguments == "verbose") then
        if (Set.Verbose == false) then
            Set.Verbose = true
            Turbine.Shell.WriteLine("Muzzle verbose mode enabled.");
        elseif (Set.Verbose == true) then
            Set.Verbose = false
            Turbine.Shell.WriteLine("Muzzle verbose mode disabled.");
        end
    end
end

Turbine.Shell.AddCommand("Muzzle;muzzle", MuzzleCommand);

-- Check if Muzzle Reload is loaded and if so unload it
function ReloadCheck()
    Turbine.PluginManager.RefreshAvailablePlugins();
    loaded_plugins = Turbine.PluginManager.GetLoadedPlugins();

    ReloadChecker = Turbine.UI.Control();
    ReloadChecker:SetWantsUpdates(true);

    ReloadChecker.Update = function(sender, args)
        for k,v in pairs(loaded_plugins) do
            if v.Name == "Muzzle Reload" then
                Turbine.PluginManager.UnloadScriptState("MuzzleReload");
            end
        end
        ReloadChecker:SetWantsUpdates(false);
    end
end

ReloadCheck();
