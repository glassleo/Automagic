local gr, fl, aq, su, pa, hs, co = {}, {}, {}, {}, {}, {}, {}
local bindingsSet = false
-------------------------------


-- Default fallbacks

local default_gr = "[nomounted]Swift Springstrider"
local default_fl = "[nomounted]Albino Drake"
local default_aq = "Subdued Seahorse"
local default_pa = "X-53 Touring Rocket"
local default_hs = "Eternal Traveler's Hearthstone"



-- Character specific mounts

----------------------------------------------------
-- 		ALLIANCE
----------------------------------------------------
-- 1	Ravenholdt
----------------------------------------------------

-- Fou
gr.Fou			= "[nomounted]Starcursed Voidstrider"

-- Malgorzata
gr.Malgorzata	= "[nomounted]Felsaber"
fl.Malgorzata	= "[nomounted]Slayer's Felbroken Shrieker"

-- Margaret
gr.Margaret		= "[nomounted]Kul Tiran Charger"

-- Medea
gr.Medea 		= "[nomounted]Lucid Nightmare"
fl.Medea 		= "[nomounted]Twilight Drake"

-- Millius
gr.Millius 		= "[nomounted]Vicious War Elekk"

-- Octavia
gr.Octavia		= "[nomounted]Dark Iron Core Hound"

-- Parsec
gr.Parsec		= "[nomounted]Prestigious Royal Courser"

-- Peng
gr.Peng 		= "[nomounted]Great Blue Dragon Turtle"

-- Vack
gr.Vack			= "[nomounted]Running Wild"
fl.Vack			= "[nomounted]Witherbark Direwing"
aq.Vack 		= "Fathom Dweller"

-- Valdor
hs.Valdor 		= "Noble Gardener's Hearthstone"

-- Yulia
gr.Yulia		= "[nomounted]Bleakhoof Ruinstrider"
fl.Yulia		= "[nomounted]Felglow Mana Ray"

----------------------------------------------------
-- 1	Sporeggar
----------------------------------------------------

-- Andrew
gr.Andrew		= "[nomounted]Blackpaw"

-- Auros
gr.Auros 		= "[nomounted]Avenging Felcrusher"

-- Bree
gr.Bree 		= "[nomounted]Lightforged Felcrusher"

-- Flor
hs.Flor 		= "Noble Gardener's Hearthstone"

-- Gloria
gr.Gloria 		= "[nomounted]Lightforged Felcrusher"

-- Helena
hs.Helena 		= "Headless Horseman's Hearthstone"

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

-- Wes
gr.Wes 			= "[nomounted]Black Riding Goat"

----------------------------------------------------
-- 1	Xavius
----------------------------------------------------

-- Leo
gr.Leo 			= "[nomounted]Highlord's Golden Charger"
fl.Leo 			= "[nomounted]Grand Armored Gryphon"

-- Liam
gr.Liam 		= "[nomounted]Goldenmane"
hs.Liam			= "Tome of Town Portal"

----------------------------------------------------
-- 2	Ravenholdt
----------------------------------------------------

-- Gretchen

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

-- Mirko
gr.Mirko 		= "[nomounted]Summon Great Exarch's Elekk"
fl.Mirko 		= "[nomounted]Enchanted Fey Dragon"

-- Pavla
gr.Pavla 		= "[nomounted]Shadowhide Pearltusk"
fl.Pavla 		= "[nomounted]Farseer's Raging Tempest"

-- Prue
gr.Prue			= "[nomounted]Goldenmane"
fl.Prue			= "[nomounted]Archmage's Prismatic Disc"

-- See
gr.See 			= "[nomounted]Arcanist's Manasaber"
fl.See 			= "[nomounted]Arcanist's Manasaber"

-- Selma
gr.Selma 		= "[nomounted]Stormpike Battle Ram"
hs.Selma 		= "Brewfest Reveler's Hearthstone"

-- Torvald
gr.Torvald 		= "[nomounted]Beastlord's Warwolf"
hs.Torvald 		= "The Innkeeper's Daughter"

-- Tracyanne
gr.Tracyanne 	= "[nomounted]Vicious War Ram"
fl.Tracyanne 	= "[nomounted]Grand Gryphon"
hs.Tracyanne 	= "The Innkeeper's Daughter"

----------------------------------------------------
-- 2	Sporeggar
----------------------------------------------------

-- Elsa
gr.Elsa 		= "[nomounted]Summon Darkforge Ram"

-- Isak
gr.Isak 		= "[nomounted]Avenging Felcrusher"

-- Jon
gr.Jon 			= "[nomounted]Beastlord's Warwolf"

-- Karin
gr.Karin 		= "[nomounted]Admiralty Stallion"

-- Ki
gr.Ki 			= "[nomounted]Starcursed Voidstrider"

-- Mabel
gr.Mabel 		= "[nomounted]Starcursed Voidstrider"
fl.Mabel 		= "[nomounted]Twilight Harbinger"

-- Norah
gr.Norah 		= "[nomounted]Smoky Charger"

----------------------------------------------------
-- 2	Scarshield Legion
----------------------------------------------------

-- Beans

-- Errol
gr.Errol 		= "[nomounted]Grove Warden"
fl.Errol 		= "[nomounted]Grove Warden"
hs.Errol 		= "Lunar Elder's Hearthstone"

-- Florence
gr.Florence 	= "[nomounted]Dapple Gray"
fl.Florence 	= "[nomounted]Stormsong Coastwatcher"

-- Veronika
gr.Veronika 	= "[nomounted]Cerulean Ruinstrider"

----------------------------------------------------
-- 2	Al'Akir
----------------------------------------------------

-- Fuzz
hs.Fuzz 		= "Lunar Elder's Hearthstone"

-- Mak
gr.Mak 			= "Scrapforged Mechaspider"
fl.Mak 			= "Rustbolt Resistor"
hs.Mak 			= "Holographic Digitalization Hearthstone"

-- Rex
gr.Rex 			= "[nomounted]Felsaber"
fl.Rex 			= "[nomounted]Slayer's Felbroken Shrieker"

----------------------------------------------------
-- 3	Ravenholdt
----------------------------------------------------

-- Agon
gr.Agon 		= "[nomounted]Blessed Felcrusher"

-- Debbie
gr.Debbie 		= "[nomounted]Mystic Runesaber"
fl.Debbie 		= "[nomounted]Mystic Runesaber"

-- Elise
gr.Elise 		= "[nomounted]White Riding Goat"
fl.Elise 		= "[nomounted]Leyfeather Hippogryph"
aq.Elise 		= "Crimson Tidestallion"
hs.Elise 		= "Peddlefeet's Lovely Hearthstone"

-- Hiccup
gr.Hiccup		= "[nomounted]Scrapforged Mechaspider"
fl.Hiccup 		= "[nomounted]Stormwind Skychaser"

-- Lisa
gr.Lisa 		= "[nomounted]Admiralty Stallion"

-- Lua

-- Monade
gr.Monade 		= "[nomounted]Felsaber"
fl.Monade 		= "[nomounted]Slayer's Felbroken Shrieker"

-- Patricia
gr.Patricia 	= "[nomounted]Dapple Gray"

-- Ravioli
gr.Ravioli		= "[nomounted]Vicious War Mechanostrider"
fl.Ravioli		= "[nomounted]Mimiron's Head"

-- Sook
gr.Sook 		= "[nomounted]Great Blue Dragon Turtle"

-- Vevica
gr.Vevica		= "[nomounted]Vicious War Elekk"
fl.Vevica		= "[nomounted]Darkspore Mana Ray"

----------------------------------------------------
-- 3	Sporeggar
----------------------------------------------------

-- Alec
gr.Alec 		= "[nomounted]Bristling Hellboar"
fl.Alec 		= "[nomounted]Valarjar Stormwing"

-- Blanc
gr.Blanc 		= "[nomounted]Lucid Nightmare"

-- Brock
gr.Brock 		= "[nomounted]Blackpaw"

-- En
gr.En 			= "[nomounted]Sapphire Panther"

-- Jie
gr.Jie 			= "[nomounted]Blue Shado-Pan Riding Tiger"

-- Lum
gr.Lum 			= "[nomounted]Umber Ruinstrider"
fl.Lum 			= "[nomounted]Enchanted Fey Dragon"

-- Mab

-- Nieve
gr.Nieve 		= "[nomounted]Vicious Kaldorei Warsaber"
fl.Nieve 		= "[nomounted]Teldrassil Hippogryph"

-- Yessica
gr.Yessica 		= "[nomounted]Beryl Ruinstrider"
fl.Yessica 		= "[nomounted]Enchanted Fey Dragon"

-- Yuna
gr.Yuna 		= "[nomounted]Blue Shado-Pan Riding Tiger"

----------------------------------------------------
-- 3	Al'Akir
----------------------------------------------------

-- Nix
gr.Nix 			= "[nomounted]Netherlord's Chaotic Wrathsteed"

-- Wu
gr.Wu 			= "[nomounted]Ban-Lu, Grandmaster's Companion"

----------------------------------------------------
-- 4	Scarshield Legion
----------------------------------------------------

-- Cordelia
gr.Cordelia 	= "[nomounted]Black Riding Goat"

-- Edith
gr.Edith 		= "[nomounted]Umber Nightsaber"

-- Eric
gr.Eric 		= "[nomounted]Dapple Gray"

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

-- Will
gr.Will 		= "[nomounted]Dapple Gray"
fl.Will 		= "[nomounted]Stormsong Coastwatcher"

----------------------------------------------------
-- 4	The Venture Co
----------------------------------------------------

-- Barie
gr.Barbie 		= "[nomounted]Swift Lovebird"
fl.Barbie 		= "[nomounted]Leyfeather Hippogryph"

-- Beryl
gr.Beryl 		= "[nomounted]Lucid Nightmare"

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

-- Mikael
gr.Mikael 		= "[nomounted]Summon Exarch's Elekk"

-- Nil
gr.Nil 			= "[nomounted]Starcursed Voidstrider"

-- Or
gr.Or 			= "[nomounted]Summon Darkforge Ram"

-- Sinikka
gr.Sinikka 		= "[nomounted]Bristling Hellboar"
fl.Sinikka 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

----------------------------------------------------
-- 4	Ravenholdt
----------------------------------------------------

-- Folki
gr.Folki 		= "[nomounted]Blackpaw"

-- Idunn
gr.Idunn 		= "[nomounted]Dark Iron Core Hound"

----------------------------------------------------
-- 4	Xavius
----------------------------------------------------

-- Hel
gr.Hel 			= "[nomounted]Kaldorei Nightsaber"
fl.Hel 			= "[nomounted]Shadowblade's Lethal Omen"
hs.Hel 			= "Lunar Elder's Hearthstone"

-- Walt
gr.Walt 		= "[nomounted]Yellow Marsh Hopper"
hs.Walt 		= "Holographic Digitalization Hearthstone"

----------------------------------------------------
-- 5	Sporeggar
----------------------------------------------------

-- Aldous
gr.Aldous 		= "[nomounted]Starcursed Voidstrider"

-- Brigitte
gr.Brigitte 	= "[nomounted]Seabraid Stallion"

-- Demus
gr.Demus		= "[nomounted]Felsaber"
fl.Demus		= "[nomounted]Slayer's Felbroken Shrieker"

-- Floyd
gr.Floyd		= "[nomounted]Vicious War Bear"
fl.Floyd		= "[nomounted]Stormsong Coastwatcher"
hs.Floyd		= "Tome of Town Portal"

-- Franz

-- Hekla
gr.Hekla 		= "[nomounted]Bristling Hellboar"

-- Niels
gr.Niels 		= "[nomounted]Blackpaw"

-- Sonya
gr.Sonya 		= "[nomounted]Summon Dawnforge Ram"

-- Vidalia
gr.Vidalia 		= "[nomounted]Ratstallion"
fl.Vidalia 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

----------------------------------------------------
-- 5	Ravenholdt
----------------------------------------------------

-- Anmar
gr.Anmar 		= "[nomounted]Summon Dawnforge Ram"

-- Arnald
gr.Arnald 		= "[nomounted]Highlord's Golden Charger"

-- Berg
gr.Berg 		= "[nomounted]Vicious War Ram"
fl.Berg 		= "[nomounted]Alabaster Stormtalon"

-- Mary
gr.Mary 		= "[nomounted]Crimson Deathcharger"

-- Nyr
gr.Nyr 			= "[nomounted]Smoky Charger"

-- Vilma
gr.Vilma 		= "[nomounted]Ratstallion"

-- Wax
gr.Wax 			= "[nomounted]Running Wild"

----------------------------------------------------
-- 5	The Venture Co
----------------------------------------------------

-- Geir

-- Greta
gr.Greta 		= "[nomounted]Stormpike Battle Ram"

-- Katya
gr.Katya 		= "[nomounted]Cerulean Ruinstrider"

-- Otus
gr.Otus 		= "[nomounted]Swift Mountain Horse"

-- Song
gr.Song 		= "[nomounted]Bruce"

-- Susie
gr.Susie 		= "[nomounted]Highlord's Vengeful Charger"

----------------------------------------------------
-- 5	Xavius
----------------------------------------------------

-- Claire
gr.Claire 		= "[nomounted]Vicious War Ram"

-- Kenneth
gr.Kenneth 		= "[nomounted]Prestigious Royal Courser"

----------------------------------------------------
-- 6	Scarshield Legion
----------------------------------------------------

-- Irene
gr.Irene 		= "[nomounted]Cindermane Charger"
fl.Irene 		= "[nomounted]Cindermane Charger"
hs.Irene 		= "Fire Eater's Hearthstone"

-- Jiang
gr.Jiang 		= "[nomounted]Qinsho's Eternal Hound"

-- Oberon
gr.Oberon 		= "[nomounted]Acherus Deathcharger"

-- Ophelia
gr.Ophelia 		= "[nomounted]Prestigious Ivory Courser"

-- Rose
gr.Rose 		= "[nomounted]Smoky Charger"

-- Ruth
gr.Ruth 		= "[nomounted]Kul Tiran Charger"

-- Violet
gr.Violet 		= "[nomounted]Gnomeregan Mechanostrider"
hs.Violet 		= "Holographic Digitalization Hearthstone"

----------------------------------------------------
-- 6	The Venture Co
----------------------------------------------------

-- Betty
gr.Betty 		= "[nomounted]Mechagon Mechanostrider"
fl.Betty 		= "[nomounted]Mimiron's Head"
hs.Betty 		= "Holographic Digitalization Hearthstone"

-- Charles
gr.Charles 		= "[nomounted]Prestigious Royal Courser"

-- Ed
gr.Ed 			= "[nomounted]Scrapforged Mechaspider"
hs.Ed 			= "Holographic Digitalization Hearthstone"

-- Frank
gr.Frank 		= "[nomounted]X-995 Mechanocat"
hs.Frank 		= "Holographic Digitalization Hearthstone"

-- Jack
gr.Jack 		= "[nomounted]X-995 Mechanocat"
fl.Jack 		= "[nomounted]Wonderwing 2.0"
hs.Jack 		= "Holographic Digitalization Hearthstone"

-- Rob
gr.Rob 			= "[nomounted]Vicious War Fox"

----------------------------------------------------
-- 6	Sporeggar
----------------------------------------------------

-- Ludmila
gr.Ludmila 		= "[nomounted]Vicious War Elekk"

-- Maria
gr.Maria	 	= "[nomounted]Lightforged Felcrusher"

-- Melissa
gr.Melissa 		= "[nomounted]Prestigious Royal Courser"
fl.Melissa 		= "[nomounted]Cobalt Netherwing Drake"

-- Monica
gr.Monica 		= "[nomounted]X-995 Mechanocat"
hs.Monica 		= "Holographic Digitalization Hearthstone"

-- Zip
gr.Zip 			= "[nomounted]Jeweled Onyx Panther"
hs.Zip 			= "Holographic Digitalization Hearthstone"

----------------------------------------------------
-- 6	Defias Brotherhood
----------------------------------------------------

-- Julie
gr.Julie 		= "[nomounted]Scrapforged Mechaspider"
hs.Julie 		= "Holographic Digitalization Hearthstone"

-- Mark
gr.Mark 		= "[nomounted]Vicious War Mechanostrider"
fl.Mark 		= "[nomounted]Explorer's Jungle Hopper"
hs.Mark 		= "Holographic Digitalization Hearthstone"

-- Suzanne
gr.Suzanne 		= "[nomounted]Black Riding Goat"
fl.Suzanne 		= "[nomounted]Siltwing Albatross"

----------------------------------------------------
-- 6	Skullcrusher
----------------------------------------------------

-- Gunnar
gr.Gunnar 		= "[nomounted]Stormpike Battle Ram"
hs.Gunnar 		= "The Innkeeper's Daughter"

-- Sam
gr.Sam 			= "[nomounted]Vicious War Elekk"

-- Vigg
gr.Vigg 		= "[nomounted]Vicious War Ram"
hs.Vigg 		= "The Innkeeper's Daughter"

-- Britney
gr.Britney 		= "[nomounted]Swift Mountain Horse"

----------------------------------------------------
-- 		HORDE
----------------------------------------------------
-- 1	The Sha'tar
----------------------------------------------------

-- Aguna
gr.Aguna 		= "[nomounted]Kor'kron War Wolf"
fl.Aguna		= "[nomounted]Violet Netherwing Drake"
hs.Aguna		= "Lunar Elder's He"

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

-- Grime
gr.Grime		= "[nomounted]Mag'har Direwolf"

-- Lynn
gr.Lynn			= "[nomounted]Arcanist's Manasaber"
fl.Lynn			= "[nomounted]Arcanist's Manasaber"

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

-- Zee
gr.Zee			= "[nomounted]Emerald Raptor"

----------------------------------------------------
-- 1	Steamwheedle Cartel
----------------------------------------------------

-- Agata
gr.Agata 		= "[nomounted]Rivendare's Deathcharger"
fl.Agata 		= "[nomounted]Witherbark Direwing"

-- Aip
gr.Aip 			= "[nomounted]Highmountain Elderhorn"

-- Bab
gr.Bab 			= "[nomounted]Midnight"
fl.Bab 			= "[nomounted]Smoldering Ember Wyrm"

-- Glue
gr.Glue			= "[nomounted]Ironside Warwolf"
fl.Glue			= "[nomounted]Crimson Pandaren Phoenix"

-- Jessie
gr.Jessie 		= "[nomounted]Illidari Felstalker"

-- Lif
gr.Lif 			= "[nomounted]Golden Riding Crane"
fl.Lif 			= "[nomounted]Violet Pandaren Phoenix"
aq.Lif 			= "Crimson Tidestallion"

-- Seska
gr.Seska		= "[nomounted]Vicious Warstrider"
fl.Seska		= "[nomounted]Shadowblade's Murderous Omen"

-- Sybil
gr.Sybil 		= "[nomounted]Black Primal Raptor"
fl.Sybil 		= "[nomounted]Witherbark Direwing"

----------------------------------------------------
-- 1	Moonglade
----------------------------------------------------

-- Akasia
hs.Akasia 		= "Noble Gardener's Hearthstone"

-- Bess
gr.Bess 		= "[nomounted]Summon Great Sunwalker Kodo"
fl.Bess 		= "[nomounted]Clutch of Ji-Kun"

-- Cafuné
--hs["Cafuné"] 	= ""

-- Hazel
gr.Hazel		= "[nomounted]Vicious Warstrider"
fl.Hazel		= "[nomounted]Ashes of Al'ar"
aq.Hazel 		= "Crimson Tidestallion"

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
-- 1	Kor'gall
----------------------------------------------------

-- Miranda
gr.Miranda 		= "[nomounted]Hellfire Infernal"
fl.Miranda 		= "[nomounted]Armored Red Dragonhawk"

-- Raz
gr.Raz 			= "[nomounted]Predatory Bloodgazer"
fl.Raz 			= "[nomounted]Spectral Pterrorwing"

----------------------------------------------------
-- 2	Steamwheedle Cartel
----------------------------------------------------

-- Ahu
gr.Ahu			= "[nomounted]Bristling Hellboar"
fl.Ahu 			= "[nomounted,spec:1] Deathlord's Vilebrood Vanquisher; [nomounted]Armored Bloodwing"

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

-- Krosh
gr.Krosh		= "[nomounted]Beastlord's Warwolf"
fl.Krosh		= "[nomounted,spec:1] Farseer's Raging Tempest; [nomounted]Iron Skyreaver"

-- Leão
--hs["Leão"]		= "[nomounted]"

-- Liou
gr.Liou			= "[nomounted]Ban-Lu, Grandmaster's Companion"
fl.Liou			= "[nomounted]Ban-Lu, Grandmaster's Companion"

-- Nyoka
gr.Nyoka 		= "[nomounted]Yellow Marsh Hopper"

-- Salyssra
gr.Salyssra		= "[nomounted]Lucid Nightmare"
fl.Salyssra		= "[nomounted]Onyxian Drake"
hs.Salyssra 	= "Tome of Town Portal"

-- Sokwe
gr.Sokwe 		= "[nomounted]Swift Zulian Panther"

-- Won
gr.Won 			= "[nomounted]Beastlord's Warwolf"

----------------------------------------------------
-- 2	The Sha'tar
----------------------------------------------------

-- Apera
gr.Apera 		= "[nomounted]Highmountain Elderhorn"
fl.Apera 		= "[nomounted]Huntmaster's Loyal Wolfhawk"

-- Beth
gr.Beth 		= "[nomounted]Felsaber"
fl.Beth 		= "[nomounted]Slayer's Felbroken Shrieker"

-- Bite

-- Erin
gr.Erin			= "[nomounted]Highlord's Golden Charger"
fl.Erin			= "[nomounted]Highlord's Golden Charger"

-- Etu
gr.Etu			= "[nomounted]Vicious War Kodo"
fl.Etu			= "[nomounted]Clutch of Ji-Kun"

-- Myu
gr.Myu			= "Highmountain Thunderhoof"
fl.Myu			= "[nomounted,spec:3] Farseer's Raging Tempest; [nomounted]Vitreous Stone Drake"

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
-- 2	Bloodfeather
----------------------------------------------------

-- Hye
gr.Hye 			= "[nomounted]Ashhide Mushan Beast"
hs.Hye 			= "Brewfest Reveler's Hearthstone"

-- Serena
gr.Serena 		= "[nomounted]Arcanist's Manasaber"
fl.Serena 		= "[nomounted]Arcanist's Manasaber"
hs.Serena 		= "Tome of Town Portal"

-- Steven
gr.Steven 		= "[nomounted]Rivendare's Deathcharger"
hs.Steven 		= "Tome of Town Portal"

----------------------------------------------------
-- 3	Moonglade
----------------------------------------------------

-- Flerm
gr.Flerm 		= "[nomounted]Kor'kron War Wolf"
fl.Flerm 		= "[nomounted]Volcanic Stone Drake"

-- Frango

-- Gizzard
gr.Gizzard 		= "[nomounted]Vicious War Raptor"
fl.Gizzard 		= "[nomounted]Soaring Skyterror"

-- Goom
gr.Goom			= "[nomounted]Vicious War Raptor"
fl.Goom			= "[nomounted]Armored Skyscreamer"

-- Norega
gr.Norega 		= "[nomounted]Ironbound Wraithcharger"
fl.Norega 		= "[nomounted]Ironbound Wraithcharger"

-- Ozulu
gr.Ozulu 		= "[nomounted]Fossilized Raptor"
fl.Ozulu 		= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Vicki
gr.Vicki 		= "[nomounted]Illidari Felstalker"
fl.Vicki 		= "[nomounted]Felglow Mana Ray"

-- Wishbone
gr.Wishbone		= "[nomounted]Vicious War Kodo"
fl.Wishbone		= "[nomounted]Battlelord's Bloodthirsty War Wyrm"

-- Zoal
gr.Zoal			= "[nomounted]Green Skeletal Warhorse"
fl.Zoal			= "[nomounted]Deathlord's Vilebrood Vanquisher"

-- Zorp
gr.Zorp			= "[nomounted]Brawler's Burly Basilisk"
fl.Zorp			= "[nomounted]Mechanized Lumber Extractor"

----------------------------------------------------
-- 3	Steamwheedle Cartel
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
-- 3	The Sha'tar
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

-- Joan
gr.Joan			= "[nomounted]Red Primal Raptor"
fl.Joan			= "[nomounted]Voldunai Dunescraper"
aq.Joan 		= "Crimson Tidestallion"
hs.Joan 		= "Fire Eater's Hearthstone"

-- Nour
gr.Nour			= "[nomounted]Raven Lord"
fl.Nour			= "[nomounted]Dread Raven"
hs.Nour 		= "Fire Eater's Hearthstone"

-- Syrah
gr.Syrah		= "[nomounted]Nightborne Manasaber"

----------------------------------------------------
-- 3	Bloodfeather
----------------------------------------------------

-- Oren
gr.Oren 		= "[nomounted]Midnight"
fl.Oren 		= "[nomounted]Armored Bloodwing"

-- Teo
gr.Teo 			= "[nomounted]Snapback Scuttler"

----------------------------------------------------
-- 4	The Sha'tar
----------------------------------------------------

-- Anna
gr.Anna 		= "[nomounted]Great Northern Elderhorn"

-- Cosmia
gr.Cosmia		= "[nomounted]Arcanist's Manasaber"
fl.Cosmia		= "[nomounted]Arcanist's Manasaber"

-- Noicha
gr.Noicha 		= "[nomounted]Vicious War Kodo"
fl.Noicha 		= "[nomounted]High Priest's Lightsworn Seeker"
aq.Noicha 		= "Saltwater Seahorse"
hs.Noicha 		= "Peddlefeet's Lovely Hearthstone"

-- Nonagon

-- Polygon
gr.Polygon 		= "[nomounted]Amber Primordial Direhorn"
fl.Polygon 		= "[nomounted]Captured Swampstalker"

-- Wawa
gr.Wawa 		= "[nomounted]Crimson Primal Direhorn"

-- Xel
gr.Xel 			= "[nomounted]Crusader's Direhorn"

-- Zahara
gr.Zahara 		= "[nomounted]Crusader's Direhorn"

-- Zap
gr.Zap 			= "[nomounted]Armored Frostwolf"

----------------------------------------------------
-- 4	Moonglade
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
-- 4	Steamwheedle Cartel
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
-- 4	Burning Steppes
----------------------------------------------------

-- Elan
gr.Elan 		= "[nomounted]Thunder Bluff Kodo"

-- Linda
gr.Linda 		= "[nomounted]Snapback Scuttler"

----------------------------------------------------
-- 5	The Sha'tar
----------------------------------------------------

-- Alce

-- Azela
gr.Azela 		= "[nomounted]Black Primal Raptor"

-- Goma

-- Hao
gr.Hao 			= "[nomounted]Qinsho's Eternal Hound"

-- Oscar
gr.Oscar 		= "[nomounted]Vicious Skeletal Warhorse"

-- Scruff
gr.Scruff 		= "[nomounted]Vicious War Wolf"

-- Spoon
gr.Spoon  		= "[nomounted]Vicious War Kodo"
fl.Spoon 		= "[nomounted]Farseer's Raging Tempest"
aq.Spoon 		= "Saltwater Seahorse"
hs.Spoon 		= "Fire Eater's Hearthstone"

-- Tezeta

-- Vendegast
gr.Vendegast 	= "[nomounted]Ratstallion"

-- Zumaridi

----------------------------------------------------
-- 5	Steamwheedle Cartel
----------------------------------------------------

-- Aluni
gr.Aluni		= "[nomounted]Bloodfang Widow"
fl.Aluni		= "[nomounted]Armored Bloodwing"

-- Bear

-- Gabriel
gr.Gabriel 		= "[nomounted]White Skeletal Warhorse"

-- Hocus
gr.Hocus 		= "[nomounted]Vicious Skeletal Warhorse"

-- Hui
gr.Hui 			= "[nomounted]Great Brown Dragon Turtle"

-- Janis
gr.Janis 		= "[nomounted]Slate Primordial Direhorn"

-- Kun
gr.Kun 			= "[nomounted]Great Blue Dragon Turtle"

-- Malaclypse
gr.Malaclypse 	= "[nomounted]Netherlord's Brimstone Wrathsteed"

-- Sithandra
gr.Sithandra	= "[nomounted]Acherus Deathcharger"
fl.Sithandra 	= "[nomounted]Deathlord's Vilebrood Vanquisher"

----------------------------------------------------
-- 5	Moonglade
----------------------------------------------------

-- Chai
gr.Chai 		= "[nomounted]Great Blue Dragon Turtle"

-- Denzel
gr.Denzel 		= "[nomounted]Mag'har Direwolf"

-- Edna
gr.Edna 		= "[nomounted]Acherus Deathcharger"
fl.Edna 		= "[nomounted]Icebound Frostbrood Vanquisher"

-- Guo
gr.Guo 			= "[nomounted]Great Purple Dragon Turtle"

-- Kiwi

----------------------------------------------------
-- 5	Shattered Hand
----------------------------------------------------

-- Maya

-- Njord
gr.Njord 		= "[nomounted]Snapdragon Kelpstalker"

----------------------------------------------------
-- 6	Steamwheedle Cartel
----------------------------------------------------

-- Carrie
gr.Carrie 		= "[nomounted]Mollie"

-- Felix
gr.Felix 		= "[nomounted]Mystic Runesaber"
fl.Felix 		= "[nomounted]Mystic Runesaber"
hs.Felix 		= "Tome of Town Portal"

-- June
gr.June 		= "[nomounted]Springfur Alpaca"

-- Leslie
gr.Leslie 		= "[nomounted]Elusive Quickhoof"
fl.Leslie 		= "[nomounted]Waste Marauder"

-- Pest
gr.Pest 		= "[nomounted]Elusive Quickhoof"

-- Rebecca
gr.Rebecca 		= "[nomounted]Caravan Hyena"

-- Shu
gr.Shu 			= "[nomounted]"

-- Tim
gr.Tim 			= "[nomounted]Mollie"

----------------------------------------------------
-- 6	The Sha'tar
----------------------------------------------------

-- Aponi
gr.Aponi 		= "[nomounted]Spirit of Eche'ro"

-- Cassiopeia
gr.Cassiopeia 	= "[nomounted]Arcanist's Manasaber"

-- Joyce
gr.Joyce 		= "[nomounted]Elusive Quickhoof"

-- Revna
gr.Revna 		= "[nomounted]Infernal Direwolf"

-- Rick
gr.Rick 		= "[nomounted]Springfur Alpaca"

-- Scott
gr.Scott 		= "[nomounted]Dune Scavenger"

-- Thomas
gr.Thomas 		= "[nomounted]Springfur Alpaca"

----------------------------------------------------
-- 6	Moonglade
----------------------------------------------------

-- Daka
gr.Daka 		= "[nomounted]Frostwolf Snarler"

-- David
gr.David 		= "[nomounted]Mollie"

-- Gary
gr.Gary 		= "[nomounted]Mollie"

-- James
gr.James		= "[nomounted]Vicious Warstrider"

-- Kala
gr.Kala 		= "[nomounted]Vicious War Kodo"

-- Ogo
gr.Ogo 			= "[nomounted]Vicious War Raptor"

----------------------------------------------------
-- 6	Burning Steppes
----------------------------------------------------

-- Fak
gr.Fak 			= "[nomounted]Red Primal Raptor"
fl.Fak 			= "[nomounted]Witherbark Direwing"
aq.Fak 			= "Saltwater Seahorse"
hs.Fak 			= "Fire Eater's Hearthstone"

-- Loko
gr.Loko 		= "[nomounted]Vicious War Raptor"

-- Magda
gr.Magda 		= "[nomounted]Netherlord's Accursed Wrathsteed"
fl.Magda 		= "[nomounted]Uncorrupted Voidwing"

-- New
gr.New 			= "[nomounted]Crusader's Direhorn"

----------------------------------------------------



local frame = CreateFrame("FRAME", "Automagic")

frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("VARIABLES_LOADED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:RegisterEvent("BAG_UPDATE")
frame:RegisterEvent("PET_STABLE_CLOSED")
frame:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
frame:RegisterEvent("PLAYER_LEVEL_UP")
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

	text = "#showtooltip\n/use " .. text

	EditMacro(name, nil, icon, text, 1, 1)
end


local function eventHandler(self, event)
	if InCombatLockdown() then
		frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	else
		frame:UnregisterEvent("PLAYER_REGEN_ENABLED")

		local instanceName, instanceType, difficulty, difficultyName, maxPlayers, playerDifficulty, isDynamicInstance, mapID, instanceGroupSize = GetInstanceInfo()
		local _, class, _ = UnitClass("player")
		local playerName, _ = UnitName("player")
		local faction,_ = UnitFactionGroup("player")
		local spec = GetSpecialization() or 0
		local level = UnitLevel("player") or 1

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


		if event ~= "ZONE_CHANGED_NEW_AREA" then
			-- Healthstone
			if bags("Healthstone") >= 1 then
				macro("Healthstone", "Healthstone")
			else
				macro("Healthstone", "Healthstone", 237477)
			end

			-- Tonic
			if bags("Crimson Vial") >= 1 then macro("Tonic", "Crimson Vial")

			-- Battleground
			elseif instanceType == "pvp" and bags("\"Third Wind\" Potion") >= 1 then macro("Tonic", "\"Third Wind\" Potion")

			-- Darkmoon Faire
			elseif bags("Darkmoon Healing Tonic") >= 1 then macro("Tonic", "Darkmoon Healing Tonic")

			-- Kul Tiras/Zandalar
			elseif bags("Abyssal Healing Potion") >= 1 and level >= 110 then macro("Tonic", "Abyssal Healing Potion")
			elseif bags("Coastal Healing Potion") >= 1 and level >= 100 then macro("Tonic", "Coastal Healing Potion")

			-- Broken Isles
			elseif bags("Astral Healing Potion") >= 1 and level >= 110 then macro("Tonic", "Astral Healing Potion")
			elseif bags("Ancient Healing Potion") >= 1 and level >= 100 then macro("Tonic", "Ancient Healing Potion")

			-- Draenor
			elseif bags("Healing Tonic") >= 1 and level >= 91 then macro("Tonic", "Healing Tonic")

			-- Pandaria
			elseif bags("Master Healing Potion") >= 1 and level >= 85 then macro("Tonic", "Master Healing Potion")

			-- Cataclysm
			elseif bags("Mythical Healing Potion") >= 1 and level >= 80 then macro("Tonic", "Mythical Healing Potion")

			-- Northrend
			elseif bags("Crazy Alchemist's Potion") >= 1 and level >= 70 then macro("Tonic", "Crazy Alchemist's Potion")
			elseif bags("Runic Healing Potion") >= 1 and level >= 70 then macro("Tonic", "Runic Healing Potion")
			elseif bags("Powerful Rejuvenation Potion") >= 1 and level >= 70 then macro("Tonic", "Powerful Rejuvenation Potion")
			elseif bags("Resurgent Healing Potion") >= 1 and level >= 65 then macro("Tonic", "Resurgent Healing Potion")

			-- Outland
			elseif bags("Fel Regeneration Potion") >= 1 and level >= 60 then macro("Tonic", "Fel Regeneration Potion")
			elseif bags("Super Healing Potion") >= 1 and level >= 55 then macro("Tonic", "Super Healing Potion")
			elseif bags("Volatile Healing Potion") >= 1 and level >= 55 then macro("Tonic", "Volatile Healing Potion")

			-- Classic
			elseif bags("Major Healing Potion") >= 1 and level >= 45 then macro("Tonic", "Major Healing Potion")
			elseif bags("Superior Healing Potion") >= 1 and level >= 35 then macro("Tonic", "Superior Healing Potion")
			elseif bags("Greater Healing Potion") >= 1 and level >= 21 then macro("Tonic", "Greater Healing Potion")
			elseif bags("Healing Potion") >= 1 and level >= 12 then macro("Tonic", "Healing Potion")
			elseif bags("Lesser Healing Potion") >= 1 and level >= 3 then macro("Tonic", "Lesser Healing Potion")
			elseif bags("Minor Healing Potion") >= 1 then macro("Tonic", "Minor Healing Potion")

			-- Fallback to best current content potion
			else macro("Tonic", "Abyssal Healing Potion", 134865) end


			-- Potion
			if instanceType == "pvp" and bags("Saltwater Potion") >= 1 then macro("Potion", "Saltwater Potion")
			elseif instanceName == "Blackwing Descent Scenario" and bags("Experimental Vial") >= 1 then macro("Potion", "Experimental Vial")
			elseif primary == "int" and bags("Potion of Unbridled Fury") >= 1 then macro("Potion", "Potion of Unbridled Fury")
			elseif primary == "int" and bags("Superior Battle Potion of Intellect") >= 1 then macro("Potion", "Superior Battle Potion of Intellect")
			elseif primary == "agi" and bags("Superior Battle Potion of Agility") >= 1 then macro("Potion", "Superior Battle Potion of Agility")
			elseif primary == "str" and bags("Superior Battle Potion of Strength") >= 1 then macro("Potion", "Superior Battle Potion of Strength")
			elseif primary == "int" and bags("Battle Potion of Intellect") >= 1 then macro("Potion", "Battle Potion of Intellect")
			elseif primary == "agi" and bags("Battle Potion of Agility") >= 1 then macro("Potion", "Battle Potion of Agility")
			elseif primary == "str" and bags("Battle Potion of Strength") >= 1 then macro("Potion", "Battle Potion of Strength")
			elseif bags("Potion of Prolonged Power") >= 1 then macro("Potion", "Potion of Prolonged Power")
			else macro("Potion", "Potion of Prolonged Power", 132380) end

			-- Zone Ability
			if instanceName == "Draenor" then
				macro("Zone Ability", "Garrison Ability")
			elseif instanceName == "Argus" then
				macro("Zone Ability", "Vindicaar Matrix Crystal")
			elseif (instanceName == "Horrific Vision of Orgrimmar" or instanceName == "Horrific Vision of Stormwind") and IsSpellKnown(314955) then
				macro("Zone Ability", "Sanity Restoration Orb")
			elseif instanceName == "Vision of the Twisting Sands" or instanceName == "Vale of Eternal Twilight" then
				macro("Zone Ability", "Resilient Soul", 458722)
			else
				macro("Zone Ability", "Garrison Ability")
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
					["Ray"] = "Nether Shock",
					["Riverbeast"] = "Gruesome Bite",
					["Rodent"] = "Gnaw",
					["Scalehide"] = "Scale Shield",
					["Scorpid"] = "Deadly Sting",
					["Serpent"] = "Serpent's Swiftness",
					["Shale Spider"] = "Solid Shell",
					["Silithid"] = "Tendon Rip",
					["Spider"] = "Web Spray",
					["Spirit Beast"] = "Spirit Shock",
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
						EditMacro("Call Pet " .. i, nil, ZA.PetIcons[petName] or petIcon or 132161, "#showtooltip\n#icon " .. (ZA.PetIcons[petName] or petIcon or 132161) .. "\n/use Call Pet " .. i, 1, 1)
					end
				end

				petAbilityMacro = petAbilityMacro .. "Tame Beast"
				petExoticMacro = petExoticMacro .. "Tame Beast"

				EditMacro("Pet Ability", nil, nil, petAbilityMacro, 1, 1)
				EditMacro("Pet Exotic", nil, nil, petExoticMacro, 1, 1)
			end
		end

		if event ~= "BAG_UPDATE" then
			-- UI Stuff
			--UIWidgetTopCenterContainerFrame:ClearAllPoints()
			--UIWidgetTopCenterContainerFrame:SetPoint("CENTER", 0, 400)

			-- Keybinds

			-- Mounts
			SetBindingMacro("BUTTON3", "Mount")
			SetBindingMacro("SHIFT-BUTTON3", "Mount Aquatic")
			SetBindingMacro("CTRL-BUTTON5", "Mount Gathering")
			SetBindingMacro("ALT-BUTTON5", "Mount Passenger")

			-- Pets
			SetBindingMacro("ALT-NUMPAD3", "Companion")
			SetBindingSpell("ALT-NUMPAD4", "Revive Battle Pets")
			SetBindingMacro("ALT-NUMPAD5", "No Companion")

			-- General
			SetBindingMacro("§", "Loot-A-Rang")
			SetBindingMacro("SHIFT-BUTTON5", "Cancel")
			SetBindingSpell("CTRL-B", "Fishing")
			SetBindingSpell("CTRL-N", "Survey")
			SetBindingMacro(".", "Zone Ability")

			-- UI
			SetBindingMacro("F11", "Volume Low")
			SetBindingMacro("F12", "Volume High")

			SetBindingMacro("ALT-CTRL-NUMPAD6", "Placer")
			SetBindingMacro("ALT-CTRL-NUMPAD8", "Reset Instances")
			SetBindingMacro("ALT-CTRL-NUMPAD9", "Camp")
			SetBindingMacro("CTRL-SHIFT-NUMPADDIVIDE", "Invite Guild")
			SetBindingMacro("CTRL-SHIFT-NUMPADMULTIPLY", "Leave")

			-- Loot Spec
			SetBindingMacro("ALT-F9", "Loot Spec 1")
			SetBindingMacro("ALT-F10", "Loot Spec 2")
			SetBindingMacro("ALT-F11", "Loot Spec 3")
			SetBindingMacro("ALT-F12", "Loot Spec 4")

			-- Tinkers
			SetBindingMacro("=", "Belt")
			SetBindingMacro("NUMPADEQUALS", "Belt")
			SetBindingMacro("0", "Belt")
			SetBindingMacro("NUMPADDIVIDE", "Cloak")
			SetBindingMacro("NUMPADMULTIPLY", "Gloves")

			SetBindingMacro("ALT-CTRL-SHIFT-G", "Goblin Glider")
			SetBindingMacro("ALT-CTRL-SHIFT-N", "Nitro Boosts")


			local z, m, mA, mP = GetZoneText(), "", "", ""
			local mountType, preferAquatic = "", false

			-- Check if the character has riding skill
			if instanceName == "The Deaths of Chromie" then
				mountType = "flying" -- Force flying in the Deaths of Chromie scenario
			elseif IsSpellKnown(34090) or IsSpellKnown(34091) or IsSpellKnown(90265) then -- Expert, Artisan or Master Riding
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

				if IsQuestFlaggedCompleted(25371) and class ~= "DRUID" then -- Quest to unlock the Vashj'ir Seahorse
					aq[playerName] = "[nomounted]Vashj'ir Seahorse" -- Force Vashj'ir Seahorse in Vashj'ir
				end
			elseif z == "Nazjatar" or z == "Damprock Cavern" or z == "The Forgotten Tunnel" or z == "Highborne Estates" then
				-- Nazjatar
				if (faction == "Alliance" and IsQuestFlaggedCompleted(56350)) or (faction == "Horde" and IsQuestFlaggedCompleted(55481)) then -- Quest that gives 20 Manapearls
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
					pre = "/use [nomounted,@player]Water Walking\n"
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
					EditMacro("Mount", nil, nil, pre .. "/use [swimming][nocombat,nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 1, 1)
				elseif mountType == "ground" or level >= 18 then
					EditMacro("Mount", nil, nil, pre .. "/use [nomounted]!Travel Form\n/dismount [mounted]\n/leavevehicle", 1, 1)
				else
					EditMacro("Mount", nil, nil, pre .. "/use " .. m .. "\n/dismount [mounted]\n/leavevehicle", 1, 1)
				end

				EditMacro("Mount Aquatic", nil, nil, pre .. "/use " .. m .."\n/dismount [mounted]\n/leavevehicle", 1, 1)
			elseif preferAquatic then
				EditMacro("Mount", nil, nil, "/use ".. (aq[playerName] or default_aq) .. "\n/dismount [mounted]\n/leavevehicle", 1, 1)
				EditMacro("Mount Aquatic", nil, nil, pre .. "/use " .. m .."\n/dismount [mounted]\n/leavevehicle", 1, 1)
			else
				EditMacro("Mount", nil, nil, pre .. "/use " .. m .. "\n/dismount [mounted]\n/leavevehicle", 1, 1)
				EditMacro("Mount Aquatic", nil, nil, "/use " .. (aq[playerName] or default_aq) .."\n/dismount [mounted]\n/leavevehicle", 1, 1)
			end
			
			-- Passenger Mount
			EditMacro("Mount Passenger", nil, nil, "/use " .. (pa[playerName] or default_pa), 1, 1)

			-- Hearthstone
			EditMacro("Hearthstone", nil, nil, "#showtooltip\n/use " .. (hs[playerName] or default_hs), 1, 1)

			-- Companion
			if co[playerName] then
				EditMacro("Companion", nil, nil, "/sp " .. co[playerName], 1, 1)
			else
				EditMacro("Companion", nil, nil, "/rfp", 1, 1)
			end

			-- Loot-A-Rang
			if class == "ROGUE" then
				EditMacro("Loot-A-Rang", nil, nil, "#showtooltip Loot-A-Rang\n/use [stealth,harm,nodead]Pick Pocket;[@mouseover,harm,dead][harm,dead][]Loot-A-Rang", 1, 1)
			else
				EditMacro("Loot-A-Rang", nil, nil, "#showtooltip Loot-A-Rang\n/use [@mouseover,harm,dead][harm,dead][]Loot-A-Rang", 1, 1)
			end
		end
	end
end

frame:SetScript("OnEvent", eventHandler)