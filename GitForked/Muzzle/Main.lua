-- Muzzle (Main.lua)

-- Turbine imports
import "Turbine";
import "Turbine.Gameplay";

-- Muzzle imports
import "GitForked.Muzzle.Configuration";
import "GitForked.Muzzle.Muzzle";


Turbine.Shell.WriteLine("<rgb=#008080>Muzzle</rgb> " .. Plugins.Muzzle:GetVersion() .. " loaded.");

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
