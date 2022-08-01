--Made By Ggblocks20 :)

--Create the plugin button, and the plugin itself
local toolbar = plugin:CreateToolbar("Monke Defender")

local newScriptButton = toolbar:CreateButton("Toggle UI", "Toggles Main security UI.", "rbxassetid://10312624833")
local settingsButton = toolbar:CreateButton("Settings", "Opens settings UI.", "rbxassetid://10319544511")
--Creates allowed table, so that we don't keep flagging allowed scripts
local allowed = {["Won't actually clear any scripts with this name, simply instances the table."] = true}
--Creates the actual tables containing the dangerous viruses
local HIGHthreatLevel = { --Threats that have nearly 0 legitimate use, and are mainly used in virus programs
	"string.reverse", "getfenv", "rosync", "synapse", 
}
local MEDthreatLevel = { --Threats that can have uses, but sometimes don't
	"vaccine", "rotatep"
}
local LOWthreatLevel = { --Mostly legit functions, rarely used in viruses
	"virus"
}
local virusNames = { --Names of virus scripts
	["istï¿½rthere"] = true, ["y7]phfj5ï¿½:?rï¿½btaav%/]t?&ï¿½o"] = true, ["dapperguestyo"] = true, ["zidanedude1"] = true, ["4d being"] = true, ["loser"] = true, ["infected"] = true, ["rolf"] = true,
	["wildfire"] = true, ["geometry"] = true, ["join teh moovement"] = true, ["guest talker"] = true, ["anti-lag"] = true, ["sosolid2k244"] = true, ["iamheretoheï¿½lyourplace"] = true, ["robo22e"] = true,
	["irstoopidnolifenerdwhoinfectedu"] = true, ["rayan11968"] = true, ["gomr"] = true, ["nhoj01"] = true, ["of course you have anti virus thats why me (some 1 in fear) made this"] = true, ["snap infection"] = true, ["numbrez"] = true, ["imahakwtfz"] = true,
	["wtfzor"] = true, ["dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ng.........you got owned..."] = true, ["vivrus"] = true, ["zomg saved"] = true, ["hello...i ï¿½m your new lord lolz"] = true, ["worm"] = true, ["no samurai plzzz"] = true, ["ohai"] = true,
	["virus"] = true, ["guest_talking_script"] = true, ["snapreducer"] = true, ["snap-reducer"] = true, ["script.....or..is.it"] = true, ["timer"] = true, ["datacontrollers"] = true, ["chaotic"] = true,
	["teleportscript"] = true, ["spreadify"] = true, ["antivirussoftware"] = true, ["ropack injection"] = true, ["2_2_1_1_s_s_"] = true, ["safity lock"] = true, ["ropack"] = true, ["ropack backup"] = true,
	["no availiblitly lock"] = true, ["protection"] = true, ["whfcjgysa"] = true, ["073dea7p"] = true, ["infect"] = true, ["rofl"] = true, ["notorsoitis"] = true, ["numberitis"] = true,
	["4dbeing"] = true, ["script......or is it..."] = true, ["pwnz0r3d"] = true, ["compasseffect"] = true, ["cubiclemon rulz"] = true, ["motivation"] = true,	["troll"] = true, ["dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ng you got owned and pwned"] = true, ["vaccine"] = true, ["yeller"] = true, ["propergrï¿½mmerneeded"] = true, ["robloxteam"] = true, ["propergrï¿½mmerneededinphilosiphallocations;insertnoobhere"] = true,
	["red robin yummmmmmmm"] = true, ["h75"] = true, ["owo pilla virus owoeroblocker"] = true, ["dÃ¥Ã¥Ã¥Ã¥Ã¥Ã¥Ã¥Ã¥ng..............you got owned"] = true, ["spread"] = true,
	["virusscript"] = true, ["norton vaccine"] = true, ["v-3(78% done)"] = true, ["virus...virus...leet virus!!!"] = true, ["norn virus"] = true, ["uraidiotvirus (click arrow)"] = true, ["dï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½"] = true,
	["snap_reducer"] = true, ["snap remover pro v.2"] = true, ["part(snap reducer by name)"] = true, ["black lag"] = true, ["donotremovethisscriptorelseyourbigfatmotherwilldietonightolololololol"] = true, ["infected script"] = true,
	["infectedscript"] = true, ["robloximprotantscript"] = true, ["rsffacility"] = true, ["virus script"] = true, ["anti lag"] = true,	["lag"] = true, ["dupe"] = true, ["malicious objects vaccine v1.5"] = true, ["not a virus"] = true, ["dont worry im a friendly virus"] = true, ["don't worry im a friendly virus"] = true, ["super anti infection vaccine"] = true,
}

--Creates backup tables so that we can easily reset main tables when restoring to default settings
local backupHIGHthreatLevel = table.clone(HIGHthreatLevel)
local backupMEDthreatLevel = table.clone(MEDthreatLevel)
local backupLOWthreatLevel = table.clone(LOWthreatLevel)
local backupVirusNames = table.clone(virusNames)

--Create the widget
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,   
	false,  
	1000,   
	500,    
	1000,    
	490   
)

local settingsWidget = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,   
	false,  
	1000,   
	500,    
	1000,    
	490   
)

local customWidget = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float,
	false,   
	false,  
	1000,   
	500,    
	1000,    
	490   
)
local testWidget = plugin:CreateDockWidgetPluginGui("Monke Defender", widgetInfo)
testWidget.Title = "Monke Defender"
local Widget = plugin:CreateDockWidgetPluginGui("Settings", settingsWidget)
Widget.Title = "Settings"
local CWidget = plugin:CreateDockWidgetPluginGui("Advanced Settings", customWidget)
CWidget.Title = "Advanced Settings"
--Parent UI to widget
local UI = script.ScrollingFrame:Clone() 
UI.Parent = testWidget
local SetUI = script.Settings2:Clone() 
SetUI.Parent = Widget
local customUI = script.customThreatUI:Clone()
customUI.Parent = CWidget
--Runs when button is clicked
newScriptButton.Click:Connect(function()
	testWidget.Enabled = not testWidget.Enabled
end)
--Same as above, but for settingsUI instead
settingsButton.Click:Connect(function()
	Widget.Enabled = not Widget.Enabled
end)
--Creates Widget children
local scanBtn = UI.ScanButton
local template = UI.ScanButton.Template
--Settings widget children
local requireBtn = SetUI.Require.TextButton
local httpBtn = SetUI.HTTPReq.TextButton
local TeleportBtn = SetUI.TeleportService.TextButton
local clearBtn = SetUI.ClearTable
local cloneBtn = SetUI.OpenCustom
local cloneBtn2 = SetUI.Clones.TextButton
local studioBtn = SetUI.IsStudio.TextButton
local quarantineBtn = SetUI.autoQ.TextButton
--Runs when any of the settings buttons are clicked
clearBtn.MouseButton1Click:Connect(function()
	table.clear(allowed)
	print("Cleared all allowed scripts!")
	allowed["Won't actually clear any scripts with this name, simply instances the table."] = true
end)
requireBtn.MouseButton1Click:Connect(function()
	if script.Settings.FlagRequire.Value == true then
		requireBtn.BackgroundColor = BrickColor.new("Really red")
		script.Settings.FlagRequire.Value = false
	else
		requireBtn.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.FlagRequire.Value = true
	end
end)
cloneBtn2.MouseButton1Click:Connect(function()
	if script.Settings.DeleteClones.Value == true then
		cloneBtn2.BackgroundColor = BrickColor.new("Really red")
		script.Settings.DeleteClones.Value = false
	else
		cloneBtn2.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.DeleteClones.Value = true
	end
end)
TeleportBtn.MouseButton1Click:Connect(function()
	if script.Settings.FlagTeleport.Value == true then
		TeleportBtn.BackgroundColor = BrickColor.new("Really red")
		script.Settings.FlagTeleport.Value = false
	else
		TeleportBtn.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.FlagTeleport.Value = true
	end
end)
httpBtn.MouseButton1Click:Connect(function()
	if script.Settings.FlagHTTP.Value == true then
		httpBtn.BackgroundColor = BrickColor.new("Really red")
		script.Settings.FlagHTTP.Value = false
	else
		httpBtn.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.FlagHTTP.Value = true
	end
end)
studioBtn.MouseButton1Click:Connect(function()
	if script.Settings.FlagStudio.Value == true then
		studioBtn.BackgroundColor = BrickColor.new("Really red")
		script.Settings.FlagStudio.Value = false
	else
		studioBtn.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.FlagStudio.Value = true
	end
end)
quarantineBtn.MouseButton1Click:Connect(function()
	if script.Settings.AutoQuarantine.Value == true then
		quarantineBtn.BackgroundColor = BrickColor.new("Really red")
		script.Settings.AutoQuarantine.Value = false
	else
		quarantineBtn.BackgroundColor = BrickColor.new("Lime green")
		script.Settings.AutoQuarantine.Value = true
	end
end)
--Opens custom threat UI 
SetUI.OpenCustom.MouseButton1Click:Connect(function()
	Widget.Enabled = false
	CWidget.Enabled = true
end)
--Buttons for the custom threat UI
customUI.AddLow.MouseButton1Click:Connect(function()
	table.insert(LOWthreatLevel, customUI.TextBox.Text)
end)
customUI.AddMed.MouseButton1Click:Connect(function()
	table.insert(MEDthreatLevel, customUI.TextBox.Text)
end)
customUI.AddHigh.MouseButton1Click:Connect(function()
	table.insert(HIGHthreatLevel, customUI.TextBox.Text)
end)
customUI.RemoveThreat.MouseButton1Click:Connect(function()
	local threat = customUI.RemoveBox.Text
	for i, v in pairs(LOWthreatLevel) do
		if v == threat.lower(threat) then
			table.remove(LOWthreatLevel, i)
		end
	end
	for i, v in pairs(MEDthreatLevel) do
		if v == threat.lower(threat) then
			table.remove(MEDthreatLevel, i)
		end
	end
	for i, v in pairs(HIGHthreatLevel) do
		if v == threat.lower(threat) then
			table.remove(HIGHthreatLevel, i)
		end
	end
end)
customUI.AddName.MouseButton1Click:Connect(function()
	virusNames[string.lower(customUI.nameBox.Text)] = true
end)
--Loops through our backup tables and resets the main tables
customUI.ClearCustom.MouseButton1Click:Connect(function()
	virusNames = table.clone(backupVirusNames)
	LOWthreatLevel = table.clone(backupLOWthreatLevel)
	MEDthreatLevel = table.clone(backupMEDthreatLevel)
	HIGHthreatLevel = table.clone(HIGHthreatLevel)
end)
--Creates the actual button that the person can view :)
function createTemplate(threatName, threatLevel, scriptName, script2, isModule, moduleParent)
	for _, IHateRoblox --[[:P]] in pairs(scanBtn:GetChildren()) do
		if IHateRoblox.Name ~= "UICorner" or IHateRoblox.Name ~=  "UIListLayout" or IHateRoblox.Name ~= "Template" then
			if IHateRoblox.Name == scriptName then
				if IHateRoblox.ThreatName.Text == "Threat: "..threatName and script.Settings.DeleteClones.Value == true then
					IHateRoblox:Destroy() --We have a clone, so destroy the clone
					UI.labelclone.Visible = true --Alert the player of a clone
				end
			end
		end
	end
	local clone = template:Clone()
	clone.Parent = scanBtn
	clone.Name = scriptName
	clone.Visible = true
	clone.ThreatLevel.Text = threatLevel
	clone.ThreatName.Text = "Threat: "..threatName
	clone.ScriptName.Text = "Script: "..scriptName
	if script.Settings.AutoQuarantine.Value == true then
		clone:Destroy()
		if isModule then
			if not game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone") then
				local folder = Instance.new("Folder")
				folder.Name = "[MonkeDefender]Safe Zone"
				folder.Parent = game:GetService("ServerStorage")
				script2.Parent = folder
				moduleParent.Parent = folder
				if not script2:IsA("ModuleScript") then
					script2.Disabled = true
				end
				clone:Destroy()
			else
				script2.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
				moduleParent.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
				if not script2:IsA("ModuleScript") then
					script2.Disabled = true
				end
				clone:Destroy()
			end
		end
		if not game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone") then
			local folder = Instance.new("Folder")
			folder.Name = "[MonkeDefender]Safe Zone"
			folder.Parent = game:GetService("ServerStorage")
			script2.Parent = folder
			if not script2:IsA("ModuleScript") then
				script2.Disabled = true
			end
			clone:Destroy()
		else
			script2.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
			if not script2:IsA("ModuleScript") then
				script2.Disabled = true
			end
			clone:Destroy()
		end
	end
	if allowed[scriptName] then
		clone:Destroy()
	end
	local actionsBtn = clone:FindFirstChild("ActionsButton")
	actionsBtn.MouseButton1Click:Connect(function()
		for _, childrenInMyBasement --[[funni(don't tell the FBI😳)]] in pairs(actionsBtn:GetChildren()) do
			if childrenInMyBasement.Name ~= "UICorner" then
				childrenInMyBasement.Visible = true
			end
		end
		local allowBtn = actionsBtn.Allow
		allowBtn.MouseButton1Click:Connect(function()
			clone:Destroy()
			allowed[scriptName] = true
		end)
		local qBtn = actionsBtn.quaraButton
		qBtn.MouseButton1Click:Connect(function()
			if isModule == true then
				if not game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone") then
					local folder = Instance.new("Folder")
					folder.Name = "[MonkeDefender]Safe Zone"
					folder.Parent = game:GetService("ServerStorage")
					script2.Parent = folder
					moduleParent.Parent = folder
					if not script2:IsA("ModuleScript") then
						script2.Disabled = true
					end
					clone:Destroy()
				else
					script2.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
					moduleParent.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
					if not script2:IsA("ModuleScript") then
						script2.Disabled = true
					end
					clone:Destroy()
				end
			end
			if not game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone") then
				local folder = Instance.new("Folder")
				folder.Name = "[MonkeDefender]Safe Zone"
				folder.Parent = game:GetService("ServerStorage")
				script2.Parent = folder
				if not script2:IsA("ModuleScript") then
					script2.Disabled = true
				end
				clone:Destroy()
			else
				script2.Parent = game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone")
				if not script2:IsA("ModuleScript") then
					script2.Disabled = true
				end
				clone:Destroy()
			end
		end)
	end)
end
--Makes function for optional scans, simply for optimization
function scan(obj, v)
	if virusNames[string.lower(obj.Name)] then
		createTemplate(name, "Threat Level: Medium", v.Name, v, false)
	end
	for _, a in pairs(HIGHthreatLevel) do
		if string.find(string.lower(obj.Source), a) then
			print("High Threat virus found in script "..obj.Name..". Virus is "..a)
			createTemplate(a, "Threat Level: High", v.Name, obj, true, v)
		end
	end
	for _, a in pairs(MEDthreatLevel) do
		if string.find(string.lower(obj.Source), a) then
			print("High Threat virus found in script "..obj.Name..". Virus is "..a)
			createTemplate(a, "Threat Level: Medium", v.Name, obj, true, v)
		end
	end
	for _, a in pairs(LOWtheatLevel) do
		if string.find(string.lower(obj.Source), a) then
			print("High Threat virus found in script "..obj.Name..". Virus is "..a)
			createTemplate(a, "Threat Level: Low", v.Name, obj, true, v)
		end
	end
end
--Runs when scan button is clicked
scanBtn.MouseButton1Click:Connect(function()
	UI.labelclone.Visible = false
	UI.novirus.Visible = false
	for _, v in pairs(game:GetDescendants()) do
		if v:IsA("Script") and v.Parent ~= "[MonkeDefender]Safe Zone" then
			
			if not allowed[v.Name] then
				if virusNames[string.lower(v.Name)] then
					createTemplate(name, "Threat Level: Medium", v.Name, v, false)
				end
				for _, a in pairs(HIGHthreatLevel) do
					if v.Source.lower(v.Source):find(a) then
						createTemplate(a, "Threat Level: High", v.Name, v, false)
						print("High Threat virus found in script "..v.Name..". Virus is "..a)
					end
				end
				for _, b in pairs(MEDthreatLevel) do
					if v.Source.lower(v.Source):find(b) then
						print("Medium Threat virus found in script "..v.Name..". Virus is "..b)
						createTemplate(b, "Threat Level: Medium", v.Name, v, false)
					end
				end
				for _, c in pairs(LOWthreatLevel) do
						if v.Source.lower(v.Source):find(c) then
						print("Low Threat virus found in script "..v.Name..". Virus is "..c)
						createTemplate(c, "Threat Level: Low", v.Name, v, false)
					end
				end
			end
			if v.Source.lower(v.Source):find("require") then
				if (not allowed[v.Name]) and v.Parent ~= "[MonkeDefender]Safe Zone"  then
					if script.Settings.FlagRequire.Value == true then
						if string.match(string.lower(v.Source), match("%d+")) then 
							local Success = pcall(function()--Checks to make sure asset is valid, prevents code from erroring
								game:GetService("MarketplaceService"):GetProductInfo(v.Source.lower(v.Source):match("%d+"))
							end)
							if Success then
								for _, obj in ipairs(game:GetObjects("rbxassetid://"..v.Source.lower(v.Source):match("%d+"))) do
									if obj:IsA("Script") or obj:IsA("ModuleScript") then
										if not game.ServerStorage:FindFirstChild("[MonkeDefender]Safe Zone") then
											local folder = Instance.new("Folder")
											folder.Name = "[MonkeDefender]Safe Zone"
											folder.Parent = game:GetService("ServerStorage")
											obj.Parent = folder
											scan(obj, v)
										else
											obj.Parent = game.ServerStorage:WaitForChild("[MonkeDefender]Safe Zone")
											scan(obj, v)
										end
									end
								end
							end
						end
					end
				end
			end
			if not allowed[v.Name] then
				local low = v.Source.lower(v.Source)
				
				if low:find("teleportservice:teleport") then
					if script.Settings.FlagTeleport.Value then
						createTemplate("TeleportService", "Threat Level: Low", v.Name, v, false)
					end
				end
				
				if low:find("isstudio") then
					if script.Settings.FlagStudio.Value then
						createTemplate("IsStudio", "Threat Level: High", v.Name, v, false)
					end
				end
				
				if low:find("httpservice") then
					if script.Settings.FlagTeleport.Value == true then
						createTemplate("HttpService", "Threat Level: Medium", v.Name, v, false)
					end
				end
				
			end
		end 
	end
	if not scanBtn:GetChildren()[4] then
		UI.novirus.Visible = true
	end
end)
