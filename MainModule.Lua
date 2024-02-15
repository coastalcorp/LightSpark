local module = {}

function module.Switch(Switch)
	for i, j in ipairs(Switch:GetChildren()) do
		if j.Name == "Switch" then
			local SwitchController = script.SwitchController:Clone()
			SwitchController.Parent = j
			Instance.new("ClickDetector", j.Click)
		end
	end
end

function module.Light(Light)
	local LightController = script.LightController:Clone()
	LightController.Parent = Light
end

return module
