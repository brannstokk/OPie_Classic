local _, T = ...
local L, R = T.L, OneRingLib and OneRingLib.ext and OneRingLib.ext.RingKeeper
if not (R and R.SetRing) then return end

R:SetRing("DruidShift", {
	{id="/cancelform [noform:moonkin]\n/cast [outdoors,nocombat,noswimming,nomod] {{spell:783}}; [outpost:corral,nomod,nospec:103/104] {{spell:161691}}; [swimming,nomod][nomod] {{spell:783}}; [nocombat,outdoors,nomod:alt] {{mount:ground}}; [outdoors] {{spell:783}}", show="[known:783]", _u="f"}, -- Travel
	{c="c74cff", id=24858, _u="k"}, -- Moonkin
	{c="fff04d", id=768, _u="c"}, -- Cat
	{c="ff0000", id=5487, _u="b"}, -- Bear
	name=L"Shapeshifts", hotkey="PRIMARY", limit="DRUID", _u="OPCDS"
})
R:SetRing("DruidUtility", {
	{id="/cast [combat][mod,nomod:alt] {{spell:20484}}; [@target,nodead,group,nomod] {{spell:212040}}; {{spell:50769}}", _u="r"}, -- rebirth/revit/revive
	{id="/cast [mod] {{spell:16914}}; {{spell:740/16914}}", _u="t"}, -- hurricane/tranq
	{id="/cast [nomod] {{spell:22812}}; {{spell:61336/22812}}", _u="b"}, -- bark/survival
	{id="/cast {{spell:33891/102560}}", _u="i"}, -- Incarnation
	{id="/cast [mod][+cleanse] {{spell:88423/2782}}; {{spell:18960/193753}}", _u="p"}, -- moonglade/cleanse
	{id=29166, _u="v"}, -- innervate
	name=L"Utility", hotkey="[noform:bear/cat] SECONDARY; ALT-SECONDARY", limit="DRUID", _u="OPCDU"
})
R:SetRing("DruidFeral", {
	{id=106951, _u="k"}, -- berserk
	{id="/cast [noform:bear] {{spell:5217}}; {{spell:22842}}", _u="e"}, -- frenzied / tiger's fury
	{id="/cast [mod][nospec:2/3] {{spell:1850}}; [form:bear] {{spell:77761}}; {{spell:77764}}", _u="r"}, -- dash / stampeding roar
	{id=106839, _u="s"}, -- skull bash
	{id=22812, _u="b"}, -- barkskin
	{id=61336, _u="i"}, -- survival instincts
	{id=102401, _u="c"}, -- feral charge
	{id="/cast {{spell:102543/102558}}", _u="n"}, -- Incarnation
	{id="/cast [nomod,@player][mod,@none] {{spell:8936}}", show="[spec:102/104/105] hide;", _u="h"}, -- Regrowth
	name=L"Feral", hotkey="[form:bear/cat] SECONDARY; ALT-SECONDARY", limit="DRUID", _u="OPCDF"
})

do -- Hunter Pets
	local m = "#showtooltip [@pet,exists,nodead,nopet:%d] {{spell:%d}};\n/cast [@pet,exists,nopet:%1$d,nodead] {{spell:2641}}\n/cast [@pet,noexists,nomod] {{spell:%2$d}}; [@pet,dead][@pet,noexists] {{spell:982}}; [@pet,help,nomod] {{spell:136}}; [@pet] {{spell:2641}}"
	R:SetRing("HunterPets", {
		{id=m:format(1,883), show="[known:883,havepet:1]", _u="1"},
		{id=m:format(2,83242), show="[known:83242,havepet:2]", _u="2"},
		{id=m:format(3,83243), show="[known:83243,havepet:3]", _u="3"},
		{id=m:format(4,83244), show="[known:83244,havepet:4]", _u="4"},
		{id=m:format(5,83245), show="[known:83245,havepet:5]", _u="5"},
		name=L"Pets", limit="HUNTER", _u="OPCHP", internal=true
	})
end
R:SetRing("HunterAspects", {
	{id=186257, _u="c"}, -- cheetah
	{id=781, _u="d"}, -- disengage
	{id=5384, _u="g"}, -- feign
	{"ring", "HunterPets", onlyNonEmpty=true, _u="e", show="[nospec:2][notalent:15.1]"},
	{id=147362, _u="i"}, -- counter
	name=L"Aspects", hotkey="PRIMARY", limit="HUNTER", _u="OPCHA"
})
R:SetRing("HunterTraps", {
	{id=191433, _u="e"}, -- explosive
	{id=187650, _u="f"}, -- freezing
	{id=187698, _u="t"}, -- tar/caltrops
	name=L"Traps", hotkey="[spec:3] SECONDARY", limit="HUNTER", _u="OPCHT"
})

R:SetRing("MageCombat", {
	{id=45438, _u="b"}, -- ice block
	{id=30449, _u="s"}, -- spellsteal
	{id=55342, _u="m"}, -- mirror image
	{id=12051, _u="e"}, -- evocation
	{id=12042, _u="a"}, -- arcane power
	{id=80353, _u="t"}, -- time warp
	{id=11426, _u="i"}, -- ice barrier
	{id=190319, _u="c"}, -- combustion
	name=L"Combat", limit="MAGE", hotkey="PRIMARY", _u="OPCMC"
})
R:SetRing("MageTools", {
	{id=42955, _u="f"}, -- food
	{id=66, _u="i"}, -- (greater) invisibility
	{"ring", "MagePolymorph", onlyNonEmpty=true, _u="t"},
	{id=130, _u="s"}, -- slow fall
	{id=1459, _u="n"}, -- intellect
	name=L"Utility", limit="MAGE", hotkey="SECONDARY", _u="OPCMT"
})
R:SetRing("MagePolymorph", {
  {id=118, _u="s"}, -- sheep
  {id=12824, _u="s"}, -- sheep r2
  {id=12825, _u="s"}, -- sheep r3
  {id=12826, _u="s"}, -- sheep r4
	{id=28271, _u="u"}, -- turtle
	{id=28272, _u="i"}, -- pig
	{id=28270, _u="m"}, -- cow

	name=L"Polymorphs", limit="MAGE", _u="OPCMP", internal=true
})
do -- MageTravel
	local m = "/cast [mod] {{spell:%s}}; {{spell:%s}}"
	R:SetRing("MageTravel", {
		{id=m:format(10059, 3561), _u="w"}, -- Stormwind
		{id=m:format(11419, 3565), _u="d"}, -- Darnassus
		{id=m:format(11420, 3566), _u="t"}, -- Thunder Bluff
		{id=m:format(11418, 3563), _u="u"}, -- Undercity
		{id=m:format(11416, 3562), _u="i"}, -- Ironforge
		{id=m:format(11417, 3567), _u="o"}, -- Orgrimmar
	  name=L"Portals and Teleports", hotkey="ALT-G", limit="MAGE", _u="OPCMP"
	})
end

R:SetRing("PaladinAuras", {
	{"ring", "PaladinBlessing", onlyNonEmpty=true, _u="b"},
	{id=1022, _u="t"}, -- hand of protection
	{id=1044, _u="e"}, -- hand of freedom
	{id=25780, _u="f"}, -- righteous fury
	name=L"Paladin Buffs", hotkey="PRIMARY", limit="PALADIN", _u="OPCPA"
})
R:SetRing("PaladinBlessing", {
	{id=203538, _u="k"}, -- kings
	{id=203539, _u="w"}, -- wisdom
	name=L"Blessings", limit="PALADIN", internal=true, _u="OPCPB"
})
R:SetRing("PaladinTools", {
	{id=853, _u="h"}, -- hammer
	{c="ed8f1b", id=498, _u="p"}, -- divine protection
	{id=31884, _u="a"}, -- avenging wrath
	{id=62124, _u="r"}, -- hand of reckoning
	{id=26573, _u="c"}, -- consecration
	{id=183218, _u="i"}, -- hand of hindrance
	{id=213644, _c="l"}, -- cleanse
	name=L"Utility", limit="PALADIN", hotkey="SECONDARY", _u="OPCPT"
})
R:SetRing("WarlockLTS", {
	{"ring", "WarlockDemons", _u="d"},
	{id="/cast [mod][noknown:119898] {{spell:755}}; {{spell:119898}}", _u="a"}, -- funnel/command
	{id="/cast [mod:alt] {{spell:20707}}; [group,nomod][nogroup,mod] {{spell:29893}}; {{spell:6201}}", _u="h"}, -- soul/health/well
	{id=111771, _u="w"}, -- gateway
	{"ring", "WarlockGuardians", _u="g"},
	{id="/cast [flyable,nocombat,nomod] {{mount:air}}; [outdoors,nocombat,nomod:alt] {{mount:ground}}; {{spell:126}}", _u="e"}, -- mount/eye
	name=L"Warlock General", hotkey="PRIMARY", limit="WARLOCK", _u="OPCLS"
})
R:SetRing("WarlockCombat", {
	{id="/cast [nomod] {{spell:48018}}; {{spell:48020}}", _u="t"}, -- demonic circle
	{id=1098, _u="e"}, -- enslave
	{id=710, _u="a"}, -- banish
	{id="/cast {{spell:111400}}; {{spell:111397}}; {{spell:108482}}", _u="m"}, -- tier 4 talents [combat-ish]
	{id=5782, _u="f"}, -- fear
	{id=5484, _u="h"}, -- howl
	name=L"Warlock Combat", hotkey="SECONDARY", limit="WARLOCK", _u="OPCLO"
})
R:SetRing("WarlockDemons", {
	{id=30146, _u="f"}, -- felguard
	{id=697, _u="v"}, -- void
	{id=688, _u="i"}, -- imp
	{id=712, _u="s"}, -- succubus
	{id=691, _u="h"}, -- felhunter
	name=L"Demons", limit="WARLOCK", _u="OPCLD", internal=true
})
R:SetRing("WarlockGuardians", {
	{id=18540, _u="d"}, -- doomguard
	{id=1122, _u="i"}, -- infernal
	name=L"Guardians", limit="WARLOCK", _u="OPCLG", internal=true
})

R:SetRing("CommonTrades", {
	{id="/cast {{spell:3908/51309}}", _u="t"}, -- tailoring
	{id="/cast {{spell:2108/51302}}", _u="l"}, -- leatherworking
	{id="/cast {{spell:2018/51300}}", _u="b"}, -- blacksmithing
	{id="/cast [mod] {{spell:31252}}; {{spell:25229/51311}};", _u="j"}, -- jewelcrafting/prospecting
	{id="/cast [mod] {{spell:13262}}; {{spell:7411/51313}}", _u="e"}, -- enchanting/disenchanting
	{id="/cast {{spell:2259/51304}}", _u="a"}, -- alchemy
	{id="/cast [mod] {{spell:818}}; {{spell:2550/51296}}", _u="c"}, -- cooking/campfire
	{id="/cast [mod] {{spell:51005}}; {{spell:45357/45363}}", _u="i"}, -- inscription/milling
	{id="/cast {{spell:4036/51306}}", _u="g"}, -- engineering
	{id="/cast [mod] {{spell:80451}}; {{spell:78670/89722}}", _u="r"},
	{id=53428, _u="u"}, -- runeforging
	{id=2656, _u="m"}, -- smelting
	name=L"Trade Skills", hotkey="ALT-T", _u="OPCCT"
})
R:SetRing("RaidSymbols", {
	{"raidmark", 1, _u="y"}, -- yellow star
	{"raidmark", 2, _u="o"}, -- orange circle
	{"raidmark", 3, _u="p"}, -- purple diamond
	{"raidmark", 4, _u="g"}, -- green triangle
	{"raidmark", 5, _u="s"}, -- silver moon
	{"raidmark", 6, _u="b"}, -- blue square
	{"raidmark", 7, _u="r"}, -- red cross
	{"raidmark", 8, _u="w"}, -- white skull
	{"raidmark", 0, _u="c"}, -- clear all
	name=L"Target Markers", hotkey="ALT-R", _u="OPCRS"
})
