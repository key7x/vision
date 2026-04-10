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
luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\191\238\0\88", "\61\217\135\108")] = function(...)
	local places = {[LUAOBFUSACTOR_DECRYPT_STR_0("\94\81\85\209\142", "\62\18\30\23\147\215\167")]=7939820001,[LUAOBFUSACTOR_DECRYPT_STR_0("\4\230", "\137\74\171\120\206\83\147\199")]=8505066428,[LUAOBFUSACTOR_DECRYPT_STR_0("\22\120\192\78\5\40\36\221\19\113", "\144\82\61\152\17\75\103\118")]=8535803544,[LUAOBFUSACTOR_DECRYPT_STR_0("\58\226\108\79\58\144\255\60\42\234\117\66\49", "\116\126\167\52\16\116\217\184")]=8535803845};
	local utils = nil;
	local IS = function(n)
		if (game['PlaceId'] == places[n]) then
			return true;
		end
	end;
	local DEL = function(p, obj)
		if p:FindFirstChild(obj) then
			p:FindFirstChild(obj):Destroy();
		end
	end;
	local PROMPT_BROKEN_EXEC = false;
	if (identifyexecutor():lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\61\47\140\181\11\67", "\168\78\64\224\212\121\34")) or identifyexecutor():lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\246\160\243\247", "\103\142\197\157\152\54\72"))) then
		PROMPT_BROKEN_EXEC = true;
	end
	local PROMPT = function(prompt, location, condition, keepRoot, off)
		local FlatIdent_2BD95 = 0;
		local root;
		while true do
			if (FlatIdent_2BD95 == 1) then
				prompt['Exclusivity'] = Enum['ProximityPromptExclusivity']['AlwaysShow'];
				repeat
					local FlatIdent_60EA1 = 0;
					while true do
						if (FlatIdent_60EA1 == 1) then
							fireproximityprompt(prompt, 0);
							task.wait();
							break;
						end
						if (FlatIdent_60EA1 == 0) then
							if keepRoot then
								root['CFrame'] = keepRoot:GetPivot() + (off or Vector3['zero']);
							elseif location then
								root['CFrame'] = location;
							end
							if PROMPT_BROKEN_EXEC then
								workspace['CurrentCamera']['CFrame'] = CFrame.lookAt(workspace['CurrentCamera']['CFrame'].Position, (location and location['Position']) or keepRoot:GetPivot()['Position']);
							end
							FlatIdent_60EA1 = 1;
						end
					end
				until not prompt:IsDescendantOf(workspace) or (condition and condition()) 
				break;
			end
			if (FlatIdent_2BD95 == 0) then
				root = game['Players']['LocalPlayer']['Character']:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\13\75\72\93\54\42\87\65\110\55\42\74\117\93\42\49", "\88\69\62\37\60"));
				prompt['HoldDuration'] = 0;
				FlatIdent_2BD95 = 1;
			end
		end
	end;
	local plr = game['Players']['LocalPlayer'];
	local char = plr['Character'];
	local backpack = plr['Backpack'];
	local humanoid = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\198\210\31\89\80\10\205\234", "\164\142\167\114\56\62\101"));
	local root = char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\197\80\201\185\41\226\76\192\138\40\226\81\244\185\53\249", "\71\141\37\164\216"));
	if (IS(LUAOBFUSACTOR_DECRYPT_STR_0("\217\46\234\217\31\244\207\38\243\202", "\187\157\107\178\134\81")) or IS(LUAOBFUSACTOR_DECRYPT_STR_0("\218\9\146\7\32\171\225\142\202\1\139\10\43", "\198\158\76\202\88\110\226\166"))) then
		for _, v in workspace['Collections']:GetChildren() do
			if v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\29\141\239\195\206\6\150\238\250\209\0\143\231\222", "\170\163\111\226\151")) then
				PROMPT(v.ProximityPrompt, v.CFrame);
			end
		end
		local events = workspace['Events'];
		local function placeToCauldron(itemName, layer2Name)
			local FlatIdent_31905 = 0;
			local item;
			local layer2;
			local child;
			local t;
			while true do
				if (FlatIdent_31905 == 1) then
					layer2 = events['Cauldron']['Layer2']:FindFirstChild(layer2Name or itemName);
					if (not item or not layer2) then
						local FlatIdent_455BF = 0;
						while true do
							if (FlatIdent_455BF == 0) then
								print(LUAOBFUSACTOR_DECRYPT_STR_0("\24\36\183\53\14\56\59\81\60\179\33\75\37\105\67\112\191\49\93\36\32\31\55", "\73\113\80\210\88\46\87"));
								return;
							end
						end
					end
					FlatIdent_31905 = 2;
				end
				if (FlatIdent_31905 == 2) then
					child = #backpack:GetChildren();
					PROMPT(item.ProximityPrompt, item.CFrame, function()
						return #backpack:GetChildren() ~= child;
					end);
					FlatIdent_31905 = 3;
				end
				if (FlatIdent_31905 == 4) then
					PROMPT(layer2, events['Cauldron']:GetPivot(), function()
						local FlatIdent_2FD19 = 0;
						while true do
							if (FlatIdent_2FD19 == 0) then
								if ((os.time() - t) > 0.135) then
									local FlatIdent_79536 = 0;
									while true do
										if (FlatIdent_79536 == 0) then
											print(LUAOBFUSACTOR_DECRYPT_STR_0("\145\62\194\30\235\152\108\201\27\227\193\34\194\6\167\145\37\206\25\167\148\60\141\6\239\132\108\196\6\226\140\108\206\29\245\147\41\206\6\235\152", "\135\225\76\173\114"));
											child = #backpack:GetChildren();
											FlatIdent_79536 = 1;
										end
										if (FlatIdent_79536 == 1) then
											PROMPT(item.ProximityPrompt, item.CFrame, function()
												return #backpack:GetChildren() ~= child;
											end);
											t = os.time();
											break;
										end
									end
								end
								return not item:IsDescendantOf(workspace);
							end
						end
					end);
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\30\226\182\181\236\188\171\22", "\199\122\141\216\208\204\221"));
					break;
				end
				if (FlatIdent_31905 == 3) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\172\212\23\248\108\182\164\157\4\248\113\248\166\157\25\176\104\255\174\214\21\244\56\227\189\157\4\248\125\182\164\201\21\253", "\150\205\189\112\144\24"));
					t = os.time();
					FlatIdent_31905 = 4;
				end
				if (0 == FlatIdent_31905) then
					print(itemName, layer2Name);
					item = events:FindFirstChild(itemName);
					FlatIdent_31905 = 1;
				end
			end
		end
		placeToCauldron(LUAOBFUSACTOR_DECRYPT_STR_0("\18\133\171\73\22\200\19\31\49\144\179\73\68", "\112\69\228\223\44\100\232\113"), LUAOBFUSACTOR_DECRYPT_STR_0("\227\30\19\214\164", "\230\180\127\103\179\214\28"));
		placeToCauldron(LUAOBFUSACTOR_DECRYPT_STR_0("\190\10\76\67", "\128\236\101\63\38\132\33"));
		placeToCauldron(LUAOBFUSACTOR_DECRYPT_STR_0("\137\174\22", "\175\204\201\113\36\214\139"));
		placeToCauldron(LUAOBFUSACTOR_DECRYPT_STR_0("\96\222\52\207\23", "\100\39\172\85\188"));
		local currentAmount = #backpack:GetChildren();
		PROMPT(workspace['Events']['Final'].ProximityPrompt, workspace['Events']['Final'].CFrame, function()
			return #backpack:GetChildren() ~= currentAmount;
		end);
		task.wait();
		PROMPT(workspace['Dexeliao']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\128\119\183\147\39\168\106", "\83\205\24\217\224"), true), nil, function()
			return not workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\194\192\213\56\234\204\204\50", "\93\134\165\173"));
		end, workspace.Dexeliao, Vector3.new(0, 5.5, 0));
	end
	if (IS(LUAOBFUSACTOR_DECRYPT_STR_0("\144\223", "\30\222\146\161\162\90\174\210")) or IS(LUAOBFUSACTOR_DECRYPT_STR_0("\201\97\82\40\220", "\106\133\46\16"))) then
		if IS(LUAOBFUSACTOR_DECRYPT_STR_0("\118\13", "\32\56\64\19\156\58")) then
			local FlatIdent_17196 = 0;
			while true do
				if (FlatIdent_17196 == 1) then
					DEL(game.ReplicatedStorage, LUAOBFUSACTOR_DECRYPT_STR_0("\112\221\232\70\73\241\129\72\205\183", "\224\58\168\133\54\58\146"));
					break;
				end
				if (FlatIdent_17196 == 0) then
					for _, v in pairs(workspace:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\120\127\4\205\116\146\143", "\107\57\54\43\157\21\230\231")):GetDescendants()) do
						if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\239\132\4\246\177\232\221\218\133\2\248\176\200\219\222\153", "\175\187\235\113\149\217\188")) then
							v:Destroy();
						end
					end
					DEL(game.ReplicatedStorage, LUAOBFUSACTOR_DECRYPT_STR_0("\22\186\140\92\240\122\121\46\170", "\24\92\207\225\44\131\25"));
					FlatIdent_17196 = 1;
				end
			end
		end
		local gameFolder = workspace['Game'];
		local objective = gameFolder['Objective'];
		for _, v in objective['Orbs']:GetChildren() do
			if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\102\220\188\73\23", "\29\43\179\216\44\123")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\159\216\51\73\141\216\50\88", "\44\221\185\64"))) then
				PROMPT(v:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\49\245\71\71\122\12\238\92\70\67\19\232\69\79\103", "\19\97\135\40\63"), true), (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\131\83\55\62\35", "\81\206\60\83\91\79")) and v:GetPivot()) or v['CFrame']);
			end
		end
		for _, v in objective:GetChildren() do
			if (v['Name'] == LUAOBFUSACTOR_DECRYPT_STR_0("\125\160\197\126\35\229\66\168\74\174\194", "\196\46\203\176\18\79\163\45")) then
				local FlatIdent_5BA5E = 0;
				local placePrompt;
				while true do
					if (FlatIdent_5BA5E == 0) then
						placePrompt = v['SkullPlace']:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\136\48\113\6\45\246\230\172\59\78\12\43\246\255\172", "\143\216\66\30\126\68\155"));
						if (placePrompt and placePrompt['Enabled']) then
							local FlatIdent_74348 = 0;
							local skull;
							local skullName;
							while true do
								if (FlatIdent_74348 == 1) then
									PROMPT(skull.ProximityPrompt, skull.CFrame, function()
										return backpack:FindFirstChild(skullName);
									end);
									humanoid:EquipTool(backpack:FindFirstChild(skullName));
									FlatIdent_74348 = 2;
								end
								if (FlatIdent_74348 == 0) then
									skull = v['Skull']['Skull'];
									skullName = skull['ProximityPrompt']['ObjectText'];
									FlatIdent_74348 = 1;
								end
								if (2 == FlatIdent_74348) then
									PROMPT(placePrompt, v['SkullPlace'].CFrame, function()
										local FlatIdent_817B0 = 0;
										local isDone;
										while true do
											if (FlatIdent_817B0 == 0) then
												isDone = not (placePrompt['Enabled'] and placePrompt:IsDescendantOf(workspace));
												return isDone;
											end
										end
									end);
									break;
								end
							end
						end
						break;
					end
				end
			end
		end
		if IS(LUAOBFUSACTOR_DECRYPT_STR_0("\132\229", "\129\202\168\109\171\165\195\183")) then
			local FlatIdent_52551 = 0;
			local womansLantern;
			while true do
				if (FlatIdent_52551 == 0) then
					task.wait(1);
					womansLantern = gameFolder['Event']:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\15\87\51\221\210", "\134\66\56\87\184\190\116"));
					FlatIdent_52551 = 1;
				end
				if (FlatIdent_52551 == 1) then
					if womansLantern then
						local FlatIdent_2D88C = 0;
						local t;
						while true do
							if (FlatIdent_2D88C == 0) then
								t = os.time();
								PROMPT(womansLantern:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\35\6\163\16\230\40\33\37\1\27\180\20\251\53", "\85\92\81\105\219\121\139\65"), true), womansLantern:GetPivot(), function()
									return (os.time() - t) > 1;
								end, womansLantern);
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
end;
return luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\251\186\92\64", "\191\157\211\48\37\28")](...);
