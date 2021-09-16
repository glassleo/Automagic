local A = Automagic or {}
local gr, fl, aq, su, pa, hs, co = {}, {}, {}, {}, {}, {}, {}
local throttled = {}

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
	-- Argus
	["Krokuun"] = true,
	["Antoran Wastes"] = true,
	["Mac'Aree"] = true, -- Removed in 9.1.5?
	["Eredath"] = true,
	["Invasion Points"] = true,
	-- Battle for Azeroth
	["8.1 Darkshore Alliance Quests"] = true, -- Darkshore Unlock Scenario
	["8.1 Darkshore Horde Quests"] = true, -- Darkshore Unlock Scenario
	["Mechagon City"] = true,
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

		-- Reply to Message
		SetBinding("<", "REPLY")
		SetBinding("SHIFT-<", "REPLY2")

		-- Belt
		SetBindingMacro("=", "G002")
		SetBindingMacro("NUMPADEQUALS", "G002")
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

		-- Dismiss Companion
		macro(12, "/dismisspet", 132599)

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
	end
end


local function eventHandler(self, event)
	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		frame:UnregisterEvent("PLAYER_REGEN_ENABLED")

		if event ~= "PLAYER_REGEN_ENABLED" and throttled[event] then
			return
		else
			throttled[event] = true
			C_Timer.After(1, function()
				throttled[event] = false

				if event ~= "BAG_UPDATE" and event ~= "LEARNED_SPELL_IN_TAB" then
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


			if event ~= "LEARNED_SPELL_IN_TAB" and event ~= "PLAYER_REGEN_ENABLED" then
				-- Replace Global Macros
				for i = 1, 120 do
					if GetMacroBody(i) then
						EditMacro(i, string.format("G%03d", i), "INV_MISC_QUESTIONMARK", "", 1, 1)
					else
						CreateMacro(string.format("G%03d", i), "INV_MISC_QUESTIONMARK", "", nil)
					end
				end
			
				BuildGlobalMacros()
				SetGlobalBinds()
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
			elseif primary == "int" and bags("Potion of Unbridled Fury") >= 1 then
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

			-- Signature Ability
			if bags("Phial of Serenity") >= 1 then
				macro(32, "#showtooltip\n/use Phial of Serenity")
			else
				macro(32, "#showtooltip\n/use Summon Steward")
			end

			-- Hunter Pet
			if class == "HUNTER" then
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
					["Goat"] = "Gruff",
					["Gorilla"] = "Silverback",
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

					if ZA and ZA.PetIcons then
						macro(macroID, "#showtooltip\n#icon " .. (ZA.PetIcons[petName] or petIcon or 132161) .. "\n/use Call Pet " .. i, ZA.PetIcons[petName] or petIcon or 132161)
					end
				end

				petAbilityMacro = petAbilityMacro .. "Tame Beast"
				petExoticMacro = petExoticMacro .. "Tame Beast"

				macro(19, petAbilityMacro)
				macro(20, petExoticMacro)
			end
		end

		if event ~= "BAG_UPDATE" then
			-- UI Stuff
			--UIWidgetTopCenterContainerFrame:ClearAllPoints()
			--UIWidgetTopCenterContainerFrame:SetPoint("CENTER", 0, 400)

			-- Mounts
			local z, m, mA, mP = GetZoneText(), "", "", ""
			local mountType, preferAquatic, overrideMount = "", false, false

			local ground = A.Characters["defaults"]["ground"]
			local flying = A.Characters["defaults"]["flying"]
			local aquatic = A.Characters["defaults"]["aquatic"]
			local passenger = A.Characters["defaults"]["passenger"]
			local hs = (covenant == 1) and "Kyrian Hearthstone" or (covenant == 2) and "Venthyr Sinstone" or (covenant == 3) and "Night Fae Hearthstone" or (covenant == 4) and "Necrolord Hearthstone" or A.Characters["defaults"]["hs"]
			local pets = nil

			if A.Characters[name.."-"..realm] or A.Characters[name] then
				local c = A.Characters[name.."-"..realm] or A.Characters[name]

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