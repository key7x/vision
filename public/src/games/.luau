local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local arg1 = ...;
local luaobf_bundle = {};
local _require = require;
local function require(path, ...)
	local FlatIdent_2584C = 0;
	local fn;
	while true do
		if (FlatIdent_2584C == 0) then
			fn = luaobf_bundle[path];
			if not fn then
				return _require(path, arg1, ...);
			end
			FlatIdent_2584C = 1;
		end
		if (FlatIdent_2584C == 1) then
			return fn(arg1, ...);
		end
	end
end
luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\215\214\129\41", "\223\177\191\237\76\225")] = function(...)
	local folder = workspace['GameplayFolder'];
	local rooms = folder['Rooms'];
	local char = game['Players']['LocalPlayer']['Character'];
	local p = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\102\200\178\46", "\219\54\169\192\90\48\80"));
	p['Parent'] = workspace;
	p['Anchored'] = true;
	p['CanCollide'] = true;
	p['Size'] = Vector3.new(5, 5, 5);
	local lock = true;
	char['ChildAdded']:Connect(function(child)
		if (child['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\110\78\9\33\76\80", "\69\41\34\96")) then
			while char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\155\207\222\14\7\57", "\75\220\163\183\106\98")) do
				local FlatIdent_10BCC = 0;
				while true do
					if (0 == FlatIdent_10BCC) then
						task.wait();
						char:PivotTo(folder['Characters']['Pipose01']:GetPivot());
						break;
					end
				end
			end
		end
	end);
	rooms['ChildAdded']:Connect(function(child)
		local FlatIdent_47A9C = 0;
		local orientation;
		local size;
		local topY;
		local pos;
		while true do
			if (FlatIdent_47A9C == 2) then
				orientation, size = child:GetBoundingBox();
				topY = orientation['Position']['Y'] + (size['Y'] / 2);
				FlatIdent_47A9C = 3;
			end
			if (FlatIdent_47A9C == 3) then
				pos = Vector3.new(orientation['Position'].X, topY + 85, orientation['Position'].Z);
				p['Position'] = Vector3.new(orientation['Position'].X, topY + 70, orientation['Position'].Z);
				FlatIdent_47A9C = 4;
			end
			if (FlatIdent_47A9C == 1) then
				if (child['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\36\179\153\50\206\3\182\135\18\215\6", "\185\98\218\235\87")) then
					local FlatIdent_6FA1 = 0;
					while true do
						if (FlatIdent_6FA1 == 1) then
							return;
						end
						if (0 == FlatIdent_6FA1) then
							p['Position'] = child:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\248\61\33\227\236\165\196\49\19\227\210\175\219\51\53\242", "\202\171\92\71\134\190"), math.huge)['Position'] - Vector3.new(0, 3.5, 0);
							while child:IsDescendantOf(workspace) do
								local FlatIdent_940A0 = 0;
								while true do
									if (FlatIdent_940A0 == 0) then
										task.wait();
										char:PivotTo(child:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\192\42\141\27\206\35\133\29\196\32\141\57\206\62\156", "\232\73\161\76"), math.huge).CFrame);
										break;
									end
								end
							end
							FlatIdent_6FA1 = 1;
						end
					end
				end
				if lock then
					return;
				end
				FlatIdent_47A9C = 2;
			end
			if (FlatIdent_47A9C == 0) then
				if not child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\150\214\70\88\18", "\126\219\185\34\61")) then
					return;
				end
				if (child['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\63\203\95\96\125\127\255\238\11\198\74\97\91\121\240\232\25\192\74\119\108", "\135\108\174\62\18\30\23\147")) then
					local FlatIdent_7DD24 = 0;
					while true do
						if (FlatIdent_7DD24 == 0) then
							while not workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\236\45\248\29\175\33\196\190\229\35\204\16\186\32\232\163\253\56\196", "\167\214\137\74\171\120\206\83")) do
								local FlatIdent_781F8 = 0;
								while true do
									if (FlatIdent_781F8 == 0) then
										task.wait();
										char:PivotTo(child:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\174\232\59\73\204\162\135\245\34\82\234\179", "\199\235\144\82\61\152"), math.huge).CFrame);
										break;
									end
								end
							end
							return;
						end
					end
				end
				FlatIdent_47A9C = 1;
			end
			if (FlatIdent_47A9C == 4) then
				char:PivotTo(CFrame.new(pos));
				break;
			end
		end
	end);
	local remote = game['ReplicatedStorage']['Events']['LocalEntityReplicate'];
	local remote2 = game['ReplicatedStorage']['Events']['LocalDamage'];
	for _, connection in pairs(getconnections(remote.OnClientEvent)) do
		connection:Disable();
	end
	for _, connection in pairs(getconnections(remote2.OnClientEvent)) do
		connection:Disable();
	end
	local oldNamecall;
	oldNamecall = hookmetamethod(game, LUAOBFUSACTOR_DECRYPT_STR_0("\56\41\183\42\10\19\186\42\11\26", "\75\103\118\217"), function(self, ...)
		local FlatIdent_946F = 0;
		local method;
		local args;
		while true do
			if (FlatIdent_946F == 0) then
				method = getnamecallmethod();
				args = {...};
				FlatIdent_946F = 1;
			end
			if (FlatIdent_946F == 1) then
				if (not checkcaller() and (method == LUAOBFUSACTOR_DECRYPT_STR_0("\225\93\98\17\138\27\213\66\117\6", "\126\167\52\16\116\217"))) then
					if (self == remote2) then
						return;
					end
				end
				return oldNamecall(self, unpack(args));
			end
		end
	end);
	game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\248\34\33\153\177\11\239", "\156\168\78\64\224\212\121"))['LocalPlayer']['PlayerGui']['Main']['Client']['MainClient']['Lopee']['LopeePart']['Name'] = " ";
end;
return luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\1\231\169\203", "\174\103\142\197")](...);
