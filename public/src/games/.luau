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
	local folder = workspace.GameplayFolder;
	local rooms = folder.Rooms;
	local char = game.Players.LocalPlayer.Character;
	local p = Instance.new("Part");
	p.Parent = workspace;
	p.Anchored = true;
	p.CanCollide = true;
	p.Size = Vector3.new(5, 5, 5);
	local lock = true;
	char.ChildAdded:Connect(function(child)
		if (child.Name == "Glider") then
			while char:FindFirstChild("Glider") do
				task.wait();
				char:PivotTo(folder.Characters.Pipose01:GetPivot());
			end
		end
	end);
	rooms.ChildAdded:Connect(function(child)
		if not child:IsA("Model") then
			return;
		end
		if (child.Name == "SearchlightsEncounter") then
			while not workspace:FindFirstChild("RegSearchlightsOutro") do
				task.wait();
				char:PivotTo(child:WaitForChild("ExitTeleport", math.huge).CFrame);
			end
			return;
		end
		if (child.Name == "FirewallEnd") then
			p.Position = child:WaitForChild("SafeRoomTeleport", math.huge).Position - Vector3.new(0, 3.5, 0);
			while child:IsDescendantOf(workspace) do
				task.wait();
				char:PivotTo(child:WaitForChild("SafeRoomTeleport", math.huge).CFrame);
			end
			return;
		end
		if lock then
			return;
		end
		local orientation, size = child:GetBoundingBox();
		local topY = orientation.Position.Y + (size.Y / 2);
		local pos = Vector3.new(orientation.Position.X, topY + 85, orientation.Position.Z);
		p.Position = Vector3.new(orientation.Position.X, topY + 70, orientation.Position.Z);
		char:PivotTo(CFrame.new(pos));
	end);
	local remote = game.ReplicatedStorage.Events.LocalEntityReplicate;
	local remote2 = game.ReplicatedStorage.Events.LocalDamage;
	for _, connection in pairs(getconnections(remote.OnClientEvent)) do
		connection:Disable();
	end
	for _, connection in pairs(getconnections(remote2.OnClientEvent)) do
		connection:Disable();
	end
	local oldNamecall;
	oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
		local method = getnamecallmethod();
		local args = {...};
		if (not checkcaller() and (method == "FireServer")) then
			if (self == remote2) then
				return;
			end
		end
		return oldNamecall(self, unpack(args));
	end);
	game:GetService("Players").LocalPlayer.PlayerGui.Main.Client.MainClient.Lopee.LopeePart.Name = " ";
end;
return luaobf_bundle['file'](...);
