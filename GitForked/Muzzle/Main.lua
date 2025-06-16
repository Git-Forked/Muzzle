-- Muzzle (Main.lua)
-- 1.4.0

-- Turbine imports
import "Turbine";
import "Turbine.Gameplay";

-- Muzzle imports
import "GitForked.Muzzle.Configuration";
import "GitForked.Muzzle.Muzzle";

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

PlayerName = ""
function ChatHandler(sender, args)
    if args.ChatType == Turbine.ChatType.World then
        for _,v in pairs(Muzzle) do
            if string.match(args.Message, v) then
                if Set.Verbose == true then
                    Turbine.Shell.WriteLine("<rgb=".. Set.MuzzledFontColorHexRGB ..">Muzzled</rgb> for '<rgb=".. Set.FilterFontColorHexRGB ..">".. v .."</rgb>': <rgb=".. Set.BlockoutFontColorHexRGB ..">".. args.Message);
                end
                return;
            end
        end
        PlayerName = GetPlayerNameOnce()
        if string.match(args.Message, PlayerName) then
            HighlightedMessage = string.gsub(args.Message, PlayerName, "<rgb=" .. Set.HighlightColorHexRGB .. ">" .. PlayerName .. "<rgb=" .. Set.StandardFontColorHexRGB .. ">") -- string.gsub(string, pattern, replace)
            Turbine.Shell.WriteLine("<rgb=" .. Set.HighlightColorHexRGB .. "> ::: " .. PlayerName .. " ::: <rgb=#FFFFFF>" .. HighlightedMessage);
        elseif string.match(args.Message, string.lower(PlayerName)) then
            HighlightedMessage = string.gsub(args.Message, string.lower(PlayerName), "<rgb=" .. Set.HighlightColorHexRGB .. ">" .. string.lower(PlayerName) .. "<rgb=" .. Set.StandardFontColorHexRGB .. ">")
            Turbine.Shell.WriteLine("<rgb=" .. Set.HighlightColorHexRGB .. "> ::: " .. PlayerName .. " ::: <rgb=#FFFFFF>" .. HighlightedMessage);
        else
            Turbine.Shell.WriteLine("<rgb=" .. Set.StandardFontColorHexRGB .. ">" .. args.Message);
        end
    end
    --
    if Set.Trade == true and args.ChatType == Turbine.ChatType.Trade then
        for _,v in pairs(Muzzle) do
            if string.match(args.Message, v) then
                if Set.Verbose == true then
                    Turbine.Shell.WriteLine("<rgb=".. Set.MuzzledFontColorHexRGB ..">Muzzled</rgb> for '<rgb=".. Set.FilterFontColorHexRGB ..">".. v .."</rgb>': <rgb=".. Set.BlockoutFontColorHexRGB ..">".. args.Message);
                end
                return;
            end
        end
        PlayerName = GetPlayerNameOnce()
        if string.match(args.Message, PlayerName) then
            HighlightedMessage = string.gsub(args.Message, PlayerName, "<rgb=" .. Set.HighlightColorHexRGB .. ">" .. PlayerName .. "<rgb=" .. Set.StandardFontColorHexRGB .. ">") -- string.gsub(string, pattern, replace)
            Turbine.Shell.WriteLine("<rgb=" .. Set.HighlightColorHexRGB .. "> ::: " .. PlayerName .. " ::: <rgb=#FFFFFF>" .. HighlightedMessage);
        elseif string.match(args.Message, string.lower(PlayerName)) then
            HighlightedMessage = string.gsub(args.Message, string.lower(PlayerName), "<rgb=" .. Set.HighlightColorHexRGB .. ">" .. string.lower(PlayerName) .. "<rgb=" .. Set.StandardFontColorHexRGB .. ">")
            Turbine.Shell.WriteLine("<rgb=" .. Set.HighlightColorHexRGB .. "> ::: " .. PlayerName .. " ::: <rgb=#FFFFFF>" .. HighlightedMessage);
        else
            Turbine.Shell.WriteLine("<rgb=" .. Set.StandardFontColorHexRGB .. ">" .. args.Message);
        end
    end
end

AddCallback(Turbine.Chat, "Received", ChatHandler);

function ShowPlayerName()
    local player = Turbine.Gameplay.LocalPlayer:GetInstance()
    if player then
        local PlayerName = player:GetName()
        Turbine.Shell.WriteLine("Your player name is: <rgb=" .. Set.HighlightColorHexRGB .. ">" .. PlayerName .. "</rgb>");
    else
        Turbine.Shell.WriteLine("Could not retrieve player information.");
    end
end

function GetPlayerName()
    local player = Turbine.Gameplay.LocalPlayer:GetInstance()
    if player then
        local PlayerName = player:GetName()
        return PlayerName
    else
        Turbine.Shell.WriteLine("Could not retrieve player information.");
    end
end

function GetPlayerNameOnce()
    if PlayerName ~= "" then
        return PlayerName
    else
        local player = Turbine.Gameplay.LocalPlayer:GetInstance()
        if player then
            local PlayerName = player:GetName()
            return PlayerName
        else
            Turbine.Shell.WriteLine("Could not retrieve player information.");
        end
    end
end

-- Muzzle Reload
function Reload()
    Turbine.PluginManager.LoadPlugin('Muzzle Reload');
end

function Version()
    Turbine.Shell.WriteLine("<rgb=#008080>Muzzle</rgb> " .. Plugins.Muzzle:GetVersion() .. " by <rgb=#008080>Git-Forked</rgb> is running.");
end

function Fonts()
    Turbine.Shell.WriteLine("Muzzle Font Colors: <rgb="..Set.HighlightColorHexRGB..">Highlight</rgb>, <rgb="..Set.StandardFontColorHexRGB..">Standard</rgb>, <rgb="..Set.MuzzledFontColorHexRGB..">Muzzle</rgb>, <rgb="..Set.FilterFontColorHexRGB..">Filter</rgb>, <rgb="..Set.BlockoutFontColorHexRGB..">Blockout</rgb>");
end

-- Muzzle Commands
MuzzleCommand = Turbine.ShellCommand();

function MuzzleCommand:Execute(command, arguments)
    if (arguments == "reload") then
        Turbine.Shell.WriteLine("Muzzle reloading..");
        Reload();
    elseif (arguments == "name") then
        ShowPlayerName();
    elseif (arguments == "version") then
        Version();
    elseif (arguments == "fonts") then
        Fonts();
    elseif (arguments == "verbose") then
        if (Set.Verbose == false) then
            Set.Verbose = true
            Turbine.Shell.WriteLine("Muzzle verbose mode enabled.");
        elseif (Set.Verbose == true) then
            Set.Verbose = false
            Turbine.Shell.WriteLine("Muzzle verbose mode disabled.");
        end
    elseif (arguments == "trade") then
        if (Set.Trade == false) then
            Set.Trade = true
            Turbine.Shell.WriteLine("Muzzle trade channel enabled.");
        elseif (Set.Trade == true) then
            Set.Trade = false
            Turbine.Shell.WriteLine("Muzzle trade channel disabled.");
        end
    elseif (arguments == "?" or "help") then
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("Muzzle Help Menu");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("Note: Muzzle does not require the user to use any of these commands to operate. These commands are provided for advanced users.");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle reload");
        Turbine.Shell.WriteLine("Will reload the Muzzle plugin. This is useful if you have added names or keywords, since a reload is required for the new names or keywords to take effect.  This command prevents having to log your character out and back in.");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle name");
        Turbine.Shell.WriteLine("Display your player name.");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle version");
        Turbine.Shell.WriteLine("Display the version of the Muzzle plugin.");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle fonts");
        Turbine.Shell.WriteLine("Display the font colors configuration (set in Configuration.lua).");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle verbose");
        Turbine.Shell.WriteLine("Toggle to enable or disable verbose mode (for debugging your list).");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle trade");
        Turbine.Shell.WriteLine("Toggle to enable or disable filtering of the trade channel.");
        Turbine.Shell.WriteLine(" ");
        Turbine.Shell.WriteLine("/Muzzle ?");
        Turbine.Shell.WriteLine("Display the Muzzle Help Menu.");
        Turbine.Shell.WriteLine(" ");
    else
        Turbine.Shell.WriteLine("Invalid input, please try again.");
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

Turbine.Shell.WriteLine("<rgb=#008080>Muzzle</rgb> " .. Plugins.Muzzle:GetVersion() .. " by <rgb=#008080>Git-Forked</rgb> loaded.");
