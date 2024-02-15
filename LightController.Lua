local API = game.Workspace["Coastal LightSpark"].SparkAPI.API
local Configuation = script.Parent.Configuration

API.Event:Connect(function(Zone, Power)
	if Zone == Configuation:GetAttribute("Zone") or Zone == 0 then
		if Power then
			Configuation.LightPart.Value.Light.Enabled = Power
			Configuation.LightPart.Value.Material = Enum.Material.Neon
		else
			Configuation.LightPart.Value.Light.Enabled = Power
			Configuation.LightPart.Value.Material = Enum.Material.SmoothPlastic
		end
	end
	
	if Zone == "Emg" and Configuation:GetAttribute("EmergencyLight") == true then
		Configuation.LightPart.Value.Light.Enabled = Power
		Configuation.LightPart.Value.Material = Enum.Material.Neon
	end
	
end)
