function event_say(e)
	local warningRoom = "I hope you have room for all of this.";
	if(e.message:findi("hail")) then
		e.self:Say("Hello my friend, you need some [plat] an [hpbuff] / [manabuff] or have you come to the ease your pain of doing [tradeskills]?");
		e.self:Say("Do you need [help] with the usage of tradskill commands?");
		e.self:Say("Need a ride [home] to bind point?");
	elseif(e.message:findi("tradeskills")) then
		e.self:Emote(" says under his breath 'Alrighty then if you insist.....'");
		e.self:Say("Tell me which tradeskill type you need materials for from these choices. [Research] [Alchemy] [Baking] [Brewing] [Fishing] [Fletching] [Jewelcraft] [Poison] [Pottery] [Smithing] [Tailoring] [Tinkering]");
	elseif(e.message:findi("help")) then
		e.self:Say("Each skill range is for only the prior skill range to the one you specify. So an [RS26] would be only for skills 23 to 26.");
		e.self:Say("Example Usage1: 'RS41' (will give only mats for 27 to 41 research skillups for your class)");
		e.self:Say("Example Usage2: 'RS41 all' (will give only mats for 27 to 41 skillups for all research classes)");
		e.self:Say("Example Usage3: 'FL41' (will give only mats for 46 to 56 skillups for fletching.)");
		e.self:Say("WARNING: You need to make sure you have plenty of inventory space before using this feature.");

	--RESEARCH
	elseif(e.message:findi("Research")) then
		e.self:Say("What skill range max? [RS22] [RS26] [RS41] [RS42] [RS46] [RS62] [RS71] [RS82] [RS83] [RS87] [RS96] [RS102] [RS116] [RS120] [RS122] [RS140] [RS142] [RS162] [RS166] [RS182] [RS184] [RS no fail]");
		e.self:Say("If you want to research other classes than your own add [all] after range max.");
		e.self:Say(warningRoom);
	elseif(e.message:findi("RS22 all") or e.other:GetClass() == "11" and (e.message:findi("RS22"))) then --Necro
		e.other:SummonItem(16024,20); --necro   21   Words of Derivation
		e.other:SummonItem(11810,20); --necro   21   Words of Eradication
	elseif(e.message:findi("RS22 all") or e.other:GetClass() == "12" and (e.message:findi("RS22"))) then --Wiz
	elseif(e.message:findi("RS22 all") or e.other:GetClass() == "13" and (e.message:findi("RS22"))) then --Mage
		e.other:SummonItem(11786,20); --mage   22   Words of the Element
		e.other:SummonItem(11787,20); --mage   22   Words of Tyranny
		e.other:SummonItem(11788,20); --mage   22   Words of Dominion			****NOTE there is a duplicate of this in DB 11828
		e.other:SummonItem(15401,20); --mage   22   Elemental: Earth			****NOTE there is a duplicate of this in DB 16119
		e.other:SummonItem(15402,20); --mage   22   Elemental: Water			****NOTE there is a duplicate of this in DB 16120
		e.other:SummonItem(15403,20); --mage   22   Elemental: Fire				****NOTE there is a duplicate of this in DB 16145
		e.other:SummonItem(15404,20); --mage   22   Elemental: Air				****NOTE there is a duplicate of this in DB 16146
		e.other:SummonItem(10019,20); --mage   22   Bloodstone
		e.other:SummonItem(13339,20); --mage   22   Aviak Feather				****NOTE 13160 incase it is 'feathers' not feather
		e.other:SummonItem(10501,20); --mage   22   Small Brick of Ore
		e.other:SummonItem(16584,20); --mage   22   Halas Heater
		e.other:SummonItem(13075,20); --mage   22   Shark Skin					****NOTE there is a duplicate of this in DB 13875
	elseif(e.message:findi("RS22 all") or e.other:GetClass() == "14" and (e.message:findi("RS22"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
		e.other:SummonItem(16068,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Left)
		e.other:SummonItem(16070,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Left)
		e.other:SummonItem(16072,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Left)
		e.other:SummonItem(16069,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Right)
		e.other:SummonItem(16071,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Right)
		e.other:SummonItem(16073,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Right)
	elseif(e.message:findi("RS26 all") or e.other:GetClass() == "11" and (e.message:findi("RS26"))) then --Necro
		e.other:SummonItem(11817,20); --necro   26   Words of Reviviscence
		e.other:SummonItem(11815,20); --necro   26   Words of Possession
		e.other:SummonItem(11813,20); --necro   26   Words of Materials
		e.other:SummonItem(11811,20); --necro   26   Words of Imitation
		e.other:SummonItem(11818,20); --necro   26   Words of the Sentient (Azia)
		e.other:SummonItem(11816,20); --necro   26   Words of the Spoken
		e.other:SummonItem(11814,20); --necro   26   Words of Spirit
		e.other:SummonItem(11843,20); --necro   26   Words of Resolve			****NOTE was given to me as Words of Resolution but doesn't exist here or on PeQ
	elseif(e.message:findi("RS26 all") or e.other:GetClass() == "12" and (e.message:findi("RS26"))) then --Wiz
		e.other:SummonItem(11738,20); --wizard   26   Rune of Falhalem
		e.other:SummonItem(16054,20); --wizard   26   Rune of Nagafen
		e.other:SummonItem(11741,20); --wizard   26   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
		e.other:SummonItem(11739,20); --wizard   26   Rune of Substance
		e.other:SummonItem(11742,20); --wizard   26   Rune of Proximity			****NOTE there is a duplicate of this in DB 16050
		e.other:SummonItem(11740,20); --wizard   26   Rune of Periphery
	elseif(e.message:findi("RS26 all") or e.other:GetClass() == "13" and (e.message:findi("RS26"))) then --Mage
	elseif(e.message:findi("RS26 all") or e.other:GetClass() == "14" and (e.message:findi("RS26"))) then --Chanter
	elseif(e.message:findi("RS41 all") or e.other:GetClass() == "11" and (e.message:findi("RS41"))) then --Necro
		e.other:SummonItem(11819,20); --necro   41   Words of Refuge
		e.other:SummonItem(11821,20); --necro   41   Words of Enlightenment
		e.other:SummonItem(11811,20); --necro   41   Words of Imitation
		e.other:SummonItem(11825,20); --necro   41   Words of the Extinct
		e.other:SummonItem(16039,20); --necro   41   Words of Cazic-Thule
		e.other:SummonItem(11820,20); --necro   41   Words of Absorption
		e.other:SummonItem(11822,20); --necro   41   Words of Anthology
		e.other:SummonItem(11812,20); --necro   41   Words of Dissolution
		e.other:SummonItem(11826,20); --necro   41   Words of the Quickening
		e.other:SummonItem(11824,20); --necro   41   Words of Radiance
	elseif(e.message:findi("RS41 all") or e.other:GetClass() == "12" and (e.message:findi("RS41"))) then --Wiz
	elseif(e.message:findi("RS41 all") or e.other:GetClass() == "13" and (e.message:findi("RS41"))) then --Mage
	elseif(e.message:findi("RS41 all") or e.other:GetClass() == "14" and (e.message:findi("RS41"))) then --Chanter
	elseif(e.message:findi("RS42 all") or e.other:GetClass() == "11" and (e.message:findi("RS42"))) then --Necro
	elseif(e.message:findi("RS42 all") or e.other:GetClass() == "12" and (e.message:findi("RS42"))) then --Wiz
	elseif(e.message:findi("RS42 all") or e.other:GetClass() == "13" and (e.message:findi("RS42"))) then --Mage
		e.other:SummonItem(11788,20); --mage   22   Words of Dominion			****NOTE there is a duplicate of this in DB 11828
		e.other:SummonItem(15396,20); --mage   42   Minor Summoning: Air		****NOTE there is a duplicate of this in DB 16128
		e.other:SummonItem(15335,20); --mage   42   Minor Summoning: Earth		****NOTE there is a duplicate of this in DB 16125
		e.other:SummonItem(15395,20); --mage   42   Minor Summoning: Fire		****NOTE there is a duplicate of this in DB 16127
		e.other:SummonItem(15336,20); --mage   42   Minor Summoning: Water		****NOTE there is a duplicate of this in DB 16126
		e.other:SummonItem(11791,20); --mage   42   Pearl Shard
		e.other:SummonItem(10025,20); --mage   42   Topaz
		e.other:SummonItem(11790,20); --mage   42   Jade Shard
		e.other:SummonItem(11789,20); --mage   42   Ice of Velious
	elseif(e.message:findi("RS42 all") or e.other:GetClass() == "14" and (e.message:findi("RS42"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
		e.other:SummonItem(16074,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Left)
		e.other:SummonItem(16075,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Right)
		e.other:SummonItem(16078,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Right)
		e.other:SummonItem(16079,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Left)
		e.other:SummonItem(16076,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Left)
		e.other:SummonItem(16077,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Right)
	elseif(e.message:findi("RS46 all") or e.other:GetClass() == "11" and (e.message:findi("RS46"))) then --Necro
	elseif(e.message:findi("RS46 all") or e.other:GetClass() == "12" and (e.message:findi("RS46"))) then --Wiz
		e.other:SummonItem(11746,20); --wizard   46   Rune of Al'Kabor
		e.other:SummonItem(11743,20); --wizard   46   Rune of Neglect
		e.other:SummonItem(11745,20); --wizard   46   Rune of Velious
		e.other:SummonItem(11744,20); --wizard   46   Rune of Oppression
	elseif(e.message:findi("RS46 all") or e.other:GetClass() == "13" and (e.message:findi("RS46"))) then --Mage
	elseif(e.message:findi("RS46 all") or e.other:GetClass() == "14" and (e.message:findi("RS46"))) then --Chanter
	elseif(e.message:findi("RS62 all") or e.other:GetClass() == "11" and (e.message:findi("RS62"))) then --Necro
		e.other:SummonItem(11823,20); --necro   62   Words of Discernment
		e.other:SummonItem(11831,20); --necro   62   Words of the Sentient (Beza)
		e.other:SummonItem(11833,20); --necro   62   Words of Cloudburst
		e.other:SummonItem(11815,20); --necro   62   Words of Possession
		e.other:SummonItem(11827,20); --necro   62   Words of Eventide
		e.other:SummonItem(11832,20); --necro   62   Words of Recluse
		e.other:SummonItem(11834,20); --necro   62   Words of Mistbreath
		e.other:SummonItem(11835,20); --necro   62   Words of Detachment
		e.other:SummonItem(11820,20); --necro   62   Words of Absorption
		e.other:SummonItem(16039,20); --necro   62   Words of Cazic-Thule
		e.other:SummonItem(11829,20); --necro   62   Words of Allure
	elseif(e.message:findi("RS62 all") or e.other:GetClass() == "12" and (e.message:findi("RS62"))) then --Wiz
	elseif(e.message:findi("RS62 all") or e.other:GetClass() == "13" and (e.message:findi("RS62"))) then --Mage
		e.other:SummonItem(11792,20); --mage   62   Words of Transcendence
		e.other:SummonItem(11871,20); --mage   62   Words of Dimension
		e.other:SummonItem(11794,20); --mage   62   Words of Coercion
		e.other:SummonItem(15050,20); --mage   62   Summon Food					****NOTE there is a duplicate of this in DB 16100
		e.other:SummonItem(15211,20); --mage   62   Summon Drink				****NOTE there is a duplicate of this in DB 16102
		e.other:SummonItem(15499,20); --mage   62   Lesser Summoning: Air		****NOTE there is a duplicate of this in DB 16132
		e.other:SummonItem(15496,20); --mage   62   Lesser Summoning: Earth		****NOTE there is a duplicate of this in DB 16129
		e.other:SummonItem(15498,20); --mage   62   Lesser Summoning: Fire		****NOTE there is a duplicate of this in DB 16131
		e.other:SummonItem(15497,20); --mage   62   Lesser Summoning: Water		****NOTE there is a duplicate of this in DB 16130
		e.other:SummonItem(13015,20); --mage   62   Loaf of Bread
		e.other:SummonItem(13006,20); --mage   62   Flask of Water				****NOTE Flask of Water was not in DB, this is Water Flask. Same thing?
		e.other:SummonItem(11791,20); --mage   62   Pearl Shard
		e.other:SummonItem(11796,20); --mage   62   Glove of Rallos Zek
		e.other:SummonItem(11790,20); --mage   62   Jade Shard
		e.other:SummonItem(11789,20); --mage   62   Ice of Velious
	elseif(e.message:findi("RS62 all") or e.other:GetClass() == "14" and (e.message:findi("RS62"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
		e.other:SummonItem(16081,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Left)
		e.other:SummonItem(16080,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Right)
		e.other:SummonItem(16082,20); --enchanter   62   Velishoul's Tome Pg. 8
		e.other:SummonItem(16085,20); --enchanter   62   Velishoul's Tome Pg. 16 (Faded)
		e.other:SummonItem(16083,20); --enchanter   62   Velishoul's Tome Pg. 9
		e.other:SummonItem(16086,20); --enchanter   62   Velishoul's Tome Pg. 17
	elseif(e.message:findi("RS71 all") or e.other:GetClass() == "11" and (e.message:findi("RS71"))) then --Necro
	elseif(e.message:findi("RS71 all") or e.other:GetClass() == "12" and (e.message:findi("RS71"))) then --Wiz
		e.other:SummonItem(11747,20); --wizard   71   Rune of Expulsion
		e.other:SummonItem(11751,20); --wizard   71   Rune of Trauma
		e.other:SummonItem(11750,20); --wizard   71   Rune of Disassociation
		e.other:SummonItem(11753,20); --wizard   71   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
		e.other:SummonItem(11748,20); --wizard   71   Rune of Attraction		****NOTE there is a duplicate of this in DB 11777
		e.other:SummonItem(11752,20); --wizard   71   Rune of Xegony
		e.other:SummonItem(11749,20); --wizard   71   Rune of Presence
	elseif(e.message:findi("RS71 all") or e.other:GetClass() == "13" and (e.message:findi("RS71"))) then --Mage
	elseif(e.message:findi("RS71 all") or e.other:GetClass() == "14" and (e.message:findi("RS71"))) then --Chanter
	elseif(e.message:findi("RS82 all") or e.other:GetClass() == "11" and (e.message:findi("RS82"))) then --Necro
	elseif(e.message:findi("RS82 all") or e.other:GetClass() == "12" and (e.message:findi("RS82"))) then --Wiz
	elseif(e.message:findi("RS82 all") or e.other:GetClass() == "13" and (e.message:findi("RS82"))) then --Mage
		e.other:SummonItem(11793,20); --mage   82   Words of Sight
		e.other:SummonItem(11794,20); --mage   82   Words of Coercion
		e.other:SummonItem(15320,20); --mage   82   Summon Heatstone
		e.other:SummonItem(15572,20); --mage   82   Summoning: Air
		e.other:SummonItem(15569,20); --mage   82   Summoning: Earth
		e.other:SummonItem(15571,20); --mage   82   Summoning: Fire
		e.other:SummonItem(15570,20); --mage   82   Summoning: Water
		e.other:SummonItem(11795,20); --mage   82   Eye of Serilis
		e.other:SummonItem(11802,20); --mage   82   Scent of Marr
		e.other:SummonItem(11796,20); --mage   82   Glove of Rallos Zek
		e.other:SummonItem(11801,20); --mage   82   Breath of Solusek
		e.other:SummonItem(11797,20); --mage   82   Flame of Vox
	elseif(e.message:findi("RS82 all") or e.other:GetClass() == "14" and (e.message:findi("RS82"))) then --Chanter
		e.other:SummonItem(16087,20); --enchanter   82   Velishoul's Tome Pg. 43
		e.other:SummonItem(16089,20); --enchanter   82   Velishoul's Tome Pg. 67
		e.other:SummonItem(16092,20); --enchanter   82   Velishoul's Tome Pg. 75
		e.other:SummonItem(11700,20); --enchanter   82   Velishoul's Tome Pg. 108 (Faded)
		e.other:SummonItem(16088,20); --enchanter   82   Velishoul's Tome Pg. 44
		e.other:SummonItem(16091,20); --enchanter   82   Velishoul's Tome Pg. 68
		e.other:SummonItem(16093,20); --enchanter   82   Velishoul's Tome Pg. 76
		e.other:SummonItem(11702,20); --enchanter   82   Velishoul's Tome Pg. 109
	elseif(e.message:findi("RS83 all") or e.other:GetClass() == "11" and (e.message:findi("RS83"))) then --Necro
		e.other:SummonItem(11838,20); --necro   83   Words of Purification
		e.other:SummonItem(11815,20); --necro   83   Words of Possession
		e.other:SummonItem(11839,20); --necro   83   Words of the Incorporeal
		e.other:SummonItem(11841,20); --necro   83   Words of Dissemination
		e.other:SummonItem(11840,20); --necro   83   Words of Acquisition (Azia)
		e.other:SummonItem(11842,20); --necro   83   Words of Parasitism
	elseif(e.message:findi("RS83 all") or e.other:GetClass() == "12" and (e.message:findi("RS83"))) then --Wiz
	elseif(e.message:findi("RS83 all") or e.other:GetClass() == "13" and (e.message:findi("RS83"))) then --Mage
	elseif(e.message:findi("RS83 all") or e.other:GetClass() == "14" and (e.message:findi("RS83"))) then --Chanter
	elseif(e.message:findi("RS87 all") or e.other:GetClass() == "11" and (e.message:findi("RS87"))) then --Necro
		e.other:SummonItem(11815,20); --necro   83   Words of Possession
		e.other:SummonItem(11836,20); --necro   87   Words of Haunting
		e.other:SummonItem(11837,20); --necro   87   Words of Rupturing
	elseif(e.message:findi("RS87 all") or e.other:GetClass() == "12" and (e.message:findi("RS87"))) then --Wiz
	elseif(e.message:findi("RS87 all") or e.other:GetClass() == "13" and (e.message:findi("RS87"))) then --Mage
	elseif(e.message:findi("RS87 all") or e.other:GetClass() == "14" and (e.message:findi("RS87"))) then --Chanter
	elseif(e.message:findi("RS96 all") or e.other:GetClass() == "11" and (e.message:findi("RS96"))) then --Necro
	elseif(e.message:findi("RS96 all") or e.other:GetClass() == "12" and (e.message:findi("RS96"))) then --Wiz
		e.other:SummonItem(11746,20); --wizard   96   Rune of Al'Kabor
		e.other:SummonItem(11762,20); --wizard   96   Rune of Arrest
		e.other:SummonItem(11753,20); --wizard   71   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
		e.other:SummonItem(11754,20); --wizard   96   Rune of The Combine
		e.other:SummonItem(11757,20); --wizard   96   Rune of Rallos Zek
		e.other:SummonItem(11760,20); --wizard   96   Rune of Consumption
		e.other:SummonItem(11752,20); --wizard   96   Rune of Xegony
		e.other:SummonItem(11755,20); --wizard   96   Rune of Dismemberment
		e.other:SummonItem(11758,20); --wizard   96   Rune of the Helix
		e.other:SummonItem(11761,20); --wizard   96   Rune of Sorcery
		e.other:SummonItem(11741,20); --wizard   96   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
		e.other:SummonItem(11756,20); --wizard   96   Rune of Regeneration
	elseif(e.message:findi("RS96 all") or e.other:GetClass() == "13" and (e.message:findi("RS96"))) then --Mage
	elseif(e.message:findi("RS96 all") or e.other:GetClass() == "14" and (e.message:findi("RS96"))) then --Chanter
	elseif(e.message:findi("RS102 all") or e.other:GetClass() == "11" and (e.message:findi("RS102"))) then --Necro
	elseif(e.message:findi("RS102 all") or e.other:GetClass() == "12" and (e.message:findi("RS102"))) then --Wiz
	elseif(e.message:findi("RS102 all") or e.other:GetClass() == "13" and (e.message:findi("RS102"))) then --Mage
		e.other:SummonItem(11798,20); --mage   102   Words of Detention
		e.other:SummonItem(11799,20); --mage   102   Words of Duress
		e.other:SummonItem(15048,20); --mage   102   Cancel Magic				****NOTE there is duplicates of this in DB 16118, 16207, 16313, 16415
		e.other:SummonItem(15576,20); --mage   102   Greater Summoning: Air
		e.other:SummonItem(15575,20); --mage   102   Greater Summoning: Fire
		e.other:SummonItem(11800,20); --mage   102   Blood of Velious
		e.other:SummonItem(11802,20); --mage   102   The Scent of Marr
		e.other:SummonItem(11801,20); --mage   102   Breath of Solusek
	elseif(e.message:findi("RS102 all") or e.other:GetClass() == "14" and (e.message:findi("RS102"))) then --Chanter
	elseif(e.message:findi("RS116 all") or e.other:GetClass() == "11" and (e.message:findi("RS116"))) then --Necro
		e.other:SummonItem(11850,20); --necro   116   Words of Dark Paths
		e.other:SummonItem(11836,20); --necro   116   Words of Haunting
		e.other:SummonItem(11851,20); --necro   116   Words of the Suffering
	elseif(e.message:findi("RS116 all") or e.other:GetClass() == "12" and (e.message:findi("RS116"))) then --Wiz
	elseif(e.message:findi("RS116 all") or e.other:GetClass() == "13" and (e.message:findi("RS116"))) then --Mage
	elseif(e.message:findi("RS116 all") or e.other:GetClass() == "14" and (e.message:findi("RS116"))) then --Chanter
	elseif(e.message:findi("RS120 all") or e.other:GetClass() == "11" and (e.message:findi("RS120"))) then --Necro
		e.other:SummonItem(11845,20); --necro   120   Words of Duration
		e.other:SummonItem(11846,20); --necro   120   Words of Motion
		e.other:SummonItem(11844,20); --necro   120   Words of Quivering
		e.other:SummonItem(11847,20); --necro   120   Words of Neglect
		e.other:SummonItem(11843,20); --necro   120   Words of Resolve
		e.other:SummonItem(11848,20); --necro   120   Words of Endurance
	elseif(e.message:findi("RS120 all") or e.other:GetClass() == "12" and (e.message:findi("RS120"))) then --Wiz
		e.other:SummonItem(11764,20); --wizard   120   Rune of Banding
		e.other:SummonItem(11774,20); --wizard   120   Rune of Conception
		e.other:SummonItem(11763,20); --wizard   120   Rune of Concussion
		e.other:SummonItem(11765,20); --wizard   120   Rune of the Catalyst
		e.other:SummonItem(11769,20); --wizard   120   Rune of Contortion
		e.other:SummonItem(11767,20); --wizard   120   Rune of The Cyclone
		e.other:SummonItem(11768,20); --wizard   120   Rune of Howling
		e.other:SummonItem(11766,20); --wizard   120   Rune of Solusek Ro
	elseif(e.message:findi("RS120 all") or e.other:GetClass() == "13" and (e.message:findi("RS120"))) then --Mage
	elseif(e.message:findi("RS120 all") or e.other:GetClass() == "14" and (e.message:findi("RS120"))) then --Chanter
	elseif(e.message:findi("RS122 all") or e.other:GetClass() == "11" and (e.message:findi("RS122"))) then --Necro
		e.other:SummonItem(16037,20); --necro   122   Words of Abatement
		e.other:SummonItem(16039,20); --necro   122   Words of Cazic-Thule
		e.other:SummonItem(11849,20); --necro   122   Words of Efficacy
	elseif(e.message:findi("RS122 all") or e.other:GetClass() == "12" and (e.message:findi("RS122"))) then --Wiz
	elseif(e.message:findi("RS122 all") or e.other:GetClass() == "13" and (e.message:findi("RS122"))) then --Mage
		e.other:SummonItem(11803,20); --mage   122   Words of Collection (Azia)
		e.other:SummonItem(11872,20); --mage   122   Words of Convocation
		e.other:SummonItem(7001,20); --mage   122   Dagger
		e.other:SummonItem(10021,20); --mage   122   Star Rose Quartz
		e.other:SummonItem(15620,20); --mage   122   Minor Conjuration: Earth
		e.other:SummonItem(15621,20); --mage   122   Minor Conjuration: Water
		e.other:SummonItem(11796,20); --mage   122   Glove of Rallos Zek
		e.other:SummonItem(11797,20); --mage   122   Flame of Vox
	elseif(e.message:findi("RS122 all") or e.other:GetClass() == "14" and (e.message:findi("RS122"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
		e.other:SummonItem(11704,20); --enchanter   122   Salil's Writ Pg. 60 (Left)
		e.other:SummonItem(11882,20); --enchanter   122   Salil's Writ Pg. 60 (Right)
		e.other:SummonItem(11705,20); --enchanter   122   Salil's Writ Pg. 64 (Left) (Faded)
		e.other:SummonItem(11707,20); --enchanter   122   Salil's Writ Pg. 64 (Right)
		e.other:SummonItem(11708,20); --enchanter   122   Salil's Writ Pg. 90 (Left)
		e.other:SummonItem(11709,20); --enchanter   122   Salil's Writ Pg. 90 (Right) (Faded)
	elseif(e.message:findi("RS140 all") or e.other:GetClass() == "11" and (e.message:findi("RS140"))) then --Necro
		e.other:SummonItem(11852,20); --necro   140   Words of Descrying
		e.other:SummonItem(11855,20); --necro   140   Words of Projection
		e.other:SummonItem(11857,20); --necro   140   Words of Bidding
		e.other:SummonItem(11853,20); --necro   140   Words of Seizure
		e.other:SummonItem(16039,20); --necro   140   Words of Cazic-Thule
		e.other:SummonItem(11851,20); --necro   140   Words of the Suffering
		e.other:SummonItem(11854,20); --necro   140   Words of Disillusionment
		e.other:SummonItem(11856,20); --necro   140   Words of the Spectre
		e.other:SummonItem(11858,20); --necro   140   Words of Collection (Beza)
	elseif(e.message:findi("RS140 all") or e.other:GetClass() == "12" and (e.message:findi("RS140"))) then --Wiz
		e.other:SummonItem(11746,20); --wizard   140   Rune of Al'Kabor
		e.other:SummonItem(11754,20); --wizard   140   Rune of The Combine
		e.other:SummonItem(11772,20); --wizard   140   Rune of Paralysis
		e.other:SummonItem(11758,20); --wizard   140   Rune of The Helix
		e.other:SummonItem(11774,20); --wizard   140   Rune of Conception
		e.other:SummonItem(11770,20); --wizard   140   Rune of Petrification
		e.other:SummonItem(11775,20); --wizard   140   Rune of Infraction
		e.other:SummonItem(11773,20); --wizard   140   Rune of Embrace
		e.other:SummonItem(11771,20); --wizard   140   Rune of Tyranny
	elseif(e.message:findi("RS140 all") or e.other:GetClass() == "13" and (e.message:findi("RS140"))) then --Mage
	elseif(e.message:findi("RS140 all") or e.other:GetClass() == "14" and (e.message:findi("RS140"))) then --Chanter
	elseif(e.message:findi("RS142 all") or e.other:GetClass() == "11" and (e.message:findi("RS142"))) then --Necro
	elseif(e.message:findi("RS142 all") or e.other:GetClass() == "12" and (e.message:findi("RS142"))) then --Wiz
	elseif(e.message:findi("RS142 all") or e.other:GetClass() == "13" and (e.message:findi("RS142"))) then --Mage
		e.other:SummonItem(11804,20); --mage   142   Words of Incarceration
		e.other:SummonItem(15627,20); --mage   142   Lesser Conjuration: Air
		e.other:SummonItem(15624,20); --mage   142   Lesser Conjuration: Earth
		e.other:SummonItem(15625,20); --mage   142   Lesser Conjuration: Water
		e.other:SummonItem(11802,20); --mage   142   The Scent of Marr
		e.other:SummonItem(11805,20); --mage   142   Essence of Rathe
		e.other:SummonItem(11806,20); --mage   142   Tears of Prexus
	elseif(e.message:findi("RS142 all") or e.other:GetClass() == "14" and (e.message:findi("RS142"))) then --Chanter
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 174 (Left)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 288 (Left)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 282 (Left)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 153 (Left)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 174 (Right)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 288 (Right) (Faded)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 282 (Right) (Faded)
		e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 153 (Right)
	elseif(e.message:findi("RS162 all") or e.other:GetClass() == "11" and (e.message:findi("RS162"))) then --Necro
	elseif(e.message:findi("RS162 all") or e.other:GetClass() == "12" and (e.message:findi("RS162"))) then --Wiz
	elseif(e.message:findi("RS162 all") or e.other:GetClass() == "13" and (e.message:findi("RS162"))) then --Mage
	elseif(e.message:findi("RS162 all") or e.other:GetClass() == "14" and (e.message:findi("RS162"))) then --Chanter
		e.other:SummonItem(11724,20); --enchanter   162   Nilitim's Grimoire Pg. 115
		e.other:SummonItem(11726,20); --enchanter   162   Nilitim's Grimoire Pg. 300
		e.other:SummonItem(11722,20); --enchanter   162   Nilitim's Grimoire Pg. 35
		e.other:SummonItem(11728,20); --enchanter   162   Nilitim's Grimoire Pg. 351
		e.other:SummonItem(11725,20); --enchanter   162   Nilitim's Grimoire Pg. 116
		e.other:SummonItem(11727,20); --enchanter   162   Nilitim's Grimoire Pg. 301
		e.other:SummonItem(11723,20); --enchanter   162   Nilitim's Grimoire Pg. 36
		e.other:SummonItem(11729,20); --enchanter   162   Nilitim's Grimoire Pg. 352
	elseif(e.message:findi("RS166 all") or e.other:GetClass() == "11" and (e.message:findi("RS166"))) then --Necro
		e.other:SummonItem(11861,20); --necro   166   Words of the Psyche
		e.other:SummonItem(11863,20); --necro   166   Words of Obligation
		e.other:SummonItem(11862,20); --necro   166   Words of Burnishing
		e.other:SummonItem(11864,20); --necro   166   Words of Collection (Caza)
	elseif(e.message:findi("RS166 all") or e.other:GetClass() == "12" and (e.message:findi("RS166"))) then --Wiz
		e.other:SummonItem(11748,20); --wizard   166   Rune of Attraction			****NOTE there is a duplicate of this in DB 11777
		e.other:SummonItem(11778,20); --wizard   166   Rune of The Inverse
		e.other:SummonItem(11776,20); --wizard   166   Rune of Rathe
	elseif(e.message:findi("RS166 all") or e.other:GetClass() == "13" and (e.message:findi("RS166"))) then --Mage
	elseif(e.message:findi("RS166 all") or e.other:GetClass() == "14" and (e.message:findi("RS166"))) then --Chanter
	elseif(e.message:findi("RS182 all") or e.other:GetClass() == "11" and (e.message:findi("RS182"))) then --Necro
	elseif(e.message:findi("RS182 all") or e.other:GetClass() == "12" and (e.message:findi("RS182"))) then --Wiz
	elseif(e.message:findi("RS182 all") or e.other:GetClass() == "13" and (e.message:findi("RS182"))) then --Mage
		e.other:SummonItem(11807,20); --mage   182   Words of Bondage
		e.other:SummonItem(15631,20); --mage   182   Conjuration: Air
		e.other:SummonItem(15630,20); --mage   182   Conjuration: Fire
		e.other:SummonItem(15629,20); --mage   182   Conjuration: Water
		e.other:SummonItem(11809,20); --mage   182   Wing of Xegony
		e.other:SummonItem(11808,20); --mage   182   Breath of Ro
		e.other:SummonItem(11806,20); --mage   182   Tears of Prexus
	elseif(e.message:findi("RS182 all") or e.other:GetClass() == "14" and (e.message:findi("RS182"))) then --Chanter
	elseif(e.message:findi("RS184 all") or e.other:GetClass() == "11" and (e.message:findi("RS184"))) then --Necro
		e.other:SummonItem(11865,20); --necro   184   Words of Requisition
		e.other:SummonItem(11869,20); --necro   184   Words of the Ethereal
		e.other:SummonItem(11870,20); --necro   184   Words of Crippling Force
		e.other:SummonItem(11867,20); --necro   184   Words of Grappling
		e.other:SummonItem(11866,20); --necro   184   Words of Acquisition (Beza)
		e.other:SummonItem(11868,20); --necro   184   Words of Odus
	elseif(e.message:findi("RS184 all") or e.other:GetClass() == "12" and (e.message:findi("RS184"))) then --Wiz
		e.other:SummonItem(11779,20); --wizard   184   Rune of Ap'Sagor
		e.other:SummonItem(11781,20); --wizard   184   Rune of the Astral			****NOTE there is a duplicate of this in DB 11881
		e.other:SummonItem(11783,20); --wizard   184   Rune of Crippling
		e.other:SummonItem(11763,20); --wizard   184   Rune of Concussion
		e.other:SummonItem(11780,20); --wizard   184   Rune of Frost				****NOTE there is a duplicate of this in DB 11880
		e.other:SummonItem(11782,20); --wizard   184   Rune of Impetus
		e.other:SummonItem(11776,20); --wizard   184   Rune of Rathe
	elseif(e.message:findi("RS184 all") or e.other:GetClass() == "13" and (e.message:findi("RS184"))) then --Mage
	elseif(e.message:findi("RS184 all") or e.other:GetClass() == "14" and (e.message:findi("RS184"))) then --Chanter
	elseif(e.message:findi("RS no fail all") or e.other:GetClass() == "11" and (e.message:findi("RS no fail"))) then --Necro
	elseif(e.message:findi("RS no fail all") or e.other:GetClass() == "12" and (e.message:findi("RS no fail"))) then --Wiz
	elseif(e.message:findi("RS no fail all") or e.other:GetClass() == "13" and (e.message:findi("RS no fail"))) then --Mage
	elseif(e.message:findi("RS no fail all") or e.other:GetClass() == "14" and (e.message:findi("RS no fail"))) then --Chanter
		e.other:SummonItem(11736,20); --enchanter   ?   Nilitim's Grimoire Pg. 449
		e.other:SummonItem(11730,20); --enchanter   ?   Nilitim's Grimoire Pg. 378
		e.other:SummonItem(11732,20); --enchanter   ?   Nilitim's Grimoire Pg. 400
		e.other:SummonItem(11734,20); --enchanter   ?   Nilitim's Grimoire Pg. 415
		e.other:SummonItem(11737,20); --enchanter   ?   Nilitim's Grimoire Pg. 450
		e.other:SummonItem(11731,20); --enchanter   ?   Nilitim's Grimoire Pg. 379
		e.other:SummonItem(11733,20); --enchanter   ?   Nilitim's Grimoire Pg. 401
		e.other:SummonItem(11735,20); --enchanter   ?   Nilitim's Grimoire Pg. 416
		
	--ALCHEMY
	elseif(e.message:findi("Alchemy")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		--e.self:Say("What skill range max? [AL31] [AL52] [AL79] [AL106] [AL142] [AL178]");
		--e.self:Say(warningRoom);
	elseif(e.message:findi("AL31")) then --31 - Distillate of Skinspikes I
		e.other:SummonItem(16512,20); --Sticklewort
		e.other:SummonItem(14950,20); --Primitive Potion Vial
		e.other:SummonItem(14950,20); --Acaana Leaf
		e.other:SummonItem(14950,20); --Comfrey Leaf
		e.other:SummonItem(14950,20); --Flamewort Leaf
	elseif(e.message:findi("AL52")) then --52 - Distillate of Skinspikes II
		e.other:SummonItem(14950,20); --Vox's Dust
		e.other:SummonItem(14950,20); --Crude Potion Vial
		e.other:SummonItem(14950,20); --Acaana Leaf
		e.other:SummonItem(14950,20); --Comfrey Leaf
		e.other:SummonItem(14950,20); --Flamewort Leaf
	elseif(e.message:findi("AL79")) then --79 - Distillate of Skinspikes III
		e.other:SummonItem(14950,20); --Violet Tri-Tube Sap
		e.other:SummonItem(14950,20); --Rough Potion Vial
		e.other:SummonItem(14950,20); --Acaana Leaf
		e.other:SummonItem(14950,20); --Comfrey Leaf
		e.other:SummonItem(14950,20); --Flamewort Leaf
	elseif(e.message:findi("AL106")) then --106 - Distillate of Skinspikes IV
		e.other:SummonItem(14950,20); --Blue Vervain Bulb
		e.other:SummonItem(14950,20); --Makeshift Potion Vial
		e.other:SummonItem(14950,20); --Sprig of Acaana
		e.other:SummonItem(14950,20); --Sprig of Comfrey
		e.other:SummonItem(14950,20); --Sprig of Flamewort
	elseif(e.message:findi("AL142")) then --142 - Distillate of Skinspikes V
		e.other:SummonItem(14950,20); --Betherium Bark
		e.other:SummonItem(14950,20); --Simple Potion Vial
		e.other:SummonItem(14950,20); --Sprig of Acaana
		e.other:SummonItem(14950,20); --Sprig of Comfrey
		e.other:SummonItem(14950,20); --Sprig of Flamewort
		
	--BAKING
	elseif(e.message:findi("Baking")) then
		e.self:Say("What skill range max? [BK17] [BK75] [BK83] [BK135] [BK143] [BK152] [BK226]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("BK17")) then --17 - Clump of Dough
		e.other:SummonItem(14950,20); --basilisk Eggs
		e.other:SummonItem(13089,20); --Cup of Flour								****NOTE there is a duplicate of this in DB 13193
		e.other:SummonItem(13087,20); --Bottle of Milk
	elseif(e.message:findi("BK75")) then --75 - Creamy Fennel Sauce
		e.other:SummonItem(9726,20); --Cream
		e.other:SummonItem(13089,20); --Cup of Flour								****NOTE there is a duplicate of this in DB 13193
		e.other:SummonItem(14234,20); --Fennel
	elseif(e.message:findi("BK83")) then --83 - Cream
		e.other:SummonItem(14221,20); --Benzoin
		e.other:SummonItem(13087,20); --Bottle of Milk
	elseif(e.message:findi("BK135")) then --135 - Fish Rolls
		e.other:SummonItem(13062,20); --Bat Wing
		e.other:SummonItem(13019,20); --Fresh Fish
	elseif(e.message:findi("BK143")) then --143 - Filleted Bear
		e.other:SummonItem(13404,20); --Bear Meat
	elseif(e.message:findi("BK152")) then --152 - Bear Filet in Cream
		e.other:SummonItem(9744,20); --Filleted Bear
		e.other:SummonItem(9743,20); --Creamy Fennel Sauce
	elseif(e.message:findi("BK226")) then --226 - Halas 10 pound meat pie
		e.other:SummonItem(9748,20); --Bear Fillet in Cream
		e.other:SummonItem(13090,20); --Clump of Dough
		e.other:SummonItem(9749,20); --Lion Fillet in Cream
		e.other:SummonItem(9751,20); --Mammoth Fillet in Cream
		e.other:SummonItem(9750,20); --Wolf Fillet in Cream
		e.other:SummonItem(14215,20); --Sage Leaf
		
	--BREWING
	elseif(e.message:findi("Brewing")) then
		e.self:Say("What skill range max? [BR31] [BR62] [BR95] [BR122] [BR151] [BR162] [BR226] [BR248]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("BR31")) then --31 - Short Beer
		e.other:SummonItem(16590,20); --Barley
		e.other:SummonItem(16580,20); --Cask
		e.other:SummonItem(16591,20); --Hops
		e.other:SummonItem(16595,20); --Malt
	elseif(e.message:findi("BR62")) then --62 - Fish Wine
		e.other:SummonItem(16598,20); --Bottle
		e.other:SummonItem(13019,20); --Fresh Fish
		e.other:SummonItem(16592,20); --Grapes
		e.other:SummonItem(13006,20); --Water Flask
	elseif(e.message:findi("BR95")) then --95 - Red Wine
		e.other:SummonItem(13045,20); --Berries
		e.other:SummonItem(16598,20); --Bottle
		e.other:SummonItem(16592,20); --Grapes
		e.other:SummonItem(16597,20); --Wine Yeast
	elseif(e.message:findi("BR122")) then --122 - Fetid Essence
		e.other:SummonItem(13106,20); --Fishing Grubs
		e.other:SummonItem(13006,20); --Water Flask
	elseif(e.message:findi("BR151")) then --151 - Skull Ale
		e.other:SummonItem(12308); --Cyclops Skull
		e.other:SummonItem(13032,20); --Short Beer
		e.other:SummonItem(13425,20); --Spices
		e.other:SummonItem(13428,20); --Vinegar
	elseif(e.message:findi("BR162")) then --162 - Jumjum Spiced Beer
		e.other:SummonItem(16590,20); --Barley
		e.other:SummonItem(16598,20); --Bottle
		e.other:SummonItem(16591,20); --Hops
		e.other:SummonItem(13425,20); --Spices
		e.other:SummonItem(13006,20); --Water Flask
		e.other:SummonItem(13973,20); --Jumjum Stalk								****NOTE there is a duplicate of this in DB 13974,13975
	elseif(e.message:findi("BR226")) then --226 - Qeynos Afternoon Tea
		e.other:SummonItem(9759,20); --Bayle's Delight
		e.other:SummonItem(9650,20); --Celestial Essence
		e.other:SummonItem(9726,20); --Cream
		e.other:SummonItem(14239,20); --Eucalyptus Leaf
		e.other:SummonItem(14915,20); --Tea Leaves
		e.other:SummonItem(13006,20); --Water Flask
	elseif(e.message:findi("BR248")) then --248 - Minotaur Hero's Brew
		e.other:SummonItem(16580,20); --Cask
		e.other:SummonItem(16595,20); --Malt
		e.other:SummonItem(13032,20); --Short Beer
		e.other:SummonItem(13006,20); --Water Flask
		e.other:SummonItem(16596,20); --Yeast 
		
	--FISHING
	elseif(e.message:findi("Fishing")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--FLETCHING
	elseif(e.message:findi("Fletching")) then
		e.self:Say("What skill range max? [FL46] [FL56] [FL68] [FL102] [FL135] [FL182] [FL202]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("FL46")) then --46 - CLASS 2 Wood Point Arrow (large nock)
		e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
		e.other:SummonItem(8055,20); --Field Point Arrowhead
		e.other:SummonItem(8050,20); --Large Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL56")) then --56 - CLASS 2 Wood Point Arrow (small nock)
		e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
		e.other:SummonItem(8055,20); --Field Point Arrowhead
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL68")) then --68 - CLASS 2 Bone Point Arrow (small nock)
		e.other:SummonItem(8061,20); --Bundled Bone Arrow Shafts
		e.other:SummonItem(8055,20); --Field Point Arrowhead
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL102")) then --102 - CLASS 2 Bone Hooked Arrow (small nock)
		e.other:SummonItem(8061,20); --Bundled Bone Arrow Shafts
		e.other:SummonItem(8056,20); --Hooked Arrowhead
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL135")) then --135 - CLASS 2 Ceramic Hooked Arrow (small nock)
		e.other:SummonItem(8062,20); --Bundled Ceramic Arrow Shafts
		e.other:SummonItem(8056,20); --Hooked Arrowhead
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL182")) then --182 - CLASS 2 Wood Silver Tip Arrow (small nock)
		e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
		e.other:SummonItem(8057,20); --Silver Tipped Arrowheads
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
	elseif(e.message:findi("FL202")) then --202 - CLASS 2 Steel Silver Tip Arrow (small nock)
		e.other:SummonItem(8063,20); --Bundled Steel Arrow Shafts
		e.other:SummonItem(8057,20); --Silver Tipped Arrowheads
		e.other:SummonItem(8052,20); --Small Groove Nocks
		e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		
	--JEWELCRAFT
	elseif(e.message:findi("Jewelcraft")) then
		e.self:Say("What skill range max? [JC17] [JC30] [JC40] [JC50] [JC60] [JC74] [JC92] [JC106] [JC119] [JC132] [JC146] [JC164] [JC178] [JC191] [JC204] [JC218] [JC236] [JC250]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("JC17")) then --
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(10015,20); --Malachite
	elseif(e.message:findi("JC30")) then --
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(10020,20); --Jasper
	elseif(e.message:findi("JC40")) then --
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(10023,20); --Jade
	elseif(e.message:findi("JC50")) then --
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(10030,20); --Opal
	elseif(e.message:findi("JC60")) then --
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(10034,20); --Sapphire
	elseif(e.message:findi("JC74")) then --
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(10015,20); --Malachite
	elseif(e.message:findi("JC92")) then --
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(10020,20); --Jasper
	elseif(e.message:findi("JC106")) then --
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(10023,20); --Jade
	elseif(e.message:findi("JC119")) then --
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(10030,20); --Opal
	elseif(e.message:findi("JC132")) then --
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(10034,20); --Sapphire
	elseif(e.message:findi("JC146")) then --
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(10015,20); --Malachite
	elseif(e.message:findi("JC164")) then --
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(10020,20); --Jasper
	elseif(e.message:findi("JC178")) then --
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(10023,20); --Jade
	elseif(e.message:findi("JC191")) then --
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(10030,20); --Opal
	elseif(e.message:findi("JC204")) then --
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(10034,20); --Sapphire
	elseif(e.message:findi("JC218")) then --
		e.other:SummonItem(16503,20); --platinum bar 218 to 279
		e.other:SummonItem(10015,20); --Malachite
	elseif(e.message:findi("JC236")) then --
		e.other:SummonItem(16503,20); --platinum bar 218 to 279
		e.other:SummonItem(10020,20); --Jasper
	elseif(e.message:findi("JC250")) then --
		e.other:SummonItem(16503,20); --platinum bar 218 to 279
		e.other:SummonItem(10023,20); --Jade
		
	--POISON
	elseif(e.message:findi("Poison")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--POTTERY
	elseif(e.message:findi("Pottery")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--SMITHING
	elseif(e.message:findi("Smithing")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--TAILORING
	elseif(e.message:findi("Tailoring")) then
		e.self:Say("What skill range max? [TR15] [TR26] [TR31] [TR36] [TR56] [TR82] [TR88] [TR108] [TR135] [TR151] [TR158] [TR229] [TR295]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("TR15")) then --15 - silk swatches
		e.other:SummonItem(13041,20); --spider silk
	elseif(e.message:findi("TR26")) then --26 - Tattered mask
		e.other:SummonItem(13782,20); --Ruined wolf pelt
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR31")) then --31 - Leather padding
		e.other:SummonItem(16486,20); --silk thread
		e.other:SummonItem(13753,20); --low quality wolf skin
	elseif(e.message:findi("TR36")) then --36 - Raw silk mask
		e.other:SummonItem(16482,20); --silk swatch
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR56")) then --56 - Studded mask
		e.other:SummonItem(13754,20); --medium quality wolf skin
		e.other:SummonItem(12072,20); --studs
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR82")) then --82 - Cured silk mask
		e.other:SummonItem(16482,20); --silk swatch
		e.other:SummonItem(16480,20); --heady kiola
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR88")) then --88 - Tailored backpack
		e.other:SummonItem(13800,20); --high quality bear skin
		e.other:SummonItem(12089,20); --backpack pattern
	elseif(e.message:findi("TR108")) then --108 - Reinforced mask
		e.other:SummonItem(13754,20); --medium quality wolf skin
		e.other:SummonItem(12073,20); --steel boning
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR135")) then --135 - Wu's fighting mask
		e.other:SummonItem(16482,20); --silk swatch
		e.other:SummonItem(16480,20); --heady kiola
		e.other:SummonItem(10250,20); --vial of viscous mana
		e.other:SummonItem(13802,20); --mask pattern
	elseif(e.message:findi("TR151")) then --151 - Wu's fighting sleeves
		e.other:SummonItem(16482,20); --silk swatch
		e.other:SummonItem(16480,20); --heady kiola
		e.other:SummonItem(10250,20); --vial of viscous mana
		e.other:SummonItem(13808,20); --sleeve pattern
	elseif(e.message:findi("TR158")) then --158 - Wu's fighting shirt
		e.other:SummonItem(16482,20); --silk swatch
		e.other:SummonItem(16480,20); --heady kiola
		e.other:SummonItem(10250,20); --vial of viscous mana
		e.other:SummonItem(13804,20); --tunic pattern
	elseif(e.message:findi("TR229")) then --229 - Tae Ew Leather Gloves
		e.other:SummonItem(27761,2); --hardened lizard hide
		e.other:SummonItem(13810,2); --glove pattern
	elseif(e.message:findi("TR295")) then --295 - Tae Ew Leather Pants
		e.other:SummonItem(27761,2); --hardened lizard hide
		e.other:SummonItem(13811,2); --pant pattern
		
	--TINKERING
	elseif(e.message:findi("Tinkering")) then
		e.self:Say("What skill range max? [TK68] [TK95] [TK102] [TK122] [TK148] [TK175]");
		e.self:Say(warningRoom);
	elseif(e.message:findi("TK68")) then --68 - Flameless Lantern
		e.other:SummonItem(13004,20); --Large Lantern
		e.other:SummonItem(16857,20); --Metal Twine
		e.other:SummonItem(16881,20); --Firewater
	elseif(e.message:findi("TK95")) then --95 - Spyglass
		e.other:SummonItem(16863,20); --Collapsible Fishing Pole
		e.other:SummonItem(16598,20); --Bottle
		e.other:SummonItem(16857,20); --Metal Twine
		e.other:SummonItem(16850,20); --Metal Rod
		e.other:SummonItem(16860,20); --Reflective Shard
	elseif(e.message:findi("TK102")) then --102 - Stalking Probes
		e.other:SummonItem(16858,20); --Gears
		e.other:SummonItem(16598,20); --Bottle
		e.other:SummonItem(16850,20); --Metal Rod
		e.other:SummonItem(16881,20); --Firewater
	elseif(e.message:findi("TK122")) then --122 - Power Gloves
		e.other:SummonItem(16858,20); --Gears
		e.other:SummonItem(16881,20); --Firewater
		e.other:SummonItem(16857,20); --Metal Twine
		e.other:SummonItem(16859,20); --Sprockets
		e.other:SummonItem(16854,20); --Steel Lined Gloves
	elseif(e.message:findi("TK148")) then --148 - Aqualung
		e.other:SummonItem(16890,20); --Fine Coral Mesh
		e.other:SummonItem(16862,20); --Silk Lined Steel Helm
		e.other:SummonItem(16857,20); --Metal Twine
		e.other:SummonItem(16850,20); --Metal Rod
		e.other:SummonItem(16861,20); --Gnomish Bolts
		e.other:SummonItem(13019,20); --Fresh Fish
	elseif(e.message:findi("TK175")) then --175 - Rebreathers
		e.other:SummonItem(16873,20); --Aqualung
		e.other:SummonItem(16892,20); --Lime Coated Meshing
		e.other:SummonItem(16891,20); --Sharkskin Tubing
		e.other:SummonItem(4001,20); --Platemail Helm
		e.other:SummonItem(16881,20); --Firewater
		e.other:SummonItem(16888,20); --Metal Fastening

	--PLAT
	elseif(e.message:findi("plat")) then
		e.other:GiveCash(100,100,100,100);
		local qglobals = eq.get_qglobals(e.self,e.other);
		--eq.delete_global("platz");
		local pcount = 1;
		local pcountAdd;
		if(qglobals["platz"] == nil) then
			eq.set_global("platz","1",9,"F");
		end		
		pcount = tonumber(qglobals["platz"]);
		pcountAdd = pcount + 1;
		e.self:Say("have fun");
		eq.set_global("platz",tostring(pcountAdd),9,"F");
		
	--BUFFS
	elseif(e.message:findi("hpbuff")) then
		e.self:CastSpell(3692,e.other:GetID(),0,1);
	elseif(e.message:findi("manabuff")) then
		e.self:CastSpell(697,e.other:GetID(),0,1);
		
	--TLs
	elseif(e.message:findi("home")) then
		e.self:CastSpell(1422,e.other:GetID(),0,1);
	end
end
