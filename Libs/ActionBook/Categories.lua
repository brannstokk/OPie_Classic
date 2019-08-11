local _, T = ...
if T.SkipLocalActionBook then return end
local AB, mark = assert(T.ActionBook:compatible(2, 21), "A compatible version of ActionBook is required"), {}
local RW = assert(T.ActionBook:compatible("Rewire", 1, 10), "A compatible version of Rewire is required")
local L = AB:locale()

local function icmp(a,b)
	return strcmputf8i(a,b) < 1
end

do -- spellbook
	local function addEntry(add, at, _ok, st, sid)
		if st == "SPELL" and not IsPassiveSpell(sid) and not mark[sid] then
			mark[sid] = 1
			add(at, sid)
		elseif st == "FLYOUT" then
			for j=1,select(3,GetFlyoutInfo(sid)) do
				local asid, _osid, ik = GetFlyoutSlotInfo(sid, j)
				if ik then
					addEntry(add, at, true, "SPELL", asid)
				end
			end
		end
	end
	AB:AugmentCategory(L"Abilities", function(_, add)
		wipe(mark)
		if UnitLevel("player") >= 90 and GetExpansionLevel() >= 5 then
			add("spell", 161691)
		end
		for i=1,GetNumSpellTabs()+12 do
			local _, _, ofs, c, _, sid = GetSpellTabInfo(i)
			for j=ofs+1,sid == 0 and (ofs+c) or 0 do
				addEntry(add, "spell", pcall(GetSpellBookItemInfo, j, "spell"))
			end
		end
		wipe(mark)
		-- for i=1,4 do
		-- 	local id = C_SpecializationInfo.GetPvpTalentSlotInfo(i)
		-- 	id = id and id.selectedTalentID
		-- 	if id then
		-- 		local sid = select(6, GetPvpTalentInfoByID(id))
		-- 		if sid and not IsPassiveSpell(sid) then
		-- 			add("spell", sid)
		-- 		end
		-- 	end
		-- end
	end)
end
AB:AugmentCategory(L"Items", function(_, add)
	wipe(mark)
	for t=0,1 do
		t = t == 0 and GetItemSpell or IsEquippableItem
		for bag=0,4 do
			for slot=1,GetContainerNumSlots(bag) do
				local iid = GetContainerItemID(bag, slot)
				if iid and not mark[iid] and t(iid) then
					add("item", iid)
					mark[iid] = 1
				end
			end
		end
		for slot=INVSLOT_FIRST_EQUIPPED, INVSLOT_LAST_EQUIPPED do
			local iid = GetInventoryItemID("player", slot)
			if iid and not mark[iid] and t(iid) then
				add("item", iid)
				mark[iid] = 1
			end
		end
	end
end)
-- AB:AugmentCategory(L"Mounts", function(_, add)
-- 	if GetSpellInfo(150544) then add("spell", 150544) end
-- 	local myFactionId = UnitFactionGroup("player") == "Horde" and 0 or 1
-- 	--local idm, i2, i2n = C_MountJournal.GetMountIDs(), {}, {}
-- 	local idm = {}
-- 	for i=1, #idm do
-- 		local mid = idm[i]
-- 		local name, sid, _3, _4, _5, _6, _7, factionLocked, factionId, hide, have = C_MountJournal.GetMountInfoByID(mid)
-- 		if have and not hide
-- 		   and (not factionLocked or factionId == myFactionId)
-- 		   and RW:IsSpellCastable(sid)
-- 		   then
-- 			i2[#i2+1], i2n[mid] = mid, name
-- 		end
-- 	end
-- 	table.sort(i2, function(a,b) return i2n[a] < i2n[b] end)
-- 	for i=1,#i2 do
-- 		add("mount", i2[i])
-- 	end
-- end)
AB:AugmentCategory(L"Macros", function(_, add)
	add("macrotext", "")
	local n, ni = {}, 1
	for name in RW:GetNamedMacros() do
		n[ni], ni = name, ni + 1
	end
	table.sort(n, icmp)
	for i=1,#n do
		add("macro", n[i])
	end
end)
AB:AugmentCategory(L"Raid markers", function(_, add)
	for k=0,1 do
		k = k == 0 and "raidmark"
		for i=0,8 do
			add(k, i)
		end
	end
end)
do -- misc
	AB:AddActionToCategory(L"Miscellaneous", "macrotext", "")
end
do -- aliases
	AB:AddCategoryAlias("Miscellaneous", L"Miscellaneous")
end