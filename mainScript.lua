--Made By Ggblocks20 :)

--Create the plugin button, and the plugin itself
local toolbar = plugin:CreateToolbar("Monke Defender")

local newScriptButton = toolbar:CreateButton("Toggle UI", "Toggles Main security UI.", "rbxassetid://10312624833")
local settingsButton = toolbar:CreateButton("Settings", "Opens settings UI.", "rbxassetid://10319544511")
--Creates allowed table, so that we don't keep flagging allowed scripts
local allowed = {"Won't actually clear any scripts with this name, simply instances the table."}
--Creates the actual tables containing the dangerous viruses
local HIGHthreatLevel = { --Threats that have nearly 0 legitimate use, and are mainly used in virus programs
	"string.reverse", "getfenv", "rosync", "synapse", "isstudio"
}
local MEDthreatLevel = { --Threats that can have uses, but sometimes don't
	"vaccine", "rotatep"
}
local LOWthreatLevel = { --Mostly legit functions, rarely used in viruses
	"virus",
}
local virusNames = { --Names of virus scripts
	"IStÃ¯Â¿Â½rtHere","y7]pHfj5Ã¯Â¿Â½:?rÃ¯Â¿Â½BtaaV%/]t?&Ã¯Â¿Â½O",'dapperguestyo',"zidanedude1",
	"4d being","loser","infected","rolf","wildfire","geometry","join teh moovement","guest talker","anti-lag","sosolid2k244","IAmHereToHeÃ¯Â¿Â½lYourPlace","ROBO22e","IRstoopidnolifenerdwhoinfectedU","rayan11968","gomr","nhoj01","Of Course You Have Anti Virus Thats Why me (Some 1 in fear) Made This",
	"snap infection","numbrez","imahakwtfz","wtfzor","dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ng.........you got owned...","vivrus","zomg saved",
	"hello...i Ã¯Â¿Â½m your new lord lolz","worm","no samurai plzzz","ohai","virus","guest_talking_script","snapreducer",
	"snap-reducer","script.....or..is.it","timer","datacontrollers","chaotic","teleportscript","spreadify",
	"antivirussoftware","ropack injection","2_2_1_1_s_s_","safity lock","ropack","ropack backup","no availiblitly lock",
	"protection","whfcjgysa","073dea7p","Infect","rofl","notorsoitis","numberitis","Virus","4dbeing","4d being","loser",
	"infected","no samurai plzzz","ohai","virus","guest_talking_script","snapreducer","snap-reducer",
	"script.....or..is.it","Script......Or is it...","rolf","wildfire","geometry","join teh moovement","guest talker",
	"anti-lag","snap infection","numbrez","imahakwtfz","wtfzor","dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ng.........you got owned...","vivrus",
	"zomg saved","hello...i Ã¯Â¿Â½m your new lord lolz","worm","datacontrollers","chaotic","spreadify",
	"antivirussoftware","ropack injection","2_2_1_1_s_s_","safity lock","ropack","ropack backup","no availiblitly lock",
	"protection","whfcjgysa","073dea7p","PWNZ0R3D","CompassEffect" , "Guest_Talking_Script" , "cubiclemon rulz",
	"Motivation","motivation" , "Anti-Lag" , "troll" , "Troll" , "DÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½NG YOU GOT OWNED AND PWNED" , "Vaccine","Yeller","ProperGrÃ¯Â¿Â½mmerNeeded","RobloxTeam","ProperGrÃ¯Â¿Â½mmerNeededInPhilosiphalLocations;insertNoobHere","RED ROBIN YUMMMMMMMM","4D Being","ROFL", "ViVrus", "H75", "OwO PILLA VIRUS OwOERoblocker","dÃÂ¥ÃÂ¥ÃÂ¥ÃÂ¥ÃÂ¥ÃÂ¥ÃÂ¥ÃÂ¥ng..............you got owned","Spread","VirusScript","Norton Vaccine","Anti-Lag","V-3(78% Done)","Virus...Virus...LEET VIRUS!!!","NORN VIRUS","UrAIdiotVirus (Click Arrow)","dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½", "Snap_Reducer","SnapReducer","Snap Remover Pro V.2","ParT(Snap reducer by name)","Black Lag","DoNotRemoveThisScriptOrElseYourBigFatMotherWillDieTonightOLOLOLOLOLOL","Infected","Infected Script","InfectedScript","ROBLOXImprotantScript","RSFfacility","virus script","Virus Script","anti Lag","anti lag","Anti lag","lag","Lag","dupe","Dupe","Malicious Objects Vaccine V1.5","Not a Virus","dÃ¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ng.........you got owned...","vaccine","Vaccine", "Virus", "virus", "Dont worry im a friendly virus", "Dont worry im a friendly virus", "Don't worry im a friendly virus","don't worry im a friendly virus", "Super Anti Infection Vaccine", "Bad script Purger", "No Lag Script", "Scanner V1", "Spy bot and Lag remover", "Script......Or is it..."
}
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
local testWidget = plugin:CreateDockWidgetPluginGui("Monke Defender", widgetInfo)
testWidget.Title = "Monke Defender"
local Widget = plugin:CreateDockWidgetPluginGui("Settings", settingsWidget)
Widget.Title = "Settings"
--Parent UI to widget
local UI = script.ScrollingFrame:Clone() 
UI.Parent = testWidget
local SetUI = script.Settings2:Clone() 
SetUI.Parent = Widget
--Runs when button is clicked
newScriptButton.Click:Connect(function()
	if testWidget.Enabled == false then 
		testWidget.Enabled = true
	else
		testWidget.Enabled = false
	end
end)
--Same as above, but for settingsUI instead
settingsButton.Click:Connect(function()
	if Widget.Enabled == false then 
		Widget.Enabled = true
	else
		Widget.Enabled = false
	end
end)
--Creates Widget children
local scanBtn = UI.ScanButton
local template = UI.ScanButton.Template
--Settings widget children
local requireBtn = SetUI.Require.TextButton
local httpBtn = SetUI.HTTPReq.TextButton
local TeleportBtn = SetUI.TeleportService.TextButton
local clearBtn = SetUI.ClearTable
--Runs when any of the settings buttons are clicked
clearBtn.MouseButton1Click:Connect(function()
	table.clear(allowed)
	print("Cleared all allowed scripts!")
	table.insert(allowed, "Won't actually clear any scripts with this name, simply instances the table.")
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
--Creates the actual button that the person can view :)
function createTemplate(threatName, threatLevel, scriptName, script2, isModule, moduleParent)
	for _, IHateRoblox --[[:P]] in pairs(scanBtn:GetChildren()) do
		if IHateRoblox.Name ~= "UICorner" or "UIListLayout" or "Template" then
			if IHateRoblox.Name == scriptName then
				if IHateRoblox.ThreatName.Text == "Threat: "..threatName then
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
	for _, item in pairs(allowed) do
		if item == scriptName then
			clone:Destroy()
		end
	end
	local actionsBtn = clone:FindFirstChild("ActionsButton")
	actionsBtn.MouseButton1Click:Connect(function()
		for _, childrenInMyBasement --[[funni(don't tell the FBIð³)]] in pairs(actionsBtn:GetChildren()) do
			if childrenInMyBasement.Name ~= "UICorner" then
				childrenInMyBasement.Visible = true
			end
		end
		local allowBtn = actionsBtn.Allow
		allowBtn.MouseButton1Click:Connect(function()
			clone:Destroy()
			table.insert(allowed, scriptName)
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
	for _, a in pairs(HIGHthreatLevel) do
		wait()
		if obj.Source.lower(obj.Source):find(a) then
			print("High Threat virus found in script "..obj.Name..". Virus is "..a)
			createTemplate(a, "Threat Level: High", v.Name, obj, true, v)
		end
	end
	for _, a in pairs(MEDthreatLevel) do
		wait()
		if obj.Source.lower(obj.Source):find(a) then
			print("High Threat virus found in script "..obj.Name..". Virus is "..a)
			createTemplate(a, "Threat Level: Medium", v.Name, obj, true, v)
		end
	end
	for _, a in pairs(LOWthreatLevel) do
		wait()
		if obj.Source.lower(obj.Source):find(a) then
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
			for _, item in pairs(allowed) do
				if v.Name ~= item or v.Name == "Won't actually clear any scripts with this name, simply instances the table." then --this makes it so that viruses can't name themselves the one thing in allowed table and get away with it
					for _, name in pairs(virusNames) do
						if v.Name.lower(v.Name) == name then
							createTemplate(name, "Threat Level: Medium", v.Name, v, false)
						end
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
			end
			if v.Source.lower(v.Source):find("require") then
				for _, item in pairs(allowed) do
					if v.Name ~= item and v.Parent ~= "[MonkeDefender]Safe Zone"  then
						if script.Settings.FlagRequire.Value == true then
							if v.Source.lower(v.Source):match("%d+") then 
								local Success = pcall(function()--Checks to make sure asset is valid, prevents code from erroring
									game:GetService("MarketplaceService"):GetProductInfo(v.Source.lower(v.Source):match("%d+"))
								end)
								if (Success) then
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
			end
			if v.Source.lower(v.Source):find("teleportservice:teleport") then
				for _, item in pairs(allowed) do
					wait()
					if v.Name ~= item then
						if script.Settings.FlagTeleport.Value == true then
							createTemplate("TeleportService", "Threat Level: Low", v.Name, v, false)
						end
					end	
				end
			end
			if v.Source.lower(v.Source):find("httpservice") then
				for _, item in pairs(allowed) do
					wait()
					if v.Name ~= item then
						if script.Settings.FlagTeleport.Value == true then
							createTemplate("HttpService", "Threat Level: Medium", v.Name, v, false)
						end
					end	
				end
			end
		end 
	end
	if not scanBtn:GetChildren()[4] then
		UI.novirus.Visible = true
	end
end)
