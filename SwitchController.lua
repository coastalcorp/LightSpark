local API = game.Workspace["Coastal LightSpark"].SparkAPI.API
local Settings = require(game.Workspace["Coastal LightSpark"].Configuration.Settings)
local Configuation = script.Parent.Configuration

API.Event:Connect(function(Zone, Power)
	if Zone == Configuation:GetAttribute("Zone") or Zone == 0 then
		Configuation:SetAttribute("Powered", Power)
	end
end)

script.Parent.Click:WaitForChild("ClickDetector").MouseClick:Connect(function(plr)
	if Settings["Whitelist Settings"].Enabled then
		if plr:GetRankInGroup(Settings["Whitelist Settings"].GroupID) >= Settings["Whitelist Settings"].Rank then
			API:Fire()
		end
	else
		API:Fire(Configuation:GetAttribute("Zone"), not Configuation:GetAttribute("Powered"))
	end
end)

Configuation:GetAttributeChangedSignal("Powered"):Connect(function()
	if Configuation:GetAttribute("Powered") == true then
		script.Parent.On.Transparency = 0
		script.Parent.Off.Transparency = 1
	else
		script.Parent.On.Transparency = 1
		script.Parent.Off.Transparency = 0
	end
end)
