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
--		"mailbox" - Mailbox Toy (Katy's Stampwhistle or Ohuna Perch)
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
		["dragon"] = "Highland Drake",
		["aquatic"] = "Subdued Seahorse",
		["passenger"] = "X-53 Touring Rocket",
		["hs"] = "Tome of Town Portal", -- Replaced by Covenant Hearthstone if available
		["mailbox"] = "Ohuna Perch"
		--["hex"] = "Frog",
		--["polymorph"] = "Sheep",
	},

	-- Custom
	["Agata"] = { ["ground"] = "Rivendare's Deathcharger", ["flying"] = "Witherbark Direwing", },
	["Agnes"] = { ["ground"] = "Netherlord's Brimstone Wrathsteed", ["flying"] = "Smoldering Ember Wyrm", ["hs"] = "Venthyr Sinstone", },
	["Aldous"] = { ["ground"] = "Prestigious Ivory Courser", ["flying"] = "Cloudwing Hippogryph", },
	["Anna"] = { ["flying"] = "Grove Warden", ["dragon"] = "Renewed Proto-Drake", },
	["Ap"] = { ["ground"] = "Crusader's Direhorn", ["flying"] = "Cobalt Pterrordax", },
	["Apera"] = { ["ground"] = "Highmountain Elderhorn", ["flying"] = "Huntmaster's Loyal Wolfhawk", ["dragon"] = "Renewed Proto-Drake", },
	["Aponi"] = { ["flying"] = "Spirit of Eche'ro", },
	["Appi"] = { ["ground"] = "Highmountain Thunderhoof", ["flying"] = "Huntmaster's Dire Wolfhawk", ["dragon"] = "Renewed Proto-Drake", ["aquatic"] = "Otto", },
	["Art"] = { ["ground"] = "Arcanist's Manasaber", ["flying"] = "Violet Spellwing", ["hs"] = "Tome of Town Portal", },
	["Aska"] = { ["ground"] = "Grimhowl", },
	["Asteria"] = { ["ground"] = "Vicious Kaldorei Warsaber", ["flying"] = "Teldrassil Hippogryph", ["hs"] = "Night Fae Hearthstone", },
	["Astra"] = { ["ground"] = "Pureheart Courser", ["flying:1"] = "High Priest's Lightsworn Seeker", ["flying"] = "Long-Forgotten Hippogryph", ["hs"] = "Lunar Elder's Hearthstone", },
	["Au"] = { ["ground"] = "Blessed Felcrusher", ["flying"] = "High Priest's Lightsworn Seeker", ["aquatic"] = "Deepstar Aurelid", ["dragon:3"] = "Renewed Proto-Drake", ["hs"] = "Broker Translocation Matrix", },
	["Bababla"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Voldunai Dunescraper", ["dragon"] = "Windborne Velocidrake", },
	["Beans"] = {},
	["Beryl"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Shadowbarb Drone", ["hs"] = "Venthyr Sinstone", },
	["Bess"] = { ["ground"] = "Summon Great Sunwalker Kodo", ["flying"] = "Clutch of Ji-Kun", },
	["Betty"] = { ["ground"] = "Eternal Phalynx of Courage", ["flying"] = "Wonderwing 2.0|Steamscale Incinerator", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Bimini"] = { ["ground"] = "Sundancer", ["flying"] = "Nether-Gorged Greatwyrm", },
	["Birgitta"] = { ["ground"] = "Admiralty Stallion", ["flying"] = "Siltwing Albatross", ["dragon"] = "Windborne Velocidrake", ["hs"] = "Ohn'ir Windsage's Hearthstone" },
	["Bite"] = { },
	["Blanc"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Restoration Deathwalker", },
	["Bones"] = { ["ground"] = "Battle-Bound Warhound", ["flying"] = "Regal Corpsefly", },
	["Boom"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Grand Armored Wyvern", ["dragon"] = "Cliffside Wylderdrake", },
	["Brock"] = { ["ground"] = "Kul Tiran Charger", ["flying"] = "Stormsong Coastwatcher", ["dragon"] = "Highland Drake", },
	["Cafuné"] = { ["flying"] = "Grove Warden", ["dragon"] = "Renewed Proto-Drake", },
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
	["Debbie"] = { ["flying"] = "Mystic Runesaber", ["mailbox"] = "Katy's Stampwhistle", },
	["Desna"] = { ["ground"] = "Frostwolf Snarler", ["flying"] = "Grand Armored Wyvern", ["dragon"] = "Cliffside Wylderdrake", },
	["Dia"] = { ["ground"] = "Mag'har Direwolf", ["flying"] = "Ashenvale Chimaera", ["dragon"] = "Renewed Proto-Drake", ["aquatic"] = "Fathom Dweller", ["hs"] = "Lunar Elder's Hearthstone", },
	["Ean"] = { ["ground"] = "Vicious War Fox", ["flying"] = "Armored Blue Dragonhawk", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Eternal Traveler's Hearthstone", },
	["Echo"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Spectral Pterrorwing", ["dragon"] = "Windborne Velocidrake", },
	["Ed"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Uncorrupted Voidwing", },
	["Edna"] = { ["flying"] = "Ironbound Wraithcharger", },
	["Ek"] = { ["ground"] = "Running Wild", ["flying"] = "Obsidian Worldbreaker", },
	["Eld"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Fire Eater's Hearthstone", },
	["Ellika"] = { ["ground"] = "Amethyst Ruinstrider|Sable Ruinstrider", ["flying"] = "Phosphorescent Stone Drake", ["aquatic"] = "Saltwater Seahorse", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Elsa"] = { ["ground"] = "Blackpaw", ["flying"] = "Honeyback Harvester", },
	["Elspeth"] = { ["ground"] = "Vicious Skeletal Warhorse", ["flying"] = "Undercity Plaguebat", ["aquatic"] = "Fathom Dweller", ["hs"] = "Necrolord Hearthstone", },
	["Emile"] = { ["ground"] = "Battle Gargon Silessa", ["flying"] = "Sinfall Gravewing", ["hs"] = "Venthyr Sinstone", },
	["Emily"] = { ["ground"] = "Highlord's Vigilant Charger", ["flying"] = "Val'sharah Hippogryph", ["hs"] = "Kyrian Hearthstone", },
	["Emma"] = { ["ground"] = "Guardian Vorquin", ["flying"] = "Twilight Harbinger", },
	["Enna"] = { ["ground"] = "Armored Plaguerot Tauralus", ["flying"] = "Yu'lei, Daughter of Jade", },
	["Eo"] = { ["ground"] = "Raven Lord", ["flying"] = "Dread Raven", },
	["Eris"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", ["aquatic"] = "Fathom Dweller", ["hs"] = "Necrolord Hearthstone", },
	["Errol"] = { ["flying"] = "Grove Warden", ["hs"] = "Lunar Elder's Hearthstone", },
	["Eska"] = { ["ground"] = "Swift Frostwolf", ["flying"] = "Grand Armored Wyvern", ["dragon"] = "Renewed Proto-Drake", },
	["Felix"] = { ["ground"] = "Summon Thalassian Charger", ["flying"] = "Nether-Gorged Greatwyrm", ["hs"] = "Tome of Town Portal", },
	["Fester"] = { ["ground"] = "Vicious War Spider", ["flying"] = "Undercity Plaguebat", ["dragon"] = "Highland Drake", },
	["Flerm"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Volcanic Stone Drake", ["hex"] = "Cockroach", ["dragon"] = "Cliffside Wylderdrake", },
	["Flora"] = { ["ground"] = "Crimson Vorquin", ["flying"] = "Life-Binder's Handmaiden", },
	["Francesca"] = { ["ground"] = "Sundancer", ["flying"] = "Infinite Timereaver", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Tome of Town Portal", },
	["Frango"] = { ["ground"] = "Grove Warden", ["flying"] = "Grove Warden", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Night Fae Hearthstone", ["treant"] = true, },
	["Frank"] = { ["ground"] = "Seabraid Stallion", ["flying"] = "Proudmoore Sea Scout", ["aquatic"] = "Surf Jelly", ["hs"] = "Necrolord Hearthstone", },
	["Frid"] = { ["dragon"] = "Renewed Proto-Drake", },
	["Frutsi"] = { },
	["Fuzz"] = { ["ground"] = "Seabraid Stallion", ["flying"] = "Squawks", },
	["Galinha"] = { ["dragon"] = "Windborne Velocidrake", },
	["Gary"] = { ["ground"] = "Ancient Salamanther", ["flying"] = "Tangled Dreamweaver", ["dragon"] = "Renewed Proto-Drake", },
	["Ghost"] = { ["ground"] = "Kaldorei Nightsaber", ["flying"] = "Shadowblade's Lethal Omen", },
	["Ghoulina"] = { ["ground"] = "Jigglesworth Sr.", ["flying"] = "Regal Corpsefly", ["dragon"] = "Renewed Proto-Drake", },
	["Gizzard"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Soaring Skyterror", ["dragon"] = "Windborne Velocidrake", },
	["Gloria"] = { ["ground"] = "Lightforged Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Glue"] = { ["ground"] = "Ironside Warwolf", ["flying"] = "Crimson Pandaren Phoenix", },
	["Gorgina"] = { ["ground"] = "Wandering Arden Doe", ["flying"] = "Leyfeather Hippogryph", },
	["Grace"] = { ["ground"] = "Avenging Felcrusher", ["flying"] = "Scintillating Mana Ray", },
	["Grey"] = { ["ground"] = "Smoky Charger", ["flying"] = "Life-Binder's Handmaiden", },
	["Gruff"] = { ["ground"] = "Snapback Scuttler", ["flying"] = "Squawks", },
	["Hecate"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Duskflutter Ardenmoth", ["aquatic"] = "Darkwater Skate", ["hs"] = "Lunar Elder's Hearthstone", },
	["Hekla"] = { ["ground"] = "Bristling Hellboar", ["flying"] = "Black Drake", },
	["Helena"] = { ["ground"] = "Armored Plaguerot Tauralus", },
	["Hilda"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Time-Lost Proto-Drake", ["aquatic"] = "Subdued Seahorse", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Timewalker's Hearthstone", },
	["Hope"] = { ["ground"] = "Bronze Vorquin", ["flying"] = "Bronze Drake", ["hs"] = "Timewalker's Hearthstone", },
	["Huo"] = { ["ground"] = "Jade, Bright Foreseer", ["flying"] = "Crimson Pandaren Phoenix", ["dragon"] = "Highland Drake", },
	["Ini"] = { ["ground"] = "Violet Raptor", ["flying"] = "Bloodgorged Hunter", ["dragon"] = "Windborne Velocidrake", ["hs"] = "Night Fae Hearthstone", },
	["Io"] = { ["ground"] = "Bronze Vorquin", ["flying"] = "Tangled Dreamweaver", },
	["Iro"] = { ["ground"] = "Felsaber", ["flying"] = "Cloudwing Hippogryph", },
	["Isolde"] = { ["ground"] = "Acherus Deathcharger", },
	["Ji"] = { ["ground"] = "Blue Shado-Pan Riding Tiger", ["flying"] = "Thundering Onyx Cloud Serpent", ["hs"] = "Dominated Hearthstone", },
	["June"] = { ["ground"] = "Springfur Alpaca", ["flying"] = "Wastewander Skyterror", },
	["Kathryn"] = { ["ground"] = "Summon Dawnforge Ram", ["flying"] = "Dusky Waycrest Gryphon", ["aquatic"] = "Darkwater Skate", },
	["Katya"] = { ["ground"] = "Bleakhoof Ruinstrider", },
	["Kiasmos"] = { ["ground"] = "Core Hound", ["flying"] = "Pureblood Fire Hawk", ["dragon"] = "Highland Drake", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Dominated Hearthstone", },
	["Kiwi"] = {},
	["Leaf"] = { ["ground"] = "Wandering Ancient", },
	["Leo"] = { ["ground"] = "Highlord's Golden Charger", ["flying"] = "Sapphire Skyblazer", ["dragon"] = "Winding Slitherdrake", },
	["Lif"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", ["aquatic"] = "Crimson Tidestallion", },
	["Linda"] = { ["ground"] = "Snapback Scuttler", ["flying"] = "Siltwing Albatross", ["dragon"] = "Windborne Velocidrake", },
	["Ling"] = { ["ground"] = "Golden Riding Crane", ["flying"] = "Violet Pandaren Phoenix", },
	["Lion"] = { ["ground"] = "Magmashell", ["flying"] = "Battlelord's Bloodthirsty War Wyrm", ["dragon"] = "Renewed Proto-Drake", },
	["Liou"] = { ["ground"] = "Ban-Lu, Grandmaster's Companion", ["flying"] = "Emerald Pandaren Phoenix", },
	["Lisa"] = { ["ground"] = "Llothien Prowler", ["flying"] = "Vulpine Familiar", },
	["Liz"] = { ["ground"] = "Vicious War Trike", ["flying"] = "Shadowblade's Baneful Omen", },
	["Lua"] = { },
	["Lucas"] = { ["ground"] = "Running Wild", ["flying"] = "Armored Bloodwing", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Venthyr Sinstone", },
	["Mab"] = { },
	["Malgorzata"] = { ["ground"] = "Felsaber", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Maria"] = { ["ground"] = "Grimhowl", ["flying"] = "Obsidian Worldbreaker", ["aquatic"] = "Inkscale Deepseeker", ["hs"] = "Fire Eater's Hearthstone", },
	["Marisol"] = { ["ground"] = "Sundancer", ["flying"] = "Heavenly Azure Cloud Serpent", ["dragon"] = "Windborne Velocidrake", },
	["Maya"] = { },
	["Mayhem"] = { ["ground"] = "Hellfire Infernal", ["flying"] = "Wastewarped Deathwalker", ["hs"] = "Venthyr Sinstone", },
	["Medea"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Ardenweald Wilderling", ["hs"] = "Eternal Traveler's Hearthstone", },
	["Mei"] = { ["ground"] = "Great brown Dragon Turtle", },
	["Mikael"] = { ["ground"] = "Summon Great Exarch's Elekk", ["flying"] = "Enchanted Fey Dragon", ["hs"] = "Holographic Digitalization Hearthstone", },
	["Milo"] = { ["ground"] = "Scrapforged Mechaspider", ["flying"] = "Stormwind Skychaser", },
	["Moronica"] = { },
	["My"] = { ["ground"] = "Hellfire Infernal", ["flying"] = "Bronzewing Vespoid", },
	["Namu"] = { },
	["Nea"] = { ["ground"] = "Colossal Wraithbound Mawrat", ["flying"] = "Azure Netherwing Drake", },
	["Njord"] = { ["ground"] = "Snapdragon Kelpstalker", ["flying"] = "Abyss Worm", },
	["Nord"] = { ["ground"] = "Ironbound Wraithcharger", ["flying"] = "Icebound Frostbrood Vanquisher", },
	["Norega"] = { ["ground"] = "Warstitched Darkhound", ["flying"] = "Witherbark Direwing", },
	["Nour"] = { ["ground:2"] = "Vicious Sabertooth", ["ground"] = "Stormhide Salamanther", ["flying"] = "High Priest's Lightsworn Seeker", ["dragon:2"] = "Highland Drake", ["dragon"] = "Renewed Proto-Drake", ["aquatic"] = "Saltwater Seahorse", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Onion"] = { ["ground"] = "Midnight", ["flying"] = "The Dreadwake", },
	["Ornacia"] = { },
	["Pang"] = { ["ground"] = "Obsidian Vorquin", ["flying"] = "Black Drake", ["hs"] = "Timewalker's Hearthstone", },
	["Peppermint"] = { ["flying"] = "Hogrus, Swine of Good Fortune", },
	["Pest"] = { ["ground"] = "Elusive Quickhoof", ["flying"] = "Waste Marauder", },
	["Phoebe"] = { ["flying"] = "Priestess' Moonsaber", ["hs"] = "Lunar Elder's Hearthstone", },
	["Prue"] = { ["ground"] = "Dapple Gray", ["flying"] = "Glacial Tidestorm", },
	["Ravioli"] = { ["ground"] = "Vicious War Mechanostrider", ["flying"] = "Mimiron's Head", },
	["Rose"] = { ["ground"] = "White Riding Goat", ["flying"] = "X-45 Heartbreaker", ["aquatic"] = "Crimson Tidestallion", ["hs"] = "Peddlefeet's Lovely Hearthstone", },
	["Salyssra"] = { ["ground"] = "Lucid Nightmare", ["flying"] = "Uncorrupted Voidwing", ["hs"] = "Dominated Hearthstone", },
	["Schnappi"] = { ["dragon"] = "Windborne Velocidrake", },
	["Selma"] = { ["ground"] = "Stormpike Battle Ram", ["flying"] = "Valarjar Stormwing", ["dragon"] = "Winding Slitherdrake", ["hs"] = "Brewfest Reveler's Hearthstone", },
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
	["Spoon"] = { ["ground"] = "Vicious War Kodo", ["flying"] = "Farseer's Raging Tempest", ["aquatic"] = "Saltwater Seahorse", ["dragon"] = "Renewed Proto-Drake", },
	["Syrah"] = { ["ground"] = "Nightborne Manasaber", ["flying"] = "Arcanist's Manasaber", },
	["Syro"] = { ["ground"] = "Frenzied Feltalon", ["flying"] = "Slayer's Felbroken Shrieker", },
	["Tix"] = { ["ground"] = "Caravan Hyena", ["flying"] = "Waste Marauder", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Timewalker's Hearthstone", },
	["Tor"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Island Thunderscale", ["hs"] = "The Innkeeper's Daughter", },
	["Tracyanne"] = { ["ground"] = "Vicious War Ram", ["flying"] = "Grand Gryphon", ["aquatic"] = "Subdued Seahorse", ["dragon"] = "Windborne Velocidrake", ["hs"] = "The Innkeeper's Daughter", },
	["Vack"] = { ["ground"] = "Running Wild", ["flying"] = "Witherbark Direwing", ["aquatic"] = "Fathom Dweller", },
	["Veka"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Spectral Pterrorwing", ["dragon"] = "Windborne Velocidrake", },
	["Vendegast"] = { ["ground"] = "Battle-Bound Warhound", ["flying"] = "Witherbark Direwing", },
	["Vevica"] = { ["ground"] = "Vicious War Elekk", ["flying"] = "Darkspore Mana Ray", },
	["Victoria"] = { ["ground"] = "Vicious Warstrider", ["flying"] = "Nether-Gorged Greatwyrm", },
	["Vidalia"] = { ["ground"] = "Ratstallion", ["flying"] = "Deathlord's Vilebrood Vanquisher", },
	["Viktor"] = { ["ground"] = "Bloodfang Widow", ["flying"] = "Witherbark Direwing", },
	["Violaine"] = { ["ground"] = "Umber Nightsaber", ["flying"] = "Teldrassil Hippogryph", ["aquatic"] = "Saltwater Seahorse", },
	["Will"] = { },
	["Wiz"] = { ["ground"] = "Bone-White Primal Raptor", ["flying"] = "Tazavesh Gearglider", ["hs"] = "Kyrian Hearthstone", },
	["Wo"] = { ["ground"] = "Beastlord's Warwolf", ["flying"] = "Grand Armored Wyvern", ["hs"] = "Ohn'ir Windsage's Hearthstone", },
	["Wyle"] = { ["ground"] = "Skullripper", ["flying"] = "Witherbark Direwing", ["dragon"] = "Windborne Velocidrake", },
	["Yarn"] = { ["ground"] = "Ashhide Mushan Beast", ["flying"] = "Clutch of Ji-Kun", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Fire Eater's Hearthstone", },
	["Yessica"] = { ["ground"] = "Beryl Ruinstrider", ["flying"] = "Enchanted Fey Dragon", },
	["Yuki"] = { ["ground"] = "Pale Acidmaw", ["flying"] = "Rajani Warserpent", ["aquatic"] = "Sea Turtle", ["hs"] = "Night Fae Hearthstone", },
	["Yulia"] = { ["ground"] = "Umber Ruinstrider", ["flying"] = "Vibrant Mana Ray", },
	["Zap"] = { ["ground"] = "Swift Purple Raptor", ["flying"] = "Armored Skyscreamer", ["dragon"] = "Windborne Velocidrake", },
	["Ziguni"] = { ["ground"] = "Vicious War Raptor", ["flying"] = "Bloodthirsty Dreadwing", ["dragon"] = "Windborne Velocidrake", },
	["Zo"] = { ["ground"] = "Scarlet Helicid", ["flying"] = "Vespoid Flutterer", ["hs"] = "Timewalker's Hearthstone", },
	["Zoal"] = { ["ground"] = "Kor'kron War Wolf", ["flying"] = "Violet Netherwing Drake", ["dragon"] = "Renewed Proto-Drake", ["hs"] = "Lunar Elder's Hearthstone", },
	["Zoom"] = { ["ground"] = "Scarlet Helicid", ["flying"] = "Darkmoon Dirigible", },
	["Zorp"] = { ["ground"] = "Brawler's Burly Basilisk", ["flying"] = "Grinning Reaver", ["dragon"] = "Renewed Proto-Drake", },
	["Zsa"] = { ["ground"] = "Gorestrider Gronnling", ["flying"] = "Soaring Skyterror", ["dragon"] = "Renewed Proto-Drake", },
	["Zumaridi"] = { },
}




-- Pet Icons

Automagic.PetIcons = {
	-- Hunters
	["Aldous"] = { ["Blue"] = 1861689, },
	["Auros"] = { ["Yros"] = 1602322, },
	["Alec"] = { ["Mana"] = "Interface/AddOns/Media_Newsom/Pets/ManasaberBlue", },
	["Apera"] = { ["Anna"] = 1392564, ["Arra'chea"] = 132245, },
	["Appi"] = {
		["Steve"] = 667690,
		["Andy"] = 1504874,
		["Blep"] = 1390637,
		["Frank"] = 464160,
		["Toothpaste"] = 1570766,
	},
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