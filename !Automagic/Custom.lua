Automagic = {}
local faction = UnitFactionGroup("player")


-- Character Data
--
--   Mounts:
--		"ground" - Ground Mount(s)
--		"flying" - Flying Mount(s)
--		"aquatic" - Aquatic Mount(s)
--		"passenger" - Passenger Mount(s)
--
--   Toys:
--		"hs" - Hearthstone Toy
--
--   Companion Pets:
--		"pets" - Companion Pet(s)
--
-- Character names can be either just the name ("Bob") or include realm ("Bob-Earthen Ring")
--
-- For spec specific entries, suffix : and spec number (example: "flying:2" for the second spec)
-- Spec specific entries are always prioritized first
-- Separate multiple items with | for random selection
--
-- If ground mount is omitted but flying mount is not, the flying mount will be used as ground mount
-- In other cases default substitutes will be used


Automagic.Characters = {
	-- Defaults
	["defaults"] = {
		["ground"] = (faction == "Alliance") and "Mountain Horse" or "Trained Snarler", -- Smoky Direwolf
		["flying"] = (faction == "Alliance") and "Grand Gryphon" or "Grand Wyvern",
		["aquatic"] = "Subdued Seahorse",
		["passenger"] = "X-53 Touring Rocket",
		["hs"] = "Tome of Town Portal", -- Replaced by Covenant Hearthstone if available
	},

	-- Alliance
	["Aero"] = { ["ground"] = "Pureheart Courser", ["flying"] = "Cloudwing Hippogryph", },
	["Agon"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "High Priest's Lightsworn Seeker", },
	["Aldous"] = { ["ground"] = "Prestigious Ivory Courser", ["flying"] = "Cloudwing Hippogryph", },
	["Aleksandr"] = { ["ground"] = "Vicious War Elekk", ["flying"] = "Vibrant Mana Ray", },
	["Altair"] = { ["ground"] = "Prestigious Forest Courser", ["flying"] = "Shadowblade's Baneful Omen", },
	["Andrew"] = { ["ground"] = "Blackpaw", ["flying"] = "Alabaster Stormtalon", },
	["Arnald"] = { ["ground"] = "Highlord's Vigilant Charger", ["flying"] = "Grand Armored Gryphon", },
	["Asami"] = { ["ground"] = "Regal Riding Crane", ["flying"] = "Rajani Warserpent", },
	["Aska"] = { ["ground"] = "Summon Darkforge Ram", ["flying"] = "Pureblood Fire Hawk", },
	["Asteria"] = { ["ground"] = "Priestess' Moonsaber", ["flying"] = "Teldrassil Hippogryph", },
	["Auros"] = { ["ground"] = "Glorious Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Ava"] = { ["ground"] = "Umber Ruinstrider", ["flying"] = "Gilded Prowler", },
	["Beans"] = {},
	["Berg"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Alabaster Stormtalon", },
	["Beryl"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Shadowbarb Drone", },
	["Betty"] = { ["ground"] = "Mechagon Mechanostrider", ["flying"] = "Mimiron's Head", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Björn"] = { ["ground"] = "Blackpaw", },
	["Blanc"] = { ["ground"] = "Lucid Nightmare", },
	["Brigitte"] = { ["ground"] = "Seabraid Stallion", },
	["Britney"] = { ["ground"] = "Swift Mountain Horse", ["flying"] = "Shadowbarb Drone", },
	["Brock"] = { ["ground"] = "Kul Tiran Charger", ["flying"] = "Proudmoore Sea Scout", },
	["Bruce"] = { ["ground"] = "Regal Riding Crane", ["flying"] = "Azure Cloud Serpent", },
	["Castor"] = { ["ground"] = "Vicious Kaldorei Warsaber", ["flying"] = "Teldrassil Hippogryph", },
	["Chow"] = { ["ground"] = "Blue Shado-Pan Riding Tiger", },
	["Claire"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Proudmoore Sea Scout", },
	["Claw"] = {},
	["Coeus"] = { ["ground"] = "Kaldorei Nightsaber", ["flying"] = "Silver Covenant Hippogryph", },
	["Cordelia"] = { ["ground"] = "Black Riding Goat", },
	["Debbie"] = { ["flying"] = "Mystic Runesaber", },
	["Desmond"] = { ["ground"] = "Starcursed Voidstrider", ["flying"] = "Uncorrupted Voidwing", },
	["Dreki"] = { ["ground"] = "Core Hound", ["flying:3"] = "Corrupted Fire Hawk", ["flying"] = "Pureblood Fire Hawk", },
	["Ed"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Rustbolt Resistor", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Edith"] = { ["ground"] = "Dapple Gray", ["flying"] = "Stormsong Coastwatcher", },
	["Eld"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Fire Eater's Hearthstone", },
	["Elise"] = { ["ground"] = "White Riding Goat", ["flying"] = "Leyfeather Hippogryph", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Ellika"] = { ["ground"] = "Beryl Ruinstrider", ["flying"] = "Ankoan Waveray", },
	["Elsa"] = { ["ground"] = "Summon Darkforge Ram", },
	["Eric"] = { ["ground"] = "Rocktusk Battleboar", ["flying"] = "Honeyback Harvester", },
	["Erika"] = {},
	["Eris"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Errol"] = { ["flying"] = "Grove Warden", ["hs"] = "Lunar Elder's Hearthstone", },
	["Ethan"] = { ["ground"] = "Vicious War Fox", ["flying"] = "Armored Blue Dragonhawk", },
	["Evie"] = { ["ground"] = "Swift Zulian Panther", ["flying"] = "Teldrassil Hippogryph", },
	["Fax"] = { ["ground"] = "Explorer's Dunetrekker", ["flying"] = "Explorer's Jungle Hopper", },
	["Fix"] = { ["ground"] = "Ratstallion", },
	["Flor"] = { ["hs"] = "Noble Gardener's Hearthstone", },
	["Floyd"] = { ["ground"] = "Vicious War Bear", ["flying"] = "Stormsong Coastwatcher", ["hs"] = "Tome of Town Portal", },
	["Frank"] = { ["flying"] = "Netherlord's Chaotic Wrathsteed", },
	["Frid"] = {},
	["Fuzz"] = { ["hs"] = "Lunar Elder's Hearthstone", },
	["Ghost"] = { ["ground"] = "Running Wild", },
	["Gloria"] = { ["ground"] = "Lightforged Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Gnarl"] = {},
	["Grace"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "High Priest's Lightsworn Seeker", },
	["Grey"] = { ["ground"] = "Vicious Gilnean Warhorse", },
	["Gunnar"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Proudmoore Sea Scout", ["hs"] = "The Innkeeper's Daughter", },
	["Harebrain"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Shadowbarb Drone", },
	["Hart"] = { ["ground"] = "Highlord's Golden Charger", ["flying"] = "Grand Armored Gryphon", },
	["Hazel"] = { ["ground"] = "Azure Riding Crane", },
	["Heather"] = { ["ground"] = "Llothien Prowler", },
	["Hecate"] = { ["ground"] = "Bloodfang Widow", ["flying"] = "Nazjatar Blood Serpent", },
	["Hekla"] = { ["ground"] = "Bristling Hellboar", },
	["Hel"] = { ["ground"] = "Kaldorei Nightsaber", ["flying"] = "Shadowblade's Lethal Omen", },
	["Helena"] = { ["flying"] = "Lightforged Warframe", },
	["Hera"] = { ["ground"] = "Dark Iron Core Hound", ["flying"] = "Dusky Waycrest Gryphon", },
	["Hexan"] = { ["ground"] = "Hellfire Infernal", },
	["Hilda"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Grand Armored Gryphon", },
	["How"] = { ["ground"] = "Green Shado-Pan Riding Tiger", ["flying"] = "Ashen Pandaren Phoenix", },
	["Idunn"] = { ["ground"] = "Dark Iron Core Hound", ["flying"] = "Shadowblade's Crimson Omen", },
	["Ingrid"] = { ["flying"] = "Invincible", },
	["Irene"] = { ["flying"] = "Cindermane Charger", ["hs"] = "Fire Eater's Hearthstone", },
	["Iro"] = { ["ground"] = "Felsaber", ["flying"] = "Cloudwing Hippogryph", },
	["Isak"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "Vibrant Mana Ray", },
	["It"] = { ["ground"] = "Ratstallion", },
	["Ivan"] = { ["ground"] = "Running Wild", ["flying"] = "Obsidian Worldbreaker", },
	["Jack"] = { ["ground"] = "Vicious Gilnean Warhorse", ["flying"] = "Shadowblade's Lethal Omen", },
	["Janet"] = { ["ground"] = "Starcursed Voidstrider", ["flying"] = "Twilight Avenger", },
	["Joe"] = { ["ground"] = "Seabraid Stallion", ["flying"] = "Proudmoore Sea Scout", },
	["Jon"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", },
	["Julie"] = { ["ground"] = "Scrapforged Mechaspider", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Karin"] = { ["ground"] = "Admiralty Stallion", },
	["Karl"] = { ["ground"] = "Blackpaw", ["flying"] = "Proudmoore Sea Scout", },
	["Kathryn"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Dusky Waycrest Gryphon", ["aquatic"] = "Darkwater Skate", },
	["Katya"] = { ["ground"] = "Cerulean Ruinstrider", },
	["Kenneth"] = { ["ground"] = "Lil' Donkey", ["flying"] = "Shadowbarb Drone", },
	["Ki"] = { ["flying"] = "Arcanist's Manasaber", },
	["Kit"] = { ["ground"] = "Argent Charger", },
	["Leaf"] = { ["ground"] = "Wandering Ancient", },
	["Leo-Xavius"] = { ["ground"] = "Highlord's Golden Charger", ["flying"] = "Gilded Prowler", },
	["Liam"] = { ["ground"] = "Goldenmane", ["flying"] = "Violet Spellwing", ["hs"] = "Tome of Town Portal", },
	["Lillian"] = { ["ground"] = "Kul Tiran Charger", },
	["Lisa"] = { ["ground"] = "Goldenmane", ["flying"] = "High Priest's Lightsworn Seeker", },
	["Lua"] = {},
	["Lucas"] = { ["ground"] = "Running Wild", ["flying"] = "Armored Bloodwing", },
	["Ludmila"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "Darkspore Mana Ray", },
	["Mab"] = {},
	["Mak"] = { ["ground"] = "Summon Darkforge Ram", ["flying"] = "Spawn of Galakras", },
	["Malgorzata"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Margaret"] = { ["ground"] = "Kul Tiran Charger", ["flying"] = "Proudmoore Sea Scout", },
	["Maria"] = { ["ground"] = "Cerulean Ruinstrider", ["flying"] = "Vibrant Mana Ray", },
	["Mark"] = { ["ground"] = "Smoky Charger", ["flying"] = "Dusky Waycrest Gryphon", },
	["Mary"] = { ["ground"] = "Crimson Deathcharger", ["flying"] = "Armored Bloodwing", },
	["Matilda"] = { ["ground"] = "Kul Tiran Charger", ["flying"] = "Proudmoore Sea Scout", },
	["Mayhem"] = { ["ground"] = "Vile Fiend", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Medea"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Twilight Drake", },
	["Melissa"] = { ["ground"] = "Prestigious Royal Courser", ["flying"] = "Cobalt Netherwing Drake", },
	["Mikael"] = { ["ground"] = "Summon Great Exarch's Elekk", ["flying"] = "Enchanted Fey Dragon", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Milo"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Stormwind Skychaser", },
	["Minerva"] = { ["ground"] = "Wandering Arden Doe", ["flying"] = "Stormsong Coastwatcher", },
	["Mischa"] = { ["ground"] = "Cerulean Ruinstrider", },
	["Missy"] = { ["ground"] = "Smoky Charger", ["flying"] = "Stormsong Coastwatcher", },
	["Misty"] = {},
	["Monade"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Monica"] = { ["ground"] = "Smoky Charger", },
	["My"] = { ["ground"] = "Hellfire Infernal", },
	["Nancy"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Aerial Unit R-21/X", },
	["Niels"] = { ["ground"] = "Garn Nighthowl", ["flying"] = "Stormsong Coastwatcher", },
	["Nieve"] = { ["ground"] = "Vicious Kaldorei Warsaber", ["flying"] = "Teldrassil Hippogryph", },
	["Nix"] = { ["ground"] = "Netherlord's Chaotic Wrathsteed", ["flying"] = "Black Serpent of N'Zoth", },
	["Nora"] = { ["ground"] = "Core Hound", },
	["Nord"] = { ["ground"] = "Ironbound Wraithcharger", ["flying"] = "Icebound Frostbrood Vanquisher", },
	["Oberon"] = { ["ground"] = "Acherus Deathcharger", ["flying"] = "Black Serpent of N'Zoth", },
	["Oki"] = { ["ground"] = "Bristling Hellboar", },
	["Olivia"] = { ["ground"] = "White Riding Goat", },
	["Ólafur"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Time-Lost Proto-Drake", },
	["Pam"] = { ["ground"] = "Court Sinrunner", },
	["Pang"] = { ["ground"] = "Netherlord's Brimstone Wrathsteed", ["flying"] = "Antoran Charhound", },
	["Parsec"] = { ["ground"] = "Prestigious Royal Courser", ["flying"] = "Onyx Netherwing Drake", },
	["Pavla"] = { ["ground"] = "Shadowhide Pearltusk", ["flying"] = "Farseer's Raging Tempest", },
	["Penelope"] = { ["flying"] = "Ban-Lu, Grandmaster's Companion", },
	["Peppermint"] = { ["flying"] = "Hogrus, Swine of Good Fortune", },
	["Phoebe"] = { ["flying"] = "Priestess' Moonsaber", ["hs"] = "Lunar Elder's Hearthstone", },
	["Prue"] = { ["ground"] = "Dapple Gray", ["flying"] = "Glacial Tidestorm", },
	["Ravioli"] = { ["ground"] = "Vicious War Mechanostrider", ["flying"] = "Mimiron's Head", },
	["Rex"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Rose"] = { ["ground"] = "Smoky Charger", },
	["Ruth"] = {},
	["Sacha"] = { ["ground"] = "Blessed Felcrusher", ["flying"] = "Enchanted Fey Dragon", },
	["Sam"] = { ["ground"] = "Vicious War Elekk", ["flying"] = "Violet Netherwing Drake", },
	["Selma"] = { ["ground"] = "Stormpike Battle Ram", ["flying"] = "Valarjar Stormwing", ["hs"] = "Brewfest Reveler's Hearthstone", },
	["Shanna"] = { ["ground"] = "Admiralty Stallion", },
	["Sharaya"] = { ["ground"] = "Lucid Nightmare", },
	["Sigurd"] = { ["ground"] = "Blackpaw", },
	["Simeon"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Grand Gryphon", },
	["Sinikka"] = { ["ground"] = "Bristling Hellboar", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Sistine"] = { ["ground"] = "Kaldorei Nightsaber", },
	["Skuggi"] = { ["ground"] = "Midnight", ["flying"] = "Malevolent Drone", },
	["Song"] = { ["ground"] = "Bruce", ["flying"] = "Pandaren Kite", },
	["Sonya"] = { ["ground"] = "Summon Dawnforge Ram", },
	["Sook"] = { ["ground"] = "Golden Riding Crane", ["flying:3"] = "Onyx Cloud Serpent", ["flying"] = "Heavenly Golden Cloud Serpent", },
	["Spark"] = { ["ground"] = "Stormpike Battle Ram", },
	["Steve"] = { ["flying"] = "Warforged Nightmare", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Sun"] = { ["ground"] = "Vicious War Turtle", ["flying"] = "Yu'lei, Daughter of Jade", },
	["Susie"] = { ["ground"] = "Highlord's Vengeful Charger", },
	["Suzanne"] = { ["ground"] = "Black Riding Goat", ["flying"] = "Siltwing Albatross", },
	["Tek"] = { ["ground"] = "Blessed Felcrusher", ["flying"] = "Vibrant Mana Ray", },
	["Tor"] = { ["ground"] = "Beastlord's Warwolf", ["hs"] = "The Innkeeper's Daughter", },
	["Torunn"] = { ["ground"] = "Stormpike Battle Ram", ["flying"] = "Battlelord's Bloodthirsty War Wyrm", },
	["Tracyanne"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Grand Gryphon", ["hs"] = "The Innkeeper's Daughter", },
	["Ty"] = { ["ground"] = "Gnomeregan Mechanostrider", ["flying"] = "Mimiron's Head", },
	["Vack"] = { ["ground"] = "Running Wild", ["flying"] = "Witherbark Direwing", ["aquatic"] = "Fathom Dweller", },
	["Vevica"] = { ["ground"] = "Vicious War Elekk", ["flying"] = "Darkspore Mana Ray", },
	["Vidalia"] = { ["ground"] = "Ratstallion", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Vidar"] = { ["ground"] = "Vicious War Ram", },
	["Vigg"] = { ["ground"] = "Umber Nightsaber", ["flying"] = "Teldrassil Hippogryph", },
	["Vilma"] = { ["ground"] = "Ratstallion", ["flying"] = "Shadowblade's Crimson Omen", },
	["Violaine"] = { ["ground"] = "Umber Nightsaber", ["flying"] = "Teldrassil Hippogryph", ["aquatic"] = "Saltwater Seahorse", },
	["Violet"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Uncorrupted Voidwing", },
	["Visp"] = { ["ground"] = "Running Wild", ["flying"] = "Onyx Netherwing Drake", },
	["Wane"] = { ["ground"] = "Vile Fiend", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Wax"] = { ["ground"] = "Sandy Nightsaber", ["flying"] = "Honeyback Harvester", },
	["Wes"] = { ["ground"] = "Black Riding Goat", ["flying"] = "Steamscale Incinerator", },
	["Will"] = { ["ground"] = "Dapple Gray", ["flying"] = "Stormsong Coastwatcher", },
	["Wu"] = { ["ground"] = "Ban-Lu, Grandmaster's Companion", ["flying"] = "Thundering Jade Cloud Serpent", },
	["Yessica"] = { ["ground"] = "Beryl Ruinstrider", ["flying"] = "Enchanted Fey Dragon", },
	["Yulia"] = { ["ground"] = "Bleakhoof Ruinstrider", ["flying"] = "Felglow Mana Ray", },
	["Zip"] = { ["flying"] = "Luminous Starseeker", },

	-- Horde
	["Agata"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Witherbark Direwing", },
	["Agnes"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Aguna"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Violet Netherwing Drake", ["hs"] = "Lunar Elder's Hearthstone", },
	["Aip"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Battlelord's Bloodthirsty War Wyrm", },
	["Aiu"] = { ["ground"] = "Summon Great Sunwalker Kodo", },
	["Aka"] = { ["ground"] = "Highmountain Thunderhoof", ["flying"] = "Clutch of Ji-Kun", },
	["Akasia"] = { ["ground"] = "Wandering Ancient", },
	["Ako"] = { ["flying"] = "Grove Warden", },
	["Alce"] = { ["flying"] = "Grove Warden", },
	["Alec"] = { ["ground"] = "Nightborne Manasaber", },
	["Aluni"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Voldunai Dunescraper", },
	["Anna"] = { ["ground"] = "Highmountain Thunderhoof", ["flying:3"] = "Farseer's Raging Tempest", ["flying"] = "Vitreous Stone Drake", },
	["Ao"] = { ["ground"] = "Trained Icehoof", ["flying"] = "Icebound Frostbrood Vanquisher", },
	["Ap"] = { ["ground"] = "Highmountain Elderhorn", ["flying"] = "Huntmaster's Loyal Wolfhawk", },
	["Apera"] = { ["ground"] = "Highmountain Elderhorn", ["flying"] = "Huntmaster's Loyal Wolfhawk", },
	["Aponi"] = { ["flying"] = "Spirit of Eche'ro", },
	["Appi"] = { ["ground"] = "Highmountain Thunderhoof", ["flying"] = "Huntmaster's Dire Wolfhawk", },
	["Art"] = { ["ground"] = "Arcanist's Manasaber", ["flying"] = "Violet Spellwing", ["hs"] = "Tome of Town Portal", },
	["Astra"] = { ["ground"] = "Pureheart Courser", ["flying:1"] = "High Priest's Lightsworn Seeker", ["flying"] = "Long-Forgotten Hippogryph", ["hs"] = "Lunar Elder's Hearthstone", },
	["Ax"] = { ["ground"] = "Primal Flamesaber", ["flying"] = "Sunreaver Dragonhawk", ["hs"] = "Tome of Town Portal", },
	["Azela"] = { ["ground"] = "Black Primal Raptor", ["flying"] = "Cobalt Pterrordax", },
	["Bab"] = { ["ground"] = "Midnight", ["flying"] = "Smoldering Ember Wyrm", },
	["Bess"] = { ["ground"] = "Summon Great Sunwalker Kodo", ["flying"] = "Clutch of Ji-Kun", },
	["Bite"] = {},
	["Bones"] = { ["ground"] = "Vile Fiend", ["flying"] = "Malevolent Drone", },
	["Bonk"] = { ["ground"] = "Gilded Ravasaur", ["flying"] = "Captured Swampstalker", },
	["Boom"] = { ["ground"] = "Arcadian War Turtle", ["flying"] = "Depleted-Kyparium Rocket", },
	["Bree"] = {},
	["Bryan"] = { ["ground"] = "Mollie", ["flying"] = "Farseer's Raging Tempest", },
	["Byrne"] = { ["ground"] = "Netherlord's Brimstone Wrathsteed", ["flying"] = "Antoran Charhound", },
	["Cafuné"] = { ["flying"] = "Grove Warden", },
	["Cain"] = { ["ground"] = "Pureheart Courser", ["flying"] = "Sunreaver Dragonhawk", },
	["Camilla"] = { ["ground"] = "Midnight", ["flying"] = "Expedition Bloodswarmer", },
	["Carolyn"] = { ["ground"] = "Violet Raptor", ["flying"] = "Armored Skyscreamer", },
	["Carrie"] = { ["ground"] = "Mollie", ["flying"] = "High Priest's Lightsworn Seeker", },
	["Cassiopeia"] = { ["flying"] = "Arcanist's Manasaber", },
	["Celeste"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Arcanist's Manasaber", },
	["Ceri"] = { ["ground"] = "Regal Riding Crane", },
	["Chai"] = { ["ground"] = "Swift Lovebird", ["flying"] = "Heavenly Crimson Cloud Serpent", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Colette"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Eclipse Dragonhawk", },
	["Cosmia"] = { ["flying"] = "Arcanist's Manasaber", },
	["Daka"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Grand Armored Wyvern", },
	["Desna"] = { ["ground"] = "Frostwolf Snarler", ["flying"] = "Grand Armored Wyvern", },
	["Dia"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Ashenvale Chimaera", ["aquatic"] = "Fathom Dweller", ["hs"] = "Lunar Elder's Hearthstone", },
	["Echo"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Armored Skyscreamer", },
	["Edna"] = { ["flying"] = "Ironbound Wraithcharger", },
	["Elan"] = { ["ground"] = "Thunder Bluff Kodo", ["flying"] = "Farseer's Raging Tempest", },
	["Ella"] = { ["ground"] = "Great Green Dragon Turtle", ["flying"] = "Ashen Pandaren Phoenix", },
	["Elspeth"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Emily"] = { ["flying"] = "Highlord's Vengeful Charger", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Enna"] = { ["ground"] = "Armored Plaguerot Tauralus", ["flying"] = "Yu'lei, Daughter of Jade", },
	["Eo"] = { ["ground"] = "Highlord's Vengeful Charger", ["flying"] = "Armored Red Dragonhawk", ["aquatic"] = "Crimson Tidestallion", },
	["Erin"] = { ["flying"] = "Highlord's Golden Charger", },
	["Eska"] = { ["ground"] = "Swift Frostwolf", ["flying"] = "Grand Armored Wyvern", },
	["Esme"] = { ["ground"] = "Highmountain Thunderhoof", ["flying"] = "Spirit of Eche'ro", },
	["Etu"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Clutch of Ji-Kun", },
	["Ewa"] = {},
	["Felix"] = { ["flyinh"] = "Mystic Runesaber", ["hs"] = "Tome of Town Portal", },
	["Fester"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Flerm"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Volcanic Stone Drake", },
	["Francesca"] = { ["ground"] = "Sundancer", ["flying"] = "Infinite Timereaver", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Tome of Town Portal", },
	["Frango"] = { ["ground"] = "Flametalon of Alysrazor", ["flying"] = "Ashes of Al'ar", ["hs"] = "Fire Eater's Hearthstone", },
	["Fred"] = { ["ground"] = "Mollie", ["flying"] = "Wastewander Skyterror", },
	["Gabriel"] = { ["ground"] = "White Skeletal Warhorse", },
	["Galinha"] = {},
	["Gary"] = { ["ground"] = "Alabaster Hyena", ["flying"] = "Wastewander Skyterror", ["aquatic"] = "Saltwater Seahorse", },
	["Gizzard"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Soaring Skyterror", },
	["Glue"] = { ["ground"] = "Ironside Warwolf", ["flying"] = "Crimson Pandaren Phoenix", },
	["Goom"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Cobalt Pterrordax", },
	["Gorgina"] = { ["ground"] = "Wandering Arden Doe", ["flying"] = "Leyfeather Hippogryph", },
	["Grime"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Iron Skyreaver", },
	["Gruff"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Grand Armored Wyvern", },
	["Guo"] = { ["ground"] = "Blue Shado-Pan Riding Tiger", ["flying"] = "Onyx Cloud Serpent", },
	["Hao"] = { ["ground"] = "Great Blue Dragon Turtle", ["flying"] = "Golden Cloud Serpent", },
	["Hocus"] = { ["ground"] = "Vicious Skeletal Warhorse", },
	["Hye"] = { ["ground"] = "Vile Fiend", ["flying"] = "Malevolent Drone", },
	["Ian"] = { ["ground"] = "Summon Thalassian Charger", ["flying"] = "Gilded Prowler", },
	["Ini"] = { ["ground"] = "Violet Raptor", ["flying"] = "Bloodgorged Hunter", },
	["Ixchel"] = { ["ground"] = "Gilded Ravasaur", ["flying"] = "Cobalt Pterrordax", },
	["Janis"] = { ["ground"] = "Slate Primordial Direhorn", },
	["Jerry"] = { ["ground"] = "Mollie", ["flying"] = "Waste Marauder", },
	["Joana"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Cobalt Pterrordax", },
	["June"] = { ["ground"] = "Springfur Alpaca", },
	["Kala"] = { ["ground"] = "Vicious War Kodo", },
	["Kaplitt"] = { ["ground"] = "Mag'har Direwolf", },
	["Kiasmos"] = { ["ground"] = "Infernal Direwolf", },
	["Kiwi"] = {},
	["Krosh"] = { ["ground"] = "Dustmane Direwolf", ["flying"] = "Alabaster Thunderwing", },
	["Leah"] = { ["ground"] = "Fossilized Raptor", ["flying"] = "Expedition Bloodswarmer", },
	["Leo-Burning Steppes"] = { ["ground"] = "Raven Lord", ["flying"] = "Dread Raven", },
	["Leão"] = {},
	["Lif"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", ["aquatic"] = "Crimson Tidestallion", },
	["Linda"] = { ["ground"] = "Snapback Scuttler", ["flying"] = "Unshackled Waveray", },
	["Ling"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", },
	["Liou"] = { ["flying"] = "Ban-Lu, Grandmaster's Companion", },
	["Liz"] = { ["ground"] = "Vicious War Trike", ["flying"] = "Shadowblade's Baneful Omen", },
	["Luke"] = { ["ground"] = "Vicious War Trike", ["flying"] = "Xiwyllag ATV", },
	["Luna"] = { ["flying"] = "Grove Warden", },
	["Lurch"] = { ["ground"] = "Lurid Bloodtusk", ["flying"] = "Archmage's Prismatic Disc", },
	["Lynn"] = { ["flying"] = "Arcanist's Manasaber", },
	["Magda"] = { ["ground"] = "Netherlord's Accursed Wrathsteed", ["flying"] = "Uncorrupted Voidwing", },
	["Malaclypse"] = { ["flying"] = "Warforged Nightmare", },
	["Marisol"] = { ["ground"] = "Sundancer", ["flying"] = "Heavenly Azure Cloud Serpent", },
	["Marjorie"] = { ["ground"] = "Thunder Bluff Kodo", ["flying"] = "Battlelord's Bloodthirsty War Wyrm", },
	["Martha"] = { ["ground"] = "Black War Kodo", ["flying"] = "Grand Armored Wyvern", },
	["Maya"] = {},
	["Mildred"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Abyss Worm", },
	["Miranda"] = { ["ground"] = "Hellfire Infernal", ["flying"] = "Armored Red Dragonhawk", },
	["Nea"] = { ["flying"] = "Warforged Nightmare", },
	["New"] = { ["ground"] = "Crusader's Direhorn", ["flying"] = "Cobalt Pterrordax", },
	["Njord"] = { ["ground"] = "Snapdragon Kelpstalker", ["flying"] = "Abyss Worm", },
	["No"] = { ["ground"] = "Llothien Prowler", ["flying"] = "Violet Pandaren Phoenix", ["aquatic"] = "Crimson Tidestallion", },
	["Noicha"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "High Priest's Lightsworn Seeker", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Nonagon"] = {},
	["Norega"] = { ["flying"] = "Ironbound Wraithcharger", },
	["Nour"] = { ["ground"] = "Raven Lord", ["flying"] = "Dread Raven", },
	["Nox"] = { ["ground"] = "Netherlord's Accursed Wrathsteed", ["flying"] = "Dark Phoenix", },
	["Nyoka"] = { ["ground"] = "Yellow Marsh Hopper", ["flying"] = "Captured Swampstalker", },
	["Onion"] = { ["ground"] = "Midnight", ["flying"] = "The Dreadwake", },
	["Ophelia"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Oren"] = { ["ground"] = "Midnight", ["flying"] = "Armored Bloodwing", },
	["Oscar"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Ozulu"] = { ["ground"] = "Fossilized Raptor", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Paul"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Twilight Avenger", },
	["Pest"] = { ["ground"] = "Elusive Quickhoof", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Polygon"] = { ["ground"] = "Amber Primordial Direhorn", ["flying"] = "Captured Swampstalker", },
	["Raz"] = { ["ground"] = "Predatory Bloodgazer", ["flying"] = "Spectral Pterrorwing", },
	["Rebecca"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Ashes of Al'ar", },
	["Reesh"] = { ["ground"] = "Skullripper", ["flying"] = "Witherbark Direwing", },
	["Revna"] = { ["ground"] = "Coalfist Gronnling", ["flying"] = "Soaring Skyterror", },
	["Rhys"] = { ["flying"] = "Spirit of Eche'ro", },
	["Rok"] = { ["ground"] = "Bristling Hellboar", ["flying"] = "Twilight Avenger", },
	["Ryan"] = { ["ground"] = "Mollie", ["flying"] = "Waste Marauder", },
	["Sadie"] = { ["ground"] = "Highmountain Thunderhoof", },
	["Salyssra"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Onyxian Drake", ["hs"] = "Tome of Town Portal", },
	["Sandra"] = { ["ground"] = "Mollie", ["flying"] = "Waste Marauder", },
	["Sandy"] = { ["flying"] = "Grinning Reaver", ["hs"] = "Fire Eater's Hearthstone", },
	["Schooka"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Iron Skyreaver", },
	["Scott"] = { ["ground"] = "Dune Scavenger", ["flying"] = "Wastewander Skyterror", },
	["Serena"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Ashes of Al'ar", ["hs"] = "Tome of Town Portal", },
	["Seska"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Shadowblade's Murderous Omen", },
	["Shu"] = { ["ground"] = "Onyx Jeweled Panther", ["flying"] = "Shadowblade's Crimson Omen", },
	["Sithandra"] = { ["ground"] = "Acherus Deathcharger", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Solene"] = { ["ground"] = "Swift Red Hawkstrider", ["flying"] = "Red Dragonhawk", ["aquatic"] = "Crimson Tidestallion", },
	["Spoon"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Farseer's Raging Tempest", ["aquatic"] = "Saltwater Seahorse", },
	["Suri"] = { ["ground"] = "Ironside Warwolf", ["flying"] = "Huntmaster's Loyal Wolfhawk", },
	["Sven"] = { ["ground"] = "Blue Shado-Pan Riding Tiger", },
	["Sylvia"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Syrah"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Arcanist's Manasaber", },
	["Syro"] = { ["ground"] = "Frenzied Feltalon", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Teo"] = { ["ground"] = "Snapback Scuttler", ["flying"] = "Voldunai Dunescraper", },
	["Thrash"] = {},
	["Tim"] = { ["ground"] = "Elusive Quickhoof", ["flying"] = "Waste Marauder", },
	["Veka"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Spectral Pterrorwing", },
	["Vendegast"] = { ["ground"] = "Battle-Bound Warhound", ["flying"] = "Witherbark Direwing", },
	["Venom"] = { ["ground"] = "Green Primal Raptor", ["flying"] = "Captured Swampstalker", },
	["Vicki"] = { ["ground"] = "Illidari Felstalker", ["flying"] = "Felglow Mana Ray", },
	["Victoria"] = { ["ground"] = "Vicious Warstrider", },
	["Viktor"] = { ["ground"] = "Bloodfang Widow", ["flying"] = "Witherbark Direwing", },
	["Vincent"] = { ["ground"] = "Netherlord's Chaotic Wrathsteed", ["flying"] = "Undercity Plaguebat", },
	["Vivianne"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Witherbark Direwing", },
	["Volt"] = { ["ground"] = "Vicious War Trike", ["flying"] = "Xiwyllag ATV", },
	["Voo"] = { ["flying"] = "Grove Warden", },
	["Wawa"] = { ["ground"] = "Gilded Ravasaur", },
	["Won"] = { ["ground"] = "Beastlord's Warwolf", ["flying"] = "Grand Armored Wyvern", },
	["Wugzark"] = { ["ground"] = "Garn Nighthowl", },
	["Wuso"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Witherbark Direwing", },
	["Wyle"] = { ["ground"] = "Skullripper", ["flying"] = "Witherbark Direwing", },
	["Xi"] = { ["ground"] = "Ashhide Mushan Beast", ["flying"] = "Cobalt Pterrordax", },
	["Yarn"] = { ["ground"] = "Ashhide Mushan Beast", ["flying"] = "Clutch of Ji-Kun", ["hs"] = "Fire Eater's Hearthstone", },
	["Zac"] = { ["ground"] = "Prestigious Ivory Courser", ["flying"] = "Cloudwing Hippogryph", },
	["Zahara"] = { ["ground"] = "Crusader's Direhorn", },
	["Zap"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Grand Armored Wyvern", },
	["Zea"] = {},
	["Zek"] = { ["ground"] = "Crusader's Direhorn", ["flying"] = "Cobalt Pterrordax", },
	["Zev"] = { ["ground"] = "Prestigious Azure Courser", },
	["Ziguni"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Bloodthirsty Dreadwing", },
	["Zo"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Drake of the Four Winds", },
	["Zoal"] = { ["ground"] = "Green Skeletal Warhorse", ["flying"] = "Maldraxxian Corpsefly", },
	["Zolani"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Armored Skyscreamer", },
	["Zoom"] = { ["ground"] = "Brown Riding Goat", ["flying"] = "Darkmoon Dirigible", },
	["Zorp"] = { ["ground"] = "Brawler's Burly Basilisk", ["flying"] = "Mechanized Lumber Extractor", },
	["Zumaridi"] = {},
}




-- Pet Icons

Automagic.PetIcons = {
	-- Hunters
	["Alec"] = { ["Mana"] = "Interface/AddOns/Media_Newsom/Pets/ManasaberBlue", },
	["Appi"] = {
		["Andy"] = 1504874,
		["Blep"] = 1390637,
		["Frank"] = 464160,
		["Ravioli"] = "Interface/AddOns/Media_Newsom/Pets/CoreHoundPurple",
		["Toothpaste"] = 1570766,
	},
	["Ella"] = { ["Kiki"] = 656342, },
	["Goom"] = { ["Doris"] = 838687, },
	["Janis"] = { ["Bobby"] = 838687, },
	["Linda"] = { ["Mondays"] = 2027886, },
	["Suri"] = { ["Marg"] = 1279719, },
	["Syrah"] = { ["Escoutatz"] = "Interface/AddOns/Media_Newsom/Pets/ManasaberBlue", },
	["Zolani"] = { ["Bibi"] = 132193, },

	-- Mages
	["Zoom"] = { ["Water Elemental"] = "Interface/AddOns/Media_Newsom/Pets/WaterElementalStormsWake", }
}