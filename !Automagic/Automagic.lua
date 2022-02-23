local gr, fl, aq, su, pa, hs, co = {}, {}, {}, {}, {}, {}, {}
local throttled = {}


Automagic.PetIcons["DETHKNIGHT"] = {
	["Geist"] = 336781,
	["Ghoul"] = 1100170,
	["Skeleton"] = 136187,
}
Automagic.PetIcons["MAGE"] = {
	["Water Elemental"] = 135862,
}
Automagic.PetIcons["MONK"] = {
	["Chi-Ji"] = 877514,
	["Niuzao"] = 627607,
	["Xuen"] = 620832,
	["Yu'lon"] = 877408,
}
Automagic.PetIcons["SHAMAN"] = {
	["Greater Earth Elemental"] = 136024,
	["Greater Fire Elemental"] = 135790,
	["Greater Storm Elemental"] = 2065626,
	["Primal Earth Elemental"] = 136024,
	["Primal Fire Elemental"] = 651081,
	["Primal Storm Elemental"] = 2065626,
}


local frame = CreateFrame("FRAME", "AutomagicFrame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("BAG_UPDATE")
frame:RegisterEvent("PET_STABLE_CLOSED")
frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("LEARNED_SPELL_IN_TAB")
frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")


-- Outdoor zones where flying is disabled
local groundAreas = {
	-- Kalimdor
	["Ammen Vale"] = true,
	["Azuremyst Isle"] = true,
	["Bloodmyst Isle"] = true,
	["The Exodar"] = true,
	-- Eastern Kingdoms
	["Sunstrider Isle"] = true,
	["Eversong Woods"] = true,
	["Ghostlands"] = true,
	["Silvermoon City"] = true,
	["Isle of Quel'Danas"] = true,
	-- Darkmoon Faire
	["Darkmoon Faire"] = true,
	["Darkmoon Island"] = true,
	-- Cataclysm
	["Tol Barad Peninsula"] = true,
	["Tol Barad"] = true,
	["Molten Front"] = true,
	-- Pandaria
	["Isle of Thunder"] = true,
	["Mogu Island Daily Area"] = true, -- Isle of Thunder
	["Isle of Giants"] = true,
	["Timeless Isle"] = true,
	-- Draenor
	["Tanaan Jungle Intro"] = true,
	-- Broken Isles
	["Helheim"] = true,
	["Niskara"] = true,
	-- Order Halls
	["The Maelstrom"] = true,
	["Mardum, the Shattered Abyss"] = true,
	["Skyhold"] = true,
	["The Wandering Isle"] = true,
	["Dreadscar Rift"] = true,
	["Emerald Dreamway"] = true,
	["Malorne's Nightmare"] = true, -- Druid Emerald Dream Scenario
	["Artifact - The Vortex Pinnacle - Shaman Order Hall"] = true, -- Shaman Skywall Scenario
	["Firelands_Artifact"] = true, -- Shaman Firelands Scenario
	["Death Knight Campaign - Scarlet Monastery"] = true, -- Death Knight Scarlet Monastery Scenario
	-- Argus
	["Krokuun"] = true,
	["Antoran Wastes"] = true,
	["Mac'Aree"] = true, -- Removed in 9.1.5 but still used in API in some places
	["Eredath"] = true,
	["Invasion Points"] = true,
	-- Battle for Azeroth
	["8.1 Darkshore Alliance Quests"] = true, -- Darkshore Unlock Scenario
	["8.1 Darkshore Horde Quests"] = true, -- Darkshore Unlock Scenario
	["Mechagon City"] = true,
	["The Great Sea Horde"] = true, -- Horde War Campaign Scenario
	["Crapapolis"] = true, -- Goblin Heritage
	["Crapapolis - Scenario"] = true,
	["Vale of Eternal Twilight"] = true, -- Vision of N'Zoth
	["Vision of the Twisting Sands"] = true, -- Vision of N'Zoth
	-- Shadowlands
	["Shadowlands"] = true,
	["Oribos"] = true,
	["Maldraxxus Broker Islands"] = true, -- Shattered Grove
	["The Maw"] = true,
	["Korthia"] = true,
	["Caverns of Contemplation"] = true, -- Korthia
	["Torghast"] = true,
	["Font of Fealty"] = true, -- Chains of Domination Campaign Scenario
}

-- Garrisons Map IDs
local garrisonId = { [1152] = true, [1330] = true, [1153] = true, [1158] = true, [1331] = true, [1159] = true, }


local function bags(item)
	return GetItemCount(item, false, true) or 0
end


local function macro(name, text, icon)
	if not icon then
		icon = "INV_MISC_QUESTIONMARK"
	end

	EditMacro(string.format("G%03d", name), nil, icon, text, 1)
end

local function cmacro(name, text, icon)
	if not icon then
		icon = "INV_MISC_QUESTIONMARK"
	end

	EditMacro(string.format("C%02d", name), nil, icon, text, 1)
end


local function SetGlobalBinds()
	if not InCombatLockdown() then
		-- Fishing
		SetBindingSpell("CTRL-Z", "Fishing")

		-- Survey
		SetBindingSpell("CTRL-X", "Survey")

		-- Loot-A-Rang
		SetBindingMacro("§", "G001")
		SetBindingMacro("SHIFT-§", "G001")

		-- Belt
		SetBindingMacro("=", "G002")
		SetBindingMacro("NUMPADEQUALS", "G002")
		SetBindingMacro("SHIFT-0", "G002")
		SetBindingMacro("0", "G002")

		-- Cloak
		SetBindingMacro("+", "G003")
		SetBindingMacro("NUMPADDIVIDE", "G003")

		-- Gloves
		SetBindingMacro("NUMPADMULTIPLY", "G004")

		-- Tinker: Nitro Boosts
		SetBindingMacro("ALT-CTRL-SHIFT-N", "G005")

		-- Tinker: Goblin Glider
		SetBindingMacro("ALT-CTRL-SHIFT-G", "G006")

		-- Mount
		SetBindingMacro("BUTTON3", "G007")

		-- Aquatic Mount
		SetBindingMacro("SHIFT-BUTTON3", "G008")

		-- Gathering Mount
		SetBindingMacro("CTRL-BUTTON5", "G009")

		-- Passenger Mount
		SetBindingMacro("ALT-BUTTON5", "G010")

		-- Summon Favorite Companion
		SetBindingMacro("PAGEUP", "G011")

		-- Dismiss Companion
		SetBindingMacro("PAGEDOWN", "G012")

		-- Loot Spec 1
		SetBindingMacro("ALT-NUMPAD1", "G021")

		-- Loot Spec 2
		SetBindingMacro("ALT-NUMPAD2", "G022")

		-- Loot Spec 3
		SetBindingMacro("ALT-NUMPAD3", "G023")

		-- Loot Spec 4
		SetBindingMacro("ALT-NUMPAD4", "G024")

		-- Cancel Auras
		SetBindingMacro("SHIFT-BUTTON5", "G025")

		-- Zone Ability
		SetBindingMacro(".", "G031")

		-- Combat Ally
		SetBindingMacro("-", "G035")

		-- Autofollow
		SetBindingMacro("SHIFT-å", "G107")

		-- Reload
		SetBindingMacro("CTRL-SHIFT-PAGEDOWN", "G108")

		-- Open BugSack
		SetBindingMacro("END", "G109")

		-- Close BugSack
		SetBindingMacro("HOME", "G106")

		-- Toggle ZigiAuras Debug Mode
		SetBindingMacro("NUMPAD8", "G105")

		-- Volume Low
		SetBindingMacro("F11", "G110")

		-- Volume High
		SetBindingMacro("F12", "G111")

		-- Invite Guild Members
		SetBindingMacro("CTRL-SHIFT-NUMPADDIVIDE", "G112")

		-- Reset Instances
		SetBindingMacro("CTRL-SHIFT-HOME", "G113")

		-- Leave
		SetBindingMacro("CTRL-SHIFT-NUMPADMULTIPLY", "G114")

		-- Placer
		SetBindingMacro("CTRL-SHIFT-END", "G116")

		-- Wholly
		--SetBindingMacro("HOME", "G117")

		-- ATT Main
		--SetBindingMacro("PAGEDOWN", "G118")

		-- ATT Mini List
		--SetBindingMacro("PAGEUP", "G119")

		-- Camp
		SetBindingMacro("CTRL-SHIFT-PAGEUP", "G120")

		-------------------------------

		SetBinding("+", "MACRO G003")
		SetBinding(",", "EXTRAACTIONBUTTON1")
		SetBinding("-", "MACRO G035")
		SetBinding(".", "MACRO G031")
		SetBinding("0", "MACRO G002")
		SetBinding("SHIFT-0", "MACRO G002")
		SetBinding("8", "NONE")
		SetBinding("9", "NONE")
		SetBinding("<", "REPLY")
		SetBinding("=", "MACRO G002")
		SetBinding("ALT-BUTTON3", "CLICK BT4Button28:LeftButton")
		SetBinding("ALT-BUTTON4", "MACRO Mount Passenger")
		SetBinding("ALT-BUTTON5", "MACRO G010")
		SetBinding("ALT-C", "TOGGLECHARACTER0")
		SetBinding("ALT-CTRL-BUTTON3", "MACRO Mount Aquatic")
		SetBinding("ALT-CTRL-NUMPAD6", "MACRO G116")
		SetBinding("ALT-CTRL-NUMPAD8", "MACRO G113")
		SetBinding("ALT-CTRL-NUMPAD9", "MACRO G120")
		SetBinding("ALT-CTRL-NUMPADMULTIPLY", "MACRO Leave")
		SetBinding("ALT-CTRL-SHIFT--", "CLICK BindPadMacro:Flight Paths")
		SetBinding("ALT-CTRL-SHIFT-BUTTON3", "CLICK BindPadKey:MACRO Mount Aquatic")
		SetBinding("ALT-CTRL-SHIFT-G", "MACRO G006")
		SetBinding("ALT-CTRL-SHIFT-N", "MACRO G005")
		SetBinding("ALT-E", "CLICK BT4Button20:LeftButton")
		SetBinding("ALT-F", "CLICK BT4Button29:LeftButton")
		SetBinding("ALT-F10", "MACRO G022")
		SetBinding("ALT-F11", "MACRO G023")
		SetBinding("ALT-F12", "MACRO G024")
		SetBinding("ALT-F16", "MACRO Loot Spec 1")
		SetBinding("ALT-F17", "MACRO Loot Spec 2")
		SetBinding("ALT-F18", "MACRO Loot Spec 3")
		SetBinding("ALT-F19", "MACRO Loot Spec 4")
		SetBinding("ALT-F9", "MACRO G021")
		SetBinding("ALT-I", "TOGGLECHARACTER4")
		SetBinding("ALT-J", "TOGGLEGUILDTAB")
		SetBinding("ALT-N", "TOGGLETALENTS")
		SetBinding("ALT-NUMPAD1", "MACRO G021")
		SetBinding("ALT-NUMPAD2", "MACRO G022")
		SetBinding("ALT-NUMPAD3", "MACRO G023")
		SetBinding("ALT-NUMPAD4", "MACRO G024")
		SetBinding("ALT-NUMPAD5", "MACRO G012")
		SetBinding("ALT-NUMPAD6", "TOGGLEENCOUNTERJOURNAL")
		SetBinding("ALT-NUMPAD7", "TOGGLECOLLECTIONSPETJOURNAL")
		SetBinding("ALT-NUMPAD8", "TOGGLECOLLECTIONSTOYBOX")
		SetBinding("ALT-NUMPAD9", "TOGGLECOLLECTIONSWARDROBE")
		SetBinding("ALT-O", "CLICK BindPadMacro:Garrison")
		SetBinding("ALT-SPACE", "TOGGLEWORLDSTATESCORES")
		SetBinding("ALT-T", "CLICK BT4Button40:LeftButton")
		SetBinding("ALT-U", "NONE")
		SetBinding("ALT-X", "SITORSTAND")
		SetBinding("ALT-§", "CLICK BT4Button99:LeftButton")
		SetBinding("ALT-¨", "MACRO Mount Passenger")
		SetBinding("ALT-ö", "TOGGLEFPS")
		SetBinding("BUTTON3", "MACRO G007")
		SetBinding("BUTTON4", "NONE")
		SetBinding("BUTTON5", "TOGGLEAUTORUN")
		SetBinding("C", "CLICK BT4Button61:LeftButton")
		SetBinding("CTRL--", "NONE")
		SetBinding("CTRL-0", "NONE")
		SetBinding("CTRL-1", "NONE")
		SetBinding("CTRL-2", "NONE")
		SetBinding("CTRL-3", "NONE")
		SetBinding("CTRL-4", "NONE")
		SetBinding("CTRL-5", "NONE")
		SetBinding("CTRL-6", "NONE")
		SetBinding("CTRL-7", "NONE")
		SetBinding("CTRL-8", "NONE")
		SetBinding("CTRL-9", "NONE")
		SetBinding("CTRL-=", "NONE")
		SetBinding("CTRL-B", "SPELL Fishing")
		SetBinding("CTRL-BUTTON3", "CLICK BT4Button41:LeftButton")
		SetBinding("CTRL-BUTTON4", "MACRO Mount Gathering")
		SetBinding("CTRL-BUTTON5", "MACRO G009")
		SetBinding("CTRL-C", "CLICK BT4Button73:LeftButton")
		SetBinding("CTRL-E", "ACTIONBUTTON8")
		SetBinding("CTRL-F", "CLICK BT4Button30:LeftButton")
		SetBinding("CTRL-F1", "NONE")
		SetBinding("CTRL-F10", "NONE")
		SetBinding("CTRL-F2", "NONE")
		SetBinding("CTRL-F3", "NONE")
		SetBinding("CTRL-F4", "NONE")
		SetBinding("CTRL-F5", "NONE")
		SetBinding("CTRL-F6", "NONE")
		SetBinding("CTRL-F7", "ALLTHETHINGS_TOGGLEACCOUNTMODE")
		SetBinding("CTRL-F8", "NONE")
		SetBinding("CTRL-F9", "NONE")
		SetBinding("CTRL-H", "CLICK BT4Button74:LeftButton")
		SetBinding("CTRL-I", "NONE")
		SetBinding("CTRL-J", "CLICK BT4Button27:LeftButton")
		SetBinding("CTRL-M", "NONE")
		SetBinding("CTRL-N", "NONE")
		SetBinding("CTRL-PAGEDOWN", "NONE")
		SetBinding("CTRL-PAGEUP", "NONE")
		SetBinding("CTRL-Q", "CLICK BT4Button54:LeftButton")
		SetBinding("CTRL-R", "CLICK BT4Button17:LeftButton")
		SetBinding("CTRL-S", "NONE")
		SetBinding("CTRL-SHIFT-BUTTON3", "MACRO Mount Aquatic")
		SetBinding("CTRL-SHIFT-BUTTON4", "CLICK BindPadKey:MACRO Mount Passenger")
		SetBinding("CTRL-SHIFT-END", "MACRO G116")
		SetBinding("CTRL-SHIFT-F16", "MACRO Placer")
		SetBinding("CTRL-SHIFT-F18", "MACRO Reset Instances")
		SetBinding("CTRL-SHIFT-F19", "MACRO Camp")
		SetBinding("CTRL-SHIFT-HOME", "MACRO G113")
		SetBinding("CTRL-SHIFT-NUMPAD0", "CLICK BindPadMacro:Pull 0")
		SetBinding("CTRL-SHIFT-NUMPAD1", "CLICK BindPadMacro:Pull 10")
		SetBinding("CTRL-SHIFT-NUMPAD2", "CLICK BindPadMacro:Pull 12")
		SetBinding("CTRL-SHIFT-NUMPAD3", "CLICK BindPadMacro:Pull 3")
		SetBinding("CTRL-SHIFT-NUMPAD4", "CLICK BindPadMacro:Pull 15")
		SetBinding("CTRL-SHIFT-NUMPAD5", "CLICK BindPadMacro:Pull 5")
		SetBinding("CTRL-SHIFT-NUMPAD6", "CLICK BindPadMacro:Pull 30")
		SetBinding("CTRL-SHIFT-NUMPAD7", "CLICK BindPadMacro:Pull 7")
		SetBinding("CTRL-SHIFT-NUMPAD8", "CLICK BindPadMacro:Pull 20")
		SetBinding("CTRL-SHIFT-NUMPAD9", "CLICK BindPadMacro:Pull 60")
		SetBinding("CTRL-SHIFT-NUMPADDECIMAL", "CLICK BindPadMacro:Ready Check")
		SetBinding("CTRL-SHIFT-NUMPADDIVIDE", "MACRO G112")
		SetBinding("CTRL-SHIFT-NUMPADMULTIPLY", "MACRO G114")
		SetBinding("CTRL-SHIFT-PAGEDOWN", "MACRO G108")
		SetBinding("CTRL-SHIFT-PAGEUP", "MACRO G120")
		SetBinding("CTRL-SHIFT-SPACE", "INTERACTTARGET")
		SetBinding("CTRL-SPACE", "NONE")
		SetBinding("CTRL-T", "CLICK BT4Button39:LeftButton")
		SetBinding("CTRL-V", "CLICK BT4Button44:LeftButton")
		SetBinding("CTRL-X", "SPELL Survey")
		SetBinding("CTRL-Z", "SPELL Fishing")
		SetBinding("CTRL-¨", "MACRO Mount Gathering")
		SetBinding("DELETE", "NONE")
		SetBinding("DOWN", "NONE")
		SetBinding("E", "CLICK BT4Button64:LeftButton")
		SetBinding("END", "MACRO G109")
		SetBinding("F", "CLICK BT4Button32:LeftButton")
		SetBinding("F1", "CLICK BT4Button49:LeftButton")
		SetBinding("F10", "TOGGLESOUND")
		SetBinding("F11", "MACRO G110")
		SetBinding("F12", "MACRO G111")
		SetBinding("F14", "SPELL Revive Battle Pets")
		SetBinding("F15", "MACRO No Companion")
		SetBinding("F16", "MACRO Army")
		SetBinding("F17", "MACRO Wholly")
		SetBinding("F18", "MACRO Army")
		SetBinding("F2", "CLICK BT4Button50:LeftButton")
		SetBinding("F3", "CLICK BT4Button51:LeftButton")
		SetBinding("F4", "CLICK BT4Button52:LeftButton")
		SetBinding("F5", "CLICK BT4Button53:LeftButton")
		SetBinding("F6", "DEJUNK_TOGGLE_OPTIONS_FRAME")
		SetBinding("F7", "ALLTHETHINGS_TOGGLEMINILIST")
		SetBinding("F8", "TOGGLEMUSIC")
		SetBinding("F9", "NONE")
		SetBinding("G", "CLICK BT4Button65:LeftButton")
		SetBinding("H", "CLICK BT4Button18:LeftButton")
		SetBinding("HOME", "MACRO G106")
		SetBinding("I", "TOGGLEDUNGEONSANDRAIDS")
		SetBinding("INSERT", "NONE")
		SetBinding("J", "CLICK BT4Button25:LeftButton")
		SetBinding("L", "NONE")
		SetBinding("LEFT", "NONE")
		SetBinding("N", "CLICK BT4Button13:LeftButton")
		SetBinding("NUMLOCK", "NONE")
		SetBinding("NUMPAD0", "RAIDTARGET8")
		SetBinding("NUMPAD1", "RAIDTARGET7")
		SetBinding("NUMPAD2", "RAIDTARGET6")
		SetBinding("NUMPAD3", "RAIDTARGET5")
		SetBinding("NUMPAD4", "RAIDTARGET4")
		SetBinding("NUMPAD5", "RAIDTARGET3")
		SetBinding("NUMPAD6", "RAIDTARGET2")
		SetBinding("NUMPAD7", "RAIDTARGET1")
		SetBinding("NUMPAD8", "MACRO G105")
		SetBinding("NUMPAD9", "RAIDTARGETNONE")
		SetBinding("NUMPADDIVIDE", "MACRO G003")
		SetBinding("NUMPADEQUALS", "MACRO G002")
		SetBinding("NUMPADMINUS", "NAMEPLATES")
		SetBinding("NUMPADMULTIPLY", "MACRO G004")
		SetBinding("NUMPADPLUS", "FRIENDNAMEPLATES")
		SetBinding("PAGEDOWN", "MACRO G012")
		SetBinding("PAGEUP", "MACRO G011")
		SetBinding("PRINTSCREEN", "MACRO Companion")
		SetBinding("Q", "CLICK BT4Button63:LeftButton")
		SetBinding("R", "CLICK BT4Button15:LeftButton")
		SetBinding("RIGHT", "NONE")
		SetBinding("SHIFT-0", "MACRO G002")
		SetBinding("SHIFT-1", "NONE")
		SetBinding("SHIFT-2", "NONE")
		SetBinding("SHIFT-3", "NONE")
		SetBinding("SHIFT-4", "NONE")
		SetBinding("SHIFT-5", "NONE")
		SetBinding("SHIFT-6", "NONE")
		SetBinding("SHIFT-<", "REPLY2")
		SetBinding("SHIFT-B", "NONE")
		SetBinding("SHIFT-BUTTON3", "MACRO G008")
		SetBinding("SHIFT-BUTTON4", "MACRO Cancel")
		SetBinding("SHIFT-BUTTON5", "MACRO G025")
		SetBinding("SHIFT-C", "CLICK BT4Button62:LeftButton")
		SetBinding("SHIFT-DOWN", "NONE")
		SetBinding("SHIFT-E", "CLICK BT4Button68:LeftButton")
		SetBinding("SHIFT-F", "CLICK BT4Button31:LeftButton")
		SetBinding("SHIFT-F1", "NONE")
		SetBinding("SHIFT-F2", "NONE")
		SetBinding("SHIFT-F3", "NONE")
		SetBinding("SHIFT-F4", "NONE")
		SetBinding("SHIFT-F5", "NONE")
		SetBinding("SHIFT-F7", "ALLTHETHINGS_TOGGLEMAINLIST")
		SetBinding("SHIFT-G", "CLICK BT4Button66:LeftButton")
		SetBinding("SHIFT-H", "CLICK BT4Button19:LeftButton")
		SetBinding("SHIFT-I", "NONE")
		SetBinding("SHIFT-J", "CLICK BT4Button26:LeftButton")
		SetBinding("SHIFT-M", "NONE")
		SetBinding("SHIFT-MOUSEWHEELDOWN", "NONE")
		SetBinding("SHIFT-MOUSEWHEELUP", "NONE")
		SetBinding("SHIFT-N", "CLICK BT4Button14:LeftButton")
		SetBinding("SHIFT-P", "TOGGLECOLLECTIONSMOUNTJOURNAL")
		SetBinding("SHIFT-PAGEDOWN", "NONE")
		SetBinding("SHIFT-Q", "CLICK BT4Button42:LeftButton")
		SetBinding("SHIFT-R", "CLICK BT4Button16:LeftButton")
		SetBinding("SHIFT-SPACE", "NONE")
		SetBinding("SHIFT-T", "CLICK BT4Button38:LeftButton")
		SetBinding("SHIFT-UP", "NONE")
		SetBinding("SHIFT-V", "CLICK BT4Button43:LeftButton")
		SetBinding("SHIFT-X", "CLICK BT4Button55:LeftButton")
		SetBinding("SHIFT-§", "MACRO G001")
		SetBinding("SHIFT-¨", "MACRO Cancel")
		SetBinding("SHIFT-å", "MACRO G107")
		SetBinding("T", "CLICK BT4Button37:LeftButton")
		SetBinding("UP", "NONE")
		SetBinding("V", "CLICK BT4Button67:LeftButton")
		SetBinding("X", "CLICK BT4Button56:LeftButton")
		SetBinding("§", "MACRO G001")
		SetBinding("¨", "NONE")
		SetBinding("ä", "FOCUSTARGET")
		SetBinding("å", "FOLLOWTARGET")
		SetBinding("ö", "TOGGLERUN")
	end
end


local function BuildGlobalMacros()
	if not InCombatLockdown() then
		-- Belt
		macro(2, "#showtooltip\n/use 6", 3552794)

		-- Cloak
		macro(3, "#showtooltip\n/cancelaura Nitro Boosts\n/use 15", 3555130)

		-- Gloves
		macro(4, "#showtooltip\n/use 10", 3552836)

		-- Tinker: Nitro Boosts
		macro(5, "/run C_TradeSkillUI.OpenTradeSkill(202) C_TradeSkillUI.CraftRecipe(55016) C_TradeSkillUI.CloseTradeSkill()\n/click CharacterWaistSlot", 136243)
		
		-- Tinker: Goblin Glider
		macro(6, "/run C_TradeSkillUI.OpenTradeSkill(202) C_TradeSkillUI.CraftRecipe(126392) C_TradeSkillUI.CloseTradeSkill()\n/click CharacterBackSlot", 136243)

		-- Gathering Mount
		macro(9, "/use [nomounted]Sky Golem\n/dismount [mounted]\n/leavevehicle", 413588)

		-- Dismiss Companion / Remove Chef's Hat
		macro(12, "/dismisspet\n/cancelaura Cooking Speed", 132599)

		-- Loot Spec 1
		macro(21, "/run SetLootSpecialization(GetSpecializationInfo(1))", 237281)

		-- Loot Spec 2
		macro(22, "/run SetLootSpecialization(GetSpecializationInfo(2))", 237281)

		-- Loot Spec 3
		macro(23, "/run local _,_,c=UnitClass(\"player\") if c~=12 then SetLootSpecialization(GetSpecializationInfo(3)) end", 237281)

		-- Loot Spec 4
		macro(24, "/run local _,_,c=UnitClass(\"player\") if c==11 then SetLootSpecialization(GetSpecializationInfo(4)) end", 237281)

		-- Cancel Auras
		macro(25, "/cancelaura Ice Block\n/cancelaura Divine Shield\n/cancelaura Dispersion\n/cancelaura Aspect of the Turtle\n/cancelaura Blessing of Protection\n/cancelaura Slow Fall\n/cancelaura Levitate\n/cancelaura Goblin Glider\n/cancelaura Spirit of Redemption", 135739)

		-- Trinket 1
		macro(26, "#showtooltip\n/use 13")

		-- Trinket 2
		macro(27, "#showtooltip\n/use 14")

		-- Phial of Serenity
		macro(32, "#showtooltip\n/use Phial of Serenity", 463534)

		-- Signature Ability
		macro(33, "#showtooltip\n/use Signature Ability")

		-- Covenant Ability
		macro(34, "#showtooltip\n/use Covenant Ability")

		-- Combat Ally
		macro(35, "#showtooltip\n/use Combat Ally")

		-- Toggle ZigiAuras Debug Mode
		macro(105, "/za", 3610509)

		-- Close BugSack
		macro(106, "/run BugSack:CloseSack()", 237144)

		-- LFG Teleport
		macro(106, "/run LFGTeleport(IsInLFGDungeon())", 397907)

		-- Autofollow
		macro(107, "/autofollow", 132328)

		-- Reload
		macro(108, "/reload", 236372)

		-- Open BugSack
		macro(109, "/bugsack show", 237144)

		-- Volume Low
		macro(110, "/run SetCVar(\"Sound_MasterVolume\", 0.1)", 133014)

		-- Volume High
		macro(111, "/run SetCVar(\"Sound_MasterVolume\", 0.3)", 133014)

		-- Invite Guild Members
		macro(112, "/run local n,r=UnitFullName(\"player\") local p=n..\"-\"..r local t=GetNumGuildMembers() for i=1,t do local c,_,g,_,_,_,_,_,o=GetGuildRosterInfo(i) if g<=1 and c~=p and o then C_PartyInfo.InviteUnit(c) end end", 413583)

		-- Reset Instances
		macro(113, "/run ResetInstances()", 525134)

		-- Leave
		macro(114, "/run C_PartyInfo.LeaveParty()", 236347)

		-- Temp
		--macro(115, "", 892831)

		-- Placer
		macro(116, "/placer", 450905)

		-- Camp
		macro(120, "/camp", 3193418)

		-- Pets
		Automagic.UpdatePets()
	end
end


function Automagic.UpdatePets()
	if InCombatLockdown() then return end

	-- Pets
	local instanceName, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
	local _, class, _ = UnitClass("player")
	local _,race = UnitRace("player")
	local name = GetUnitName("player", false)
	local realm = GetRealmName()
	local faction,_ = UnitFactionGroup("player")
	local spec = GetSpecialization() or 0
	local level = UnitLevel("player") or 1
	local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0

	if not realm then return end
	
	if class == "HUNTER" and GetStablePetInfo(1) then
		local petAbilityMacro, petExoticMacro = "#showtooltip\n/use ", "#showtooltip\n/use "

		local petAbilities = {
			["Basilisk"] = "Petrifying Gaze",
			["Bat"] = "Sonic Blast",
			["Bear"] = "Thick Fur",
			["Beetle"] = "Harden Carapace",
			["Bird of Prey"] = "Talon Rend",
			["Blood Beast"] = "Blood Bolt",
			["Boar"] = "Bristle",
			["Camel"] = "Hardy",
			["Carrion Bird"] = "Bloody Screech",
			["Cat"] = "Catlike Reflexes",
			["Chimaera"] = "Frost Breath",
			["Clefthoof"] = "Thick Hide",
			["Core Hound"] = "Obsidian Skin",
			["Courser"] = "Fleethoof",
			["Crab"] = "Pin",
			["Crane"] = "Chi-Ji's Tranquility",
			["Crocolisk"] = "Ankle Crack",
			["Devilsaur"] = "Monstrous Bite",
			["Direhorn"] = "Gore",
			["Dog"] = "Lock Jaw",
			["Dragonhawk"] = "Dragon's Guile",
			["Feathermane"] = "Feather Flurry",
			["Fox"] = "Agile Reflexes",
			["Gorilla"] = "Silverback",
			["Gruffhorn"] = "Gruff",
			["Hydra"] = "Acid Bite",
			["Hyena"] = "Infected Bite",
			["Krolusk"] = "Bulwark",
			["Lizard"] = "Grievous Bite",
			["Mammoth"] = "Trample",
			["Mechanical"] = "Defense Matrix",
			["Monkey"] = "Primal Agility",
			["Moth"] = "Serenity Dust",
			["Oxen"] = "Niuzao's Fortitude",
			["Pterrordax"] = "Ancient Hide",
			["Quilen"] = "Stone Armor",
			["Raptor"] = "Savage Rend",
			["Ravager"] = "Ravage",
			["Ray"] = "Nether Energy",
			["Riverbeast"] = "Gruesome Bite",
			["Rodent"] = "Gnaw",
			["Scalehide"] = "Scale Shield",
			["Scorpid"] = "Deadly Sting",
			["Serpent"] = "Serpent's Swiftness",
			["Shale Spider"] = "Solid Shell",
			["Silithid"] = "Tendon Rip",
			["Spider"] = "Web Spray",
			["Spirit Beast"] = "Spirit Pulse",
			["Sporebat"] = "Spore Cloud",
			["Stag"] = "Nature's Grace",
			["Tallstrider"] = "Dust Cloud",
			["Toad"] = "Swarm of Flies",
			["Turtle"] = "Shell Shield",
			["Warp Stalker"] = "Warp Time",
			["Wasp"] = "Toxic Sting",
			["Wind Serpent"] = "Winged Agility",
			["Wolf"] = "Furious Bite",
			["Worm"] = "Acid Spit",
		}

		local petExoticAbilities = {
			["Spirit Beast"] = "Spirit Mend",
			["Bear"] = "Rest",
			["Bird of Prey"] = "Trick",
			["Cat"] = "Prowl",
			["Chimaera"] = "Froststorm Breath",
			["Clefthoof"] = "Blood of the Rhino",
			["Core Hound"] = "Molten Hide",
			["Crane"] = "Trick",
			["Devilsaur"] = "Feast",
			["Feathermane"] = "Updraft",
			["Fox"] = "Play",
			["Krolusk"] = "Calcified Carapace",
			["Pterrordax"] = "Updraft",
			["Quilen"] = "Eternal Guardian",
			["Rodent"] = "Rest",
			["Shale Spider"] = "Shimmering Scale",
			["Silithid"] = "Dune Strider",
			["Worm"] = "Burrow Attack",
		}

		local PetIcons = {}

		if Automagic.PetIcons[name.."-"..realm] or Automagic.PetIcons[name] then
			PetIcons = Automagic.PetIcons[name.."-"..realm] or Automagic.PetIcons[name]
		end

		for i = 1, 5 do
			local petIcon, petName, _, family = GetStablePetInfo(i)
			local macroID = 13 + i

			if family and petAbilities[family] then
				petAbilityMacro = petAbilityMacro .. "[pet:" .. family .. "]" .. petAbilities[family] .. ";"
			end

			if family and petExoticAbilities[family] then
				if family == "Spirit Beast" then
					petExoticMacro = petExoticMacro .. "[pet:Spirit Beast,mod:alt]Spirit Walk;[pet:Spirit Beast,mod:shift,@pet][pet:Spirit Beast,help][pet:Spirit Beast,@player]Spirit Mend;"
				else
					petExoticMacro = petExoticMacro .. "[pet:" .. family .. "]" .. petExoticAbilities[family] .. ";"
				end
			end
			macro(macroID, "#showtooltip\n#icon " .. (PetIcons[petName] or petIcon or 132161) .. "\n/use Call Pet " .. i, tonumber(PetIcons[petName]) or petIcon or 132161)
		end

		petAbilityMacro = petAbilityMacro .. "Tame Beast"
		petExoticMacro = petExoticMacro .. "Tame Beast"

		macro(19, petAbilityMacro)
		macro(20, petExoticMacro)
	elseif class == "MAGE" then
		local PetIcons = {}

		if Automagic.PetIcons[name.."-"..realm] or Automagic.PetIcons[name] then
			PetIcons = Automagic.PetIcons[name.."-"..realm] or Automagic.PetIcons[name]
		end

		macro(14, "#showtooltip\n#icon " .. (PetIcons["Water Elemental"] or 135862) .. "\n/use Summon Water Elemental", tonumber(PetIcons["Water Elemental"]) or 135862)
	end
end


local function eventHandler(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		-- UI Scale
		if AutomagicOptions and AutomagicOptions.EnableScaling == false then
			SetCVar("useuiscale", 0)
		else
			SetCVar("useuiscale", 1)
			SetCVar("uiscale", 1)
			local _, height = GetPhysicalScreenSize()
			UIParent:SetScale(768 / height)

			for _, frame in next, {
			    "CharacterFrame",
			    "TradeFrame",
			    "MerchantFrame",
			    "PVEFrame",
			    "GossipFrame",
			    "InterfaceOptionsFrame",
			    "GameMenuFrame",
			    "ChatFrame1EditBox",
			} do
			    _G[frame]:SetScale(1.2)
			end
		end
	end

	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		frame:UnregisterEvent("PLAYER_REGEN_ENABLED")

		if event == "PET_STABLE_CLOSED" then
			Automagic.UpdatePets()
			return
		end

		if event ~= "PLAYER_REGEN_ENABLED" and throttled[event] then
			return
		else
			throttled[event] = true
			C_Timer.After(1, function()
				throttled[event] = false

				if event ~= "BAG_UPDATE" and event ~= "LEARNED_SPELL_IN_TAB" and event ~="ACTIVE_TALENT_GROUP_CHANGED" and event ~= "ZONE_CHANGED_NEW_AREA" and event ~= "PLAYER_REGEN_ENABLED" and event ~= "PET_STABLE_CLOSED" and event ~= "PLAYER_LEVEL_UP" then
					SetGlobalBinds()
				end
			end)
		end

		if event ~= "ZONE_CHANGED_NEW_AREA" and event ~= "BAG_UPDATE" then
			-- Ongoing Calendar Events
			--local events = {}

			--if C_Calendar and C_DateAndTime then
			--	local time = C_DateAndTime.GetCurrentCalendarTime()
        	--	C_Calendar.SetAbsMonth(time.month, time.year)
			--	local numEvents = C_Calendar.GetNumDayEvents(0, time.monthDay) or 0

			--	if numEvents >= 1 then
			--		for i = 1, numEvents do
			--			if C_Calendar.GetDayEvent(0, monthDay, i) and C_Calendar.GetDayEvent(0, monthDay, i).eventType == 4 then
			--				events[C_Calendar.GetDayEvent(0, monthDay, i).title] = true
			--			end
			--		end
			--	end
			--end


			if event ~= "LEARNED_SPELL_IN_TAB" and event ~= "PLAYER_REGEN_ENABLED" and event ~="ACTIVE_TALENT_GROUP_CHANGED" then
				-- Replace Global Macros
				for i = 1, 120 do
					if GetMacroBody(i) then
						EditMacro(i, string.format("G%03d", i), "INV_MISC_QUESTIONMARK", "", 1, 1)
					else
						CreateMacro(string.format("G%03d", i), "INV_MISC_QUESTIONMARK", "", nil)
					end
				end
			
				BuildGlobalMacros()

				if event ~= "PET_STABLE_CLOSED" and event ~= "PLAYER_LEVEL_UP" then
					SetGlobalBinds()
				end
			end
		end

		local instanceName, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
		local _, class, _ = UnitClass("player")
		local _,race = UnitRace("player")
		local name = GetUnitName("player", false)
		local realm = GetRealmName()
		local faction,_ = UnitFactionGroup("player")
		local spec = GetSpecialization() or 0
		local level = UnitLevel("player") or 1
		local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0
		-- 1 Kyrian
		-- 2 Venthyr
		-- 3 Night Fae
		-- 4 Necrolord

		local role = "dps"
		if (class == "DEATHKNIGHT" and spec == 1) or (class == "DEMONHUNTER" and spec == 2) or (class == "DRUID" and spec == 3) or (class == "MONK" and spec == 1) or (class == "PALADIN" and spec == 2) or (class == "WARRIOR" and spec == 3) then
			role = "tank"
		elseif (class == "DRUID" and spec == 4) or (class == "MONK" and spec == 2) or (class == "PALADIN" and spec == 1) or (class == "PRIEST" and spec ~= 3) or (class == "SHAMAN" and spec == 3) then
			role = "healer"
		end

		local primary = "int"
		if (class == "DEMONHUNTER") or (class == "DRUID" and (spec == 2 or spec == 3)) or (class == "HUNTER") or (class == "MONK" and spec ~= 2) or (class == "ROGUE") or (class == "SHAMAN" and spec == 2) then
			primary = "agi"
		elseif (class == "DEATHKNIGHT") or (class == "WARRIOR") or (class == "PALADIN" and spec ~= 1) then
			primary = "str"
		end

		if not name or not class or not race or not faction or not spec or not level then return end


		if event ~= "BAG_UPDATE" then
			if instanceName == "Draenor" or instanceName == "Tanaan Jungle Intro" then
				if class == "ROGUE" then
					macro(1, "#showtooltip Findle's Loot-A-Rang\n/use [stealth,harm,nodead]Pick Pocket;[@mouseover,harm,dead][harm,dead][]Findle's Loot-A-Rang", 986491)
				else
					macro(1, "#showtooltip Findle's Loot-A-Rang\n/use [@mouseover,harm,dead][harm,dead][]Findle's Loot-A-Rang", 986490)
				end
			else
				if class == "ROGUE" then
					macro(1, "#showtooltip Loot-A-Rang\n/use [stealth,harm,nodead]Pick Pocket;[@mouseover,harm,dead][harm,dead][]Loot-A-Rang", 986491)
				else
					macro(1, "#showtooltip Loot-A-Rang\n/use [@mouseover,harm,dead][harm,dead][]Loot-A-Rang", 986490)
				end
			end
		end


		if event ~= "ZONE_CHANGED_NEW_AREA" then
			-- Healthstone
			if bags("Healthstone") >= 1 then
				-- Healthstone
				macro(28, "#showtooltip\n/use Healthstone")
			else
				-- No Healthstone Available
				macro(28, "#showtooltip\n/use Healthstone", 237477)
			end

			-- Mana Gem
			if bags("Mana Gem") >= 1 then
				-- Mana Gem
				macro(36, "#showtooltip\n/use Mana Gem")
			else
				-- No Mana Gem Available
				macro(36, "#showtooltip\n/use Mana Gem", 1379187)
			end

			-- Tonic
			if instanceName == "Torghast, Tower of the Damned" and bags("Rejuvenating Siphoned Essence") >= 1 then
				-- Torghast
				macro(29, "#showtooltip\n/use Rejuvenating Siphoned Essence")
			elseif bags("Crimson Vial") >= 1 then
				-- Crimson Vial (Conjured by Rogue PvP talent)
				macro(29, "#showtooltip\n/use 137222")
			elseif bags("Greater Phial of Serenity") >= 1 then
				-- Greater Phial of Serenity (Conjured)
				macro(29, "#showtooltip\n/use Greater Phial of Serenity")
			elseif instanceType == "pvp" and bags("\"Third Wind\" Potion") >= 1 then
				-- Battlegrounds
				macro(29, "#showtooltip\n/use \"Third Wind\" Potion")
			elseif instanceType == "none" and bags("Darkmoon Healing Tonic") >= 1 then
				-- Outdoors only (20%)
				macro(29, "#showtooltip\n/use Darkmoon Healing Tonic")
			elseif bags("Soulful Healing Potion") >= 1 and level >= 51 then
				-- Shadowlands (random drop), level 51 (10,000)
				macro(29, "#showtooltip\n/use Soulful Healing Potion")
			elseif bags("Spiritual Healing Potion") >= 1 and level >= 51 then
				-- Shadowlands, level 51 (10,000)
				macro(29, "#showtooltip\n/use Spiritual Healing Potion")
			elseif bags("Abyssal Healing Potion") >= 1 and level >= 40 then
				-- Nazjatar, level 40 (12k, probably not squished properly)
				macro(29, "#showtooltip\n/use Abyssal Healing Potion")
			elseif bags("Astral Healing Potion") >= 1 and level >= 45 then
				-- Argus, level 45 (4950)
				macro(29, "#showtooltip\n/use Astral Healing Potion")
			elseif bags("Coastal Healing Potion") >= 1 and level >= 40 then
				-- Kul Tiras/Zandalar, level 40
				macro(29, "#showtooltip\n/use Coastal Healing Potion")
			elseif bags("Ancient Healing Potion") >= 1 and level >= 45 then
				-- Broken Isles, level 45 (2200)
				macro(29, "#showtooltip\n/use Ancient Healing Potion")
			elseif bags("Healing Tonic") >= 1 and level >= 91 then
				-- Draenor
				macro(29, "#showtooltip\n/use Healing Tonic")
			elseif bags("Master Healing Potion") >= 1 and level >= 32 then
				-- Pandaria
				macro(29, "#showtooltip\n/use Master Healing Potion")
			elseif bags("Mythical Healing Potion") >= 1 and level >= 80 then
				-- Cataclysm
				macro(29, "#showtooltip\n/use Mythical Healing Potion")
			elseif bags("Crazy Alchemist's Potion") >= 1 and level >= 70 then
				-- Northrend
				macro(29, "#showtooltip\n/use Crazy Alchemist's Potion")
			elseif bags("Runic Healing Potion") >= 1 and level >= 70 then
				-- Northrend
				macro(29, "#showtooltip\n/use Runic Healing Potion")
			elseif bags("Powerful Rejuvenation Potion") >= 1 and level >= 70 then
				-- Northrend
				macro(29, "#showtooltip\n/use Powerful Rejuvenation Potion")
			elseif bags("Resurgent Healing Potion") >= 1 and level >= 65 then
				-- Northrend
				macro(29, "#showtooltip\n/use Resurgent Healing Potion")
			elseif bags("Fel Regeneration Potion") >= 1 and level >= 60 then
				-- Outland
				macro(29, "#showtooltip\n/use Fel Regeneration Potion")
			elseif bags("Super Healing Potion") >= 1 and level >= 55 then
				-- Outland
				macro(29, "#showtooltip\n/use Super Healing Potion")
			elseif bags("Volatile Healing Potion") >= 1 and level >= 55 then
				-- Outland
				macro(29, "#showtooltip\n/use Volatile Healing Potion")
			elseif bags("Major Healing Potion") >= 1 and level >= 45 then
				-- Classic
				macro(29, "#showtooltip\n/use Major Healing Potion")
			elseif bags("Superior Healing Potion") >= 1 and level >= 35 then
				-- Classic
				macro(29, "#showtooltip\n/use Superior Healing Potion")
			elseif bags("Greater Healing Potion") >= 1 and level >= 21 then
				-- Classic
				macro(29, "#showtooltip\n/use Greater Healing Potion")
			elseif bags("Expedition Healing Potion") >= 1 then
				-- Exile's Reach
				macro(29, "#showtooltip\n/use Expedition Healing Potion")
			elseif bags("Healing Potion") >= 1 and level >= 12 then
				-- Classic
				macro(29, "#showtooltip\n/use Healing Potion")
			elseif bags("Lesser Healing Potion") >= 1 and level >= 3 then
				-- Classic
				macro(29, "#showtooltip\n/use Lesser Healing Potion")
			elseif bags("Minor Healing Potion") >= 1 then
				-- Classic
				macro(29, "#showtooltip\n/use Minor Healing Potion")
			else
				-- No Tonic Available
				macro(29, "#showtooltip\n/use Spiritual Healing Potion", 134865)
			end


			-- Potion
			if instanceName == "Torghast, Tower of the Damned" and bags("Fleeting Frenzy Potion") >= 1 then
				-- Torghast
				macro(30, "#showtooltip\n/use Fleeting Frenzy Potion")
			elseif instanceType == "pvp" and bags("Saltwater Potion") >= 1 then
				macro(30, "#showtooltip\n/use Saltwater Potion")
			elseif instanceName == "Blackwing Descent Scenario" and bags("Experimental Vial") >= 1 then
				macro(30, "#showtooltip\n/use Experimental Vial")
			elseif bags("Potion of Unbridled Fury") >= 1 then
				macro(30, "#showtooltip\n/use Potion of Unbridled Fury")
			elseif primary == "int" and bags("Superior Battle Potion of Intellect") >= 1 then
				macro(30, "#showtooltip\n/use Superior Battle Potion of Intellect")
			elseif primary == "agi" and bags("Superior Battle Potion of Agility") >= 1 then
				macro(30, "#showtooltip\n/use Superior Battle Potion of Agility")
			elseif primary == "str" and bags("Superior Battle Potion of Strength") >= 1 then
				macro(30, "#showtooltip\n/use Superior Battle Potion of Strength")
			elseif primary == "int" and bags("Battle Potion of Intellect") >= 1 then
				macro(30, "#showtooltip\n/use Battle Potion of Intellect")
			elseif primary == "agi" and bags("Battle Potion of Agility") >= 1 then
				macro(30, "#showtooltip\n/use Battle Potion of Agility")
			elseif primary == "str" and bags("Battle Potion of Strength") >= 1 then
				macro(30, "#showtooltip\n/use Battle Potion of Strength")
			elseif bags("Potion of Prolonged Power") >= 1 then
				macro(30, "#showtooltip\n/use Potion of Prolonged Power")
			else
				-- No Potion Available
				macro(30, "#showtooltip\n/use Potion of Prolonged Power", 132380)
			end

			-- Zone Ability
			if instanceName == "Draenor" then
				-- Draenor: Garrison Ability
				macro(31, "#showtooltip\n/use Garrison Ability")
			elseif instanceName == "Argus" then
				-- Argus: Vindicaar Matrix Crystal
				macro(31, "#showtooltip\n/use Vindicaar Matrix Crystal")
			elseif (instanceName == "Horrific Vision of Orgrimmar" or instanceName == "Horrific Vision of Stormwind") and IsSpellKnown(314955) then
				-- Horrific Vision: Sanity Restoration Orb
				macro(31, "#showtooltip\n/use Sanity Restoration Orb")
			elseif instanceName == "Vision of the Twisting Sands" or instanceName == "Vale of Eternal Twilight" then
				-- Minor Horrific Vision: Resilient Soul
				macro(31, "#showtooltip\n/use Resilient Soul", 458722)
			elseif IsInJailersTower() then
				-- Torghast: Activate Empowerment
				macro(31, "#showtooltip\n/use Activate Empowerment")
			elseif instanceName == "Torghast" then
				-- Torghast: Layer 5 spam
				-- /run C_GossipInfo.SelectOption(TorghastLevelPickerFrame.currentSelectedButton.index)
				macro(31, "/run C_GossipInfo.SelectOption(5)", 4067926)
			elseif instanceName == "The Shadowlands" and covenant == 4 then
				-- Shadowlands: Construct Ability
				macro(31, "#showtooltip\n/use Construct Ability")
			else
				-- No Zone Ability Available
				macro(31, "#showtooltip\n/use Garrison Ability", 975738)
			end
		end

		if event ~= "BAG_UPDATE" then
			-- UI Stuff
			--UIWidgetTopCenterContainerFrame:ClearAllPoints()
			--UIWidgetTopCenterContainerFrame:SetPoint("CENTER", 0, 400)

			-- Mounts
			local z, m, mA, mP = GetZoneText(), "", "", ""
			local mountType, preferAquatic, overrideMount = "", false, false

			local ground = Automagic.Characters["defaults"]["ground"]
			local flying = Automagic.Characters["defaults"]["flying"]
			local aquatic = Automagic.Characters["defaults"]["aquatic"]
			local passenger = Automagic.Characters["defaults"]["passenger"]
			local hs = (covenant == 1) and "Kyrian Hearthstone" or (covenant == 2) and "Venthyr Sinstone" or (covenant == 3) and "Night Fae Hearthstone" or (covenant == 4) and "Necrolord Hearthstone" or Automagic.Characters["defaults"]["hs"]
			local pets = nil

			if Automagic.Characters[name.."-"..realm] or Automagic.Characters[name] then
				local c = Automagic.Characters[name.."-"..realm] or Automagic.Characters[name]

				if c["flying:"..spec] or c["flying"] then
					flying = c["flying:"..spec] or c["flying"]
					ground = flying
				end
				if c["ground:"..spec] or c["ground"] then
					ground = c["ground:"..spec] or c["ground"]
				end
				if c["aquatic:"..spec] or c["aquatic"] then
					aquatic = c["aquatic:"..spec] or c["aquatic"]
				end
				if c["passenger:"..spec] or c["passenger"] then
					passenger = c["passenger:"..spec] or c["passenger"]
				end
				if c["hs:"..spec] or c["hs"] then
					hs = c["hs:"..spec] or c["hs"]
				end
				if c["pets:"..spec] or c["pets"] then
					pets = c["pets:"..spec] or c["pets"]
				end
			end

			-- Ground Mounts
			local pieces = { strsplit("|", ground) }

			if #pieces == 1 then
				ground = "/use [nomounted]" .. strtrim(pieces[1])
			else
				ground = "/userandom [nomounted]"
				for i = 1, #pieces do
					if i > 1 then ground = ground .. "," end
					ground = ground .. strtrim(pieces[i])
				end
			end

			-- Flying Mounts
			local pieces = { strsplit("|", flying) }

			if #pieces == 1 then
				flying = "/use [nomounted]" .. strtrim(pieces[1])
			else
				flying = "/userandom [nomounted]"
				for i = 1, #pieces do
					if i > 1 then flying = flying .. "," end
					flying = flying .. strtrim(pieces[i])
				end
			end

			-- Aquatic Mounts
			local pieces = { strsplit("|", aquatic) }

			if #pieces == 1 then
				aquatic = "/use [nomounted]" .. strtrim(pieces[1])
			else
				aquatic = "/userandom [nomounted]"
				for i = 1, #pieces do
					if i > 1 then aquatic = aquatic .. "," end
					aquatic = aquatic .. strtrim(pieces[i])
				end
			end

			-- Passenger Mounts
			local pieces = { strsplit("|", passenger) }

			if #pieces == 1 then
				passenger = "/use " .. strtrim(pieces[1])
			else
				passenger = "/userandom "
				for i = 1, #pieces do
					if i > 1 then passenger = passenger .. "," end
					passenger = passenger .. strtrim(pieces[i])
				end
			end

			-- Check if the character has riding skill
			if instanceName == "The Deaths of Chromie" or instanceName == "Tirisfal Glades" then
				mountType = "flying" -- Force flying in the Deaths of Chromie scenario/Tirisfal Glades Artifact scenario
			elseif instanceName == "Torghast, Tower of the Damned" then
				overrideMount = "/use Mawrat Harness" -- Mawrat Harness is the only "mount" that is useable inside Torghast
			elseif (z == "The Maw" or z == "Korthia") and class ~= "DRUID" and not C_QuestLog.IsQuestFlaggedCompleted(63994) then
				overrideMount = "/use [nomounted]Corridor Creeper" -- The Maw
			elseif IsSpellKnown(34090) or IsSpellKnown(34091) or IsSpellKnown(90265) then -- Expert, Artisan, Master Riding
				mountType = "flying" -- We can use flying mounts

				if (instanceType ~= "none" and not garrisonId[mapID]) or groundAreas[z] or groundAreas[instanceName] then
					-- We can't fly inside instances, except Draenor Garrisons and The Deaths of Chromie
					-- Flying is also disabled in certain outdoor areas/zones
					mountType = "ground"
				end
			elseif IsSpellKnown(33388) or IsSpellKnown(33391) then -- Apprentice or Journeyman Riding
				-- We can use ground mounts
				mountType = "ground"
			end

			-- Check which aquatic mount we should use
			if z == "Vashj'ir" or z == "Kelp'thar Forest" or z == "Shimmering Expanse" or z == "Abyssal Depths" then
				-- Vashj'ir
				preferAquatic = true

				if C_QuestLog.IsQuestFlaggedCompleted(25371) and class ~= "DRUID" then -- Quest to unlock the Vashj'ir Seahorse
					aquatic = "/use [nomounted]Vashj'ir Seahorse" -- Force Vashj'ir Seahorse in Vashj'ir
				end
			elseif z == "Nazjatar" or z == "Damprock Cavern" or z == "The Forgotten Tunnel" or z == "Highborne Estates" then
				-- Nazjatar
				if (faction == "Alliance" and C_QuestLog.IsQuestFlaggedCompleted(56350)) or (faction == "Horde" and C_QuestLog.IsQuestFlaggedCompleted(55481)) then -- Quest that gives 20 Manapearls
					preferAquatic = true
				end
			end

			local pre = ""

			if mountType == "ground" then
				if GetItemCount("Magic Broom", false) >= 1 then -- Check if we have a Magic Broom in bags
					ground = "/use [nomounted]Magic Broom" -- Always prefer Magic Broom over any other ground mount
				end

				if class == "SHAMAN" then
					pre = "/use [nomounted,nocombat,@player]Water Walking\n"
				end
			elseif mountType == "flying" then
				if GetItemCount("Magic Broom", false) >= 1 then -- Check if we have a Magic Broom in bags
					flying = "/use [nomounted]Magic Broom" -- Always prefer Magic Broom over any other flying mount
				end
			else
				ground = "/use [nomounted]Summon Chauffeur" -- Fall back to the heirloom mount if we don't have riding skill
			end

			-- Update Macros
			-- Mount + Aquatic Mount
			if class == "DRUID" then
				if mountType == "flying" then
					macro(7, pre .. "/use [swimming][nocombat,nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 413588)
					macro(8, pre .. flying .."\n/dismount [mounted]\n/leavevehicle", 413588)
				elseif (mountType == "ground" or level >= 10 or IsSpellKnown(783)) and instanceType ~= "pvp" then
					macro(7, pre .. "/use [nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 413588)
					macro(8, pre .. ground .."\n/dismount [mounted]\n/leavevehicle", 413588)
				else
					macro(7, pre .. ground .. "\n/dismount [mounted]\n/leavevehicle", 413588)
					macro(8, pre .. ground .."\n/dismount [mounted]\n/leavevehicle", 413588)
				end
			elseif preferAquatic then
				macro(7, aquatic .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, ((mountType == "flying") and flying or ground) .. "\n/dismount [mounted]\n/leavevehicle", 413588)
			elseif overrideMount then
				macro(7, overrideMount .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, ((mountType == "flying") and flying or ground) .. "\n/dismount [mounted]\n/leavevehicle", 413588)
			else
				macro(7, ((mountType == "flying") and flying or ground) .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, aquatic .. "\n/dismount [mounted]\n/leavevehicle", 413588)
			end
			
			-- Passenger Mount
			macro(10, passenger, 413588)

			-- Hearthstone
			macro(13, "#showtooltip\n#icon 134414\n/use " .. hs, 134414)

			-- Companion
			if pets then
				pets = { strsplit("|", pets) }

				if #pets == 1 then
					macro(11, "/sp " .. strtrim(pets[1]), 613074)
				else
					local a = ""
					for i = 1, #pets do
						if i > 1 then a = a .. "," end
						a = a .. "\"" .. strtrim(pets[i]) .. "\""
					end

					macro(11, "/run local a={"..a.."}_,c=C_PetJournal.FindPetIDByName(a[math.random(1,#a)])C_PetJournal.SummonPetByGUID(c)", 613074)
				end
			else
				macro(11, "/rfp", 613074)
			end
		end
	end
end

frame:SetScript("OnEvent", eventHandler)