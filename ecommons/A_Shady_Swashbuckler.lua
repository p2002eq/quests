function event_say(e)
	local skillRange;
	if(e.message:findi("hail")) then
		e.self:Say("Hello my friend, you need some [plat] an [hpbuff] / [manabuff] or have you come to the ease your pain of doing [tradeskills]?");
		e.self:Say("Need a ride [home] to bind point?");
	elseif(e.message:findi("tradeskills")) then
		e.self:Emote(" says under his breath 'Alrighty then if you insist.....'");
		e.self:Say("Tell me which tradeskill type you need materials for from these choices. [Research] [Alchemy] [Baking] [Brewing] [Fishing] [Fletching] [Jewelcraft] [Poison] [Pottery] [Smithing] [Tailoring] [Tinkering]");

	--RESEARCH
	elseif(e.message:findi("Research")) then
		e.self:Say("What skill range max? [22] [26] [41] [42] [46] [62] [71] [82] [83] [87] [96] [102] [116] [120] [122] [140] [142] [162] [166] [182] [184] [no fail]");
		e.self:Say("If you want to research other classes than your own add [all] after range max.");
		e.self:Say("Each skill range is for only the prior skill range to the one you specify. So [26] would be only for skills 23 to 26.");
		e.self:Say("Example Usage1: 41 (will give only mats for 27 to 41 skillups for your class)");
		e.self:Say("Example Usage2: 41 all (will give only mats for 27 to 41 skillups for all research classes)");
		e.self:Say("WARNING: You need to make sure you have plenty of inventory space before using this feature.");
	elseif(e.message:findi("22")) then
		if(e.other:GetClass() == "11" or (e.message:findi("22") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(16024,20); --necro   21   Words of Derivation
			e.other:SummonItem(11810,20); --necro   21   Words of Eradication
		elseif(e.other:GetClass() == "12" or (e.message:findi("22") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("22") and e.message:findi("all"))) then --Mage
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
		elseif(e.other:GetClass() == "14" or (e.message:findi("22") and e.message:findi("all"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
			e.other:SummonItem(16068,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Left)
			--e.other:SummonItem(); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Left)			****NOTE Missing from database
			e.other:SummonItem(16072,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Left)
			e.other:SummonItem(16069,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Right)
			--e.other:SummonItem(); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Right)		****NOTE Missing from database
			e.other:SummonItem(16073,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Right)
		end
	elseif(e.message:findi("26")) then
		if(e.other:GetClass() == "11" or (e.message:findi("26") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11817,20); --necro   26   Words of Reviviscence
			e.other:SummonItem(11815,20); --necro   26   Words of Possession
			e.other:SummonItem(11813,20); --necro   26   Words of Materials
			e.other:SummonItem(11811,20); --necro   26   Words of Imitation
			e.other:SummonItem(11818,20); --necro   26   Words of the Sentient (Azia)
			e.other:SummonItem(11816,20); --necro   26   Words of the Spoken
			e.other:SummonItem(11814,20); --necro   26   Words of Spirit
			--e.other:SummonItem(); --necro   26   Words of Resolution									****NOTE Missing from database
		elseif(e.other:GetClass() == "12" or (e.message:findi("26") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11738,20); --wizard   26   Rune of Falhalem
			e.other:SummonItem(16054,20); --wizard   26   Rune of Nagafen
			e.other:SummonItem(11741,20); --wizard   26   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
			e.other:SummonItem(11739,20); --wizard   26   Rune of Substance
			e.other:SummonItem(11742,20); --wizard   26   Rune of Proximity			****NOTE there is a duplicate of this in DB 16050
			e.other:SummonItem(11740,20); --wizard   26   Rune of Periphery
		elseif(e.other:GetClass() == "13" or (e.message:findi("26") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("26") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("41")) then
		if(e.other:GetClass() == "11" or (e.message:findi("41") and e.message:findi("all"))) then --Necro
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
		elseif(e.other:GetClass() == "12" or (e.message:findi("41") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("41") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("41") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("42")) then
		if(e.other:GetClass() == "11" or (e.message:findi("42") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("42") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("42") and e.message:findi("all"))) then --Mage
			e.other:SummonItem(11788,20); --mage   22   Words of Dominion			****NOTE there is a duplicate of this in DB 11828
			e.other:SummonItem(15396,20); --mage   42   Minor Summoning: Air		****NOTE there is a duplicate of this in DB 16128
			e.other:SummonItem(15335,20); --mage   42   Minor Summoning: Earth		****NOTE there is a duplicate of this in DB 16125
			e.other:SummonItem(15395,20); --mage   42   Minor Summoning: Fire		****NOTE there is a duplicate of this in DB 16127
			e.other:SummonItem(15336,20); --mage   42   Minor Summoning: Water		****NOTE there is a duplicate of this in DB 16126
			e.other:SummonItem(11791,20); --mage   42   Pearl Shard
			e.other:SummonItem(10025,20); --mage   42   Topaz
			e.other:SummonItem(11790,20); --mage   42   Jade Shard
			e.other:SummonItem(11789,20); --mage   42   Ice of Velious
		elseif(e.other:GetClass() == "14" or (e.message:findi("42") and e.message:findi("all"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
			e.other:SummonItem(16074,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Left)	****NOTE One of the left/right missing from DB
			--e.other:SummonItem(); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Right)		****NOTE One of the left/right missing from DB
			e.other:SummonItem(16078,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Right)	****NOTE One of the left/right missing from DB
			--e.other:SummonItem(); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Left)		****NOTE One of the left/right missing from DB
			e.other:SummonItem(16076,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Left)
			e.other:SummonItem(16077,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Right)
		end
	elseif(e.message:findi("46")) then
		if(e.other:GetClass() == "11" or (e.message:findi("46") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("46") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11746,20); --wizard   46   Rune of Al'Kabor
			e.other:SummonItem(11743,20); --wizard   46   Rune of Neglect
			e.other:SummonItem(11745,20); --wizard   46   Rune of Velious
			e.other:SummonItem(11744,20); --wizard   46   Rune of Oppression
		elseif(e.other:GetClass() == "13" or (e.message:findi("46") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("46") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("62")) then
		if(e.other:GetClass() == "11" or (e.message:findi("62") and e.message:findi("all"))) then --Necro
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
		elseif(e.other:GetClass() == "12" or (e.message:findi("62") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("62") and e.message:findi("all"))) then --Mage
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
		elseif(e.other:GetClass() == "14" or (e.message:findi("62") and e.message:findi("all"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
			e.other:SummonItem(16081,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Left)	****NOTE One of the left/right missing from DB
			--e.other:SummonItem(); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Right)		****NOTE One of the left/right missing from DB
			e.other:SummonItem(16082,20); --enchanter   62   Velishoul's Tome Pg. 8
			--e.other:SummonItem(); --enchanter   62   Velishoul's Tome Pg. 16 (Faded)					****NOTE Missing from database
			e.other:SummonItem(16083,20); --enchanter   62   Velishoul's Tome Pg. 9
			e.other:SummonItem(16086,20); --enchanter   62   Velishoul's Tome Pg. 17
		end
	elseif(e.message:findi("71")) then
		if(e.other:GetClass() == "11" or (e.message:findi("71") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("71") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11747,20); --wizard   71   Rune of Expulsion
			e.other:SummonItem(11751,20); --wizard   71   Rune of Trauma
			e.other:SummonItem(11750,20); --wizard   71   Rune of Disassociation
			e.other:SummonItem(11753,20); --wizard   71   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
			e.other:SummonItem(11748,20); --wizard   71   Rune of Attraction		****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11752,20); --wizard   71   Rune of Xegony
			e.other:SummonItem(11749,20); --wizard   71   Rune of Presence
		elseif(e.other:GetClass() == "13" or (e.message:findi("71") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("71") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("82")) then
		if(e.other:GetClass() == "11" or (e.message:findi("82") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("82") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("82") and e.message:findi("all"))) then --Mage
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
		elseif(e.other:GetClass() == "14" or (e.message:findi("82") and e.message:findi("all"))) then --Chanter
			e.other:SummonItem(16087,20); --enchanter   82   Velishoul's Tome Pg. 43
			e.other:SummonItem(16089,20); --enchanter   82   Velishoul's Tome Pg. 67
			e.other:SummonItem(16092,20); --enchanter   82   Velishoul's Tome Pg. 75
			e.other:SummonItem(11700,20); --enchanter   82   Velishoul's Tome Pg. 108 (Faded) 			****NOTE This doesn't show as faded in DB?
			e.other:SummonItem(16088,20); --enchanter   82   Velishoul's Tome Pg. 44
			e.other:SummonItem(16091,20); --enchanter   82   Velishoul's Tome Pg. 68
			--e.other:SummonItem(); --enchanter   82   Velishoul's Tome Pg. 76							****NOTE Missing from database
			e.other:SummonItem(11702,20); --enchanter   82   Velishoul's Tome Pg. 109
		end
	elseif(e.message:findi("83")) then
		if(e.other:GetClass() == "11" or (e.message:findi("83") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11838,20); --necro   83   Words of Purification
			e.other:SummonItem(11815,20); --necro   83   Words of Possession
			e.other:SummonItem(11839,20); --necro   83   Words of the Incorporeal
			e.other:SummonItem(11841,20); --necro   83   Words of Dissemination
			e.other:SummonItem(11840,20); --necro   83   Words of Acquisition (Azia)
			e.other:SummonItem(11842,20); --necro   83   Words of Parasitism
		elseif(e.other:GetClass() == "12" or (e.message:findi("83") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("83") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("83") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("87")) then
		if(e.other:GetClass() == "11" or (e.message:findi("87") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11815,20); --necro   83   Words of Possession
			e.other:SummonItem(11836,20); --necro   87   Words of Haunting
			e.other:SummonItem(11837,20); --necro   87   Words of Rupturing
		elseif(e.other:GetClass() == "12" or (e.message:findi("87") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("87") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("87") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("96")) then
		if(e.other:GetClass() == "11" or (e.message:findi("96") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("96") and e.message:findi("all"))) then --Wiz
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
		elseif(e.other:GetClass() == "13" or (e.message:findi("96") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("96") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("102")) then
		if(e.other:GetClass() == "11" or (e.message:findi("102") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("102") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("102") and e.message:findi("all"))) then --Mage
			e.other:SummonItem(11798,20); --mage   102   Words of Detention
			e.other:SummonItem(11799,20); --mage   102   Words of Duress
			e.other:SummonItem(15048,20); --mage   102   Cancel Magic				****NOTE there is duplicates of this in DB 16118, 16207, 16313, 16415
			e.other:SummonItem(15576,20); --mage   102   Greater Summoning: Air
			e.other:SummonItem(15575,20); --mage   102   Greater Summoning: Fire
			e.other:SummonItem(11800,20); --mage   102   Blood of Velious
			e.other:SummonItem(11802,20); --mage   102   The Scent of Marr
			e.other:SummonItem(11801,20); --mage   102   Breath of Solusek
		elseif(e.other:GetClass() == "14" or (e.message:findi("102") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("116")) then
		if(e.other:GetClass() == "11" or (e.message:findi("116") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11850,20); --necro   116   Words of Dark Paths
			e.other:SummonItem(11836,20); --necro   116   Words of Haunting
			e.other:SummonItem(11851,20); --necro   116   Words of the Suffering
		elseif(e.other:GetClass() == "12" or (e.message:findi("116") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("116") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("116") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("120")) then
		if(e.other:GetClass() == "11" or (e.message:findi("120") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11845,20); --necro   120   Words of Duration
			e.other:SummonItem(11846,20); --necro   120   Words of Motion
			e.other:SummonItem(11844,20); --necro   120   Words of Quivering
			e.other:SummonItem(11847,20); --necro   120   Words of Neglect
			e.other:SummonItem(11843,20); --necro   120   Words of Resolve
			e.other:SummonItem(11848,20); --necro   120   Words of Endurance
		elseif(e.other:GetClass() == "12" or (e.message:findi("120") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11764,20); --wizard   120   Rune of Banding
			e.other:SummonItem(11774,20); --wizard   120   Rune of Conception
			e.other:SummonItem(11763,20); --wizard   120   Rune of Concussion
			e.other:SummonItem(11765,20); --wizard   120   Rune of the Catalyst
			e.other:SummonItem(11769,20); --wizard   120   Rune of Contortion
			e.other:SummonItem(11767,20); --wizard   120   Rune of The Cyclone
			e.other:SummonItem(11768,20); --wizard   120   Rune of Howling
			e.other:SummonItem(11766,20); --wizard   120   Rune of Solusek Ro
		elseif(e.other:GetClass() == "13" or (e.message:findi("120") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("120") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("122")) then
		if(e.other:GetClass() == "11" or (e.message:findi("122") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(16037,20); --necro   122   Words of Abatement
			e.other:SummonItem(16039,20); --necro   122   Words of Cazic-Thule
			e.other:SummonItem(11849,20); --necro   122   Words of Efficacy
		elseif(e.other:GetClass() == "12" or (e.message:findi("122") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("122") and e.message:findi("all"))) then --Mage
			e.other:SummonItem(11803,20); --mage   122   Words of Collection (Azia)
			e.other:SummonItem(11872,20); --mage   122   Words of Convocation
			e.other:SummonItem(7001,20); --mage   122   Dagger
			e.other:SummonItem(10021,20); --mage   122   Star Rose Quartz
			e.other:SummonItem(15620,20); --mage   122   Minor Conjuration: Earth
			e.other:SummonItem(15621,20); --mage   122   Minor Conjuration: Water
			e.other:SummonItem(11796,20); --mage   122   Glove of Rallos Zek
			e.other:SummonItem(11797,20); --mage   122   Flame of Vox
		elseif(e.other:GetClass() == "14" or (e.message:findi("122") and e.message:findi("all"))) then --Chanter
		--Not sure which is left and right, but for the way I handle this it doesn't really matter
			e.other:SummonItem(11704,20); --enchanter   122   Salil's Writ Pg. 60 (Left)
			e.other:SummonItem(11882,20); --enchanter   122   Salil's Writ Pg. 60 (Right)
			e.other:SummonItem(11705,20); --enchanter   122   Salil's Writ Pg. 64 (Left) (Faded)
			e.other:SummonItem(11707,20); --enchanter   122   Salil's Writ Pg. 64 (Right)
			e.other:SummonItem(11708,20); --enchanter   122   Salil's Writ Pg. 90 (Left)
			e.other:SummonItem(11709,20); --enchanter   122   Salil's Writ Pg. 90 (Right) (Faded)
		end
	elseif(e.message:findi("140")) then
		if(e.other:GetClass() == "11" or (e.message:findi("140") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11852,20); --necro   140   Words of Descrying
			e.other:SummonItem(11855,20); --necro   140   Words of Projection
			e.other:SummonItem(11857,20); --necro   140   Words of Bidding
			e.other:SummonItem(11853,20); --necro   140   Words of Seizure
			e.other:SummonItem(16039,20); --necro   140   Words of Cazic-Thule
			e.other:SummonItem(11851,20); --necro   140   Words of the Suffering
			e.other:SummonItem(11854,20); --necro   140   Words of Disillusionment
			e.other:SummonItem(11856,20); --necro   140   Words of the Spectre
			e.other:SummonItem(11858,20); --necro   140   Words of Collection (Beza)
		elseif(e.other:GetClass() == "12" or (e.message:findi("140") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11746,20); --wizard   140   Rune of Al'Kabor
			e.other:SummonItem(11754,20); --wizard   140   Rune of The Combine
			e.other:SummonItem(11772,20); --wizard   140   Rune of Paralysis
			e.other:SummonItem(11758,20); --wizard   140   Rune of The Helix
			e.other:SummonItem(11774,20); --wizard   140   Rune of Conception
			e.other:SummonItem(11770,20); --wizard   140   Rune of Petrification
			e.other:SummonItem(11775,20); --wizard   140   Rune of Infraction
			e.other:SummonItem(11773,20); --wizard   140   Rune of Embrace
			e.other:SummonItem(11771,20); --wizard   140   Rune of Tyranny
		elseif(e.other:GetClass() == "13" or (e.message:findi("140") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("140") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("142")) then
		if(e.other:GetClass() == "11" or (e.message:findi("142") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("142") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("142") and e.message:findi("all"))) then --Mage
			e.other:SummonItem(11804,20); --mage   142   Words of Incarceration
			e.other:SummonItem(15627,20); --mage   142   Lesser Conjuration: Air
			e.other:SummonItem(15624,20); --mage   142   Lesser Conjuration: Earth
			e.other:SummonItem(15625,20); --mage   142   Lesser Conjuration: Water
			e.other:SummonItem(11802,20); --mage   142   The Scent of Marr
			e.other:SummonItem(11805,20); --mage   142   Essence of Rathe
			e.other:SummonItem(11806,20); --mage   142   Tears of Prexus
		elseif(e.other:GetClass() == "14" or (e.message:findi("142") and e.message:findi("all"))) then --Chanter
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 174 (Left)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 288 (Left)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 282 (Left)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 153 (Left)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 174 (Right)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 288 (Right) (Faded)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 282 (Right) (Faded)
			e.other:SummonItem(); --enchanter   142   Salil's Writ Pg. 153 (Right)
		end
	elseif(e.message:findi("162")) then
		if(e.other:GetClass() == "11" or (e.message:findi("162") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("162") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("162") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("162") and e.message:findi("all"))) then --Chanter
			e.other:SummonItem(11724,20); --enchanter   162   Nilitim's Grimoire Pg. 115
			e.other:SummonItem(11726,20); --enchanter   162   Nilitim's Grimoire Pg. 300
			e.other:SummonItem(11722,20); --enchanter   162   Nilitim's Grimoire Pg. 35
			e.other:SummonItem(11728,20); --enchanter   162   Nilitim's Grimoire Pg. 351
			e.other:SummonItem(11725,20); --enchanter   162   Nilitim's Grimoire Pg. 116
			e.other:SummonItem(11727,20); --enchanter   162   Nilitim's Grimoire Pg. 301
			e.other:SummonItem(11723,20); --enchanter   162   Nilitim's Grimoire Pg. 36
			e.other:SummonItem(11729,20); --enchanter   162   Nilitim's Grimoire Pg. 352
		end
	elseif(e.message:findi("166")) then
		if(e.other:GetClass() == "11" or (e.message:findi("166") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11861,20); --necro   166   Words of the Psyche
			e.other:SummonItem(11863,20); --necro   166   Words of Obligation
			e.other:SummonItem(11862,20); --necro   166   Words of Burnishing
			e.other:SummonItem(11864,20); --necro   166   Words of Collection (Caza)
		elseif(e.other:GetClass() == "12" or (e.message:findi("166") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11748,20); --wizard   166   Rune of Attraction			****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11778,20); --wizard   166   Rune of The Inverse
			e.other:SummonItem(11776,20); --wizard   166   Rune of Rathe
		elseif(e.other:GetClass() == "13" or (e.message:findi("166") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("166") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("182")) then
		if(e.other:GetClass() == "11" or (e.message:findi("182") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("182") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("182") and e.message:findi("all"))) then --Mage
			e.other:SummonItem(11807,20); --mage   182   Words of Bondage
			e.other:SummonItem(15631,20); --mage   182   Conjuration: Air
			e.other:SummonItem(15630,20); --mage   182   Conjuration: Fire
			e.other:SummonItem(15629,20); --mage   182   Conjuration: Water
			e.other:SummonItem(11809,20); --mage   182   Wing of Xegony
			e.other:SummonItem(11808,20); --mage   182   Breath of Ro
			e.other:SummonItem(11806,20); --mage   182   Tears of Prexus
		elseif(e.other:GetClass() == "14" or (e.message:findi("182") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("184")) then
		if(e.other:GetClass() == "11" or (e.message:findi("184") and e.message:findi("all"))) then --Necro
			e.other:SummonItem(11865,20); --necro   184   Words of Requisition
			e.other:SummonItem(11869,20); --necro   184   Words of the Ethereal
			e.other:SummonItem(11870,20); --necro   184   Words of Crippling Force
			e.other:SummonItem(11867,20); --necro   184   Words of Grappling
			e.other:SummonItem(11866,20); --necro   184   Words of Acquisition (Beza)
			e.other:SummonItem(11868,20); --necro   184   Words of Odus
		elseif(e.other:GetClass() == "12" or (e.message:findi("184") and e.message:findi("all"))) then --Wiz
			e.other:SummonItem(11779,20); --wizard   184   Rune of Ap'Sagor
			e.other:SummonItem(11781,20); --wizard   184   Rune of the Astral			****NOTE there is a duplicate of this in DB 11881
			e.other:SummonItem(11783,20); --wizard   184   Rune of Crippling
			e.other:SummonItem(11763,20); --wizard   184   Rune of Concussion
			e.other:SummonItem(11780,20); --wizard   184   Rune of Frost				****NOTE there is a duplicate of this in DB 11880
			e.other:SummonItem(11782,20); --wizard   184   Rune of Impetus
			e.other:SummonItem(11776,20); --wizard   184   Rune of Rathe
		elseif(e.other:GetClass() == "13" or (e.message:findi("184") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("184") and e.message:findi("all"))) then --Chanter
		end
	elseif(e.message:findi("no fail")) then
		if(e.other:GetClass() == "11" or (e.message:findi("no fail") and e.message:findi("all"))) then --Necro
		elseif(e.other:GetClass() == "12" or (e.message:findi("no fail") and e.message:findi("all"))) then --Wiz
		elseif(e.other:GetClass() == "13" or (e.message:findi("no fail") and e.message:findi("all"))) then --Mage
		elseif(e.other:GetClass() == "14" or (e.message:findi("no fail") and e.message:findi("all"))) then --Chanter
			e.other:SummonItem(11736,20); --enchanter   ?   Nilitim's Grimoire Pg. 449
			--e.other:SummonItem(); --enchanter   ?   Nilitim's Grimoire Pg. 378						****NOTE Missing from database
			e.other:SummonItem(11732,20); --enchanter   ?   Nilitim's Grimoire Pg. 400
			e.other:SummonItem(11734,20); --enchanter   ?   Nilitim's Grimoire Pg. 415
			e.other:SummonItem(11737,20); --enchanter   ?   Nilitim's Grimoire Pg. 450
			e.other:SummonItem(11731,20); --enchanter   ?   Nilitim's Grimoire Pg. 379
			e.other:SummonItem(11733,20); --enchanter   ?   Nilitim's Grimoire Pg. 401
			e.other:SummonItem(11735,20); --enchanter   ?   Nilitim's Grimoire Pg. 416
		end
	--ALCHEMY
	elseif(e.message:findi("Alchemy")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--BAKING
	elseif(e.message:findi("Baking")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--BREWING
	elseif(e.message:findi("Brewing")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--FISHING
	elseif(e.message:findi("Fishing")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--FLETCHING
	elseif(e.message:findi("Fletching")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--JEWELCRAFT
	elseif(e.message:findi("Jewelcraft")) then
		e.self:Say("Here you go, I hope you had room for all of this.");
		e.other:SummonItem(16500,20); --silver bar 17 to 63
		e.other:SummonItem(16501,20); --electrum bar 74 to 135
		e.other:SummonItem(16502,20); --gold bar 146 to 207
		e.other:SummonItem(16503,20); --platinum bar 218 to 279
		e.other:SummonItem(10015,20); --Malachite
		e.other:SummonItem(10020,20); --Jasper
		e.other:SummonItem(10022,20); --Amber
		e.other:SummonItem(10024,20); --Pearl
		e.other:SummonItem(10027,20); --Onyx
		e.other:SummonItem(10029,20); --Emerald
		e.other:SummonItem(10035,20); --Ruby
		
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
		e.self:Say("My master has not told me of these items yet. Please check back later.");
		
	--TINKERING
	elseif(e.message:findi("Tinkering")) then
		e.self:Say("My master has not told me of these items yet. Please check back later.");

	--OTHER
	elseif(e.message:findi("plat")) then
		e.self:Say("have fun");
		e.other:GiveCash(100,100,100,100);
	elseif(e.message:findi("hpbuff")) then
		e.self:CastSpell(3692,e.other:GetID(),0,1);
	elseif(e.message:findi("manabuff")) then
		e.self:CastSpell(697,e.other:GetID(),0,1);
	elseif(e.message:findi("home")) then
		e.self:CastSpell(1422,e.other:GetID(),0,1);
	end
end
