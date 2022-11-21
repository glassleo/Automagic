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
--   Class Specific:
--   	"treant" (true or false)
--   	"polymorph" - Polymorph variant
--   	"hex" - Hex variant
--
-- Character names can be either just the name ("Bob") or include realm ("Bob-Earthen Ring")
--
-- For spec specific entries, suffix : and spec number (example: "flying:2" for the second spec)
-- Spec specific entries are always prioritized first
-- Separate multiple items with | for a random selection
--
-- If ground mount is omitted but flying mount is not, the flying mount will be used as ground mount
-- In other cases default substitutes will be used


Automagic.Characters = {
	-- Defaults
	["defaults"] = {
		["ground"] = (faction == "Alliance") and "Mountain Horse" or "Trained Snarler",
		["flying"] = (faction == "Alliance") and "Grand Gryphon" or "Grand Wyvern",
		["aquatic"] = "Subdued Seahorse",
		["passenger"] = "X-53 Touring Rocket",
		["hs"] = "Tome of Town Portal", -- Replaced by Covenant Hearthstone if available
		--["hex"] = "Frog",
		--["polymorph"] = "Sheep",
	},

	-- Custom
	["Agata"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Witherbark Direwing", },
	["Agnes"] = { ["ground"] = "Netherlord's Brimstone Wrathsteed", ["flying"] = "Smoldering Ember Wyrm", },
	["Aip"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Battlelord's Bloodthirsty War Wyrm", },
	["Aldous"] = { ["ground"] = "Prestigious Ivory Courser", ["flying"] = "Cloudwing Hippogryph", },
	["Anna"] = { ["flying"] = "Grove Warden", },
	["Ap"] = { ["ground"] = "Crusader's Direhorn", ["flying"] = "Cobalt Pterrordax", },
	["Apera"] = { ["ground"] = "Highmountain Elderhorn", ["flying"] = "Huntmaster's Loyal Wolfhawk", },
	["Aponi"] = { ["flying"] = "Spirit of Eche'ro", },
	["Appi"] = { ["ground"] = "Highmountain Thunderhoof", ["flying"] = "Huntmaster's Dire Wolfhawk", },
	["Art"] = { ["ground"] = "Arcanist's Manasaber", ["flying"] = "Violet Spellwing", ["hs"] = "Tome of Town Portal", },
	["Aska"] = { ["ground"] = "Grimhowl", },
	["Asteria"] = { ["ground"] = "Vicious Kaldorei Warsaber", ["flying"] = "Teldrassil Hippogryph", ["hs"] = "Night Fae Hearthstone", },
	["Astra"] = { ["ground"] = "Pureheart Courser", ["flying:1"] = "High Priest's Lightsworn Seeker", ["flying"] = "Long-Forgotten Hippogryph", ["hs"] = "Lunar Elder's Hearthstone", },
	["Au"] = { ["ground"] = "Blessed Felcrusher", ["flying"] = "High Priest's Lightsworn Seeker", ["aquatic"] = "Deepstar Aurelid", ["hs"] = "Broker Translocation Matrix", },
	["Bababla"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Voldunai Dunescraper", },
	["Barb"] = { ["ground"] = "Snapback Scuttler", ["flying"] = "Siltwing Albatross", },
	["Beans"] = {},
	["Beryl"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Shadowbarb Drone", },
	["Bess"] = { ["ground"] = "Summon Great Sunwalker Kodo", ["flying"] = "Clutch of Ji-Kun", },
	["Betty"] = { ["ground"] = "Eternal Phalynx of Courage", ["flying"] = "Wonderwing 2.0|Steamscale Incinerator", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Bimini"] = { ["ground"] = "Sundancer", ["flying"] = "Armored Blue Dragonhawk", },
	["Birgitta"] = { },
	["Bite"] = { },
	["Blanc"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Restoration Deathwalker", },
	["Bones"] = { ["ground"] = "Battle-Bound Warhound", ["flying"] = "Malevolent Drone", },
	["Boom"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Grand Armored Wyvern", },
	["Brock"] = { ["ground"] = "Kul Tiran Charger", ["flying"] = "Stormsong Coastwatcher", },
	["Cafuné"] = { ["flying"] = "Grove Warden", },
	["Camilla"] = { ["ground"] = "Court Sinrunner", ["flying"] = "Sinfall Gravewing", },
	["Carolyn"] = { ["ground"] = "Violet Raptor", ["flying"] = "Armored Skyscreamer", },
	["Carrie"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Ashes of Al'ar", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Tome of Town Portal", },
	["Cecelia"] = { ["ground"] = "Flametalon of Alysrazor", ["flying"] = "Pureblood Fire Hawk", },
	["Chai"] = { ["ground"] = "Swift Lovebird", ["flying"] = "Ivory Cloud Serpent", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Claw"] = { },
	["Code"] = { ["ground"] = "Heartlight Vombata", ["flying"] = "Desertwing Hunter", ["aquatic"] = "Subdued Seahorse", ["hs"] = "Eternal Traveler's Hearthstone", },
	["Colette"] = { ["ground"] = "Pureheart Courser", ["flying"] = "Duskflutter Ardenmoth", },
	["Cordelia"] = { ["ground"] = "Black Riding Goat", },
	["Cosmia"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Arcanist's Manasaber", },
	["Crash"] = { ["ground"] = "Running Wild", },
	["Debbie"] = { ["flying"] = "Mystic Runesaber", },
	["Desna"] = { ["ground"] = "Frostwolf Snarler", ["flying"] = "Grand Armored Wyvern", },
	["Dia"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Ashenvale Chimaera", ["aquatic"] = "Fathom Dweller", ["hs"] = "Lunar Elder's Hearthstone", },
	["Ean"] = { ["ground"] = "Vicious War Fox", ["flying"] = "Armored Blue Dragonhawk", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Eternal Traveler's Hearthstone", },
	["Echo"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Armored Skyscreamer", },
	["Ed"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Uncorrupted Voidwing", },
	["Edna"] = { ["flying"] = "Ironbound Wraithcharger", },
	["Eld"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Fire Eater's Hearthstone", },
	["Ellika"] = { ["ground"] = "Amethyst Ruinstrider|Sable Ruinstrider", ["flying"] = "Purple Riding Nether Ray", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Elsa"] = { ["ground"] = "Blackpaw", ["flying"] = "Honeyback Harvester", },
	["Elspeth"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", ["aquatic"] = "Fathom Dweller", ["hs"] = "Necrolord Hearthstone", },
	["Emily"] = { ["ground"] = "Summon Thalassian Charger", ["flying"] = "Sunreaver Dragonhawk", },
	["Emma"] = { ["ground"] = "Guardian Vorquin", ["flying"] = "Twilight Harbinger", },
	["Enna"] = { ["ground"] = "Armored Plaguerot Tauralus", ["flying"] = "Yu'lei, Daughter of Jade", },
	["Eo"] = { ["ground"] = "Raven Lord", ["flying"] = "Dread Raven", },
	["Eris"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", ["aquatic"] = "Fathom Dweller", ["hs"] = "Necrolord Hearthstone", },
	["Errol"] = { ["flying"] = "Grove Warden", ["hs"] = "Lunar Elder's Hearthstone", },
	["Eska"] = { ["ground"] = "Swift Frostwolf", ["flying"] = "Grand Armored Wyvern", },
	["Felix"] = { ["ground"] = "Summon Thalassian Charger", ["flying"] = "Nether-Gorged Greatwyrm", ["hs"] = "Tome of Town Portal", },
	["Fester"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", },
	["Flerm"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Volcanic Stone Drake", ["hex"] = "Cockroach", },
	["Flora"] = { ["ground"] = "Crimson Vorquin", ["flying"] = "Life-Binder's Handmaiden", },
	["Francesca"] = { ["ground"] = "Sundancer", ["flying"] = "Infinite Timereaver", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Tome of Town Portal", },
	["Frango"] = { ["ground"] = "Grove Warden", ["flying"] = "Grove Warden", ["hs"] = "Night Fae Hearthstone", ["treant"] = true, },
	["Frank"] = { ["ground"] = "Seabraid Stallion", ["flying"] = "Proudmoore Sea Scout", ["aquatic"] = "Surf Jelly", ["hs"] = "Necrolord Hearthstone", },
	["Frid"] = { },
	["Frutsi"] = { },
	["Fuzz"] = { ["ground"] = "Seabraid Stallion", ["flying"] = "Squawks", },
	["Galinha"] = { },
	["Gary"] = { ["ground"] = "Bronze Vorquin", ["flying"] = "Tangled Dreamweaver", },
	["Gary"] = { ["ground"] = "Green Primal Raptor", ["flying"] = "Tangled Dreamweaver", },
	["Ghost"] = { ["ground"] = "Kaldorei Nightsaber", ["flying"] = "Shadowblade's Lethal Omen", },
	["Ghoulina"] = { ["ground"] = "Jigglesworth Sr.", ["flying"] = "Regal Corpsefly", },
	["Gizzard"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Soaring Skyterror", },
	["Gloria"] = { ["ground"] = "Lightforged Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Glue"] = { ["ground"] = "Ironside Warwolf", ["flying"] = "Crimson Pandaren Phoenix", },
	["Gorgina"] = { ["ground"] = "Wandering Arden Doe", ["flying"] = "Leyfeather Hippogryph", },
	["Grace"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Gruff"] = { },
	["Hecate"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Duskflutter Ardenmoth", ["aquatic"] = "Darkwater Skate", ["hs"] = "Night Fae Hearthstone", },
	["Hekla"] = { ["ground"] = "Bristling Hellboar", ["flying"] = "Black Drake", },
	["Helena"] = { ["flying"] = "Lightforged Warframe", },
	["Hilda"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Time-Lost Proto-Drake", ["aquatic"] = "Subdued Seahorse", ["hs"] = "Timewalker's Hearthstone", },
	["Hope"] = { ["ground"] = "Bronze Vorquin", ["flying"] = "Bronze Drake", ["hs"] = "Timewalker's Hearthstone", },
	["Huo"] = { ["ground"] = "Crimson Vorquin", },
	["Ini"] = { ["ground"] = "Violet Raptor", ["flying"] = "Bloodgorged Hunter", },
	["Io"] = { ["ground"] = "Bronze Vorquin", ["flying"] = "Tangled Dreamweaver", },
	["Iro"] = { ["ground"] = "Felsaber", ["flying"] = "Cloudwing Hippogryph", },
	["Isolde"] = { ["ground"] = "Acherus Deathcharger", },
	["Ivan"] = { ["ground"] = "Running Wild", ["flying"] = "Obsidian Worldbreaker", },
	["Ji"] = { ["ground"] = "Blue Shado-Pan Riding Tiger", ["flying"] = "Thundering Onyx Cloud Serpent", ["hs"] = "Dominated Hearthstone", },
	["June"] = { ["ground"] = "Springfur Alpaca", },
	["Kathryn"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Dusky Waycrest Gryphon", ["aquatic"] = "Darkwater Skate", },
	["Katya"] = { ["ground"] = "Cerulean Ruinstrider", },
	["Kiasmos"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Dominated Hearthstone", },
	["Kiwi"] = {},
	["Lakrits"] = { ["ground"] = "Battle Gargon Silessa", ["flying"] = "Sinfall Gravewing", ["hs"] = "Venthyr Sinstone", },
	["Leaf"] = { ["ground"] = "Wandering Ancient", },
	["Leo"] = { ["ground"] = "Highlord's Golden Charger", ["flying"] = "Sapphire Skyblazer", },
	["Lif"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", ["aquatic"] = "Crimson Tidestallion", },
	["Ling"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", },
	["Liou"] = { ["ground"] = "Ban-Lu, Grandmaster's Companion", ["flying"] = "Emerald Pandaren Phoenix", },
	["Lisa"] = { ["ground"] = "Llothien Prowler", ["flying"] = "Vulpine Familiar", },
	["Liz"] = { ["ground"] = "Vicious War Trike", ["flying"] = "Shadowblade's Baneful Omen", },
	["Lua"] = { },
	["Lucas"] = { ["ground"] = "Running Wild", ["flying"] = "Armored Bloodwing", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Venthyr Sinstone", },
	["Mab"] = { },
	["Malgorzata"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Maria"] = { ["ground"] = "Grimhowl", ["flying"] = "Obsidian Worldbreaker", ["aquatic"] = "Inkscale Deepseeker", ["hs"] = "Fire Eater's Hearthstone", },
	["Marisol"] = { ["ground"] = "Sundancer", ["flying"] = "Heavenly Azure Cloud Serpent", },
	["Maya"] = { },
	["Mayhem"] = { ["ground"] = "Hellfire Infernal", ["flying"] = "Wastewarped Deathwalker", ["hs"] = "Venthyr Sinstone", },
	["Medea"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Ardenweald Wilderling", },
	["Mei"] = { },
	["Mikael"] = { ["ground"] = "Summon Great Exarch's Elekk", ["flying"] = "Enchanted Fey Dragon", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Milo"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Stormwind Skychaser", },
	["Monica"] = { ["ground"] = "Smoky Charger", ["flying"] = "Life-Binder's Handmaiden", },
	["Moronica"] = { },
	["My"] = { ["ground"] = "Hellfire Infernal", ["flying"] = "Bronzewing Vespoid", },
	["Namu"] = { },
	["Nea"] = { ["ground"] = "Colossal Wraithbound Mawrat", ["flying"] = "Azure Netherwing Drake", },
	["Njord"] = { ["ground"] = "Snapdragon Kelpstalker", ["flying"] = "Abyss Worm", },
	["Nord"] = { ["ground"] = "Ironbound Wraithcharger", ["flying"] = "Icebound Frostbrood Vanquisher", },
	["Norega"] = { ["ground"] = "Warstitched Darkhound", ["flying"] = "Witherbark Direwing", },
	["Nour"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "High Priest's Lightsworn Seeker", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Onion"] = { ["ground"] = "Midnight", ["flying"] = "The Dreadwake", },
	["Ornacia"] = { },
	["Pang"] = { ["ground"] = "Obsidian Vorquin", ["flying"] = "Black Drake", },
	["Peppermint"] = { ["flying"] = "Hogrus, Swine of Good Fortune", },
	["Pest"] = { },
	["Phoebe"] = { ["flying"] = "Priestess' Moonsaber", ["hs"] = "Lunar Elder's Hearthstone", },
	["Prue"] = { ["ground"] = "Dapple Gray", ["flying"] = "Glacial Tidestorm", },
	["Ravioli"] = { ["ground"] = "Vicious War Mechanostrider", ["flying"] = "Mimiron's Head", },
	["Rose"] = { ["ground"] = "White Riding Goat", ["flying"] = "Leyfeather Hippogryph", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Salyssra"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Uncorrupted Voidwing", ["hs"] = "Dominated Hearthstone", },
	["Schnappi"] = { },
	["Selma"] = { ["ground"] = "Stormpike Battle Ram", ["flying"] = "Valarjar Stormwing", ["hs"] = "Brewfest Reveler's Hearthstone", },
	["Serena"] = { ["ground"] = "Mystic Runesaber", ["flying"] = "Violet Spellwing", },
	["Seska"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Violet Pandaren Phoenix", },
	["Shanna"] = { ["ground"] = "Admiralty Stallion", },
	["Shui"] = { ["ground"] = "Sapphire Vorquin", ["flying"] = "Tazavesh Gearglider", },
	["Sigrid"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", },
	["Sinikka"] = { ["ground"] = "Bristling Hellboar", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Sithandra"] = { ["ground"] = "Crimson Deathcharger", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Skuggi"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Marrowfang", ["aquatic"] = "Fathom Dweller", ["hs"] = "Dominated Hearthstone", },
	["Solene"] = { ["ground"] = "Swift Red Hawkstrider", ["flying"] = "Red Dragonhawk", ["aquatic"] = "Crimson Tidestallion", },
	["Song"] = { ["ground"] = "Bruce", ["flying"] = "Pandaren Kite", },
	["Spoon"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Farseer's Raging Tempest", ["aquatic"] = "Saltwater Seahorse", },
	["Syrah"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Arcanist's Manasaber", },
	["Syro"] = { ["ground"] = "Frenzied Feltalon", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Tickle"] = { ["ground"] = "Caravan Hyena", ["flying"] = "Waste Marauder", },
	["Tor"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Island Thunderscale", ["hs"] = "The Innkeeper's Daughter", },
	["Tracyanne"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Grand Gryphon", ["aquatic"] = "Subdued Seahorse", ["hs"] = "The Innkeeper's Daughter", },
	["Vack"] = { ["ground"] = "Running Wild", ["flying"] = "Witherbark Direwing", ["aquatic"] = "Fathom Dweller", },
	["Veka"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Spectral Pterrorwing", },
	["Vendegast"] = { ["ground"] = "Battle-Bound Warhound", ["flying"] = "Witherbark Direwing", },
	["Vevica"] = { ["ground"] = "Vicious War Elekk", ["flying"] = "Darkspore Mana Ray", },
	["Victoria"] = { ["ground"] = "Vicious Warstrider", },
	["Vidalia"] = { ["ground"] = "Ratstallion", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Viktor"] = { ["ground"] = "Bloodfang Widow", ["flying"] = "Witherbark Direwing", },
	["Violaine"] = { ["ground"] = "Umber Nightsaber", ["flying"] = "Teldrassil Hippogryph", ["aquatic"] = "Saltwater Seahorse", },
	["Will"] = { },
	["Wiz"] = { ["ground"] = "Bone-White Primal Raptor", ["flying"] = "Tazavesh Gearglider", },
	["Wo"] = { ["ground"] = "Beastlord's Warwolf", ["flying"] = "Grand Armored Wyvern", },
	["Wyle"] = { ["ground"] = "Skullripper", ["flying"] = "Witherbark Direwing", },
	["Yarn"] = { ["ground"] = "Ashhide Mushan Beast", ["flying"] = "Clutch of Ji-Kun", ["hs"] = "Fire Eater's Hearthstone", },
	["Yessica"] = { ["ground"] = "Beryl Ruinstrider", ["flying"] = "Enchanted Fey Dragon", },
	["Yuki"] = { ["ground"] = "Regal Riding Crane", ["flying"] = "Rajani Warserpent", ["aquatic"] = "Sea Turtle", ["hs"] = "Night Fae Hearthstone", },
	["Yulia"] = { ["ground"] = "Umber Ruinstrider", ["flying"] = "Vibrant Mana Ray", },
	["Zap"] = { ["ground"] = "Swift Purple Raptor", },
	["Ziguni"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Bloodthirsty Dreadwing", },
	["Zoal"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Violet Netherwing Drake", ["hs"] = "Lunar Elder's Hearthstone", },
	["Zoom"] = { ["ground"] = "Scarlet Helicid", ["flying"] = "Darkmoon Dirigible", },
	["Zorp"] = { ["ground"] = "Brawler's Burly Basilisk", ["flying"] = "Grinning Reaver", },
	["Zumaridi"] = { },
}




-- Pet Icons

Automagic.PetIcons = {
	-- Hunters
	["Aldous"] = { ["Blue"] = 1861689, },
	["Auros"] = { ["Yros"] = 1602322, },
	["Alec"] = { ["Mana"] = "Interface/AddOns/Media_Newsom/Pets/ManasaberBlue", },
	["Apera"] = { ["Anna"] = 1392564, ["Arra'chea"] = 132245, },
	["Appi"] = { ["Andy"] = 1504874, ["Blep"] = 1390637, ["Frank"] = 464160, ["Ravioli"] = "Interface/AddOns/Media_Newsom/Pets/CoreHoundPurple", ["Toothpaste"] = 1570766, },
	["Elsa"] = { ["Bernard"] = 132183, ["Daisy"] = 2027853, },
	["Ella"] = { ["Kiki"] = 656342, },
	["Goom"] = { ["Doris"] = 838687, },
	["Janis"] = { ["Bobby"] = 838687, },
	["Linda"] = { ["Mondays"] = 2027886, },
	["Ravioli"] = { ["Betsy"] = 656513, },
	["Suri"] = { ["Marg"] = 1279719, },
	["Syrah"] = { ["Escoutatz"] = "Interface/AddOns/Media_Newsom/Pets/ManasaberBlue", },
	["Zolani"] = { ["Bibi"] = 132193, },
	["Zip"] = { ["Dusk"] = 1861689, },

	-- Mages
	["Floyd"] = { ["Water Elemental"] = "Interface/AddOns/Media_Newsom/Pets/WaterElementalTheTides", },
	["Medea"] = { ["Water Elemental"] = "Interface/AddOns/Media_Newsom/Pets/WaterElementalStormsWake", },
	["Zoom"] = { ["Water Elemental"] = "Interface/AddOns/Media_Newsom/Pets/WaterElementalStormsWake", },
}