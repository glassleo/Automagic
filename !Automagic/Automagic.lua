local gr, fl, aq, su, pa, hs, co = {}, {}, {}, {}, {}, {}, {}
local throttled = {}
-------------------------------


-- Default fallbacks

local default_gr = "[nomounted]Swift Springstrider"
local default_fl = "[nomounted]Albino Drake"
local default_aq = "Subdued Seahorse"
local default_pa = "X-53 Touring Rocket"
local default_hs = "Eternal Traveler's Hearthstone"




































-- Character specific

----------------------------------------------------
-- Alliance
----------------------------------------------------
-- Ravenholdt I
----------------------------------------------------

-- Agon
gr.Agon 		= "[nomounted]Avenging Felcrusher"
fl.Agon 		= "[nomounted]High Priest's Lightsworn Seeker"

-- Chow
gr.Chow 		= "[nomounted]Blue Shado-Pan Riding Tiger"

-- Ellika
gr.Ellika 		= "[nomounted]Beryl Ruinstrider"
fl.Ellika 		= "[nomounted]Ankoan Waveray"

-- Ethan
gr.Ethan 		= "[nomounted]Vicious War Fox"
fl.Ethan 		= "[nomounted]Armored Blue Dragonhawk"

-- Fax
gr.Fax 			= "[nomounted]Explorer's Dunetrekker"
fl.Fax 			= "[nomounted]Explorer's Jungle Hopper"

-- Ólafur
gr["Ólafur"] 	= "[nomounted]Summon Dawnforge Ram"
fl["Ólafur"] 	= "[nomounted]Time-Lost Proto-Drake"

-- Skuggi
gr.Skuggi 		= "[nomounted]Midnight"
fl.Skuggi 		= "[nomounted]Malevolent Drone"

----------------------------------------------------
-- Sporeggar I
----------------------------------------------------

-- Aero
gr.Aero 		= "[nomounted]Pureheart Courser"
fl.Aero 		= "[nomounted]Cloudwing Hippogryph"

-- Asami
gr.Asami 		= "[nomounted]Regal Riding Crane"
fl.Asami 		= "[nomounted]Rajani Warserpent"

-- Castor
gr.Castor 		= "[nomounted]Vicious Kaldorei Warsaber"
fl.Castor 		= "[nomounted]Teldrassil Hippogryph"

-- Desmond
gr.Desmond 		= "[nomounted]Starcursed Voidstrider"
fl.Desmond 		= "[nomounted]Uncorrupted Voidwing"

-- Dreki
gr.Dreki 		= "[nomounted]Core Hound"
fl.Dreki 		= "[nomounted]Pureblood Fire Hawk"

----------------------------------------------------
-- The Venture Co I
----------------------------------------------------

-- Asteria
gr.Asteria 		= "[nomounted]Priestess' Moonsaber"
fl.Asteria 		= "[nomounted]Teldrassil Hippogryph"

-- Coeus
gr.Coeus 		= "[nomounted]Kaldorei Nightsaber"
fl.Coeus 		= "[nomounted]Silver Covenant Hippogryph"

-- Eris
gr.Eris 		= "[nomounted]Felsaber"
fl.Eris 		= "[nomounted]Slayer's Felbroken Shrieker"

-- Hecate
gr.Hecate 		= "[nomounted]Bloodfang Widow"
fl.Hecate 		= "[nomounted]Nazjatar Blood Serpent"

-- Sacha
gr.Sacha 		= "[nomounted]Blessed Felcrusher"
fl.Sacha 		= "[nomounted]Enchanted Fey Dragon"

----------------------------------------------------
-- Skullcrusher I
----------------------------------------------------

-- Bruce
gr.Bruce 		= "[nomounted]Regal Riding Crane"
fl.Bruce 		= "[nomounted]Azure Cloud Serpent"

-- Ingrid
gr.Ingrid 		= "[nomounted]Invincible"
fl.Ingrid 		= "[nomounted]Invincible"

-- Karl
gr.Karl 		= "[nomounted]Blackpaw"
fl.Karl 		= "[nomounted]Proudmoore Sea Scout"

-- Vigg
gr.Vigg 		= "[nomounted]Umber Nightsaber"
fl.Vigg 		= "[nomounted]Teldrassil Hippogryph"

----------------------------------------------------
-- Sporeggar II
----------------------------------------------------

-- Andrew
gr.Andrew		= "[nomounted]Blackpaw"
fl.Andrew 		= "[nomounted]Alabaster Stormtalon"

-- Auros
gr.Auros 		= "[nomounted]Glorious Felcrusher"
fl.Auros 		= "[nomounted]Scintillating Mana Ray"

-- Flor
hs.Flor 		= "Noble Gardener's Hearthstone"

-- Gloria
gr.Gloria 		= "[nomounted]Lightforged Felcrusher"
fl.Gloria 		= "[nomounted]Scintillating Mana Ray"

-- Janet
gr.Janet 		= "[nomounted]Starcursed Voidstrider"
fl.Janet 		= "[nomounted]Twilight Avenger"

-- Phoebe
gr.Phoebe		= "[nomounted]Priestess' Moonsaber"
fl.Phoebe		= "[nomounted]Priestess' Moonsaber"
hs.Phoebe 		= "Lunar Elder's Hearthstone"

-- Violaine
gr.Violaine		= "[nomounted]Umber Nightsaber"
fl.Violaine		= "[nomounted]Teldrassil Hippogryph"
aq.Violaine 	= "Saltwater Seahorse"
hs.Violaine 	= "Lunar Elder's Hearthstone"

-- Wax
gr.Wax 			= "[nomounted]Sandy Nightsaber"
fl.Wax 			= "[nomounted]Honeyback Harvester"
hs.Wax 			= "Noble Gardener's Hearthstone"

-- Wes
gr.Wes 			= "[nomounted]Black Riding Goat"
fl.Wes 			= "[nomounted]Steamscale Incinerator"

----------------------------------------------------
-- Ravenholdt II
----------------------------------------------------

-- Malgorzata
gr.Malgorzata	= "[nomounted]Felsaber"
fl.Malgorzata	= "[nomounted]Slayer's Felbroken Shrieker"

-- Margaret
gr.Margaret		= "[nomounted]Kul Tiran Charger"
fl.Margaret 	= "[nomounted]Proudmoore Sea Scout"

-- Medea
gr.Medea 		= "[nomounted]Lucid Nightmare"
fl.Medea 		= "[nomounted]Twilight Drake"

-- Parsec
gr.Parsec		= "[nomounted]Prestigious Royal Courser"
fl.Parsec 		= "[nomounted]Onyx Netherwing Drake"

-- Selma
gr.Selma 		= "[nomounted]Stormpike Battle Ram"
fl.Selma 		= "[nomounted]Valarjar Stormwing"
hs.Selma 		= "Brewfest Reveler's Hearthstone"

-- Vack
gr.Vack			= "[nomounted]Running Wild"
fl.Vack			= "[nomounted]Witherbark Direwing"
aq.Vack 		= "Fathom Dweller"

-- Yulia
gr.Yulia		= "[nomounted]Bleakhoof Ruinstrider"
fl.Yulia		= "[nomounted]Felglow Mana Ray"

----------------------------------------------------
-- Xavius II
----------------------------------------------------

-- Aleksandr
gr.Aleksandr 	= "[nomounted]Vicious War Elekk"
fl.Aleksandr 	= "[nomounted]Vibrant Mana Ray"

-- Hart
gr.Hart 		= "[nomounted]Highlord's Golden Charger"
fl.Hart 		= "[nomounted]Grand Armored Gryphon"

-- Leo
gr.Leo1 		= "[nomounted]Highlord's Golden Charger"
fl.Leo1 		= "[nomounted]Grand Armored Gryphon"

-- Liam
gr.Liam 		= "[nomounted]Goldenmane"
fl.Liam 		= "[nomounted]Violet Spellwing"
hs.Liam			= "Tome of Town Portal"

----------------------------------------------------
-- Ravenholdt III
----------------------------------------------------

-- Iro
gr.Iro			= "[nomounted]Felsaber"
fl.Iro			= "[nomounted]Cloudwing Hippogryph"

-- Kathryn
gr.Kathryn		= "[nomounted]Summon Dawnforge Ram"
fl.Kathryn		= "[nomounted]Dusky Waycrest Gryphon"
aq.Kathryn 		= "Darkwater Skate"

-- Lucas
gr.Lucas		= "[nomounted]Running Wild"
fl.Lucas		= "[nomounted]Armored Bloodwing"

-- Pavla
gr.Pavla 		= "[nomounted]Shadowhide Pearltusk"
fl.Pavla 		= "[nomounted]Farseer's Raging Tempest"

-- Prue
gr.Prue			= "[nomounted]Dapple Gray"
fl.Prue			= "[nomounted]Glacial Tidestorm"

-- Tracyanne
gr.Tracyanne 	= "[nomounted]Vicious War Ram"
fl.Tracyanne 	= "[nomounted]Grand Gryphon"
hs.Tracyanne 	= "The Innkeeper's Daughter"

----------------------------------------------------
-- Scarshield Legion III
----------------------------------------------------

-- Beans

-- Edith
gr.Edith 		= "[nomounted]Dapple Gray"
fl.Edith 		= "[nomounted]Stormsong Coastwatcher"

-- Erika

-- Errol
gr.Errol 		= "[nomounted]Grove Warden"
fl.Errol 		= "[nomounted]Grove Warden"
hs.Errol 		= "Lunar Elder's Hearthstone"

-- Violet
gr.Violet 		= "[nomounted]Lucid Nightmare"
fl.Violet 		= "[nomounted]Uncorrupted Voidwing"

----------------------------------------------------
-- Sporeggar III
----------------------------------------------------

-- Elsa
gr.Elsa 		= "[nomounted]Summon Darkforge Ram"

-- Isak
gr.Isak 		= "[nomounted]Avenging Felcrusher"
fl.Isak 		= "[nomounted]Vibrant Mana Ray"

-- Jon
gr.Jon 			= "[nomounted]Beastlord's Warwolf"

-- Karin
gr.Karin 		= "[nomounted]Admiralty Stallion"

-- Monica
gr.Monica 		= "[nomounted]Smoky Charger"

----------------------------------------------------
-- Darkmoon Faire III
----------------------------------------------------

-- Hilda
gr.Hilda 		= "[nomounted]Summon Dawnforge Ram"
fl.Hilda 		= "[nomounted]Grand Armored Gryphon"

-- Tor
gr.Tor 			= "[nomounted]Beastlord's Warwolf"
hs.Tor 			= "The Innkeeper's Daughter"

----------------------------------------------------
-- Al'Akir III
----------------------------------------------------

-- Altair
gr.Altair 		= "[nomounted]Prestigious Forest Courser"
fl.Altair 		= "[nomounted]Shadowblade's Baneful Omen"

-- Ava
gr.Ava 			= "[nomounted]Avenging Felcrusher"

-- Fuzz
hs.Fuzz 		= "Lunar Elder's Hearthstone"

-- Rex
gr.Rex 			= "[nomounted]Felsaber"
fl.Rex 			= "[nomounted]Slayer's Felbroken Shrieker"

----------------------------------------------------
-- Sporeggar IV
----------------------------------------------------

-- Blanc
gr.Blanc 		= "[nomounted]Lucid Nightmare"

-- Grey
gr.Grey 		= "[nomounted]Vicious Gilnean Warhorse"

-- Ki
gr.Ki 			= "[nomounted]Arcanist's Manasaber"
fl.Ki 			= "[nomounted]Arcanist's Manasaber"

-- Mab

-- Milo
gr.Milo			= "[nomounted]Scrapforged Mechaspider"
fl.Milo 		= "[nomounted]Stormwind Skychaser"

-- Nieve
gr.Nieve 		= "[nomounted]Vicious Kaldorei Warsaber"
fl.Nieve 		= "[nomounted]Teldrassil Hippogryph"

-- Ty
gr.Ty 			= "[nomounted]Gnomeregan Mechanostrider"
fl.Ty 			= "[nomounted]Mimiron's Head"

-- Yessica
gr.Yessica 		= "[nomounted]Beryl Ruinstrider"
fl.Yessica 		= "[nomounted]Enchanted Fey Dragon"

-- Zip
gr.Zip 			= "[nomounted]Prestigious Bronze Courser"

----------------------------------------------------
-- Ravenholdt IV
----------------------------------------------------

-- Debbie
gr.Debbie 		= "[nomounted]Mystic Runesaber"
fl.Debbie 		= "[nomounted]Mystic Runesaber"

-- Elise
gr.Elise 		= "[nomounted]White Riding Goat"
fl.Elise 		= "[nomounted]Leyfeather Hippogryph"
aq.Elise 		= "Crimson Tidestallion"
hs.Elise 		= "Peddlefeet's Lovely Hearthstone"

-- Lisa
gr.Lisa 		= "[nomounted]Goldenmane"
fl.Lisa 		= "[nomounted]High Priest's Lightsworn Seeker"

-- Lua

-- Monade
gr.Monade 		= "[nomounted]Felsaber"
fl.Monade 		= "[nomounted]Slayer's Felbroken Shrieker"

-- Ravioli
gr.Ravioli		= "[nomounted]Vicious War Mechanostrider"
fl.Ravioli		= "[nomounted]Mimiron's Head"

-- Sook
gr.Sook 		= "[nomounted]Golden Riding Crane"

-- Vevica
gr.Vevica		= "[nomounted]Vicious War Elekk"
fl.Vevica		= "[nomounted]Darkspore Mana Ray"

----------------------------------------------------
-- Al'Akir IV
----------------------------------------------------

-- Ludmila
gr.Ludmila 		= "[nomounted]Avenging Felcrusher"
fl.Ludmila 		= "[nomounted]Darkspore Mana Ray"

-- Nix
gr.Nix 			= "[nomounted]Netherlord's Chaotic Wrathsteed"
fl.Nix 			= "[nomounted]Black Serpent of N'Zoth"

-- Wu
gr.Wu 			= "[nomounted]Ban-Lu, Grandmaster's Companion"
fl.Wu 			= "[nomounted]Thundering Jade Cloud Serpent"

----------------------------------------------------
-- Sporeggar V
----------------------------------------------------

-- Harebrain
gr.Harebrain 	= "[nomounted]Scrapforged Mechaspider"
fl.Harebrain 	= "[nomounted]Shadowbarb Drone"

-- Helena
gr.Helena 		= "[nomounted]Lightforged Warframe"
fl.Helena 		= "[nomounted]Lightforged Warframe"

-- Hexan
gr.Hexan 		= "[nomounted]Hellfire Infernal"

-- How
gr.How 			= "[nomounted]Swift Windsteed"
fl.How 			= "[nomounted]Swift Windsteed"

-- Lillian
gr.Lillian 		= "[nomounted]Kul Tiran Charger"

-- Matilda
gr.Matilda 		= "[nomounted]KUl Tiran Charger"
fl.Matilda 		= "[nomounted]Proudmoore Sea Scout"

-- Niels
gr.Niels 		= "[nomounted]Garn Nighthowl"

-- Simeon
gr.Simeon 		= "[nomounted]Vicious War Ram"

-- Tek
gr.Tek 			= "[nomounted]Blessed Felcrusher"

----------------------------------------------------
-- Scarshield Legion V
----------------------------------------------------

-- Aska
gr.Aska 		= "[nomounted]Summon Darkforge Ram"

-- Claw

-- Fix
gr.Fix 			= "[nomounted]Ratstallion"

-- Leaf
gr.Leaf 		= "[nomounted]Wandering Ancient"

-- Misty

-- Olivia
gr.Olivia 		= "[nomounted]White Riding Goat"

-- Sharaya
gr.Sharaya 		= "[nomounted]Lucid Nightmare"

-- Sigurd
gr.Sigurd 		= "[nomounted]Blackpaw"

----------------------------------------------------
-- Skullcrusher V
----------------------------------------------------

-- Missy
gr.Missy 		= "[nomounted]Smoky Charger"

-- Nancy
gr.Nancy 		= "[nomounted]Scrapforged Mechaspider"
fl.Nancy 		= "[nomounted]Aerial Unit R-21/X"

-- Nora
gr.Nora 		= "[nomounted]Core Hound"

-- Pang
gr.Pang 		= "[nomounted]Netherlord's Brimstone Wrathsteed"

----------------------------------------------------
-- Scarshield Legion VI
----------------------------------------------------

-- Cordelia
gr.Cordelia 	= "[nomounted]Black Riding Goat"

-- Frid

-- Heather
gr.Heather 		= "[nomounted]Llothien Prowler"

-- Hera
gr.Hera 		= "[nomounted]Dark Iron Core Hound"

-- Nord
gr.Nord 		= "[nomounted]Ironbound Wraithcharger"
fl.Nord 		= "[nomounted]Icebound Frostbrood Vanquisher"

-- Peppermint
gr.Peppermint 	= "[nomounted]Hogrus, Swine of Good Fortune"

-- Sun
gr.Sun 			= "[nomounted]Vicious War Turtle"
fl.Sun 			= "[nomounted]Yu'lei, Daughter of Jade"

-- Will
gr.Will 		= "[nomounted]Dapple Gray"
fl.Will 		= "[nomounted]Stormsong Coastwatcher"

----------------------------------------------------
-- The Venture Co VI
----------------------------------------------------

-- Beryl
gr.Beryl 		= "[nomounted]Lucid Nightmare"
fl.Beryl 		= "[nomounted]Shadowbarb Drone"

-- Eld
gr.Eld 			= "[nomounted]Core Hound"
fl.Eld 			= "[nomounted]Pureblood Fire Hawk"
aq.Eld 			= "Crimson Tidestallion"
hs.Eld 			= "Fire Eater's Hearthstone"

-- Grace
gr.Grace		= "[nomounted]Avenging Felcrusher"

-- Ivan
gr.Ivan 		= "[nomounted]Running Wild"
fl.Ivan 		= "[nomounted]Obsidian Worldbreaker"

-- Kit
gr.Kit 			= "[nomounted]Argent Charger"

-- Mak
gr.Mak 			= "[nomounted]Summon Darkforge Ram"
fl.Mak 			= "[nomounted]Spawn of Galakras"

-- Mikael
gr.Mikael 		= "[nomounted]Summon Great Exarch's Elekk"
fl.Mikael 		= "[nomounted]Enchanted Fey Dragon"
hs.Mikael 		= "Holographic Digitalization Hearthstone"

-- Sinikka
gr.Sinikka 		= "[nomounted]Bristling Hellboar"
fl.Sinikka 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

----------------------------------------------------
-- Ravenholdt VI
----------------------------------------------------

-- Idunn
gr.Idunn 		= "[nomounted]Dark Iron Core Hound"
fl.Idunn 		= "[nomounted]Shadowblade's Crimson Omen"

-- My
gr.My 			= "[nomounted]Hellfire Infernal"

-- Wane
gr.Wane 		= "[nomounted]Vile Fiend"
fl.Wane 		= "[nomounted]Slayer's Felbroken Shrieker"

----------------------------------------------------
-- Xavius VI
----------------------------------------------------

-- Hel
gr.Hel 			= "[nomounted]Kaldorei Nightsaber"
fl.Hel 			= "[nomounted]Shadowblade's Lethal Omen"
hs.Hel 			= "Lunar Elder's Hearthstone"

-- Minerva
gr.Minerva 		= "[nomounted]Dapple Gray"

-- Mischa
gr.Mischa 		= "[nomounted]Cerulean Ruinstrider"

-- Pam
gr.Pam 			= "[nomounted]Court Sinrunner"

----------------------------------------------------
-- Sporeggar VII
----------------------------------------------------

-- Aldous
gr.Aldous 		= "[nomounted]Starcursed Voidstrider"
fl.Aldous 		= "[nomounted]Shadowbarb Drone"

-- Brigitte
gr.Brigitte 	= "[nomounted]Seabraid Stallion"

-- Floyd
gr.Floyd		= "[nomounted]Vicious War Bear"
fl.Floyd		= "[nomounted]Stormsong Coastwatcher"
hs.Floyd		= "Tome of Town Portal"

-- Hekla
gr.Hekla 		= "[nomounted]Bristling Hellboar"

-- Sonya
gr.Sonya 		= "[nomounted]Summon Dawnforge Ram"

-- Vidalia
gr.Vidalia 		= "[nomounted]Ratstallion"
fl.Vidalia 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Vidar
gr.Vidar 		= "[nomounted]Vicious War Ram"

----------------------------------------------------
-- The Venture Co VII
----------------------------------------------------

-- Brock
gr.Brock 		= "[nomounted]Kul Tiran Charger"
fl.Brock 		= "[nomounted]Proudmoore Sea Scout"

-- Hazel
gr.Hazel 		= "[nomounted]Azure Riding Crane"

-- It
gr.It 			= "[nomounted]Ratstallion"

-- Katya
gr.Katya 		= "[nomounted]Cerulean Ruinstrider"

-- Shanna
gr.Shanna 		= "[nomounted]Admiralty Stallion"

-- Song
gr.Song 		= "[nomounted]Bruce"
fl.Song 		= "[nomounted]Pandaren Kite"

-- Susie
gr.Susie 		= "[nomounted]Highlord's Vengeful Charger"

----------------------------------------------------
-- Ravenholdt VII
----------------------------------------------------

-- Arnald
gr.Arnald 		= "[nomounted]Highlord's Vigilant Charger"
fl.Arnald 		= "[nomounted]Grand Armored Gryphon"

-- Berg
gr.Berg 		= "[nomounted]Vicious War Ram"
fl.Berg 		= "[nomounted]Alabaster Stormtalon"

-- Mary
gr.Mary 		= "[nomounted]Crimson Deathcharger"
fl.Mary 		= "[nomounted]Armored Bloodwing"

-- Oki
gr.Oki 			= "[nomounted]Bristling Hellboar"

-- Vilma
gr.Vilma 		= "[nomounted]Ratstallion"
fl.Vilma 		= "[nomounted]Shadowblade's Crimson Omen"

----------------------------------------------------
-- Xavius VII
----------------------------------------------------

-- Björn

-- Claire
gr.Claire 		= "[nomounted]Vicious War Ram"
fl.Claire 		= "[nomounted]Proudmoore Sea Scout"

-- Kenneth
gr.Kenneth 		= "[nomounted]Lil' Donkey"
fl.Kenneth 		= "[nomounted]Shadowbarb Drone"

-- Visp
gr.Visp 		= "[nomounted]Running Wild"

----------------------------------------------------
-- Scarshield Legion VIII
----------------------------------------------------

-- Eric
gr.Eric 		= "[nomounted]Rocktusk Battleboar"
fl.Eric 		= "[nomounted]Honeyback Harvester"

-- Irene
gr.Irene 		= "[nomounted]Cindermane Charger"
fl.Irene 		= "[nomounted]Cindermane Charger"
hs.Irene 		= "Fire Eater's Hearthstone"

-- Oberon
gr.Oberon 		= "[nomounted]Acherus Deathcharger"
fl.Oberon 		= "[nomounted]Black Serpent of N'Zoth"

-- Rose
gr.Rose 		= "[nomounted]Smoky Charger"

-- Steve
gr.Steve 		= "[nomounted]Warforged Nightmare"
fl.Steve 		= "[nomounted]Warforged Nightmare"
hs.Steve 		= "Holographic Digitalization Hearthstone"

----------------------------------------------------
-- Defias Brotherhood VII
----------------------------------------------------

-- Ghost
gr.Ghost 		= "[nomounted]Running Wild"

-- Julie
gr.Julie 		= "[nomounted]Scrapforged Mechaspider"
hs.Julie 		= "Holographic Digitalization Hearthstone"

-- Mark
gr.Mark 		= "[nomounted]Smoky Charger"
fl.Mark 		= "[nomounted]Dusky Waycrest Gryphon"

-- Suzanne
gr.Suzanne 		= "[nomounted]Black Riding Goat"
fl.Suzanne 		= "[nomounted]Siltwing Albatross"

----------------------------------------------------
-- Sporeggar VII
----------------------------------------------------

-- Maria
gr.Maria	 	= "[nomounted]Cerulean Ruinstrider"
fl.Maria 		= "[nomounted]Vibrant Mana Ray"

-- Melissa
gr.Melissa 		= "[nomounted]Prestigious Royal Courser"
fl.Melissa 		= "[nomounted]Cobalt Netherwing Drake"

-- Sistine
gr.Sistine 		= "[nomounted]Kaldorei Nightsaber"

-- Torunn
gr.Torunn 		= "[nomounted]Stormpike Battle Ram"
fl.Torunn 		= "[nomounted]Battlelord's Bloodthirsty War Wyrm"

----------------------------------------------------
-- The Venture Co VII
----------------------------------------------------

-- Betty
gr.Betty 		= "[nomounted]Mechagon Mechanostrider"
fl.Betty 		= "[nomounted]Mimiron's Head"
hs.Betty 		= "Holographic Digitalization Hearthstone"

-- Ed
gr.Ed 			= "[nomounted]Scrapforged Mechaspider"
fl.Ed 			= "[nomounted]Rustbolt Resistor"
hs.Ed 			= "Holographic Digitalization Hearthstone"

-- Frank
gr.Frank 		= "[nomounted]Netherlord's Chaotic Wrathsteed"
fl.Frank 		= "[nomounted]Netherlord's Chaotic Wrathsteed"

-- Jack
gr.Jack 		= "[nomounted]Vicious Gilnean Warhorse"
fl.Jack 		= "[nomounted]Shadowblade's Lethal Omen"

----------------------------------------------------
-- Skullcrusher VII
----------------------------------------------------

-- Gunnar
gr.Gunnar 		= "[nomounted]Vicious War Ram"
fl.Gunnar 		= "[nomounted]Proudmoore Sea Scout"
hs.Gunnar 		= "The Innkeeper's Daughter"

-- Sam
gr.Sam 			= "[nomounted]Vicious War Elekk"
fl.Sam 			= "[nomounted]Violet Netherwing Drake"

----------------------------------------------------
-- Xavius VII
----------------------------------------------------

-- Britney
gr.Britney 		= "[nomounted]Swift Mountain Horse"
fl.Britney 		= "[nomounted]Shadowbarb Drone"

-- Joe
gr.Joe 			= "[nomounted]Seabraid Stallion"
fl.Joe 			= "[nomounted]Proudmoore Sea Scout"

----------------------------------------------------




































----------------------------------------------------
-- Horde
----------------------------------------------------
-- The Sha'tar I
----------------------------------------------------

-- Aka
gr.Aka 			= "[nomounted]Highmountain Thunderhoof"
fl.Aka 			= "[nomounted]Clutch of Ji-Kun"

-- Ap
gr.Ap 			= "[nomounted]Highmountain Elderhorn"
fl.Ap 			= "[nomounted]Huntmaster's Loyal Wolfhawk"

-- Grime
gr.Grime 		= "[nomounted]Mag'har Direwolf"
fl.Grime 		= "[nomounted]Iron Skyreaver"

-- Hao
gr.Hao 			= "[nomounted]Great Blue Dragon Turtle"
fl.Hao 			= "[nomounted]Golden Cloud Serpent"

-- Wuso
gr.Wuso 		= "[nomounted]Vicious War Raptor"
fl.Wuso 		= "[nomounted]Witherbark Direwing"

----------------------------------------------------
-- Steamwheedle Cartel I
----------------------------------------------------

-- Desna
gr.Desna 		= "[nomounted]Frostwolf Snarler"
fl.Desna 		= "[nomounted]Grand Armored Wyvern"

-- Shu
gr.Shu 			= "[nomounted]Onyx Jeweled Panther"
fl.Shu 			= "[nomounted]Shadowblade's Crimson Omen"

-- Vivianne
gr.Vivianne 	= "[nomounted]Rivendare's Deathcharger"
fl.Vivianne 	= "[nomounted]Witherbark Direwing"

-- Xi
gr.Xi 			= "[nomounted]Ashhide Mushan Beast"
fl.Xi 			= "[nomounted]Cobalt Pterrordax"

----------------------------------------------------
-- Kor'gall I
----------------------------------------------------

-- Cain
gr.Cain 		= "[nomounted]Pureheart Courser"
fl.Cain 		= "[nomounted]Sunreaver Dragonhawk"

-- Luke
gr.Luke 		= "[nomounted]Vicious War Trike"
fl.Luke 		= "[nomounted]Xiwyllag ATV"

-- Martha
gr.Martha 		= "[nomounted]Black War Kodo"
fl.Martha 		= "[nomounted]Grand Armored Wyvern"

-- Zac
gr.Zac 			= "[nomounted]Prestigious Ivory Courser"
fl.Zac 			= "[nomounted]Cloudwing Hippogryph"

----------------------------------------------------
-- Terokkar I
----------------------------------------------------

-- Joana
gr.Joana		= "[nomounted]Swift Purple Raptor"
fl.Joana		= "[nomounted]Cobalt Pterrordax"

-- Ophelia
gr.Ophelia 		= "[nomounted]Vicious Skeletal Warhorse"
fl.Ophelia 		= "[nomounted]Undercity Plaguebat"

-- Paul
gr.Paul 		= "[nomounted]Lucid Nightmare"
fl.Paul 		= "[nomounted]Twilight Avenger"

-- Vincent
gr.Vincent 		= "[nomounted]Netherlord's Chaotic Wrathsteed"
fl.Vincent 		= "[nomounted]Undercity Plaguebat"

----------------------------------------------------
-- Bloodfeather I
----------------------------------------------------

-- Byrne
gr.Byrne 		= "[nomounted]Netherlord's Brimstone Wrathsteed"
fl.Byrne 		= "[nomounted]Antoran Charhound"

-- Ian
gr.Ian 			= "[nomounted]Summon Thalassian Charger"
fl.Ian 			= "[nomounted]Gilded Prowler"

-- Marjorie
gr.Marjorie 	= "[nomounted]Thunder Bluff Kodo"
fl.Marjorie 	= "[nomounted]Battlelord's Bloodthirsty War Wyrm"

----------------------------------------------------
-- The Sha'tar II
----------------------------------------------------

-- Alce

-- Dia
gr.Dia 			= "[nomounted]Mag'har Direwolf"
fl.Dia 			= "[nomounted]Ashenvale Chimaera"
aq.Dia			= "Fathom Dweller"
hs.Dia			= "Lunar Elder's Hearthstone"

-- Emily
gr.Emily		= "[nomounted]Highlord's Vengeful Charger"
fl.Emily		= "[nomounted]Highlord's Vengeful Charger"
hs.Emily		= "Peddlefeet's Lovely Hearthstone"
co.Emily		= "Brilliant Bloodfeather"

-- Galinha
hs.Galinha		= "Lunar Elder's Hearthstone"

-- Lynn
gr.Lynn			= "[nomounted]Arcanist's Manasaber"
fl.Lynn			= "[nomounted]Arcanist's Manasaber"

-- Malaclypse
gr.Malaclypse 	= "[nomounted]Warforged Nightmare"
fl.Malaclypse 	= "[nomounted]Warforged Nightmare"

-- Sandy
gr.Sandy 		= "[nomounted]Grinning Reaver"
fl.Sandy 		= "[nomounted]Grinning Reaver"
hs.Sandy 		= "Fire Eater's Hearthstone"

-- Viktor
gr.Viktor		= "[nomounted]Bloodfang Widow"
fl.Viktor		= "[nomounted]Witherbark Direwing"

-- Wyle
gr.Wyle 		= "[nomounted]Skullripper"
fl.Wyle 		= "[nomounted]Witherbark Direwing"
hs.Wyle 		= "Venthyr Sinstone"

-- Zo
gr.Zo			= "[nomounted]Swift Purple Raptor"
fl.Zo 			= "[nomounted]Drake of the Four Winds"

----------------------------------------------------
-- Moonglade II
----------------------------------------------------

-- Akasia
hs.Akasia 		= "Noble Gardener's Hearthstone"

-- Bess
gr.Bess 		= "[nomounted]Summon Great Sunwalker Kodo"
fl.Bess 		= "[nomounted]Clutch of Ji-Kun"

-- Cafuné
gr["Cafuné"] 	= "Grove Warden"

-- Gary
gr.Gary			= "[nomounted]Alabaster Hyena"
fl.Gary			= "[nomounted]Wastewander Skyterror"
aq.Gary 		= "Saltwater Seahorse"

-- Solene
gr.Solene 		= "[nomounted]Swift Red Hawkstrider"
fl.Solene 		= "[nomounted]Red Dragonhawk"
aq.Solene 		= "Crimson Tidestallion"

-- Ziguni
gr.Ziguni 		= "[nomounted]Vicious War Raptor"
fl.Ziguni 		= "[nomounted]Bloodthirsty Dreadwing"

-- Zoom
gr.Zoom 		= "[nomounted]Brown Riding Goat"
fl.Zoom			= "[nomounted]Darkmoon Dirigible"

----------------------------------------------------
-- Steamwheedle Cartel II
----------------------------------------------------

-- Agata
gr.Agata 		= "[nomounted]Rivendare's Deathcharger"
fl.Agata 		= "[nomounted]Witherbark Direwing"

-- Bab
gr.Bab 			= "[nomounted]Midnight"
fl.Bab 			= "[nomounted]Smoldering Ember Wyrm"

-- Glue
gr.Glue			= "[nomounted]Ironside Warwolf"
fl.Glue			= "[nomounted]Crimson Pandaren Phoenix"

-- Lif
gr.Lif 			= "[nomounted]Golden Riding Crane"
fl.Lif 			= "[nomounted]Violet Pandaren Phoenix"
aq.Lif 			= "Crimson Tidestallion"

-- Rebecca
gr.Rebecca 		= "[nomounted]Vicious Warstrider"
fl.Rebecca 		= "[nomounted]Ashes of Al'ar"

-- Seska
gr.Seska		= "[nomounted]Vicious Warstrider"
fl.Seska		= "[nomounted]Shadowblade's Murderous Omen"

----------------------------------------------------
-- Kor'gall II
----------------------------------------------------

-- Miranda
gr.Miranda 		= "[nomounted]Hellfire Infernal"
fl.Miranda 		= "[nomounted]Armored Red Dragonhawk"

-- Razw
gr.Raz 			= "[nomounted]Predatory Bloodgazer"
fl.Raz 			= "[nomounted]Spectral Pterrorwing"

-- Venom
gr.Venom 		= "[nomounted]Green Primal Raptor"
fl.Venom		= "[nomounted]Captured Swampstalker"

----------------------------------------------------
-- The Sha'tar III
----------------------------------------------------

-- Anna
gr.Anna			= "Highmountain Thunderhoof"
fl.Anna			= "[nomounted,spec:3] Farseer's Raging Tempest; [nomounted]Vitreous Stone Drake"

-- Apera
gr.Apera 		= "[nomounted]Highmountain Elderhorn"
fl.Apera 		= "[nomounted]Huntmaster's Loyal Wolfhawk"

-- Bite

-- Erin
gr.Erin			= "[nomounted]Highlord's Golden Charger"
fl.Erin			= "[nomounted]Highlord's Golden Charger"

-- Etu
gr.Etu			= "[nomounted]Vicious War Kodo"
fl.Etu			= "[nomounted]Clutch of Ji-Kun"

-- Nea
gr.Nea			= "[nomounted]Warforged Nightmare"
fl.Nea			= "[nomounted]Warforged Nightmare"

-- Rok
gr.Rok 			= "[nomounted]Bristling Hellboar"
fl.Rok 			= "[nomounted]Twilight Avenger"

-- Schooka
gr.Schooka 		= "[nomounted]Mag'har Direwolf"
fl.Schooka 		= "[nomounted]Iron Skyreaver"

-- Suri
gr.Suri	 		= "[nomounted]Ironside Warwolf"
fl.Suri			= "[nomounted]Huntmaster's Loyal Wolfhawk"

-- Voo
gr.Voo 			= "Grove Warden"

----------------------------------------------------
-- Steamwheedle Cartel III
----------------------------------------------------

-- Aponi
gr.Aponi		= "[nomounted]Spirit of Eche'ro"
fl.Aponi 		= "[nomounted]Spirit of Eche'ro"

-- Astra
gr.Astra 		= "[nomounted]Nightborne Manasaber"
fl.Astra 		= "[nomounted,spec:1] High Priest's Lightsworn Seeker; [nomounted]Long-Forgotten Hippogryph"
hs.Astra 		= "Lunar Elder's Hearthstone"

-- Echo
gr.Echo			= "[nomounted]Swift Purple Raptor"
fl.Echo			= "[nomounted]Armored Skyscreamer"

-- Francesca
gr.Francesca 	= "[nomounted]Ivory Hawkstrider"
fl.Francesca 	= "[nomounted]Infinite Timereaver"
aq.Francesca 	= "Saltwater Seahorse"
hs.Francesca 	= "Tome of Town Portal"

-- Leão
--gr["Leão"]		= "[nomounted]"

-- Liou
gr.Liou			= "[nomounted]Ban-Lu, Grandmaster's Companion"
fl.Liou			= "[nomounted]Ban-Lu, Grandmaster's Companion"

-- Nyoka
gr.Nyoka 		= "[nomounted]Yellow Marsh Hopper"

-- Salyssra
gr.Salyssra		= "[nomounted]Lucid Nightmare"
fl.Salyssra		= "[nomounted]Onyxian Drake"
hs.Salyssra 	= "Tome of Town Portal"

-- Won
gr.Won 			= "[nomounted]Beastlord's Warwolf"

----------------------------------------------------
-- Bloodfeather III
----------------------------------------------------

-- Alec
gr.Alec 		= "[nomounted]Nightborne Manasaber"

-- Chai
gr.Chai 		= "[nomounted]Swift Lovebird"
fl.Chai 		= "[nomounted]Heavenly Crimson Cloud Serpent"
hs.Chai 		= "Peddlefeet's Lovely Hearthstone"

-- Serena
gr.Serena 		= "[nomounted]Vicious Warstrider"
fl.Serena 		= "[nomounted]Ashes of Al'ar"
hs.Serena 		= "Tome of Town Portal"

----------------------------------------------------
-- Moonglade IV
----------------------------------------------------

-- Aip
gr.Aip			= "[nomounted]Vicious War Kodo"
fl.Aip			= "[nomounted]Battlelord's Bloodthirsty War Wyrm"

-- Flerm
gr.Flerm 		= "[nomounted]Kor'kron War Wolf"
fl.Flerm 		= "[nomounted]Volcanic Stone Drake"

-- Frango
gr.Frango 		= "[nomounted]Flametalon of Alysrazor"
fl.Frango 		= "[nomounted]Ashes of Al'ar"

-- Gizzard
gr.Gizzard 		= "[nomounted]Vicious War Raptor"
fl.Gizzard 		= "[nomounted]Soaring Skyterror"

-- Norega
gr.Norega 		= "[nomounted]Ironbound Wraithcharger"
fl.Norega 		= "[nomounted]Ironbound Wraithcharger"

-- Ozulu
gr.Ozulu 		= "[nomounted]Fossilized Raptor"
fl.Ozulu 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Vicki
gr.Vicki 		= "[nomounted]Illidari Felstalker"
fl.Vicki 		= "[nomounted]Felglow Mana Ray"

-- Zoal
gr.Zoal			= "[nomounted]Green Skeletal Warhorse"
fl.Zoal			= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Zorp
gr.Zorp			= "[nomounted]Brawler's Burly Basilisk"
fl.Zorp			= "[nomounted]Mechanized Lumber Extractor"

----------------------------------------------------
-- Steamwheedle Cartel IV
----------------------------------------------------

-- Carolyn
gr.Carolyn 		= "[nomounted]Violet Raptor"
fl.Carolyn 		= "[nomounted]Armored Skyscreamer"

-- Eo
gr.Eo 			= "[nomounted]Highlord's Vengeful Charger"
fl.Eo 			= "[nomounted]Armored Red Dragonhawk"
aq.Eo 			= "Crimson Tidestallion"

-- Ixchel
gr.Ixchel 		= "[nomounted]Gilded Ravasaur"
fl.Ixchel 		= "[nomounted]Cobalt Pterrordax"

-- Liz
gr.Liz 			= "[nomounted]Vicious War Trike"
fl.Liz 			= "[nomounted]Shadowblade's Baneful Omen"

-- Onion
gr.Onion 		= "[nomounted]Midnight"
fl.Onion 		= "[nomounted]The Dreadwake"

-- Syro
gr.Syro			= "[nomounted]Frenzied Feltalon"
fl.Syro			= "[nomounted]Slayer's Felbroken Shrieker"

-- Veka
gr.Veka			= "[nomounted,spec:1][nomounted,spec:2] Armored Razzashi Raptor; [nomounted]Swift Purple Raptor"
fl.Veka			= "[nomounted]Spectral Pterrorwing"

-- Yarn
gr.Yarn			= "[nomounted]Ashhide Mushan Beast"
fl.Yarn			= "[nomounted]Clutch of Ji-Kun"

----------------------------------------------------
-- The Sha'tar IV
----------------------------------------------------

-- Appi
gr.Appi			= "[nomounted]Highmountain Thunderhoof"
fl.Appi			= "[nomounted]Huntmaster's Dire Wolfhawk"

-- Art
gr.Art			= "[nomounted]Arcanist's Manasaber"
fl.Art			= "[nomounted]Violet Spellwing"
hs.Art 			= "Tome of Town Portal"

-- Colette
gr.Colette 		= "[nomounted]Nightborne Manasaber"
fl.Colette 		= "[nomounted]Eclipse Dragonhawk"

-- Esme
gr.Esme			= "[nomounted]Highmountain Thunderhoof"
fl.Esme 		= "[nomounted]Spirit of Eche'ro"

-- Nour
gr.Nour			= "[nomounted]Raven Lord"
fl.Nour			= "[nomounted]Dread Raven"
hs.Nour 		= "Fire Eater's Hearthstone"

-- Syrah
gr.Syrah		= "[nomounted]Nightborne Manasaber"
fl.Syrah 		= "[nomounted]Arcanist's Manasaber"

----------------------------------------------------
-- Bloodfeather IV
----------------------------------------------------

-- Bree

-- Oren
gr.Oren 		= "[nomounted]Midnight"
fl.Oren 		= "[nomounted]Armored Bloodwing"

-- Teo
gr.Teo 			= "[nomounted]Snapback Scuttler"
fl.Teo 			= "[nomounted]Voldunai Dunescraper"

----------------------------------------------------
-- Moonglade V
----------------------------------------------------

-- Aluni
gr.Aluni 		= "[nomounted]Swift Purple Raptor"
fl.Aluni 		= "[nomounted]Voldunai Dunescraper"

-- Bryan
gr.Bryan 		= "[nomounted]Mollie"
fl.Bryan 		= "[nomounted]Farseer's Raging Tempest"

-- Daka
gr.Daka 		= "[nomounted]Mag'har Direwolf"
fl.Daka 		= "[nomounted]Grand Armored Wyvern"

-- Guo
gr.Guo 			= "[nomounted]Blue Shado-Pan Riding Tiger"
fl.Guo 			= "[nomounted]Onyx Cloud Serpent"

-- Kala
gr.Kala 		= "[nomounted]Vicious War Kodo"

-- Lurch
gr.Lurch 		= "[nomounted]Lurid Bloodtusk"
fl.Lurch 		= "[nomounted]Archmage's Prismatic Disc"

-- Sandra
gr.Sandra 		= "[nomounted]Mollie"
fl.Sandra 		= "[nomounted]Waste Marauder"

----------------------------------------------------
-- The Sha'tar V
----------------------------------------------------

-- Aguna
gr.Aguna 		= "[nomounted]Kor'kron War Wolf"
fl.Aguna		= "[nomounted]Violet Netherwing Drake"
hs.Aguna		= "Lunar Elder's Hearthstone"

-- Ao
gr.Ao 			= "[nomounted]Trained Icehoof"
fl.Ao 			= "[nomounted]Icebound Frostbrood Vanquisher"

-- Hye
gr.Hye 			= "[nomounted]Vile Fiend"
fl.Hye 			= "[nomounted]Malevolent Drone"

-- Krosh
gr.Krosh 		= "[nomounted]Dustmane Direwolf"
fl.Krosh 		= "[nomounted]Alabaster Thunderwing"

-- Thrash

-- Zea

-- Zolani
gr.Zolani 		= "[nomounted]Vicious War Raptor"
fl.Zolani 		= "[nomounted]Armored Skyscreamer"

----------------------------------------------------
-- Bloodfeather V
----------------------------------------------------

-- Agnes
gr.Agnes 		= "[nomounted]Vicious Skeletal Warhorse"
fl.Agnes 		= "[nomounted]Undercity Plaguebat"

-- Rhys
gr.Rhys 		= "[nomounted]Spirit of Eche'ro"
fl.Rhys 		= "[nomounted]Spirit of Eche'ro"

-- Ryan
gr.Ryan 		= "[nomounted]Mollie"
fl.Ryan 		= "[nomounted]Waste Marauder"

-- Sven
gr.Sven 		= "[nomounted]Blue Shado-Pan Riding Tiger"

-- Volt
gr.Volt 		= "[nomounted]Vicious War Trike"
fl.Volt 		= "[nomounted]Xiwyllag ATV"

----------------------------------------------------
-- Darkspear V
----------------------------------------------------

-- Nox
gr.Nox 			= "[nomounted]Netherlord's Accursed Wrathsteed"
fl.Nox 			= "[nomounted]Dark Phoenix"

----------------------------------------------------
-- Moonglade VI
----------------------------------------------------

-- Boom
gr.Boom 		= "[nomounted]Arcadian War Turtle"

-- Elspeth
gr.Elspeth 		= "[nomounted]Vicious Skeletal Warhorse"
fl.Elspeth 		= "[nomounted]Undercity Plaguebat"

-- Eska
gr.Eska			= "[nomounted]Swift Frostwolf"
fl.Eska			= "[nomounted]Grand Armored Wyvern"

-- Fester
gr.Fester		= "[nomounted]Vicious Skeletal Warhorse"
fl.Fester		= "[nomounted]Undercity Plaguebat"

-- Gruff
gr.Gruff		= "[nomounted]Mag'har Direwolf"
fl.Gruff		= "[nomounted]Grand Armored Wyvern"

-- Kaplitt
gr.Kaplitt 		= "[nomounted]Mag'har Direwolf"

-- Reesh
gr.Reesh 		= "[nomounted]Skullripper"
fl.Reesh 		= "[nomounted]Witherbark Direwing"

-- Wugzark
gr.Wugzark 		= "[nomounted]Garn Nighthowl"

----------------------------------------------------
-- Steamwheedle Cartel VI
----------------------------------------------------

-- Ax
gr.Ax 			= "[nomounted]Primal Flamesaber"
fl.Ax 			= "[nomounted]Sunreaver Dragonhawk"

-- Camilla
gr.Camilla		= "[nomounted]Midnight"
fl.Camilla		= "[nomounted]Expedition Bloodswarmer"

-- Ceri
gr.Ceri 		= "[nomounted]Regal Riding Crane"

-- Enna
gr.Enna			= "[nomounted]White Skeletal Warhorse"
fl.Enna			= "[nomounted]Yu'lei, Daughter of Jade"

-- Kiasmos
gr.Kiasmos 		= "[nomounted]Infernal Direwolf"

-- Ling
gr.Ling			= "[nomounted]Golden Riding Crane"
fl.Ling			= "[nomounted]Violet Pandaren Phoenix"

-- Sadie
gr.Sadie		= "[nomounted]Highmountain Thunderhoof"

-- Victoria
gr.Victoria 	= "[nomounted]Vicious Warstrider"

----------------------------------------------------
-- The Sha'tar VI
----------------------------------------------------

-- Noicha
gr.Noicha 		= "[nomounted]Vicious War Kodo"
fl.Noicha 		= "[nomounted]High Priest's Lightsworn Seeker"
aq.Noicha 		= "Saltwater Seahorse"
hs.Noicha 		= "Peddlefeet's Lovely Hearthstone"

-- Nonagon

-- Polygon
gr.Polygon 		= "[nomounted]Amber Primordial Direhorn"
fl.Polygon 		= "[nomounted]Captured Swampstalker"

-- Zahara
gr.Zahara 		= "[nomounted]Crusader's Direhorn"

----------------------------------------------------
-- Burning Steppes VI
----------------------------------------------------

-- Cosmia
gr.Cosmia		= "[nomounted]Arcanist's Manasaber"
fl.Cosmia		= "[nomounted]Arcanist's Manasaber"

-- Ella
gr.Ella 		= "[nomounted]Great Green Dragon Turtle"
fl.Ella 		= "[nomounted]Ashen Pandaren Phoenix"

-- Linda
gr.Linda 		= "[nomounted]Snapback Scuttler"
fl.Linda 		= "[nomounted]Unshackled Waveray"

----------------------------------------------------
-- The Sha'tar VII
----------------------------------------------------

-- Azela
gr.Azela 		= "[nomounted]Black Primal Raptor"
fl.Azela 		= "[nomounted]Cobalt Pterrordax"

-- Goom
gr.Goom 		= "[nomounted]Vicious War Raptor"
fl.Goom 		= "[nomounted]Cobalt Pterrordax"

-- Marisol
gr.Marisol 		= "[nomounted]Sundancer"
fl.Marisol 		= "[nomounted]Heavenly Azure Cloud Serpent"

-- Oscar
gr.Oscar 		= "[nomounted]Vicious Skeletal Warhorse"
fl.Oscar 		= "[nomounted]Undercity Plaguebat"

-- Spoon
gr.Spoon  		= "[nomounted]Vicious War Kodo"
fl.Spoon 		= "[nomounted]Farseer's Raging Tempest"
aq.Spoon 		= "Saltwater Seahorse"
hs.Spoon 		= "Necrolord Hearthstone"

-- Vendegast
gr.Vendegast 	= "[nomounted]Battle-Bound Warhound"
fl.Vendegast 	= "[nomounted]Witherbark Direwing"

-- Zumaridi

----------------------------------------------------
-- Steamwheedle Cartel VII
----------------------------------------------------

-- Ako
gr.Ako 			= "[nomounted]Grove Warden"
fl.Ako 			= "[nomounted]Grove Warden"

-- Gabriel
gr.Gabriel 		= "[nomounted]White Skeletal Warhorse"

-- Hocus
gr.Hocus 		= "[nomounted]Vicious Skeletal Warhorse"

-- Janis
gr.Janis 		= "[nomounted]Slate Primordial Direhorn"

-- Sithandra
gr.Sithandra	= "[nomounted]Acherus Deathcharger"
fl.Sithandra 	= "[nomounted]Deathlord's Vilebrood Vanquisher"

----------------------------------------------------
-- Moonglade VII
----------------------------------------------------

-- Bones
gr.Bones 		= "[nomounted]Vile Fiend"
fl.Bones 		= "[nomounted]Malevolent Drone"

-- Edna

-- Ini
gr.Ini 			= "[nomounted]Violet Raptor"
fl.Ini 			= "[nomounted]Bloodgorged Hunter"

-- Kiwi

----------------------------------------------------
-- Shattered Hand VII
----------------------------------------------------

-- Celeste
gr.Celeste 		= "[nomounted]Nightborne Manasaber"

-- Jerry
gr.Jerry 		= "[nomounted]Mollie"
fl.Jerry 		= "[nomounted]Waste Marauder"

-- Maya

-- Njord
gr.Njord 		= "[nomounted]Snapdragon Kelpstalker"
fl.Njord 		= "[nomounted]Abyss Worm"

----------------------------------------------------
-- The Sha'tar VIII
----------------------------------------------------

-- Cassiopeia
gr.Cassiopeia 	= "[nomounted]Arcanist's Manasaber"
fl.Cassiopeia 	= "[nomounted]Arcanist's Manasaber"

-- Elan
gr.Elan 		= "[nomounted]Thunder Bluff Kodo"
fl.Elan 		= "[nomounted]Farseer's Raging Tempest"

-- Revna
gr.Revna 		= "[nomounted]Coalfist Gronnling"
fl.Revna 		= "[nomounted]Soaring Skyterror"

-- Scott
gr.Scott 		= "[nomounted]Dune Scavenger"

-- Wawa
gr.Wawa 		= "[nomounted]Gilded Ravasaur"

-- Zap
gr.Zap 			= "[nomounted]Frostwolf Snarler"
fl.Zap 			= "[nomounted]Island Thunderscale"

----------------------------------------------------
-- Steamwheedle Cartel VIII
----------------------------------------------------

-- Carrie
gr.Carrie 		= "[nomounted]Mollie"

-- Felix
gr.Felix 		= "[nomounted]Mystic Runesaber"
fl.Felix 		= "[nomounted]Mystic Runesaber"
hs.Felix 		= "Tome of Town Portal"

-- June
gr.June 		= "[nomounted]Springfur Alpaca"

-- Pest
gr.Pest 		= "[nomounted]Elusive Quickhoof"
fl.Pest 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Tim
gr.Tim 			= "[nomounted]Elusive Quickhoof"
fl.Tim 			= "[nomounted]Waste Marauder"

----------------------------------------------------
-- Moonglade VIII
----------------------------------------------------

-- Ewa

-- Zek
gr.Zek 			= "[nomounted]Crusader's Direhorn"
fl.Zek 			= "[nomounted]Cobalt Pterrordax"

----------------------------------------------------
-- Burning Steppes VIII
----------------------------------------------------

-- Bonk
fl.Bonk 		= "[nomounted]Captured Swampstalker"

-- Leo
gr.Leo2 		= "[nomounted]Raven Lord"
fl.Leo2 		= "[nomounted]Dread Raven"

-- Magda
gr.Magda 		= "[nomounted]Netherlord's Accursed Wrathsteed"
fl.Magda 		= "[nomounted]Uncorrupted Voidwing"

-- Luna
gr.Luna 		= "[nomounted]Grove Warden"

-- Magda

-- New
gr.New 			= "[nomounted]Crusader's Direhorn"
fl.New 			= "[nomounted]Cobalt Pterrordax"

----------------------------------------------------
-- Executus VIII
----------------------------------------------------

-- Fred
gr.Fred 		= "[nomounted]Mollie"
fl.Fred 		= "[nomounted]Wastewander Skyterror"

-- Leah
gr.Leah 		= "[nomounted]Fossilized Raptor"
fl.Leah 		= "[nomounted]Expedition Bloodswarmer"

-- No
gr.No 			= "[nomounted]Llothien Prowler"
fl.No 			= "[nomounted]Violet Pandaren Phoenix"
aq.No 			= "[nomounted]Crimson Tidestallion"

-- Sylvia
gr.Sylvia 		= "[nomounted]Felsaber"
fl.Sylvia 		= "[nomounted]Slayer's Felbroken Shrieker"

----------------------------------------------------




































local frame = CreateFrame("FRAME", "Automagic")

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
	["Mogu Island Daily Area"] = true,
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
	["Mac'Aree"] = true,
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
	["The Shadowlands"] = true,
	["Shadowlands"] = true,
	["Oribos"] = true,
	["Ardenweald"] = true,
	["Bastion"] = true,
	["Maldraxxus"] = true,
	["Maldraxxus Broker Islands"] = true,
	["The Maw"] = true,
	["Korthia"] = true,
	["Torghast"] = true,
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

		-- Belt
		SetBindingMacro("=", "G002")
		SetBindingMacro("NUMPADEQUALS", "G002")
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
		macro(5, "/use Engineering\n/run C_TradeSkillUI.CraftRecipe(55016)\n/use Engineering\n/click CharacterWaistSlot", 136243)
		
		-- Tinker: Goblin Glider
		macro(6, "/use Engineering\n/run C_TradeSkillUI.CraftRecipe(126392)\n/use Engineering\n/click CharacterBackSlot", 136243)

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

		-- Autofollow
		macro(107, "/autofollow", 132328)

		-- Reload
		macro(108, "/reload", 236372)

		-- Open BugSack
		macro(109, "/bugsack show", 237144)

		-- Close BugSack
		macro(106, "/run BugSack:CloseSack()", 237144)

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

		if throttled[event] then
			return
		else
			throttled[event] = true
			C_Timer.After(1, function()
				throttled[event] = false

				if event ~= "BAG_UPDATE" then
					SetGlobalBinds()
				end
			end)
		end

		if event ~= "ZONE_CHANGED_NEW_AREA" and event ~= "BAG_UPDATE" then
			-- Ongoing Calendar Events
			local events = {}

			if C_Calendar and C_DateAndTime then
				local monthDay = C_DateAndTime.GetCurrentCalendarTime().monthDay or 1
				C_Calendar.SetMonth(0)
				local numEvents = C_Calendar.GetNumDayEvents(0, monthDay) or 0

				if numEvents >= 1 then
					for i = 1, numEvents do
						if C_Calendar.GetDayEvent(0, monthDay, i) and C_Calendar.GetDayEvent(0, monthDay, i).eventType == 4 then
							events[C_Calendar.GetDayEvent(0, monthDay, i).title] = true
						end
					end
				end
			end


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

		local instanceName, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
		local _, class, _ = UnitClass("player")
		local _,race = UnitRace("player")
		local playerName, realm = UnitFullName("player")
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

		-- Leo workaround
		if playerName == "Leo" and realm == "Xavius" then
			playerName = "Leo1"
		elseif playerName == "Leo" then
			playerName = "Leo2"
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
			elseif bags("Master Healing Potion") >= 1 and level >= 85 then
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
					["Carrion Bird"] = "Bloody Screech",
					["Cat"] = "Catlike Reflexes",
					["Chimaera"] = "Frost Breath",
					["Clefthoof"] = "Thick Hide",
					["Core Hound"] = "Obsidian Skin",
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

			-- Check if the character has riding skill
			if instanceName == "The Deaths of Chromie" then
				mountType = "flying" -- Force flying in the Deaths of Chromie scenario
			elseif instanceName == "Torghast, Tower of the Damned" then
				overrideMount = "Mawrat Harness" -- Mawrat Harness is the only "mount" that is useable inside Torghast
			elseif (z == "The Maw" or z == "Korthia") and class ~= "DRUID" and not C_QuestLog.IsQuestFlaggedCompleted(63994) then
				overrideMount = "[nomounted]Corridor Creeper" -- The Maw
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
					aq[playerName] = "[nomounted]Vashj'ir Seahorse" -- Force Vashj'ir Seahorse in Vashj'ir
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
					m = "[nomounted]Magic Broom" -- Always prefer Magic Broom over any other ground mount
				else
					m = gr[playerName] or fl[playerName] or default_gr
				end

				if class == "SHAMAN" then
					pre = "/use [nomounted,nocombat,@player]Water Walking\n"
				end
			elseif mountType == "flying" then
				if GetItemCount("Magic Broom", false) >= 1 then -- Check if we have a Magic Broom in bags
					m = "[nomounted]Magic Broom" -- Always prefer Magic Broom over any other flying mount
				else
					m = fl[playerName] or default_fl
				end
			else
				m = "[nomounted]Summon Chauffeur" -- Fall back to the heirloom mount if we don't have riding skill
			end

			-- Update Macros
			-- Mount + Aquatic Mount
			if class == "DRUID" then
				if mountType == "flying" then
					macro(7, pre .. "/use [swimming][nocombat,nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 413588)
				elseif mountType == "ground" or level >= 10 or IsSpellKnown(783) then
					macro(7, pre .. "/use [nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 413588)
				else
					macro(7, pre .. "/use " .. m .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				end

				macro(8, pre .. "/use " .. m .."\n/dismount [mounted]\n/leavevehicle", 413588)
			elseif preferAquatic then
				macro(7, "/use ".. (aq[playerName] or default_aq) .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, pre .. "/use " .. m .."\n/dismount [mounted]\n/leavevehicle", 413588)
			else
				if overrideMount then m = overrideMount end
				macro(7, pre .. "/use " .. m .. "\n/dismount [mounted]\n/leavevehicle", 413588)
				macro(8, "/use " .. (aq[playerName] or default_aq) .."\n/dismount [mounted]\n/leavevehicle", 413588)
			end
			
			-- Passenger Mount
			macro(10, "/use " .. (pa[playerName] or default_pa), 413588)

			-- Hearthstone
			macro(13, "#showtooltip\n#icon 134414\n/use " .. (hs[playerName] or default_hs), 134414)

			-- Companion
			if co[playerName] then
				macro(11, "/sp " .. co[playerName], 613074)
			else
				macro(11, "/rfp", 613074)
			end
		end
	end
end

frame:SetScript("OnEvent", eventHandler)