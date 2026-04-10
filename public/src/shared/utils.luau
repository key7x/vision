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
luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\195\218\74\49", "\74\165\179\38\84\215\41")] = function(...)
	local var = 1;
end;
return luaobf_bundle[LUAOBFUSACTOR_DECRYPT_STR_0("\32\39\242\85", "\220\70\78\158\48\118")](...);
