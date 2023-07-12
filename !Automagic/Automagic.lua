local gr, fl, aq, su, pa, hs, co, mb = {}, {}, {}, {}, {}, {}, {}, {}
local throttled = {}


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
	["Primal Earth Elemental"] = 1016351,
	["Primal Fire Elemental"] = 651081,
	["Primal Storm Elemental"] = 462522,
}


-- Disable micro button alerts
hooksecurefunc("MicroButtonPulse", function(self,duration)
    MicroButtonPulseStop(self)
end)
hooksecurefunc("MainMenuMicroButton_ShowAlert", function(self)
    HelpTip:HideAllSystem("MicroButtons")
end)


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
frame:RegisterEvent("PLAYER_FLAGS_CHANGED", "player")
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
	["Telogrus Ríft"] = true,
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
	["Mac'Aree"] = true, -- Renamed to Eredath in 9.1.5 but still used in some places
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
	["The Rift"] = true,
	["Korthia"] = true,
	["Caverns of Contemplation"] = true, -- Korthia
	["Torghast"] = true,
	["Font of Fealty"] = true, -- Chains of Domination Campaign Scenario
	["Tazavesh, the Veiled Market"] = true,
	-- Dragon Isles
	["The Waking Shores"] = true,
	["Thaldraszus"] = true,
	["Ohn'ahran Plains"] = true,
	["The Azure Span"] = true,
	["The Forbidden Reach"] = true,
	["Grand Time Adventure"] = true,
	["Zaralek Cavern"] = true,
}

-- Dragonriding enabled zones
local dragonAreas = {
	-- Dragon Isles
	["10.0 Dragon Isles"] = true,
	["Dragon Isles"] = true,
	["The Dragon Isles"] = true,
	["The Waking Shores"] = true,
	["Thaldraszus"] = true,
	["Valdrakken"] = true,
	["The Roasted Ram"] = true, -- Valdrakken Inn
	["Ohn'ahran Plains"] = true,
	["The Azure Span"] = true,
	["The Forbidden Reach"] = true,
	["Zaralek Cavern"] = true,
	-- Instances
	["The Nokhud Offensive"] = true,
	["The Primalist Future"] = true,
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

local function known(spell)
	local spellId
	local exact = false

	if type(spell) == "number" then
		spellId = spell
		exact = true
	else
		if spellNameToId[spell] then
			spellId = spellNameToId[spell]
		else
			spellId = select(7, GetSpellInfo(spell))
		end
	end

	if not spellId then return false end

	return IsPlayerSpell(spellId) or IsSpellKnown(spellId, true)
end


local BindingThrottle = false
local function SetGlobalBinds()
	if BindingThrottle then
		C_Timer.After(0.1, function() BindingThrottle = false end)
	elseif GetCurrentBindingSet() == 2 then
		LoadBindings(1)
		print(CreateAtlasMarkup("services-icon-warning", 24, 24) .. " |cffff2020Character Specific Keybindings Detected|r")
	elseif not InCombatLockdown() then
		BindingThrottle = true
		
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

		-- Autofollow
		SetBindingMacro("SHIFT-å", "G107")

		-- Reload
		SetBindingMacro("CTRL-SHIFT-PAGEDOWN", "G108")

		-- Open BugSack
		SetBindingMacro("END", "G109")

		-- LFG Teleport
		SetBindingMacro("HOME", "G106")

		-- Toggle ZigiAuras Debug Mode
		SetBindingMacro("SHIFT-NUMPAD8", "G105")

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

		SetBinding("+", "MACRO G104")
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
		SetBinding("ALT-BUTTON5", "MACRO G010")
		SetBinding("ALT-C", "TOGGLECHARACTER0")
		SetBinding("ALT-CTRL-BUTTON3", "MACRO Mount Aquatic")
		SetBinding("ALT-CTRL-NUMPAD6", "MACRO G116")
		SetBinding("ALT-CTRL-NUMPAD8", "MACRO G113")
		SetBinding("ALT-CTRL-NUMPAD9", "MACRO G120")
		SetBinding("ALT-CTRL-NUMPADMULTIPLY", "MACRO Leave")
		SetBinding("ALT-CTRL-SHIFT-BUTTON3", "MACRO Mount Aquatic")
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
		SetBinding("CTRL-C", "NONE")
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
		SetBinding("CTRL-J", "MACRO G034")
		SetBinding("CTRL-M", "NONE")
		SetBinding("CTRL-N", "NONE")
		SetBinding("CTRL-PAGEDOWN", "NONE")
		SetBinding("CTRL-PAGEUP", "NONE")
		SetBinding("CTRL-Q", "CLICK BT4Button55:LeftButton")
		SetBinding("CTRL-R", "CLICK BT4Button17:LeftButton")
		SetBinding("SHIFT-F2", "CLICK BT4Button19:LeftButton")
		SetBinding("CTRL-S", "NONE")
		SetBinding("CTRL-SHIFT-BUTTON3", "MACRO Mount Aquatic")
		SetBinding("CTRL-SHIFT-BUTTON4", "CLICK BindPadKey:MACRO Mount Passenger")
		SetBinding("CTRL-SHIFT-END", "MACRO G116")
		SetBinding("CTRL-SHIFT-F16", "MACRO Placer")
		SetBinding("CTRL-SHIFT-F18", "MACRO Reset Instances")
		SetBinding("CTRL-SHIFT-F19", "MACRO Camp")
		SetBinding("CTRL-SHIFT-HOME", "MACRO G113")
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
		SetBinding("F10", "TOGGLESOUND")
		SetBinding("F11", "MACRO G110")
		SetBinding("F12", "MACRO G111")
		SetBinding("F1", "CLICK BT4Button49:LeftButton")
		SetBinding("F2", "CLICK BT4Button50:LeftButton")
		SetBinding("F3", "CLICK BT4Button51:LeftButton")
		SetBinding("F4", "CLICK BT4Button52:LeftButton")
		SetBinding("F5", "CLICK BT4Button53:LeftButton")
		SetBinding("F6", "CLICK BT4Button54:LeftButton")
		SetBinding("F7", "DEJUNK_TOGGLE_OPTIONS_FRAME")
		SetBinding("F8", "TOGGLEMUSIC")
		SetBinding("F9", "NONE")
		SetBinding("G", "CLICK BT4Button65:LeftButton")
		SetBinding("HOME", "MACRO G106")
		SetBinding("I", "TOGGLEDUNGEONSANDRAIDS")
		SetBinding("INSERT", "NONE")
		SetBinding("J", "MACRO G032")
		SetBinding("L", "MACRO G036")
		SetBinding("SHIFT-L", "MACRO G037")
		SetBinding("CTRL-L", "MACRO G038")
		SetBinding("LEFT", "NONE")
		SetBinding("N", "CLICK BT4Button13:LeftButton")
		SetBinding("NUMLOCK", "NONE")
		SetBinding("NUMPAD0", "TARGETFOCUS")
		-- arena
		SetBinding("SHIFT-1", "NONE")
		SetBinding("SHIFT-2", "NONE")
		SetBinding("SHIFT-3", "NONE")
		SetBinding("CTRL-1", "NONE")
		SetBinding("CTRL-2", "NONE")
		SetBinding("CTRL-3", "NONE")
		SetBinding("CTRL-SHIFT-1", "NONE")
		SetBinding("CTRL-SHIFT-2", "NONE")
		SetBinding("CTRL-SHIFT-3", "NONE")
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
		SetBinding("SHIFT-0", "MACRO G002") -- Belt (Nitro)
		SetBinding("SHIFT-<", "REPLY2")
		SetBinding("SHIFT-B", "NONE")
		SetBinding("SHIFT-BUTTON3", "MACRO G008") -- Aquatic Mount
		SetBinding("SHIFT-BUTTON5", "MACRO G025") -- Cancelaura
		SetBinding("SHIFT-C", "CLICK BT4Button62:LeftButton")
		SetBinding("SHIFT-DOWN", "NONE")
		SetBinding("SHIFT-E", "CLICK BT4Button68:LeftButton")
		SetBinding("SHIFT-G", "CLICK BT4Button66:LeftButton")
		SetBinding("CTRL-G", "MACRO G030")
		SetBinding("SHIFT-I", "NONE")
		SetBinding("SHIFT-J", "MACRO G033")
		SetBinding("SHIFT-M", "NONE")
		SetBinding("SHIFT-MOUSEWHEELDOWN", "NONE")
		SetBinding("SHIFT-MOUSEWHEELUP", "NONE")
		SetBinding("SHIFT-N", "CLICK BT4Button14:LeftButton")
		SetBinding("SHIFT-P", "TOGGLECOLLECTIONS")
		SetBinding("SHIFT-PAGEDOWN", "NONE")
		SetBinding("SHIFT-Q", "CLICK BT4Button42:LeftButton")
		SetBinding("SHIFT-R", "CLICK BT4Button16:LeftButton")
		SetBinding("SHIFT-SPACE", "NONE")
		SetBinding("SHIFT-T", "CLICK BT4Button38:LeftButton")
		SetBinding("SHIFT-UP", "NONE")
		SetBinding("SHIFT-V", "CLICK BT4Button43:LeftButton")
		SetBinding("SHIFT-§", "MACRO G001") -- bugged in 9.2
		SetBinding("SHIFT-\\", "MACRO G001")
		SetBinding("SHIFT-¨", "MACRO Cancel")
		SetBinding("SHIFT-å", "MACRO G107")
		SetBinding("T", "CLICK BT4Button37:LeftButton")
		SetBinding("UP", "NONE")
		SetBinding("V", "ACTIONBUTTON7")
		SetBinding("SHIFT-F1", "MACRO G028") -- Healthstone
		SetBinding("SHIFT-F2", "MACRO G029") -- Tonic
		SetBinding("F7", "MACRO G041") -- Bloodlust
		SetBinding("§", "MACRO G001")
		SetBinding("\\", "MACRO G001")
		SetBinding("¨", "NONE")
		SetBinding("ä", "FOCUSTARGET")
		SetBinding("'", "FOCUSTARGET")
		SetBinding("å", "FOLLOWTARGET")
		SetBinding("]", "FOLLOWTARGET")
		SetBinding("ö", "TOGGLERUN")
		SetBinding("6", "ACTIONBUTTON6")
		SetBinding("X", "MACRO G026") -- Trinket 1
		SetBinding("SHIFT-X", "MACRO G027") -- Trinket 2
		SetBinding("TAB", "TARGETNEARESTENEMY")
		SetBinding("SHIFT-TAB", "TARGETPREVIOUSENEMY")
		SetBinding("CTRL-SHIFT-TAB", "NONE")
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
		macro(5, "/run C_TradeSkillUI.OpenTradeSkill(202) C_TradeSkillUI.CraftRecipe(55016) C_TradeSkillUI.CloseTradeSkill()\n/use 6", 136243)

		-- Tinker: Goblin Glider
		macro(6, "/run C_TradeSkillUI.OpenTradeSkill(202) C_TradeSkillUI.CraftRecipe(126392) C_TradeSkillUI.CloseTradeSkill()\n/use 15", 136243)

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
		--macro(25, "/cancelaura Blessing of Protection\n/cancelaura Slow Fall\n/cancelaura Levitate\n/cancelaura Goblin Glider\n\n/cancelaura Forgeborne Reveries", 135739)

		-- Trinket 1
		macro(26, "#showtooltip\n/use 13")

		-- Trinket 2
		macro(27, "#showtooltip\n/use 14")

		-- Healthstone
		macro(28, "#showtooltip\n/use Healthstone", 538745)

		-- Toggle War Mode
		macro(104, "/run C_PvP.ToggleWarMode()", 1455894)

		-- Toggle ZigiAuras Debug Mode
		macro(105, "/za", 3610509)

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
	local instance, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
	local _, class, _ = UnitClass("player")
	local _,race = UnitRace("player")
	local name = GetUnitName("player", false)
	local realm = GetRealmName()
	local faction,_ = UnitFactionGroup("player")
	local spec = GetSpecialization() or 5
	local level = UnitLevel("player") or 1
	local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0

	if not realm then return end
	
	if class == "DEATHKNIGHT" then
		local icons = {
			[0] = 1100170, -- Ghoul (default)
			[514] = 336781, -- Geist
			[1074] = 1269569, -- Skeleton
		}

		local icon = icons[0] or 0
		local link = GetSpellLink(46584)

		if link then
			local glyph = tonumber(string.match(link, "spell:[%d]+:([%d]+)") or 0) or 0
			if icons[glyph] then icon = icons[glyph] end
		end

		macro(14, "#showtooltip\n#icon " .. icon .. "\n/use Raise Dead", tonumber(icon) > 0 and tonumber(icon) or nil)
	elseif class == "PRIEST" then
		local icons = {
			[0] = 136199, -- Shadowfiend (default)
			[1299] = 525026, -- Lightspawn
			[1085] = 2735130, -- Sha
		}

		local icon = icons[0] or 0
		local link = GetSpellLink(34433)

		if link then
			local glyph = tonumber(string.match(link, "spell:[%d]+:([%d]+)") or 0) or 0
			if icons[glyph] then icon = icons[glyph] end
		end

		macro(14, "#showtooltip\n#icon " .. icon .. "\n/use Shadowfiend", tonumber(icon) > 0 and tonumber(icon) or nil)
	elseif class == "HUNTER" then
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
			["Spirit Beast"] = "Spirit Mend",
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


local vanish = CreateFrame("Frame")
vanish:Hide()


vanish.UnregisterAllEvents(BuffFrame)
vanish.Hide(BuffFrame)
vanish.SetParent(BuffFrame, vanish)

vanish.UnregisterAllEvents(DebuffFrame)
vanish.Hide(DebuffFrame)
vanish.SetParent(DebuffFrame, vanish)

if TemporaryEnchantFrame then
	vanish.UnregisterAllEvents(TemporaryEnchantFrame)
	vanish.Hide(TemporaryEnchantFrame)
	vanish.SetParent(TemporaryEnchantFrame, vanish)
end

vanish.UnregisterAllEvents(MirrorTimerContainer)
vanish.Hide(MirrorTimerContainer)
vanish.SetParent(MirrorTimerContainer, vanish)


function Automagic.SetLayout(name)
	if InCombatLockdown() then return end
	
	local activeLayoutInfo = EditModeManagerFrame:GetActiveLayoutInfo()
	if activeLayoutInfo then
		if name ~= activeLayoutInfo.layoutName then
			for index, layout in ipairs(EditModeManagerFrame:GetLayouts()) do
				if layout.layoutName == name then
					EditModeManagerFrame:SelectLayout(index)
				end
			end
		end
	end
end

function Automagic.SetTracking(auto)
	local _, class = UnitClass("player")

	local forced = {
		-- Don't touch
		-- ["Track Pets"] = false,

		-- On
		["Flight Master"] = true,
		["Trivial Quests"] = true,
		["Target"] = true,
		["Track Quest POIs"] = true,

		-- Hunter only
		["Stable Master"] = false,
		--["Stable Master"] = (class == "HUNTER") and true or false,

		-- Off
		["Track Warboards"] = false,
		["Auctioneer"] = false,
		["Banker"] = false,
		["Barber"] = false,
		["Battlemaster"] = false,
		["Food & Drink"] = false,
		["Innkeeper"] = false,
		["Item Upgrades"] = false,
		["Mailbox"] = false,
		["Profession Trainers"] = false,
		["Reagents"] = false,
		["Repair"] = false,
		["Transmogrifier"] = false,
		["Points of Interest"] = false,
		["Focus Target"] = false,
		["Track Digsites"] = false,
	}

	for index = 1, C_Minimap.GetNumTrackingTypes() do
		local name, icon, active, type, subType, spellID = C_Minimap.GetTrackingInfo(index)
		local link = spellID and GetSpellLink(spellID) or ("|cff71d5ff"..name.."|r")
		
		if auto then
			if forced[name] ~= nil and forced[name] ~= (active and true or false) then
				C_Minimap.SetTracking(index, forced[name])

				print(
					(forced[name] and "Now tracking" or "|cffffff00No longer tracking|r") .. " ",
					(icon and "|T"..icon..":14:14|t " or "") .. link
				)
			end
		else
			print(
				(icon and "|T"..icon..":14:14|t " or "") ..link.." ",
				(active and CreateAtlasMarkup("common-icon-checkmark") .. " |cff00ff00On|r" or CreateAtlasMarkup("common-icon-redx") .. " |cffff0000Off|r")
			)
		end
	end
end

local function eventHandler(self, event)
	if event == "PLAYER_ENTERING_WORLD" then
		SetCVar("ActionButtonUseKeyDown", 0)
		SetCVar("autoLootDefault", 1)
		SetCVar("BlockTrades", 0)
		SetCVar("displaySpellActivationOverlays", 0)
		SetCVar("GxAllowCachelessShaderMode", 0)
		SetCVar("mapFade", 0)
		SetCVar("useuiscale", 0)
		SetCVar("whisperMode", "inline")
		SetCVar("worldPreloadNonCritical", 0)
		SetCVar("nameplateShowSelf", 0)
		SetCVar("nameplateShowAll", 1)
		SetCVar("nameplateHorizontalScale", 1.4)
		SetCVar("nameplateVerticalScale", 2.7)
		SetCVar("nameplateClassificationScale", 1.25)
		SetCVar("nameplateShowEnemies", 1)
		SetCVar("nameplateShowEnemyPets", 1)
		SetCVar("nameplateShowEnemyGuardians", 1)
		SetCVar("nameplateShowEnemyTotems", 1)
		SetCVar("nameplateShowEnemyMinions", 1)
		SetCVar("nameplateShowEnemyMinus", 1)
		SetCVar("nameplateMotion", 1) -- Stacking nameplates
		SetCVar("empowerTapControls", 1)
		--MinimapCluster.MailFrame:SetPoint("TOPLEFT", Minimap, 0, 500)
		Automagic.SetLayout("Global")
		Automagic.SetTracking(true)
	end

	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		frame:UnregisterEvent("PLAYER_REGEN_ENABLED")

		if event == "PET_STABLE_CLOSED" then
			Automagic.UpdatePets()
			return
		end

		if event == "PLAYER_SPECIALIZATION_CHANGED" then
			Automagic.SetLayout("Global")
			return
		end

		if event ~= "PLAYER_REGEN_ENABLED" and throttled[event] then
			return
		else
			throttled[event] = true
			C_Timer.After(1, function()
				throttled[event] = false

				if event ~= "BAG_UPDATE" and event ~= "LEARNED_SPELL_IN_TAB" and event ~= "PLAYER_FLAGS_CHANGED" and event ~="ACTIVE_TALENT_GROUP_CHANGED" and event ~= "ZONE_CHANGED_NEW_AREA" and event ~= "PLAYER_REGEN_ENABLED" and event ~= "PET_STABLE_CLOSED" and event ~= "PLAYER_LEVEL_UP" then
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


			if event ~= "LEARNED_SPELL_IN_TAB" and event ~= "PLAYER_FLAGS_CHANGED" and event ~= "PLAYER_REGEN_ENABLED" and event ~="ACTIVE_TALENT_GROUP_CHANGED" then
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

		local instance, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
		local zone = GetZoneText() or ""
		local _, class = UnitClass("player")
		local _,race = UnitRace("player")
		local name = GetUnitName("player", false)
		local realm = GetRealmName()
		local faction = UnitFactionGroup("player")
		local spec = GetSpecialization() or 5
		local role = GetSpecializationRole(spec) or "DAMAGER" -- "DAMAGER", "TANK" or "HEALER"
		local level = UnitLevel("player") or 1
		local covenant = C_Covenants and C_Covenants.GetActiveCovenantID() or 0 -- 1 Kyrian, 2 Venthyr, 3 Night Fae, 4 Necrolord

		local primary = "int"
		if (class == "DEMONHUNTER") or (class == "DRUID" and (spec == 2 or spec == 3)) or (class == "HUNTER") or (class == "MONK" and spec ~= 2) or (class == "ROGUE") or (class == "SHAMAN" and spec == 2) then
			primary = "agi"
		elseif (class == "DEATHKNIGHT") or (class == "WARRIOR") or (class == "PALADIN" and spec ~= 1) then
			primary = "str"
		end

		if not name or not class or not race or not faction or not spec or not level then return end


		if event ~= "BAG_UPDATE" then
			if instance == "Draenor" or instance == "Tanaan Jungle Intro" then
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
			-- Cancel Aura (25)
			local body = "/cancelaura Blessing of Protection\n/cancelaura Slow Fall\n/cancelaura Levitate\n/cancelaura Updraft\n/cancelaura Goblin Glider\n/cancelaura Parachute\n/cancelaura Forgeborne Reveries\n/cancelaura Path of Greed"

			if class == "DEMONHUNTER" then
				body = "/cancelaura Netherwalk\n" .. body
			elseif class == "EVOKER" then
				body = "/cancelaura Emerald Communion\n" .. body
			elseif class == "HUNTER" then
				body = "/cancelaura Aspect of the Turtle\n" .. body
			elseif class == "MAGE" then
				body = "/cancelaura Ice Block\n" .. body
			elseif class == "PALADIN" then
				body = "/cancelaura Divine Shield\n" .. body
			elseif class == "PRIEST" and spec == 2 then
				body = "/cancelaura Spirit of Redemption\n" .. body
			elseif class == "PRIEST" and spec == 3 then
				body = "/cancelaura Dispersion\n" .. body
			elseif class == "WARRIOR" then
				body = "/cancelaura Bladestorm\n" .. body
			end

			macro(25, body, 135739)


			-- Tonic (29)
			if bags(137222) >= 1 then -- Crimson Vial (30%) - Rogue PvP talent
				macro(29, "#showtooltip\n/use item:137222")

			elseif instanceType == "pvp" and bags(138486) >= 1 then -- "Third Wind" Potion (50%) - Battlegrounds only
				macro(29, "#showtooltip\n/use item:138486")

			elseif bags(202088) >= 1 then -- Powerful Flask of Renewal (30%)
				macro(29, "#showtooltip\n/use item:202088")

			elseif instanceType == "none" and bags(124660) >= 1 then -- Darkmoon Healing Tonic (20%) - Outdoor only
				macro(29, "#showtooltip\n/use item:124660")

			elseif bags(191380) >= 1 and level >= 61 then -- Refreshing Healing Potion ◆◆◆ (1.28m)
				macro(29, "#showtooltip\n/use item:191380")

			elseif bags(191379) >= 1 and level >= 61 then -- Refreshing Healing Potion ◆◆ (1.1m)
				macro(29, "#showtooltip\n/use item:191379")

			elseif bags(191378) >= 1 and level >= 61 then -- Refreshing Healing Potion ◆ (94k)
				macro(29, "#showtooltip\n/use item:191378")

			elseif IsInJailersTower() and bags(176409) >= 1 then -- Rejuvenating Siphoned Essence (10k) - Torghast only
				macro(29, "#showtooltip\n/use item:176409")

			elseif bags(187802) >= 1 and level >= 60 then -- Cosmic Healing Potion (20k)
				macro(29, "#showtooltip\n/use item:187802")

			elseif bags(180317) >= 1 and level >= 51 then -- Soulful Healing Potion (10k)
				macro(29, "#showtooltip\n/use item:180317")

			elseif bags(171267) >= 1 and level >= 51 then -- Spiritual Healing Potion (10k)
				macro(29, "#showtooltip\n/use item:171267")

			elseif level < 60 then
				macro(29, "#showtooltip\n/use 2") -- Heirloom Neck

			else -- No Tonic Available
				macro(29, "#showtooltip\n/use Refreshing Healing Potion", 134865)
			end


			-- Potion (30)
			if IsInJailersTower() and bags(176443) >= 1 then -- Fleeting Frenzy Potion - Torghast only
				macro(30, "#showtooltip\n/use item:176443")

			elseif instanceType == "pvp" and bags(138488) >= 1 then -- Saltwater Potion - Battlegrounds only
				macro(30, "#showtooltip\n/use item:138488")

			elseif instance == "Blackwing Descent Scenario" and bags(172072) >= 1 then -- Experimental Vial - Ashjra'kamas scenario only
				macro(30, "#showtooltip\n/use item:172072")

			elseif level >= 61 and bags(191914) >= 1 then -- Fleeting Elemental Potion of Ultimate Power ◆◆◆
				macro(30, "#showtooltip\n/use item:191914")

			elseif level >= 61 and bags(191913) >= 1 then -- Fleeting Elemental Potion of Ultimate Power ◆◆
				macro(30, "#showtooltip\n/use item:191913")

			elseif level >= 61 and bags(191912) >= 1 then -- Fleeting Elemental Potion of Ultimate Power ◆
				macro(30, "#showtooltip\n/use item:191912")

			elseif level >= 61 and bags(191383) >= 1 then -- Elemental Potion of Ultimate Power ◆◆◆
				macro(30, "#showtooltip\n/use item:191383")

			elseif level >= 61 and bags(191382) >= 1 then -- Elemental Potion of Ultimate Power ◆◆
				macro(30, "#showtooltip\n/use item:191382")

			elseif level >= 61 and bags(191381) >= 1 then -- Elemental Potion of Ultimate Power ◆
				macro(30, "#showtooltip\n/use item:191381")

			elseif level >= 61 and bags(191907) >= 1 then -- Fleeting Elemental Potion of Power ◆◆◆
				macro(30, "#showtooltip\n/use item:191907")

			elseif level >= 61 and bags(191906) >= 1 then -- Fleeting Elemental Potion of Power ◆◆
				macro(30, "#showtooltip\n/use item:191906")

			elseif level >= 61 and bags(191905) >= 1 then -- Fleeting Elemental Potion of Power ◆
				macro(30, "#showtooltip\n/use item:191905")

			elseif level >= 61 and bags(191389) >= 1 then -- Elemental Potion of Power ◆◆◆
				macro(30, "#showtooltip\n/use item:191389")

			elseif level >= 61 and bags(191388) >= 1 then -- Elemental Potion of Power ◆◆
				macro(30, "#showtooltip\n/use item:191388")

			elseif level >= 61 and bags(191387) >= 1 then -- Elemental Potion of Power ◆
				macro(30, "#showtooltip\n/use item:191387")

			elseif level >= 51 and primary == "agi" and bags(171270) >= 1 then -- Potion of Spectral Agility
				macro(30, "#showtooltip\n/use item:171270")

			elseif level >= 51 and primary == "int" and bags(171273) >= 1 then -- Potion of Spectral Intellect
				macro(30, "#showtooltip\n/use item:171273")

			elseif level >= 51 and primary == "str" and bags(171275) >= 1 then -- Potion of Spectral Strength
				macro(30, "#showtooltip\n/use item:171275")

			elseif level >= 51 and role == "HEALER" and bags(171350) >= 1 then -- Potion of Divine Awakening
				macro(30, "#showtooltip\n/use item:171350")

			elseif level >= 51 and bags(171349) >= 1 then -- Potion of Phantom Fire
				macro(30, "#showtooltip\n/use item:171349")

			elseif level >= 51 and bags(171352) >= 1 then -- Potion of Empowered Exorcisms
				macro(30, "#showtooltip\n/use item:171352")

			elseif level >= 51 and bags(171351) >= 1 then -- Potion of Dethly Fixation
				macro(30, "#showtooltip\n/use item:171351")

			elseif level >= 35 and primary == "agi" and bags(109217) >= 1 then -- Draenic Agility Potion
				macro(30, "#showtooltip\n/use item:109217")

			elseif level >= 35 and primary == "int" and bags(109218) >= 1 then -- Draenic Intellect Potion
				macro(30, "#showtooltip\n/use item:109218")

			elseif level >= 35 and primary == "str" and bags(109219) >= 1 then -- Draenic Strength Potion
				macro(30, "#showtooltip\n/use item:109219")

			elseif level >= 40 and bags(142117) >= 1 then -- Potion of Prolonged Power
				macro(30, "#showtooltip\n/use item:142117")

			elseif level >= 35 and bags(109220) >= 1 then -- Draenic Versatility Potion
				macro(30, "#showtooltip\n/use item:109220")

			else -- No Potion Available
				macro(30, "#showtooltip\n/use Fleeting Elemental Potion of Power", 132380)
			end

			-- Bloodlust (41)
			if class == "SHAMAN" and faction == "Horde" and level >= 48 then -- Bloodlust (48)
				macro(41, "#showtooltip\n/use Bloodlust")

			elseif class == "SHAMAN" and level >= 48 then -- Heroism (48)
				macro(41, "#showtooltip\n/use Heroism")

			elseif class == "HUNTER" and level >= 28 then -- Primal Rage (28)
				macro(41, "#showtooltip\n/use Primal Rage")

			elseif class == "MAGE" and level >= 49 then -- Time Warp (49)
				macro(41, "#showtooltip\n/use Time Warp")

			elseif class == "EVOKER" and level >= 60 then -- Fury of the Aspects (60)
				macro(41, "#showtooltip\n/use Fury of the Aspects")

			else
				if bags(193470) >= 1 and level >= 61 then -- Feral Hide Drums
					macro(41, "#showtooltip\n/use item:193470")

				elseif bags(172233) >= 1 and level <= 60 then -- Drums of Deathly Ferocity
					macro(41, "#showtooltip\n/use item:172233")

				elseif bags(154167) >= 1 and level <= 50 then -- Drums of the Maelstrom
					macro(41, "#showtooltip\n/use item:154167")

				elseif bags(142406) >= 1 and level <= 50 then -- Drums of the Mountain
					macro(41, "#showtooltip\n/use item:142406")

				elseif bags(102351) >= 1 and level <= 50 then -- Drums of Rage
					macro(41, "#showtooltip\n/use item:102351")

				elseif level >= 61 then -- No Drums Available
					macro(41, "#showtooltip\n/use item:193470")
				else -- No Drums Available
					macro(41, "#showtooltip\n/use item:142406")
				end
			end
		end

		if event ~= "BAG_UPDATE" then
			-- Content Abilities
			if level >= 20 and instanceType == "arena" or instanceType == "pvp" or C_PvP.IsWarModeActive() or (C_PvP.IsWarModeDesired() and ((instance == "Kalimdor" and zone == "Orgrimmar") or (instance == "Eastern Kingdoms" and zone == "Stormwind City") or zone == "Valdrakken")) then
				-- War Mode
				local pvp1, pvp2, pvp3 = false, false, false

				for i, id in pairs(C_SpecializationInfo.GetAllSelectedPvpTalentIDs()) do
					local _, name, _, _, spellId = GetPvpTalentInfoByID(id)
					local suffix = "(PvP Talent)"
					if name == "Spirit of the Redeemer" then name = "Spirit of Redemption" end
					if name == "Dream Projection" then suffix = "" end
					macro((i == 1) and 32 or (i == 2) and 33 or 34, "#showtooltip\n/use " .. (name or "")..suffix)
				end
			elseif instance == "The Shadowlands" or instance == "Torghast" or IsInJailersTower() then
				-- Covenant Class Ability
				if class == "DEATHKNIGHT" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Shackle the Unworthy;[known:Fleshcraft]Abomination Limb;[known:Door of Shadows]Swarming Mist")
				elseif class == "DEMONHUNTER" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Elysian Decree;[known:Soulshape]The Hunt;[known:Door of Shadows]Sinful Brand")
				elseif class == "DRUID" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Kindred Spirits;[known:Fleshcraft]Adaptive Swarm;[known:Soulshape]Convoke the Spirits;[known:Door of Shadows]Ravenous Frenzy")
				elseif class == "HUNTER" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Resonating Arrow;[known:Fleshcraft]Death Chakram;[known:Soulshape]Wild Spirits;[known:Door of Shadows]Flayed Shot")
				elseif class == "MAGE" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Radiant Spark;[known:Fleshcraft]Deathborne;[known:Soulshape]Shifting Power;[known:Door of Shadows]Mirrors of Torment")
				elseif class == "MONK" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Weapons of Order;[known:Fleshcraft]Bonedust Brew;[known:Soulshape]Faeline Stomp;[known:Door of Shadows]Fallen Order")
				elseif class == "PALADIN" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Divine Toll;[known:Fleshcraft]Vanquisher's Hammer;[known:Soulshape]Blessing of Summer;[known:Door of Shadows]Ashen Hallow")
				elseif class == "PRIEST" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Boon of the Ascended;[known:Fleshcraft]Unholy Nova;[known:Soulshape]Fae Guardians;[known:Door of Shadows]Mindgames")
				elseif class == "ROGUE" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Echoing Reprimand;[known:Fleshcraft]Serrated Bone Spike;[known:Soulshape]Sepsis;[known:Door of Shadows]Flagellation")
				elseif class == "SHAMAN" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Vesper Totem;[known:Fleshcraft]Primordial Wave;[known:Soulshape]Fae Transfusion;[known:Door of Shadows]Chain Harvest")
				elseif class == "WARLOCK" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Scouring Tithe;[known:Fleshcraft]Decimating Bolt;[known:Soulshape]Soul Rot;[known:Door of Shadows]Impending Catastrophe")
				elseif class == "WARRIOR" then
					macro(32, "#showtooltip\n/use [known:Summon Steward]Spear of Bastion;[known:Fleshcraft]Conqueror's Banner;[known:Soulshape]Ancient Aftershock")
				else
					macro(32, "#showtooltip\n/use [known:Boon of the Covenants]Boon of the Covenants")
				end

				-- Covenant Ability
				macro(33, "#showtooltip\n/use [known:Summon Steward]Summon Steward;[known:Fleshcraft]Fleshcraft;[known:Soulshape]Soulshape;[known:Door of Shadows]Door of Shadows")
				macro(34, "#showtooltip\n/use Phial of Serenity", 463534)
			else
				-- Heart of Azeroth
				macro(32, "#showtooltip\n/use Heart Essence")
			end

			-- Zone Abilities
			-- 31 = .
			-- 35 = -
			if level < 60 then
				--macro(31, "/inv Flop-Ravenholdt\n/inv Flopping-Ravenholdt\n/pr Flop-Ravenholdt\n/pr Flopping-Ravenholdt", 975738)
				--macro(35, "/tar Flop\n/follow", 975738)
				macro(35, "/tar Leo\n/follow", 975738)
			elseif instance == "Eastern Kingdoms" and zone == "Dun Morogh" then
				macro(31, "/targetexact Stolen Ram\n/whistle\n/targetlasttarget", 132161)
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Kalimdor" and zone == "Azshara" and faction == "Horde" then
				macro(31, "#showtooltip\n/use Polymorph Insect", 294474)
				macro(35, "#showtooltip\n/use Return to Camp", 135750)
			elseif instance == "Pandaria" and zone == "Kun-Lai Summit" and class == "MONK" then
				macro(31, "/bow", 572034)
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Draenor" then
				macro(31, "#showtooltip\n/use Garrison Ability")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Argus" then
				macro(31, "#showtooltip\n/use Vindicaar Matrix Crystal")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif (instance == "Horrific Vision of Orgrimmar" or instance == "Horrific Vision of Stormwind") and IsSpellKnown(314955) then
				macro(31, "#showtooltip\n/use Sanity Restoration Orb")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Vision of the Twisting Sands" or instance == "Vale of Eternal Twilight" then
				macro(31, "#showtooltip\n/use Resilient Soul", 458722)
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif IsInJailersTower() then
				macro(31, "#showtooltip\n/use Activate Empowerment")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Torghast" then
				-- Torghast: Layer 1 spam
				-- /run C_GossipInfo.SelectOption(TorghastLevelPickerFrame.currentSelectedButton.index)
				macro(31, "/run C_GossipInfo.SelectOption(1)", 4062765)
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "The Shadowlands" and covenant == 4 then
				macro(31, "#showtooltip\n/use Construct Ability") -- Necrolord only
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Zereth Mortis" then
				macro(31, "#showtooltip\n/use Summon Pocopoc")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "Northrend" then
				macro(31, "/run ProfessionsFrame.CraftingPage.CreateButton:Click()\n/use 6\n/click StaticPopup1Button1")
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			elseif instance == "10.0 Dragon Isles" or instance == "Dragon Isles" then
				if zone == "Ohn'ahran Plains" and C_TaskQuest.IsActive(70549) then
					macro(31, "#showtooltip Simple Shot\n/tar Honey Plum\n/click ExtraActionButton1")
				else
					macro(31, "#showtooltip\n/use Blessing of Ohn'ara")
				end
				macro(35, "#showtooltip\n/use Hunting Companion")
			else -- Fallback
				macro(31, "#showtooltip\n/use Garrison Ability", 975738)
				macro(35, "#showtooltip\n/use Garrison Ability", 975738)
			end


			-- Zone Utility
			local mL, mSL, mCL = nil, nil, nil
			if instance == "Pandaria" then
				if zone == "Timeless Isle" then
					mL = "#showtooltip\n/use Ash-Covered Horn"
				end
				mSL = "#showtooltip\n/use Battle Horn"
				mCL = "#showtooltip\n/use Salyin Battle Banner"
			elseif instance == "Draenor" then
				mL = "#showtooltip\n/use Spirit of Shinri"
				mSL = "#showtooltip\n/use Aviana's Feather"
				mCL = "#showtooltip\n/use Treessassin's Guise"
			elseif instance == "Argus" then
				mL = "#showtooltip\n/use Baarut the Brisk"
			elseif instance == "The Broken Isles" then
				mSL = "#showtooltip\n/use Emerald Winds"
				-- Rocfeather Skyhorn Kite?
			elseif instance == "The Shadowlands" then
				mL = "#showtooltip\n/use Silver Shardhide Whistle"
			elseif instance == "Zaralek Cavern" then
				mL = "#showtooltip\n/use Niffen Diggin' Mitts"
			end

			macro(36, mL or "", (not mL) and 975738 or nil)
			macro(37, mSL or "", (not mSL) and 975738 or nil)
			macro(38, mCL or "", (not mCL) and 975738 or nil)


			-- Mounts
			local z, m, mA, mP = GetZoneText(), "", "", ""
			local mountType, preferAquatic, overrideMount, dragonriding = "", false, false, false

			local ground = Automagic.Characters["defaults"]["ground"]
			local flying = Automagic.Characters["defaults"]["flying"]
			local dragon = Automagic.Characters["defaults"]["dragon"]
			local aquatic = Automagic.Characters["defaults"]["aquatic"]
			local passenger = Automagic.Characters["defaults"]["passenger"]
			local hs = (covenant == 1) and "Kyrian Hearthstone" or (covenant == 2) and "Venthyr Sinstone" or (covenant == 3) and "Night Fae Hearthstone" or (covenant == 4) and "Necrolord Hearthstone" or Automagic.Characters["defaults"]["hs"]
			local mailbox = Automagic.Characters["defaults"]["mailbox"]
			local pets = nil

			if Automagic.Characters[name.."-"..realm] or Automagic.Characters[name] then
				local c = Automagic.Characters[name.."-"..realm] or Automagic.Characters[name]

				if c["flying:"..spec] or c["flying"] then
					flying = c["flying:"..spec] or c["flying"]
					ground = flying
				end
				if c["dragon:"..spec] or c["dragon"] then
					dragon = c["dragon:"..spec] or c["dragon"]
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
				if c["mailbox:"..spec] or c["mailbox"] then
					mailbox = c["mailbox:"..spec] or c["mailbox"]
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

			-- Dragonriding Mounts
			local pieces = { strsplit("|", dragon) }

			if #pieces == 1 then
				dragon = "/use [nomounted]" .. strtrim(pieces[1])
			else
				dragon = "/userandom [nomounted]"
				for i = 1, #pieces do
					if i > 1 then dragon = dragon .. "," end
					dragon = dragon .. strtrim(pieces[i])
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
			if instance == "The Deaths of Chromie" or instance == "Tirisfal Glades" then
				mountType = "flying" -- Force flying in the Deaths of Chromie scenario/Tirisfal Glades Artifact scenario
			elseif instance == "Torghast, Tower of the Damned" then
				overrideMount = "/use Mawrat Harness" -- Mawrat Harness is the only "mount" that is useable inside Torghast
			elseif (z == "The Maw" or z == "Korthia") and class ~= "DRUID" and not C_QuestLog.IsQuestFlaggedCompleted(63994) then
				overrideMount = "/use [nomounted]Corridor Creeper" -- The Maw
			elseif IsSpellKnown(34090) or IsSpellKnown(34091) or IsSpellKnown(90265) then -- Expert, Artisan, Master Riding
				mountType = "flying" -- We can use flying mounts

				if (instanceType ~= "none" and not garrisonId[mapID]) or groundAreas[z] or groundAreas[instance] then
					-- We can't fly inside instances, except Draenor Garrisons and The Deaths of Chromie
					-- Flying is also disabled in certain outdoor areas/zones
					mountType = "ground"
				end
			elseif IsSpellKnown(33388) or IsSpellKnown(33391) then -- Apprentice or Journeyman Riding
				-- We can use ground mounts
				mountType = "ground"
			end

			-- Dragonriding
			if IsSpellKnown(376777) and (dragonAreas[instance] or dragonAreas[z]) then
				dragonriding = true
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
				if C_QuestLog.IsQuestFlaggedCompleted(56766) then -- Budding Deepcoral learned
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
			if dragonriding then
				macro(7, dragon .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, aquatic .. "\n/dismount [mounted]\n/leavevehicle", 413588)
			elseif class == "DRUID" then
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

			-- Mailbox
			macro(40, "#showtooltip\n/use " .. mailbox)

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