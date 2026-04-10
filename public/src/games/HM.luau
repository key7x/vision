local arg1 = ...;
local luaobf_bundle = {};
local _require = require;
local function require(path, ...)
	local fn = luaobf_bundle[path];
	if not fn then
		return _require(path, arg1, ...);
	end
	return fn(arg1, ...);
end
luaobf_bundle['file'] = function(...)
	local places = {LOBBY=7939820001,NM=8505066428,DEX_NORMAL=8535803544,DEX_NIGHTMARE=8535803845};
	local utils = nil;
	local IS = function(n)
		if (game.PlaceId == places[n]) then
			return true;
		end
	end;
	local DEL = function(p, obj)
		if p:FindFirstChild(obj) then
			p:FindFirstChild(obj):Destroy();
		end
	end;
	local PROMPT_BROKEN_EXEC = false;
	if (identifyexecutor():lower():find("solara") or identifyexecutor():lower():find("xeno")) then
		PROMPT_BROKEN_EXEC = true;
	end
	local PROMPT = function(prompt, location, condition, keepRoot, off)
		local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart");
		prompt.HoldDuration = 0;
		prompt.Exclusivity = Enum.ProximityPromptExclusivity.AlwaysShow;
		repeat
			if keepRoot then
				root.CFrame = keepRoot:GetPivot() + (off or Vector3.zero);
			elseif location then
				root.CFrame = location;
			end
			if PROMPT_BROKEN_EXEC then
				workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, (location and location.Position) or keepRoot:GetPivot().Position);
			end
			fireproximityprompt(prompt, 0);
			task.wait();
		until not prompt:IsDescendantOf(workspace) or (condition and condition()) 
	end;
	local plr = game.Players.LocalPlayer;
	local char = plr.Character;
	local backpack = plr.Backpack;
	local humanoid = char:WaitForChild("Humanoid");
	local root = char:WaitForChild("HumanoidRootPart");
	if (IS("DEX_NORMAL") or IS("DEX_NIGHTMARE")) then
		for _, v in workspace.Collections:GetChildren() do
			if v:FindFirstChild("ProximityPrompt") then
				PROMPT(v.ProximityPrompt, v.CFrame);
			end
		end
		local events = workspace.Events;
		local function placeToCauldron(itemName, layer2Name)
			print(itemName, layer2Name);
			local item = events:FindFirstChild(itemName);
			local layer2 = events.Cauldron.Layer2:FindFirstChild(layer2Name or itemName);
			if (not item or not layer2) then
				print("item or layer 2 missing");
				return;
			end
			local child = #backpack:GetChildren();
			PROMPT(item.ProximityPrompt, item.CFrame, function()
				return #backpack:GetChildren() ~= child;
			end);
			print("aight i think i picked up the item");
			local t = os.time();
			PROMPT(layer2, events.Cauldron:GetPivot(), function()
				if ((os.time() - t) > 0.135) then
					print("prolly did not pick up the item correctly");
					child = #backpack:GetChildren();
					PROMPT(item.ProximityPrompt, item.CFrame, function()
						return #backpack:GetChildren() ~= child;
					end);
					t = os.time();
				end
				return not item:IsDescendantOf(workspace);
			end);
			print("done all");
		end
		placeToCauldron("Water bottle ", "Water");
		placeToCauldron("Rose");
		placeToCauldron("Egg");
		placeToCauldron("Grass");
		local currentAmount = #backpack:GetChildren();
		PROMPT(workspace.Events.Final.ProximityPrompt, workspace.Events.Final.CFrame, function()
			return #backpack:GetChildren() ~= currentAmount;
		end);
		task.wait();
		PROMPT(workspace.Dexeliao:FindFirstChild("Monster", true), nil, function()
			return not workspace:FindFirstChild("Dexeliao");
		end, workspace.Dexeliao, Vector3.new(0, 5.5, 0));
	end
	if (IS("NM") or IS("LOBBY")) then
		if IS("NM") then
			for _, v in pairs(workspace:FindFirstChild("AI/Path"):GetDescendants()) do
				if v:IsA("TouchTransmitter") then
					v:Destroy();
				end
			end
			DEL(game.ReplicatedStorage, "Jumpscare");
			DEL(game.ReplicatedStorage, "Jumpscare2");
		end
		local gameFolder = workspace.Game;
		local objective = gameFolder.Objective;
		for _, v in objective.Orbs:GetChildren() do
			if (v:IsA("Model") or v:IsA("BasePart")) then
				PROMPT(v:FindFirstChild("ProximityPrompt", true), (v:IsA("Model") and v:GetPivot()) or v.CFrame);
			end
		end
		for _, v in objective:GetChildren() do
			if (v.Name == "SkullFolder") then
				local placePrompt = v.SkullPlace:FindFirstChild("ProximityPrompt");
				if (placePrompt and placePrompt.Enabled) then
					local skull = v.Skull.Skull;
					local skullName = skull.ProximityPrompt.ObjectText;
					PROMPT(skull.ProximityPrompt, skull.CFrame, function()
						return backpack:FindFirstChild(skullName);
					end);
					humanoid:EquipTool(backpack:FindFirstChild(skullName));
					PROMPT(placePrompt, v.SkullPlace.CFrame, function()
						local isDone = not (placePrompt.Enabled and placePrompt:IsDescendantOf(workspace));
						return isDone;
					end);
				end
			end
		end
		if IS("NM") then
			task.wait(1);
			local womansLantern = gameFolder.Event:FindFirstChildOfClass("Model");
			if womansLantern then
				local t = os.time();
				PROMPT(womansLantern:FindFirstChild("ProximityPrompt", true), womansLantern:GetPivot(), function()
					return (os.time() - t) > 1;
				end, womansLantern);
			end
		end
	end
end;
return luaobf_bundle['file'](...);
