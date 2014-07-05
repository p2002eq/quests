function event_say(e)
	local warningRoom = "I hope you have room for all of this.";
	local notready = "This feature is not ready or implemented yet, hang tight.";
	local noMatch = " has no matches for this skill range";
	local lvl1 = "Zones for levels 1 to 4 [akanon] [butcher] [everfrost] [feerott] [gfaydark] [innothule] [misty] [nektulos] [qcat] [steamfont] [tox]";
	local lvl5 = "Zones for levels 5 to 9 [blackburrow] [crushbone] [ecommons] [guktop] [erudsxing] [qeytoqrg] [befallen] [sro]";
	local lvl10 = "Zones for levels 10 to 14 [cauldron] [kerraridge] [kithicor] [northkarana] [nro] [oot] [qey2hh1] [qrg] [unrest]";
	local lvl15 = "Zones for levels 15 to 19 [oasis] [beholder] [commons] [highpass] [lakerathe] [lavastorm]";
	local lvl20 = "Zones for levels 20 to 24 [eastkarana] [lfaydark] [mistmoore] [runnyeye] [southkarana] [najena]";
	local lvl25 = "Zones for levels 25 to 29 [highkeep] [rathemtn] [soldunga]";
	local lvl30 = "Zones for levels 30 to 34 [paw]";
	local lvl35 = "Zones for levels 35 to 44 [gukbottom] [permafrost]";
	local lvl45 = "Zones for levels 45+ [kedge] [oggok] [soldungb]";
	local nc = "No combat zones [erudnext] [erudnint] [felwithea] [felwitheb] [freporte] [freportn] [freportw] [grobb] [halas] [kaladima] [kaladimb] [neriaka] [neriakb] [neriakc] [paineel] [qeynos] [qeynos2] [rivervale] [soltemple]";
	local pvp = "[arena]";
	local timecnd = "[kithicor]";
	local randX;
	local randY;
	
	if(e.message:findi("hail")) then
		e.other:Message(15,"Hello my friend, you need some [plat] an [hpbuff] / [manabuff]?");
		e.other:Message(15,"Have you come to the ease your pain of doing [tradeskills]?");
		e.other:Message(15,"Want a [port] to go kill stuff?");
		e.other:Message(15,"Need a ride [home] to bind point");
		e.other:Message(15,"Would you like to [bind] here?");
		e.other:Message(15,"Have you went and lost all your [corpses]?");
		e.other:Message(13,"Do you need [help] with the usage of tradskill commands?");
		e.self:Shout("Celebrating the 4th? How bout [fireworks]!!");
		e.other:Message(12,"If I am bugged or if any adjustments need to be made to my script. Send a /petition attn. Speedz with full details.");
	elseif(e.message:findi("tradeskills")) then
		e.self:Emote(" says under his breath 'Alrighty then if you insist.....'");
		e.other:Message(15,"Tell me which tradeskill type you need materials for from these choices. [Research] [Alchemy] [Baking] [Brewing] [Fishing] [Fletching] [Jewelcraft] [Poison] [Pottery] [Smithing] [Tailoring] [Tinkering]");
	elseif(e.message:findi("help")) then
		e.other:Message(13,"Each skill range is for only the prior skill range to the one you specify. So an [RS26] would be only for skills 23 to 26.");
		e.other:Message(13,"Example Usage1: 'RS41' (will give only mats for 27 to 41 research skillups for your class)");
		e.other:Message(13,"Example Usage2: 'RS41 all' (will give only mats for 27 to 41 skillups for all research classes)");
		e.other:Message(13,"Example Usage3: 'FL41' (will give only mats for 46 to 56 skillups for fletching.)");
		e.other:Message(13,"WARNING: You need to make sure you have plenty of inventory space before using this feature.");

	--RESEARCH
	elseif(e.message:findi("Research")) then
		e.other:Message(15,"What skill range max? [RS22] [RS26] [RS41] [RS42] [RS46] [RS62] [RS71] [RS82] [RS83] [RS87] [RS96] [RS102] [RS116] [RS120] [RS122] [RS140] [RS142] [RS162] [RS166] [RS182] [RS184] [RS no fail]");
		e.other:Message(15,"If you want to research other classes than your own add [all] after range max.");
		e.other:Message(15,warningRoom);
		
	--22
	elseif(e.message:findi("RS22")) then
		if(e.message:findi("RS22 all")) then
			e.other:SummonItem(16024,20); --necro   21   Words of Derivation
			e.other:SummonItem(11810,20); --necro   21   Words of Eradication
			e.other:SummonItem(11786,20); --mage   22   Words of the Element
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
			e.other:SummonItem(16068,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Left)
			e.other:SummonItem(16070,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Left)
			e.other:SummonItem(16072,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Left)
			e.other:SummonItem(16069,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Right)
			e.other:SummonItem(16071,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Right)
			e.other:SummonItem(16073,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Right)
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS22 all")) then --Necro
			e.other:SummonItem(16024,20); --necro   21   Words of Derivation
			e.other:SummonItem(11810,20); --necro   21   Words of Eradication
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS22 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS22 all")) then --Mage
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
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS22 all")) then --Chanter
			e.other:SummonItem(16068,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Left)
			e.other:SummonItem(16070,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Left)
			e.other:SummonItem(16072,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Left)
			e.other:SummonItem(16069,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 23 (Right)
			e.other:SummonItem(16071,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 24 (Right)
			e.other:SummonItem(16073,20); --enchanter   22   Part of Tasarin's Grimoire Pg. 26 (Right)
		end
		
	--26
	elseif(e.message:findi("RS26")) then
		if(e.message:findi("RS26 all")) then
			e.other:SummonItem(11817,20); --necro   26   Words of Reviviscence
			e.other:SummonItem(11815,20); --necro   26   Words of Possession
			e.other:SummonItem(11813,20); --necro   26   Words of Materials
			e.other:SummonItem(11811,20); --necro   26   Words of Imitation
			e.other:SummonItem(11818,20); --necro   26   Words of the Sentient (Azia)
			e.other:SummonItem(11816,20); --necro   26   Words of the Spoken
			e.other:SummonItem(11814,20); --necro   26   Words of Spirit
			e.other:SummonItem(11843,20); --necro   26   Words of Resolve			****NOTE was given to me as Words of Resolution but doesn't exist here or on PeQ
			e.other:SummonItem(11738,20); --wizard   26   Rune of Falhalem
			e.other:SummonItem(16054,20); --wizard   26   Rune of Nagafen
			e.other:SummonItem(11741,20); --wizard   26   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
			e.other:SummonItem(11739,20); --wizard   26   Rune of Substance
			e.other:SummonItem(11742,20); --wizard   26   Rune of Proximity			****NOTE there is a duplicate of this in DB 16050
			e.other:SummonItem(11740,20); --wizard   26   Rune of Periphery
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS26 all")) then --Necro
			e.other:SummonItem(11817,20); --necro   26   Words of Reviviscence
			e.other:SummonItem(11815,20); --necro   26   Words of Possession
			e.other:SummonItem(11813,20); --necro   26   Words of Materials
			e.other:SummonItem(11811,20); --necro   26   Words of Imitation
			e.other:SummonItem(11818,20); --necro   26   Words of the Sentient (Azia)
			e.other:SummonItem(11816,20); --necro   26   Words of the Spoken
			e.other:SummonItem(11814,20); --necro   26   Words of Spirit
			e.other:SummonItem(11843,20); --necro   26   Words of Resolve			****NOTE was given to me as Words of Resolution but doesn't exist here or on PeQ
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS26 all")) then --Wiz
			e.other:SummonItem(11738,20); --wizard   26   Rune of Falhalem
			e.other:SummonItem(16054,20); --wizard   26   Rune of Nagafen
			e.other:SummonItem(11741,20); --wizard   26   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
			e.other:SummonItem(11739,20); --wizard   26   Rune of Substance
			e.other:SummonItem(11742,20); --wizard   26   Rune of Proximity			****NOTE there is a duplicate of this in DB 16050
			e.other:SummonItem(11740,20); --wizard   26   Rune of Periphery
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS26 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS26 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--41
	elseif(e.message:findi("RS41")) then
		if(e.message:findi("RS41 all")) then
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
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS41 all")) then --Necro
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
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS41 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS41 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS41 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
			
	--42
	elseif(e.message:findi("RS42")) then
		if(e.message:findi("RS42 all")) then
			e.other:SummonItem(11788,20); --mage   42   Words of Dominion			****NOTE there is a duplicate of this in DB 11828
			e.other:SummonItem(15396,20); --mage   42   Minor Summoning: Air		****NOTE there is a duplicate of this in DB 16128
			e.other:SummonItem(15335,20); --mage   42   Minor Summoning: Earth		****NOTE there is a duplicate of this in DB 16125
			e.other:SummonItem(15395,20); --mage   42   Minor Summoning: Fire		****NOTE there is a duplicate of this in DB 16127
			e.other:SummonItem(15336,20); --mage   42   Minor Summoning: Water		****NOTE there is a duplicate of this in DB 16126
			e.other:SummonItem(11791,20); --mage   42   Pearl Shard
			e.other:SummonItem(10025,20); --mage   42   Topaz
			e.other:SummonItem(11790,20); --mage   42   Jade Shard
			e.other:SummonItem(11789,20); --mage   42   Ice of Velious
			e.other:SummonItem(16074,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Left)
			e.other:SummonItem(16075,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Right)
			e.other:SummonItem(16078,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Right)
			e.other:SummonItem(16079,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Left)
			e.other:SummonItem(16076,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Left)
			e.other:SummonItem(16077,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Right)
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS42 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS42 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS42 all")) then --Mage
			e.other:SummonItem(11788,20); --mage   42   Words of Dominion			****NOTE there is a duplicate of this in DB 11828
			e.other:SummonItem(15396,20); --mage   42   Minor Summoning: Air		****NOTE there is a duplicate of this in DB 16128
			e.other:SummonItem(15335,20); --mage   42   Minor Summoning: Earth		****NOTE there is a duplicate of this in DB 16125
			e.other:SummonItem(15395,20); --mage   42   Minor Summoning: Fire		****NOTE there is a duplicate of this in DB 16127
			e.other:SummonItem(15336,20); --mage   42   Minor Summoning: Water		****NOTE there is a duplicate of this in DB 16126
			e.other:SummonItem(11791,20); --mage   42   Pearl Shard
			e.other:SummonItem(10025,20); --mage   42   Topaz
			e.other:SummonItem(11790,20); --mage   42   Jade Shard
			e.other:SummonItem(11789,20); --mage   42   Ice of Velious
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS42 all")) then --Chanter
			e.other:SummonItem(16074,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Left)
			e.other:SummonItem(16075,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 30 (Right)
			e.other:SummonItem(16078,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Right)
			e.other:SummonItem(16079,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 375 (Left)
			e.other:SummonItem(16076,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Left)
			e.other:SummonItem(16077,20); --enchanter   42   Part of Tasarin's Grimoire Pg. 312 (Right)
		end
		
	--46
	elseif(e.message:findi("RS46")) then
		if(e.message:findi("RS46 all")) then
			e.other:SummonItem(11746,20); --wizard   46   Rune of Al'Kabor
			e.other:SummonItem(11743,20); --wizard   46   Rune of Neglect
			e.other:SummonItem(11745,20); --wizard   46   Rune of Velious
			e.other:SummonItem(11744,20); --wizard   46   Rune of Oppression
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS46 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS46 all")) then --Wiz
			e.other:SummonItem(11746,20); --wizard   46   Rune of Al'Kabor
			e.other:SummonItem(11743,20); --wizard   46   Rune of Neglect
			e.other:SummonItem(11745,20); --wizard   46   Rune of Velious
			e.other:SummonItem(11744,20); --wizard   46   Rune of Oppression
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS46 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS46 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--62
	elseif(e.message:findi("RS62")) then
		if(e.message:findi("RS62 all")) then
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
			e.other:SummonItem(16081,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Left)
			e.other:SummonItem(16080,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Right)
			e.other:SummonItem(16082,20); --enchanter   62   Velishoul's Tome Pg. 8
			e.other:SummonItem(16085,20); --enchanter   62   Velishoul's Tome Pg. 16 (Faded)
			e.other:SummonItem(16083,20); --enchanter   62   Velishoul's Tome Pg. 9
			e.other:SummonItem(16086,20); --enchanter   62   Velishoul's Tome Pg. 17
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS62 all")) then --Necro
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
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS62 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS62 all")) then --Mage
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
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS62 all")) then --Chanter
			e.other:SummonItem(16081,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Left)
			e.other:SummonItem(16080,20); --enchanter   62   Part of Tasarin's Grimoire Pg. 390 (Right)
			e.other:SummonItem(16082,20); --enchanter   62   Velishoul's Tome Pg. 8
			e.other:SummonItem(16085,20); --enchanter   62   Velishoul's Tome Pg. 16 (Faded)
			e.other:SummonItem(16083,20); --enchanter   62   Velishoul's Tome Pg. 9
			e.other:SummonItem(16086,20); --enchanter   62   Velishoul's Tome Pg. 17
		end
		
	--71
	elseif(e.message:findi("RS71")) then
		if(e.message:findi("RS71 all")) then
			e.other:SummonItem(11747,20); --wizard   71   Rune of Expulsion
			e.other:SummonItem(11751,20); --wizard   71   Rune of Trauma
			e.other:SummonItem(11750,20); --wizard   71   Rune of Disassociation
			e.other:SummonItem(11753,20); --wizard   71   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
			e.other:SummonItem(11748,20); --wizard   71   Rune of Attraction		****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11752,20); --wizard   71   Rune of Xegony
			e.other:SummonItem(11749,20); --wizard   71   Rune of Presence
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS71 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS71 all")) then --Wiz
			e.other:SummonItem(11747,20); --wizard   71   Rune of Expulsion
			e.other:SummonItem(11751,20); --wizard   71   Rune of Trauma
			e.other:SummonItem(11750,20); --wizard   71   Rune of Disassociation
			e.other:SummonItem(11753,20); --wizard   71   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
			e.other:SummonItem(11748,20); --wizard   71   Rune of Attraction		****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11752,20); --wizard   71   Rune of Xegony
			e.other:SummonItem(11749,20); --wizard   71   Rune of Presence
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS71 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS71 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--82
	elseif(e.message:findi("RS82")) then
		if(e.message:findi("RS82 all")) then
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS82 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS82 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS82 all")) then --Mage
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
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS82 all")) then --Chanter
			e.other:SummonItem(16087,20); --enchanter   82   Velishoul's Tome Pg. 43
			e.other:SummonItem(16089,20); --enchanter   82   Velishoul's Tome Pg. 67
			e.other:SummonItem(16092,20); --enchanter   82   Velishoul's Tome Pg. 75
			e.other:SummonItem(11700,20); --enchanter   82   Velishoul's Tome Pg. 108 (Faded)
			e.other:SummonItem(16088,20); --enchanter   82   Velishoul's Tome Pg. 44
			e.other:SummonItem(16091,20); --enchanter   82   Velishoul's Tome Pg. 68
			e.other:SummonItem(16093,20); --enchanter   82   Velishoul's Tome Pg. 76
			e.other:SummonItem(11702,20); --enchanter   82   Velishoul's Tome Pg. 109
		end
	
	--83
	elseif(e.message:findi("RS83")) then
		if(e.message:findi("RS83 all")) then
			e.other:SummonItem(11838,20); --necro   83   Words of Purification
			e.other:SummonItem(11815,20); --necro   83   Words of Possession
			e.other:SummonItem(11839,20); --necro   83   Words of the Incorporeal
			e.other:SummonItem(11841,20); --necro   83   Words of Dissemination
			e.other:SummonItem(11840,20); --necro   83   Words of Acquisition (Azia)
			e.other:SummonItem(11842,20); --necro   83   Words of Parasitism
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS83 all")) then --Necro
			e.other:SummonItem(11838,20); --necro   83   Words of Purification
			e.other:SummonItem(11815,20); --necro   83   Words of Possession
			e.other:SummonItem(11839,20); --necro   83   Words of the Incorporeal
			e.other:SummonItem(11841,20); --necro   83   Words of Dissemination
			e.other:SummonItem(11840,20); --necro   83   Words of Acquisition (Azia)
			e.other:SummonItem(11842,20); --necro   83   Words of Parasitism
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS83 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS83 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS83 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--87
	elseif(e.message:findi("RS87")) then
		if(e.message:findi("RS87 all")) then
			e.other:SummonItem(11815,20); --necro   87   Words of Possession
			e.other:SummonItem(11836,20); --necro   87   Words of Haunting
			e.other:SummonItem(11837,20); --necro   87   Words of Rupturing
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS87 all")) then --Necro
			e.other:SummonItem(11815,20); --necro   87   Words of Possession
			e.other:SummonItem(11836,20); --necro   87   Words of Haunting
			e.other:SummonItem(11837,20); --necro   87   Words of Rupturing
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS87 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS87 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS87 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--96
	elseif(e.message:findi("RS96")) then
		if(e.message:findi("RS96 all")) then
			e.other:SummonItem(11746,20); --wizard   96   Rune of Al'Kabor
			e.other:SummonItem(11762,20); --wizard   96   Rune of Arrest
			e.other:SummonItem(11753,20); --wizard   96   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
			e.other:SummonItem(11754,20); --wizard   96   Rune of The Combine
			e.other:SummonItem(11757,20); --wizard   96   Rune of Rallos Zek
			e.other:SummonItem(11760,20); --wizard   96   Rune of Consumption
			e.other:SummonItem(11752,20); --wizard   96   Rune of Xegony
			e.other:SummonItem(11755,20); --wizard   96   Rune of Dismemberment
			e.other:SummonItem(11758,20); --wizard   96   Rune of the Helix
			e.other:SummonItem(11761,20); --wizard   96   Rune of Sorcery
			e.other:SummonItem(11741,20); --wizard   96   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
			e.other:SummonItem(11756,20); --wizard   96   Rune of Regeneration
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS96 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS96 all")) then --Wiz
			e.other:SummonItem(11746,20); --wizard   96   Rune of Al'Kabor
			e.other:SummonItem(11762,20); --wizard   96   Rune of Arrest
			e.other:SummonItem(11753,20); --wizard   96   Rune of Karana			****NOTE there is a duplicate of this in DB 16058
			e.other:SummonItem(11754,20); --wizard   96   Rune of The Combine
			e.other:SummonItem(11757,20); --wizard   96   Rune of Rallos Zek
			e.other:SummonItem(11760,20); --wizard   96   Rune of Consumption
			e.other:SummonItem(11752,20); --wizard   96   Rune of Xegony
			e.other:SummonItem(11755,20); --wizard   96   Rune of Dismemberment
			e.other:SummonItem(11758,20); --wizard   96   Rune of the Helix
			e.other:SummonItem(11761,20); --wizard   96   Rune of Sorcery
			e.other:SummonItem(11741,20); --wizard   96   Rune of Fulguration		****NOTE there is a duplicate of this in DB 11759
			e.other:SummonItem(11756,20); --wizard   96   Rune of Regeneration
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS96 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS96 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--102
	elseif(e.message:findi("RS102")) then
		if(e.message:findi("RS102 all")) then
			e.other:SummonItem(11798,20); --mage   102   Words of Detention
			e.other:SummonItem(11799,20); --mage   102   Words of Duress
			e.other:SummonItem(15048,20); --mage   102   Cancel Magic				****NOTE there is duplicates of this in DB 16118, 16207, 16313, 16415
			e.other:SummonItem(15576,20); --mage   102   Greater Summoning: Air
			e.other:SummonItem(15575,20); --mage   102   Greater Summoning: Fire
			e.other:SummonItem(11800,20); --mage   102   Blood of Velious
			e.other:SummonItem(11802,20); --mage   102   The Scent of Marr
			e.other:SummonItem(11801,20); --mage   102   Breath of Solusek
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS102 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS102 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS102 all")) then --Mage
			e.other:SummonItem(11798,20); --mage   102   Words of Detention
			e.other:SummonItem(11799,20); --mage   102   Words of Duress
			e.other:SummonItem(15048,20); --mage   102   Cancel Magic				****NOTE there is duplicates of this in DB 16118, 16207, 16313, 16415
			e.other:SummonItem(15576,20); --mage   102   Greater Summoning: Air
			e.other:SummonItem(15575,20); --mage   102   Greater Summoning: Fire
			e.other:SummonItem(11800,20); --mage   102   Blood of Velious
			e.other:SummonItem(11802,20); --mage   102   The Scent of Marr
			e.other:SummonItem(11801,20); --mage   102   Breath of Solusek
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS102 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--116
	elseif(e.message:findi("RS116")) then
		if(e.message:findi("RS116 all")) then
			e.other:SummonItem(11850,20); --necro   116   Words of Dark Paths
			e.other:SummonItem(11836,20); --necro   116   Words of Haunting
			e.other:SummonItem(11851,20); --necro   116   Words of the Suffering
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS116 all")) then --Necro
			e.other:SummonItem(11850,20); --necro   116   Words of Dark Paths
			e.other:SummonItem(11836,20); --necro   116   Words of Haunting
			e.other:SummonItem(11851,20); --necro   116   Words of the Suffering
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS116 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS116 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS116 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--120
	elseif(e.message:findi("RS120")) then
		if(e.message:findi("RS120 all")) then
			e.other:SummonItem(11845,20); --necro   120   Words of Duration
			e.other:SummonItem(11846,20); --necro   120   Words of Motion
			e.other:SummonItem(11844,20); --necro   120   Words of Quivering
			e.other:SummonItem(11847,20); --necro   120   Words of Neglect
			e.other:SummonItem(11843,20); --necro   120   Words of Resolve
			e.other:SummonItem(11848,20); --necro   120   Words of Endurance
			e.other:SummonItem(11764,20); --wizard   120   Rune of Banding
			e.other:SummonItem(11774,20); --wizard   120   Rune of Conception
			e.other:SummonItem(11763,20); --wizard   120   Rune of Concussion
			e.other:SummonItem(11765,20); --wizard   120   Rune of the Catalyst
			e.other:SummonItem(11769,20); --wizard   120   Rune of Contortion
			e.other:SummonItem(11767,20); --wizard   120   Rune of The Cyclone
			e.other:SummonItem(11768,20); --wizard   120   Rune of Howling
			e.other:SummonItem(11766,20); --wizard   120   Rune of Solusek Ro
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS120 all")) then --Necro
			e.other:SummonItem(11845,20); --necro   120   Words of Duration
			e.other:SummonItem(11846,20); --necro   120   Words of Motion
			e.other:SummonItem(11844,20); --necro   120   Words of Quivering
			e.other:SummonItem(11847,20); --necro   120   Words of Neglect
			e.other:SummonItem(11843,20); --necro   120   Words of Resolve
			e.other:SummonItem(11848,20); --necro   120   Words of Endurance
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS120 all")) then --Wiz
			e.other:SummonItem(11764,20); --wizard   120   Rune of Banding
			e.other:SummonItem(11774,20); --wizard   120   Rune of Conception
			e.other:SummonItem(11763,20); --wizard   120   Rune of Concussion
			e.other:SummonItem(11765,20); --wizard   120   Rune of the Catalyst
			e.other:SummonItem(11769,20); --wizard   120   Rune of Contortion
			e.other:SummonItem(11767,20); --wizard   120   Rune of The Cyclone
			e.other:SummonItem(11768,20); --wizard   120   Rune of Howling
			e.other:SummonItem(11766,20); --wizard   120   Rune of Solusek Ro
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS120 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS120 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--122
	elseif(e.message:findi("RS122")) then
		if(e.message:findi("RS122 all")) then
			e.other:SummonItem(16037,20); --necro   122   Words of Abatement
			e.other:SummonItem(16039,20); --necro   122   Words of Cazic-Thule
			e.other:SummonItem(11849,20); --necro   122   Words of Efficacy
			e.other:SummonItem(11803,20); --mage   122   Words of Collection (Azia)
			e.other:SummonItem(11872,20); --mage   122   Words of Convocation
			e.other:SummonItem(7001,20); --mage   122   Dagger
			e.other:SummonItem(10021,20); --mage   122   Star Rose Quartz
			e.other:SummonItem(15620,20); --mage   122   Minor Conjuration: Earth
			e.other:SummonItem(15621,20); --mage   122   Minor Conjuration: Water
			e.other:SummonItem(11796,20); --mage   122   Glove of Rallos Zek
			e.other:SummonItem(11797,20); --mage   122   Flame of Vox
			e.other:SummonItem(11704,20); --enchanter   122   Salil's Writ Pg. 60 (Left)
			e.other:SummonItem(11882,20); --enchanter   122   Salil's Writ Pg. 60 (Right)
			e.other:SummonItem(11705,20); --enchanter   122   Salil's Writ Pg. 64 (Left) (Faded)
			e.other:SummonItem(11707,20); --enchanter   122   Salil's Writ Pg. 64 (Right)
			e.other:SummonItem(11708,20); --enchanter   122   Salil's Writ Pg. 90 (Left)
			e.other:SummonItem(11709,20); --enchanter   122   Salil's Writ Pg. 90 (Right) (Faded)
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS122 all")) then --Necro
			e.other:SummonItem(16037,20); --necro   122   Words of Abatement
			e.other:SummonItem(16039,20); --necro   122   Words of Cazic-Thule
			e.other:SummonItem(11849,20); --necro   122   Words of Efficacy
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS122 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS122 all")) then --Mage
			e.other:SummonItem(11803,20); --mage   122   Words of Collection (Azia)
			e.other:SummonItem(11872,20); --mage   122   Words of Convocation
			e.other:SummonItem(7001,20); --mage   122   Dagger
			e.other:SummonItem(10021,20); --mage   122   Star Rose Quartz
			e.other:SummonItem(15620,20); --mage   122   Minor Conjuration: Earth
			e.other:SummonItem(15621,20); --mage   122   Minor Conjuration: Water
			e.other:SummonItem(11796,20); --mage   122   Glove of Rallos Zek
			e.other:SummonItem(11797,20); --mage   122   Flame of Vox
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS122 all")) then --Chanter
			e.other:SummonItem(11704,20); --enchanter   122   Salil's Writ Pg. 60 (Left)
			e.other:SummonItem(11882,20); --enchanter   122   Salil's Writ Pg. 60 (Right)
			e.other:SummonItem(11705,20); --enchanter   122   Salil's Writ Pg. 64 (Left) (Faded)
			e.other:SummonItem(11707,20); --enchanter   122   Salil's Writ Pg. 64 (Right)
			e.other:SummonItem(11708,20); --enchanter   122   Salil's Writ Pg. 90 (Left)
			e.other:SummonItem(11709,20); --enchanter   122   Salil's Writ Pg. 90 (Right) (Faded)
		end
		
	--140
	elseif(e.message:findi("RS140")) then
		if(e.message:findi("RS140 all")) then
			e.other:SummonItem(11852,20); --necro   140   Words of Descrying
			e.other:SummonItem(11855,20); --necro   140   Words of Projection
			e.other:SummonItem(11857,20); --necro   140   Words of Bidding
			e.other:SummonItem(11853,20); --necro   140   Words of Seizure
			e.other:SummonItem(16039,20); --necro   140   Words of Cazic-Thule
			e.other:SummonItem(11851,20); --necro   140   Words of the Suffering
			e.other:SummonItem(11854,20); --necro   140   Words of Disillusionment
			e.other:SummonItem(11856,20); --necro   140   Words of the Spectre
			e.other:SummonItem(11858,20); --necro   140   Words of Collection (Beza)
			e.other:SummonItem(11746,20); --wizard   140   Rune of Al'Kabor
			e.other:SummonItem(11754,20); --wizard   140   Rune of The Combine
			e.other:SummonItem(11772,20); --wizard   140   Rune of Paralysis
			e.other:SummonItem(11758,20); --wizard   140   Rune of The Helix
			e.other:SummonItem(11774,20); --wizard   140   Rune of Conception
			e.other:SummonItem(11770,20); --wizard   140   Rune of Petrification
			e.other:SummonItem(11775,20); --wizard   140   Rune of Infraction
			e.other:SummonItem(11773,20); --wizard   140   Rune of Embrace
			e.other:SummonItem(11771,20); --wizard   140   Rune of Tyranny
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS140 all")) then --Necro
			e.other:SummonItem(11852,20); --necro   140   Words of Descrying
			e.other:SummonItem(11855,20); --necro   140   Words of Projection
			e.other:SummonItem(11857,20); --necro   140   Words of Bidding
			e.other:SummonItem(11853,20); --necro   140   Words of Seizure
			e.other:SummonItem(16039,20); --necro   140   Words of Cazic-Thule
			e.other:SummonItem(11851,20); --necro   140   Words of the Suffering
			e.other:SummonItem(11854,20); --necro   140   Words of Disillusionment
			e.other:SummonItem(11856,20); --necro   140   Words of the Spectre
			e.other:SummonItem(11858,20); --necro   140   Words of Collection (Beza)
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS140 all")) then --Wiz
			e.other:SummonItem(11746,20); --wizard   140   Rune of Al'Kabor
			e.other:SummonItem(11754,20); --wizard   140   Rune of The Combine
			e.other:SummonItem(11772,20); --wizard   140   Rune of Paralysis
			e.other:SummonItem(11758,20); --wizard   140   Rune of The Helix
			e.other:SummonItem(11774,20); --wizard   140   Rune of Conception
			e.other:SummonItem(11770,20); --wizard   140   Rune of Petrification
			e.other:SummonItem(11775,20); --wizard   140   Rune of Infraction
			e.other:SummonItem(11773,20); --wizard   140   Rune of Embrace
			e.other:SummonItem(11771,20); --wizard   140   Rune of Tyranny
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS140 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS140 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--142
	elseif(e.message:findi("RS142")) then
		if(e.message:findi("RS142 all")) then
			e.other:SummonItem(11804,20); --mage   142   Words of Incarceration
			e.other:SummonItem(15627,20); --mage   142   Lesser Conjuration: Air
			e.other:SummonItem(15624,20); --mage   142   Lesser Conjuration: Earth
			e.other:SummonItem(15625,20); --mage   142   Lesser Conjuration: Water
			e.other:SummonItem(11802,20); --mage   142   The Scent of Marr
			e.other:SummonItem(11805,20); --mage   142   Essence of Rathe
			e.other:SummonItem(11806,20); --mage   142   Tears of Prexus
			e.other:SummonItem(11714); --enchanter   142   Salil's Writ Pg. 174 (Left)
			e.other:SummonItem(11715); --enchanter   142   Salil's Writ Pg. 174 (Right)
			e.other:SummonItem(11718); --enchanter   142   Salil's Writ Pg. 288 (Left)
			e.other:SummonItem(11719); --enchanter   142   Salil's Writ Pg. 288 (Right) (Faded)
			e.other:SummonItem(11716); --enchanter   142   Salil's Writ Pg. 282 (Left)
			e.other:SummonItem(11717); --enchanter   142   Salil's Writ Pg. 282 (Right) (Faded)
			e.other:SummonItem(11711); --enchanter   142   Salil's Writ Pg. 153 (Left)
			e.other:SummonItem(11712); --enchanter   142   Salil's Writ Pg. 153 (Right)
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS142 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS142 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS142 all")) then --Mage
			e.other:SummonItem(11804,20); --mage   142   Words of Incarceration
			e.other:SummonItem(15627,20); --mage   142   Lesser Conjuration: Air
			e.other:SummonItem(15624,20); --mage   142   Lesser Conjuration: Earth
			e.other:SummonItem(15625,20); --mage   142   Lesser Conjuration: Water
			e.other:SummonItem(11802,20); --mage   142   The Scent of Marr
			e.other:SummonItem(11805,20); --mage   142   Essence of Rathe
			e.other:SummonItem(11806,20); --mage   142   Tears of Prexus
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS142 all")) then --Chanter
			e.other:SummonItem(11714); --enchanter   142   Salil's Writ Pg. 174 (Left)
			e.other:SummonItem(11715); --enchanter   142   Salil's Writ Pg. 174 (Right)
			e.other:SummonItem(11718); --enchanter   142   Salil's Writ Pg. 288 (Left)
			e.other:SummonItem(11719); --enchanter   142   Salil's Writ Pg. 288 (Right) (Faded)
			e.other:SummonItem(11716); --enchanter   142   Salil's Writ Pg. 282 (Left)
			e.other:SummonItem(11717); --enchanter   142   Salil's Writ Pg. 282 (Right) (Faded)
			e.other:SummonItem(11711); --enchanter   142   Salil's Writ Pg. 153 (Left)
			e.other:SummonItem(11712); --enchanter   142   Salil's Writ Pg. 153 (Right)
		end
		
	--162
	elseif(e.message:findi("RS162")) then
		if(e.message:findi("RS162 all")) then
			e.other:SummonItem(11724,20); --enchanter   162   Nilitim's Grimoire Pg. 115
			e.other:SummonItem(11726,20); --enchanter   162   Nilitim's Grimoire Pg. 300
			e.other:SummonItem(11722,20); --enchanter   162   Nilitim's Grimoire Pg. 35
			e.other:SummonItem(11728,20); --enchanter   162   Nilitim's Grimoire Pg. 351
			e.other:SummonItem(11725,20); --enchanter   162   Nilitim's Grimoire Pg. 116
			e.other:SummonItem(11727,20); --enchanter   162   Nilitim's Grimoire Pg. 301
			e.other:SummonItem(11723,20); --enchanter   162   Nilitim's Grimoire Pg. 36
			e.other:SummonItem(11729,20); --enchanter   162   Nilitim's Grimoire Pg. 352
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS162 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS162 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS162 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS162 all")) then --Chanter
			e.other:SummonItem(11724,20); --enchanter   162   Nilitim's Grimoire Pg. 115
			e.other:SummonItem(11726,20); --enchanter   162   Nilitim's Grimoire Pg. 300
			e.other:SummonItem(11722,20); --enchanter   162   Nilitim's Grimoire Pg. 35
			e.other:SummonItem(11728,20); --enchanter   162   Nilitim's Grimoire Pg. 351
			e.other:SummonItem(11725,20); --enchanter   162   Nilitim's Grimoire Pg. 116
			e.other:SummonItem(11727,20); --enchanter   162   Nilitim's Grimoire Pg. 301
			e.other:SummonItem(11723,20); --enchanter   162   Nilitim's Grimoire Pg. 36
			e.other:SummonItem(11729,20); --enchanter   162   Nilitim's Grimoire Pg. 352
		end
		
	--166
	elseif(e.message:findi("RS166")) then
		if(e.message:findi("RS166 all")) then
			e.other:SummonItem(11861,20); --necro   166   Words of the Psyche
			e.other:SummonItem(11863,20); --necro   166   Words of Obligation
			e.other:SummonItem(11862,20); --necro   166   Words of Burnishing
			e.other:SummonItem(11864,20); --necro   166   Words of Collection (Caza)
			e.other:SummonItem(11748,20); --wizard   166   Rune of Attraction			****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11778,20); --wizard   166   Rune of The Inverse
			e.other:SummonItem(11776,20); --wizard   166   Rune of Rathe
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS166 all")) then --Necro
			e.other:SummonItem(11861,20); --necro   166   Words of the Psyche
			e.other:SummonItem(11863,20); --necro   166   Words of Obligation
			e.other:SummonItem(11862,20); --necro   166   Words of Burnishing
			e.other:SummonItem(11864,20); --necro   166   Words of Collection (Caza)
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS166 all")) then --Wiz
			e.other:SummonItem(11748,20); --wizard   166   Rune of Attraction			****NOTE there is a duplicate of this in DB 11777
			e.other:SummonItem(11778,20); --wizard   166   Rune of The Inverse
			e.other:SummonItem(11776,20); --wizard   166   Rune of Rathe
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS166 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS166 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--182
	elseif(e.message:findi("RS182")) then
		if(e.message:findi("RS182 all")) then
			e.other:SummonItem(11807,20); --mage   182   Words of Bondage
			e.other:SummonItem(15631,20); --mage   182   Conjuration: Air
			e.other:SummonItem(15630,20); --mage   182   Conjuration: Fire
			e.other:SummonItem(15629,20); --mage   182   Conjuration: Water
			e.other:SummonItem(11809,20); --mage   182   Wing of Xegony
			e.other:SummonItem(11808,20); --mage   182   Breath of Ro
			e.other:SummonItem(11806,20); --mage   182   Tears of Prexus
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS182 all")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS182 all")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS182 all")) then --Mage
			e.other:SummonItem(11807,20); --mage   182   Words of Bondage
			e.other:SummonItem(15631,20); --mage   182   Conjuration: Air
			e.other:SummonItem(15630,20); --mage   182   Conjuration: Fire
			e.other:SummonItem(15629,20); --mage   182   Conjuration: Water
			e.other:SummonItem(11809,20); --mage   182   Wing of Xegony
			e.other:SummonItem(11808,20); --mage   182   Breath of Ro
			e.other:SummonItem(11806,20); --mage   182   Tears of Prexus
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS182 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--184
	elseif(e.message:findi("RS184")) then
		if(e.message:findi("RS184 all")) then
			e.other:SummonItem(11865,20); --necro   184   Words of Requisition
			e.other:SummonItem(11869,20); --necro   184   Words of the Ethereal
			e.other:SummonItem(11870,20); --necro   184   Words of Crippling Force
			e.other:SummonItem(11867,20); --necro   184   Words of Grappling
			e.other:SummonItem(11866,20); --necro   184   Words of Acquisition (Beza)
			e.other:SummonItem(11868,20); --necro   184   Words of Odus
			e.other:SummonItem(11779,20); --wizard   184   Rune of Ap'Sagor
			e.other:SummonItem(11781,20); --wizard   184   Rune of the Astral			****NOTE there is a duplicate of this in DB 11881
			e.other:SummonItem(11783,20); --wizard   184   Rune of Crippling
			e.other:SummonItem(11763,20); --wizard   184   Rune of Concussion
			e.other:SummonItem(11780,20); --wizard   184   Rune of Frost				****NOTE there is a duplicate of this in DB 11880
			e.other:SummonItem(11782,20); --wizard   184   Rune of Impetus
			e.other:SummonItem(11776,20); --wizard   184   Rune of Rathe
			e.other:Message(13,"Mage".. noMatch);
			e.other:Message(13,"Chanter".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS184 all")) then --Necro
			e.other:SummonItem(11865,20); --necro   184   Words of Requisition
			e.other:SummonItem(11869,20); --necro   184   Words of the Ethereal
			e.other:SummonItem(11870,20); --necro   184   Words of Crippling Force
			e.other:SummonItem(11867,20); --necro   184   Words of Grappling
			e.other:SummonItem(11866,20); --necro   184   Words of Acquisition (Beza)
			e.other:SummonItem(11868,20); --necro   184   Words of Odus
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS184 all")) then --Wiz
			e.other:SummonItem(11779,20); --wizard   184   Rune of Ap'Sagor
			e.other:SummonItem(11781,20); --wizard   184   Rune of the Astral			****NOTE there is a duplicate of this in DB 11881
			e.other:SummonItem(11783,20); --wizard   184   Rune of Crippling
			e.other:SummonItem(11763,20); --wizard   184   Rune of Concussion
			e.other:SummonItem(11780,20); --wizard   184   Rune of Frost				****NOTE there is a duplicate of this in DB 11880
			e.other:SummonItem(11782,20); --wizard   184   Rune of Impetus
			e.other:SummonItem(11776,20); --wizard   184   Rune of Rathe
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS184 all")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS184 all")) then --Chanter
			e.other:Message(13,"Chanter".. noMatch);
		end
	
	--no fail
	elseif(e.message:findi("RS no fail")) then
		if(e.message:findi("RS no fail all")) then
			e.other:SummonItem(11736,20); --enchanter   ?   Nilitim's Grimoire Pg. 449
			e.other:SummonItem(11730,20); --enchanter   ?   Nilitim's Grimoire Pg. 378
			e.other:SummonItem(11732,20); --enchanter   ?   Nilitim's Grimoire Pg. 400
			e.other:SummonItem(11734,20); --enchanter   ?   Nilitim's Grimoire Pg. 415
			e.other:SummonItem(11737,20); --enchanter   ?   Nilitim's Grimoire Pg. 450
			e.other:SummonItem(11731,20); --enchanter   ?   Nilitim's Grimoire Pg. 379
			e.other:SummonItem(11733,20); --enchanter   ?   Nilitim's Grimoire Pg. 401
			e.other:SummonItem(11735,20); --enchanter   ?   Nilitim's Grimoire Pg. 416
			e.other:Message(13,"Necro".. noMatch);
			e.other:Message(13,"Wizard".. noMatch);
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Necromancer" and not e.message:findi("RS no fail")) then --Necro
			e.other:Message(13,"Necro".. noMatch);
		elseif(e.other:Class() == "Wizard" and not e.message:findi("RS no fail")) then --Wiz
			e.other:Message(13,"Wizard".. noMatch);
		elseif(e.other:Class() == "Magician" and not e.message:findi("RS no fail")) then --Mage
			e.other:Message(13,"Mage".. noMatch);
		elseif(e.other:Class() == "Enchanter" and not e.message:findi("RS no fail")) then --Chanter
			e.other:SummonItem(11736,20); --enchanter   ?   Nilitim's Grimoire Pg. 449
			e.other:SummonItem(11730,20); --enchanter   ?   Nilitim's Grimoire Pg. 378
			e.other:SummonItem(11732,20); --enchanter   ?   Nilitim's Grimoire Pg. 400
			e.other:SummonItem(11734,20); --enchanter   ?   Nilitim's Grimoire Pg. 415
			e.other:SummonItem(11737,20); --enchanter   ?   Nilitim's Grimoire Pg. 450
			e.other:SummonItem(11731,20); --enchanter   ?   Nilitim's Grimoire Pg. 379
			e.other:SummonItem(11733,20); --enchanter   ?   Nilitim's Grimoire Pg. 401
			e.other:SummonItem(11735,20); --enchanter   ?   Nilitim's Grimoire Pg. 416
		end
		
	--ALCHEMY
	elseif(e.message:findi("Alchemy")) then
		e.other:Message(13,notready);
		--e.other:Message(15,"What skill range max? [AL31] [AL52] [AL79] [AL106] [AL142] [AL178]");
		--e.other:Message(15,warningRoom);
	--elseif(e.message:findi("AL")) then
		if(e.message:findi("AL31")) then --31 - Distillate of Skinspikes I
			e.other:SummonItem(16512,20); --Sticklewort
			e.other:SummonItem(14950,20); --Primitive Potion Vial
			e.other:SummonItem(14950,20); --Acaana Leaf
			e.other:SummonItem(14950,20); --Comfrey Leaf
			e.other:SummonItem(14950,20); --Flamewort Leaf
		end
		if(e.message:findi("AL52")) then --52 - Distillate of Skinspikes II
			e.other:SummonItem(14950,20); --Vox's Dust
			e.other:SummonItem(14950,20); --Crude Potion Vial
			e.other:SummonItem(14950,20); --Acaana Leaf
			e.other:SummonItem(14950,20); --Comfrey Leaf
			e.other:SummonItem(14950,20); --Flamewort Leaf
		end
		if(e.message:findi("AL79")) then --79 - Distillate of Skinspikes III
			e.other:SummonItem(14950,20); --Violet Tri-Tube Sap
			e.other:SummonItem(14950,20); --Rough Potion Vial
			e.other:SummonItem(14950,20); --Acaana Leaf
			e.other:SummonItem(14950,20); --Comfrey Leaf
			e.other:SummonItem(14950,20); --Flamewort Leaf
		end
		if(e.message:findi("AL106")) then --106 - Distillate of Skinspikes IV
			e.other:SummonItem(14950,20); --Blue Vervain Bulb
			e.other:SummonItem(14950,20); --Makeshift Potion Vial
			e.other:SummonItem(14950,20); --Sprig of Acaana
			e.other:SummonItem(14950,20); --Sprig of Comfrey
			e.other:SummonItem(14950,20); --Sprig of Flamewort
		end
		if(e.message:findi("AL142")) then --142 - Distillate of Skinspikes V
			e.other:SummonItem(14950,20); --Betherium Bark
			e.other:SummonItem(14950,20); --Simple Potion Vial
			e.other:SummonItem(14950,20); --Sprig of Acaana
			e.other:SummonItem(14950,20); --Sprig of Comfrey
			e.other:SummonItem(14950,20); --Sprig of Flamewort
		end
		
	--BAKING
	elseif(e.message:findi("Baking")) then
		e.other:Message(15,"What skill range max? [BK17] [BK75] [BK83] [BK135] [BK143] [BK152] [BK226]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("BK")) then
		if(e.message:findi("BK17")) then --17 - Clump of Dough
			e.other:SummonItem(14950,20); --basilisk Eggs
			e.other:SummonItem(13193,20); --Cup of Flour								****NOTE there is a duplicate of this in DB 13089
			e.other:SummonItem(13087,20); --Bottle of Milk
		end
		if(e.message:findi("BK75")) then --75 - Creamy Fennel Sauce
			e.other:SummonItem(9726,20); --Cream
			e.other:SummonItem(13193,20); --Cup of Flour								****NOTE there is a duplicate of this in DB 13089
			e.other:SummonItem(14234,20); --Fennel
		end
		if(e.message:findi("BK83")) then --83 - Cream
			e.other:SummonItem(14221,20); --Benzoin
			e.other:SummonItem(13087,20); --Bottle of Milk
		end
		if(e.message:findi("BK135")) then --135 - Fish Rolls
			e.other:SummonItem(13062,20); --Bat Wing
			e.other:SummonItem(13019,20); --Fresh Fish
		end
		if(e.message:findi("BK143")) then --143 - Filleted Bear
			e.other:SummonItem(13404,20); --Bear Meat
		end
		if(e.message:findi("BK152")) then --152 - Bear Filet in Cream
			e.other:SummonItem(9744,20); --Filleted Bear
			e.other:SummonItem(9743,20); --Creamy Fennel Sauce
		end
		if(e.message:findi("BK226")) then --226 - Halas 10 pound meat pie
			e.other:SummonItem(9748,20); --Bear Fillet in Cream
			e.other:SummonItem(13090,20); --Clump of Dough
			e.other:SummonItem(9749,20); --Lion Fillet in Cream
			e.other:SummonItem(9751,20); --Mammoth Fillet in Cream
			e.other:SummonItem(9750,20); --Wolf Fillet in Cream
			e.other:SummonItem(14215,20); --Sage Leaf
		end
		
	--BREWING
	elseif(e.message:findi("Brewing")) then
		e.other:Message(15,"What skill range max? [BR31] [BR62] [BR95] [BR122] [BR151] [BR162] [BR226] [BR248]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("BR")) then
		if(e.message:findi("BR31")) then --31 - Short Beer
			e.other:SummonItem(16590,20); --Barley
			e.other:SummonItem(16580,20); --Cask
			e.other:SummonItem(16591,20); --Hops
			e.other:SummonItem(16595,20); --Malt
		end
		if(e.message:findi("BR62")) then --62 - Fish Wine
			e.other:SummonItem(16598,20); --Bottle
			e.other:SummonItem(13019,20); --Fresh Fish
			e.other:SummonItem(16592,20); --Grapes
			e.other:SummonItem(13006,20); --Water Flask
		end
		if(e.message:findi("BR95")) then --95 - Red Wine
			e.other:SummonItem(13045,20); --Berries
			e.other:SummonItem(16598,20); --Bottle
			e.other:SummonItem(16592,20); --Grapes
			e.other:SummonItem(16597,20); --Wine Yeast
		end
		if(e.message:findi("BR122")) then --122 - Fetid Essence
			e.other:SummonItem(13106,20); --Fishing Grubs
			e.other:SummonItem(13006,20); --Water Flask
		end
		if(e.message:findi("BR151")) then --151 - Skull Ale
			e.other:SummonItem(12308); --Cyclops Skull
			e.other:SummonItem(13032,20); --Short Beer
			e.other:SummonItem(13425,20); --Spices
			e.other:SummonItem(13428,20); --Vinegar
		end
		if(e.message:findi("BR162")) then --162 - Jumjum Spiced Beer
			e.other:SummonItem(16590,20); --Barley
			e.other:SummonItem(16598,20); --Bottle
			e.other:SummonItem(16591,20); --Hops
			e.other:SummonItem(13425,20); --Spices
			e.other:SummonItem(13006,20); --Water Flask
			e.other:SummonItem(13973,20); --Jumjum Stalk								****NOTE there is a duplicate of this in DB 13974,13975
		end
		if(e.message:findi("BR226")) then --226 - Qeynos Afternoon Tea
			e.other:SummonItem(9759,20); --Bayle's Delight
			e.other:SummonItem(9650,20); --Celestial Essence
			e.other:SummonItem(9726,20); --Cream
			e.other:SummonItem(14239,20); --Eucalyptus Leaf
			e.other:SummonItem(14915,20); --Tea Leaves
			e.other:SummonItem(13006,20); --Water Flask
		end
		if(e.message:findi("BR248")) then --248 - Minotaur Hero's Brew
			e.other:SummonItem(16580,20); --Cask
			e.other:SummonItem(16595,20); --Malt
			e.other:SummonItem(13032,20); --Short Beer
			e.other:SummonItem(13006,20); --Water Flask
			e.other:SummonItem(16596,20); --Yeast
		end
		
	--FISHING
	elseif(e.message:findi("Fishing")) then
		e.other:Message(13,notready);
		
	--FLETCHING
	elseif(e.message:findi("Fletching")) then
		e.other:Message(15,"What skill range max? [FL46] [FL56] [FL68] [FL102] [FL135] [FL182] [FL202]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("FL")) then
		if(e.message:findi("FL46")) then --46 - CLASS 2 Wood Point Arrow (large nock)
			e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
			e.other:SummonItem(8055,20); --Field Point Arrowhead
			e.other:SummonItem(8050,20); --Large Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL56")) then --56 - CLASS 2 Wood Point Arrow (small nock)
			e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
			e.other:SummonItem(8055,20); --Field Point Arrowhead
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL68")) then --68 - CLASS 2 Bone Point Arrow (small nock)
			e.other:SummonItem(8061,20); --Bundled Bone Arrow Shafts
			e.other:SummonItem(8055,20); --Field Point Arrowhead
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL102")) then --102 - CLASS 2 Bone Hooked Arrow (small nock)
			e.other:SummonItem(8061,20); --Bundled Bone Arrow Shafts
			e.other:SummonItem(8056,20); --Hooked Arrowhead
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL135")) then --135 - CLASS 2 Ceramic Hooked Arrow (small nock)
			e.other:SummonItem(8062,20); --Bundled Ceramic Arrow Shafts
			e.other:SummonItem(8056,20); --Hooked Arrowhead
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL182")) then --182 - CLASS 2 Wood Silver Tip Arrow (small nock)
			e.other:SummonItem(8060,20); --Bundled Wooden Arrow Shafts
			e.other:SummonItem(8057,20); --Silver Tipped Arrowheads
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		if(e.message:findi("FL202")) then --202 - CLASS 2 Steel Silver Tip Arrow (small nock)
			e.other:SummonItem(8063,20); --Bundled Steel Arrow Shafts
			e.other:SummonItem(8057,20); --Silver Tipped Arrowheads
			e.other:SummonItem(8052,20); --Small Groove Nocks
			e.other:SummonItem(8065,20); --Several Parabolic Cut Fletchings
		end
		
	--JEWELCRAFT
	elseif(e.message:findi("Jewelcraft")) then
		e.other:Message(15,"What skill range max? [JC17] [JC30] [JC40] [JC50] [JC60] [JC74] [JC92] [JC106] [JC119] [JC132] [JC146] [JC164] [JC178] [JC191] [JC204] [JC218] [JC236] [JC250]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("JC")) then
		if(e.message:findi("JC17")) then --
			e.other:SummonItem(16500,20); --silver bar 17 to 63
			e.other:SummonItem(10015,20); --Malachite
		end
		if(e.message:findi("JC30")) then --
			e.other:SummonItem(16500,20); --silver bar 17 to 63
			e.other:SummonItem(10020,20); --Jasper
		end
		if(e.message:findi("JC40")) then --
			e.other:SummonItem(16500,20); --silver bar 17 to 63
			e.other:SummonItem(10023,20); --Jade
		end
		if(e.message:findi("JC50")) then --
			e.other:SummonItem(16500,20); --silver bar 17 to 63
			e.other:SummonItem(10030,20); --Opal
		end
		if(e.message:findi("JC60")) then --
			e.other:SummonItem(16500,20); --silver bar 17 to 63
			e.other:SummonItem(10034,20); --Sapphire
		end
		if(e.message:findi("JC74")) then --
			e.other:SummonItem(16501,20); --electrum bar 74 to 135
			e.other:SummonItem(10015,20); --Malachite
		end
		if(e.message:findi("JC92")) then --
			e.other:SummonItem(16501,20); --electrum bar 74 to 135
			e.other:SummonItem(10020,20); --Jasper
		end
		if(e.message:findi("JC106")) then --
			e.other:SummonItem(16501,20); --electrum bar 74 to 135
			e.other:SummonItem(10023,20); --Jade
		end
		if(e.message:findi("JC119")) then --
			e.other:SummonItem(16501,20); --electrum bar 74 to 135
			e.other:SummonItem(10030,20); --Opal
		end
		if(e.message:findi("JC132")) then --
			e.other:SummonItem(16501,20); --electrum bar 74 to 135
			e.other:SummonItem(10034,20); --Sapphire
		end
		if(e.message:findi("JC146")) then --
			e.other:SummonItem(16502,20); --gold bar 146 to 207
			e.other:SummonItem(10015,20); --Malachite
		end
		if(e.message:findi("JC164")) then --
			e.other:SummonItem(16502,20); --gold bar 146 to 207
			e.other:SummonItem(10020,20); --Jasper
		end
		if(e.message:findi("JC178")) then --
			e.other:SummonItem(16502,20); --gold bar 146 to 207
			e.other:SummonItem(10023,20); --Jade
		end
		if(e.message:findi("JC191")) then --
			e.other:SummonItem(16502,20); --gold bar 146 to 207
			e.other:SummonItem(10030,20); --Opal
		end
		if(e.message:findi("JC204")) then --
			e.other:SummonItem(16502,20); --gold bar 146 to 207
			e.other:SummonItem(10034,20); --Sapphire
		end
		if(e.message:findi("JC218")) then --
			e.other:SummonItem(16503,20); --platinum bar 218 to 279
			e.other:SummonItem(10015,20); --Malachite
		end
		if(e.message:findi("JC236")) then --
			e.other:SummonItem(16503,20); --platinum bar 218 to 279
			e.other:SummonItem(10020,20); --Jasper
		end
		if(e.message:findi("JC250")) then --
			e.other:SummonItem(16503,20); --platinum bar 218 to 279
			e.other:SummonItem(10023,20); --Jade
		end
		
	--POISON
	elseif(e.message:findi("Poison")) then
		e.other:Message(13,notready);
		
	--POTTERY
	elseif(e.message:findi("Pottery")) then
		e.other:Message(13,notready);
		
	--SMITHING
	elseif(e.message:findi("Smithing")) then
		e.other:Message(13,notready);
		
	--TAILORING
	elseif(e.message:findi("Tailoring")) then
		e.other:Message(15,"What skill range max? [TR15] [TR26] [TR31] [TR36] [TR56] [TR82] [TR88] [TR108] [TR135] [TR151] [TR158] [TR229] [TR295]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("TR")) then
		if(e.message:findi("TR15")) then --15 - silk swatches
			e.other:SummonItem(13041,20); --spider silk
		end
		if(e.message:findi("TR26")) then --26 - Tattered mask
			e.other:SummonItem(13782,20); --Ruined wolf pelt
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR31")) then --31 - Leather padding
			e.other:SummonItem(16486,20); --silk thread
			e.other:SummonItem(13753,20); --low quality wolf skin
		end
		if(e.message:findi("TR36")) then --36 - Raw silk mask
			e.other:SummonItem(16482,20); --silk swatch
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR56")) then --56 - Studded mask
			e.other:SummonItem(13754,20); --medium quality wolf skin
			e.other:SummonItem(12072,20); --studs
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR82")) then --82 - Cured silk mask
			e.other:SummonItem(16482,20); --silk swatch
			e.other:SummonItem(16480,20); --heady kiola
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR88")) then --88 - Tailored backpack
			e.other:SummonItem(13752,20); --high quality bear skin
			e.other:SummonItem(12089,20); --backpack pattern
		end
		if(e.message:findi("TR108")) then --108 - Reinforced mask
			e.other:SummonItem(13755,20); --high quality wolf skin
			e.other:SummonItem(12073,20); --steel boning
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR135")) then --135 - Wu's fighting mask
			e.other:SummonItem(16482,20); --silk swatch
			e.other:SummonItem(16480,20); --heady kiola
			e.other:SummonItem(10250,20); --vial of viscous mana
			e.other:SummonItem(13802,20); --mask pattern
		end
		if(e.message:findi("TR151")) then --151 - Wu's fighting sleeves
			e.other:SummonItem(16482,20); --silk swatch
			e.other:SummonItem(16480,20); --heady kiola
			e.other:SummonItem(10250,20); --vial of viscous mana
			e.other:SummonItem(13808,20); --sleeve pattern
		end
		if(e.message:findi("TR158")) then --158 - Wu's fighting shirt
			e.other:SummonItem(16482,20); --silk swatch
			e.other:SummonItem(16480,20); --heady kiola
			e.other:SummonItem(10250,20); --vial of viscous mana
			e.other:SummonItem(13804,20); --tunic pattern
		end
		if(e.message:findi("TR229")) then --229 - Tae Ew Leather Gloves
			e.other:SummonItem(27761,2); --hardened lizard hide
			e.other:SummonItem(13810,2); --glove pattern
		end
		if(e.message:findi("TR295")) then --295 - Tae Ew Leather Pants
			e.other:SummonItem(27761,2); --hardened lizard hide
			e.other:SummonItem(13811,2); --pant pattern
		end
		
	--TINKERING
	elseif(e.message:findi("Tinkering")) then
		e.other:Message(15,"What skill range max? [TK68] [TK95] [TK102] [TK122] [TK148] [TK175]");
		e.other:Message(15,warningRoom);
	elseif(e.message:findi("TK")) then
		if(e.message:findi("TK68")) then --68 - Flameless Lantern
			e.other:SummonItem(13004,20); --Large Lantern
			e.other:SummonItem(16857,20); --Metal Twine
			e.other:SummonItem(16881,20); --Firewater
		end
		if(e.message:findi("TK95")) then --95 - Spyglass
			e.other:SummonItem(16863,20); --Collapsible Fishing Pole
			e.other:SummonItem(16598,20); --Bottle
			e.other:SummonItem(16857,20); --Metal Twine
			e.other:SummonItem(16850,20); --Metal Rod
			e.other:SummonItem(16860,20); --Reflective Shard
		end
		if(e.message:findi("TK102")) then --102 - Stalking Probes
			e.other:SummonItem(16858,20); --Gears
			e.other:SummonItem(16598,20); --Bottle
			e.other:SummonItem(16850,20); --Metal Rod
			e.other:SummonItem(16881,20); --Firewater
		end
		if(e.message:findi("TK122")) then --122 - Power Gloves
			e.other:SummonItem(16858,20); --Gears
			e.other:SummonItem(16881,20); --Firewater
			e.other:SummonItem(16857,20); --Metal Twine
			e.other:SummonItem(16859,20); --Sprockets
			e.other:SummonItem(16854,20); --Steel Lined Gloves
		end
		if(e.message:findi("TK148")) then --148 - Aqualung
			e.other:SummonItem(16890,20); --Fine Coral Mesh
			e.other:SummonItem(16862,20); --Silk Lined Steel Helm
			e.other:SummonItem(16857,20); --Metal Twine
			e.other:SummonItem(16850,20); --Metal Rod
			e.other:SummonItem(16861,20); --Gnomish Bolts
			e.other:SummonItem(13019,20); --Fresh Fish
		end
		if(e.message:findi("TK175")) then --175 - Rebreathers
			e.other:SummonItem(16873,20); --Aqualung
			e.other:SummonItem(16892,20); --Lime Coated Meshing
			e.other:SummonItem(16891,20); --Sharkskin Tubing
			e.other:SummonItem(4001,20); --Platemail Helm
			e.other:SummonItem(16881,20); --Firewater
			e.other:SummonItem(16888,20); --Metal Fastening
		end
		
	--TLs
	elseif(e.message:findi("port")) then
		e.other:Message(13,pvp);
		e.other:Message(18,nc);
		e.other:Message(15,lvl1);
		if(e.other:GetLevel() > 4 and e.other:Admin() < 80) then
			e.other:Message(15,lvl5);
		end
		if(e.other:GetLevel() > 9 and e.other:Admin() < 80) then
			e.other:Message(15,lvl10);
		end
		if(e.other:GetLevel() > 14 and e.other:Admin() < 80) then
			e.other:Message(15,lvl15);
		end
		if(e.other:GetLevel() > 19 and e.other:Admin() < 80) then
			e.other:Message(15,lvl20);
		end
		if(e.other:GetLevel() > 24 and e.other:Admin() < 80) then
			e.other:Message(15,lvl25);
		end
		if(e.other:GetLevel() > 29 and e.other:Admin() < 80) then
			e.other:Message(15,lvl30);
		end
		if(e.other:GetLevel() > 34 and e.other:Admin() < 80) then
			e.other:Message(15,lvl35);
		end
		if(e.other:GetLevel() > 44 and e.other:Admin() < 80) then
			e.other:Message(15,lvl45);
		end
		if(e.other:Admin() > 79) then
			e.other:Message(15,lvl5);
			e.other:Message(15,lvl10);
			e.other:Message(15,lvl15);
			e.other:Message(15,lvl20);
			e.other:Message(15,lvl25);
			e.other:Message(15,lvl30);
			e.other:Message(15,lvl35);
			e.other:Message(15,lvl45);
		end
		
	--PVP Port
	elseif(e.message:findi("arena")) then
		e.other:MovePC(77,-817,-11,11,0);	
	
	--NO COMBAT PORTS
	elseif(e.message:findi("erudnext")) then
		e.other:MovePC(24,-338,75,20,0);
	elseif(e.message:findi("erudnint")) then
		e.other:MovePC(23,808,712,21,0);
	elseif(e.message:findi("felwithea")) then
		e.other:MovePC(61,94,-25,3,0);
	elseif(e.message:findi("felwitheb")) then
		e.other:MovePC(62,-790,320,-10,0);
	elseif(e.message:findi("freporte")) then
		e.other:MovePC(10,-648,-1097,-52.2,0);
	elseif(e.message:findi("freportn")) then
		e.other:MovePC(8,211,-296,4,0);
	elseif(e.message:findi("freportw")) then
		e.other:MovePC(9,181,335,-24,0);
	elseif(e.message:findi("grobb")) then
		e.other:MovePC(52,0,-100,3,0);
	elseif(e.message:findi("halas")) then
		e.other:MovePC(29,0,0,3,0);
	elseif(e.message:findi("kaladima")) then
		e.other:MovePC(60,-2,-18,3,0);
	elseif(e.message:findi("kaladimb")) then
		e.other:MovePC(67,-267,414,3.75,0);
	elseif(e.message:findi("neriaka")) then
		e.other:MovePC(40,157,-3,31,0);
	elseif(e.message:findi("neriakb")) then
		e.other:MovePC(41,-500,3,-10,0);
	elseif(e.message:findi("neriakc")) then
		e.other:MovePC(42,-969,892,-52,0);
	elseif(e.message:findi("paineel")) then
		e.other:MovePC(75,200,800,3,0);
	elseif(e.message:findi("qeynos")) then
		e.other:MovePC(1,0,10,5,0);
	elseif(e.message:findi("qeynos2")) then
		e.other:MovePC(2,-74,428,3,0);
	elseif(e.message:findi("rivervale")) then
		e.other:MovePC(19,0,0,4,0);
	elseif(e.message:findi("soltemple")) then
		e.other:MovePC(80,36,262,0,0);
		
	--LEVEL 1-4 ports
	elseif(e.message:findi("akanon")) then
		e.other:MovePC(55,-35,47,4,0);
	elseif(e.message:findi("butcher")) then
		e.other:MovePC(68,-700,2550,3,0);
	elseif(e.message:findi("everfrost")) then
		e.other:MovePC(30,629,3139,-60,0);
	elseif(e.message:findi("feerott")) then
		e.other:MovePC(47,905,1051,25,0);
	elseif(e.message:findi("gfaydark")) then
		e.other:MovePC(54,10,-20,0,0);
	elseif(e.message:findi("innothule")) then
		e.other:MovePC(46,-588,-2192,-25,0);
	elseif(e.message:findi("misty")) then
		e.other:MovePC(33,0,0,2.43,0);
	elseif(e.message:findi("nektulos")) then
		e.other:MovePC(25,-279,-1201,-5,0);
	elseif(e.message:findi("qcat")) then
		e.other:MovePC(45,80,860,-38,0);
	elseif(e.message:findi("steamfont")) then
		e.other:MovePC(56,-272.86,159.86,-21.4,0);
	elseif(e.message:findi("tox")) then
		e.other:MovePC(38,203,2295,-45,0);
		
	--LEVEL 5-9 ports
	elseif(e.message:findi("blackburrow") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(17,39,-159,3,0);
	elseif(e.message:findi("crushbone") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(58,158,-644,4,0);
	elseif(e.message:findi("ecommons") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(22,-1485,9.2,-51,0);
	elseif(e.message:findi("guktop") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(65,7,-36,4,0);
	elseif(e.message:findi("erudsxing") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(98,795,-1767,11,0);
	elseif(e.message:findi("qeytoqrg") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(4,83,508,0,0);
	elseif(e.message:findi("befallen") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(36,35,-82,3,0);
	elseif(e.message:findi("sro") and (e.other:GetLevel() > 4)) then
		e.other:MovePC(35,286,1265,79,0);
		
	--LEVEL 10-14 ports
	elseif(e.message:findi("cauldron") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(70,320,2815,473,0);
	elseif(e.message:findi("kerraridge") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(74,-859.97,474.96,23.75,0);
	elseif(e.message:findi("kithicor") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(20,3828,1889,459,0);
	elseif(e.message:findi("northkarana") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(13,-382,-284,-8,0);
	elseif(e.message:findi("nro") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(34,299.12,3537.9,-24.5,0);
	elseif(e.message:findi("oot") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(69,-9200,390,6,0);
	elseif(e.message:findi("qey2hh1") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(12,-531,15,-3,0);
	elseif(e.message:findi("qrg") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(3,0,0,2,0);
	elseif(e.message:findi("unrest") and (e.other:GetLevel() > 9)) then
		e.other:MovePC(63,52,-38,3,0);
		
	--LEVEL 15-19 ports
	elseif(e.message:findi("oasis") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(37,903.98,490.03,6.4,0);
	elseif(e.message:findi("beholder") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(16,-21.44,-512.23,45.13,0);
	elseif(e.message:findi("commons") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(21,-1334.24,209.57,-51.47,0);
	elseif(e.message:findi("highpass") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(5,-104,-14,4,0);
	elseif(e.message:findi("lakerathe") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(51,1213,4183,3,0);
	elseif(e.message:findi("lavastorm") and (e.other:GetLevel() > 14)) then
		e.other:MovePC(27,154,-1833,-15,0);
		
	--LEVEL 20-24 ports
	elseif(e.message:findi("eastkarana") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(15,865,15,-33,0);
	elseif(e.message:findi("lfaydark") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(57,-1770,-108,0,0);
	elseif(e.message:findi("mistmoore") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(59,120,-330,-178,0);
	elseif(e.message:findi("runnyeye") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(11,201,90,4,0);
	elseif(e.message:findi("southkarana") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(14,1294,2348,-6,0);
	elseif(e.message:findi("najena") and (e.other:GetLevel() > 19)) then
		e.other:MovePC(44,858,-76,4,0);
		
	--LEVEL 25-29 ports
	elseif(e.message:findi("highkeep") and (e.other:GetLevel() > 24)) then
		e.other:MovePC(6,88,-16,4,0);
	elseif(e.message:findi("rathemtn") and (e.other:GetLevel() > 24)) then
		e.other:MovePC(50,1831,3825,28,0);
	elseif(e.message:findi("soldunga") and (e.other:GetLevel() > 24)) then
		e.other:MovePC(31,-486,-476,73,0);
		
	--LEVEL 30-34 ports
	elseif(e.message:findi("paw") and (e.other:GetLevel() > 29)) then
		e.other:MovePC(18,63,-122,3,0);
		
	--LEVEL 35-44 ports
	elseif(e.message:findi("gukbottom") and (e.other:GetLevel() > 34)) then
		e.other:MovePC(66,-217,1197,-78,0);
	elseif(e.message:findi("permafrost") and (e.other:GetLevel() > 34)) then
		e.other:MovePC(73,61,-121,2,0);
		
	--LEVEL 45+ ports
	elseif(e.message:findi("kedge") and (e.other:GetLevel() > 44)) then
		e.other:MovePC(64,14,100,302,0);
	elseif(e.message:findi("oggok") and (e.other:GetLevel() > 44)) then
		e.other:MovePC(49,-99,-345,4,0);
	elseif(e.message:findi("soldungb") and (e.other:GetLevel() > 44)) then
		e.other:MovePC(32,-263,-424,-108,0);
	
	elseif(e.message:findi("home")) then
		e.self:CastSpell(1422,e.other:GetID(),0,1);
		
	elseif(e.message:findi("bind")) then
		e.self:Say("Binding your soul. You will return here when you die.");
		e.self:CastSpell(2049,e.other:GetID(),0,1);

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
		e.other:Message(15,"have fun");
		eq.set_global("platz",tostring(pcountAdd),9,"F");
		
	--BUFFS
	elseif(e.message:findi("hpbuff")) then
		e.self:CastSpell(3692,e.other:GetID(),0,1);
	elseif(e.message:findi("manabuff")) then
		e.self:CastSpell(697,e.other:GetID(),0,1);
	
	--OTHER
	elseif(e.message:findi("corpses")) then
		randX = math.random(-10,10) + e.self:GetX();
		randY = math.random(-10,10) + e.self:GetY();
		randH = math.random(720);
		eq.summon_all_player_corpses(e.other:CharacterID(),randX,randY,e.self:GetZ(),randH);
		
	elseif(e.message:findi("fireworks")) then
		e.other:SummonItem(8990,20);
		e.other:SummonItem(16877,20);
		e.other:SummonItem(16878,20);
		e.other:SummonItem(16879,20);
		e.other:SummonItem(16880,20);
	
	elseif(e.message:findi("colors") and e.other:Admin() > 79) then
		e.other:Message(1,"1 grey");
		e.other:Message(2,"2 dark green");
		e.other:Message(3,"3 grey");
		e.other:Message(4,"4 dark blue");
		e.other:Message(5,"5 pink");
		e.other:Message(6,"6 light grey");
		e.other:Message(7,"7 white");
		e.other:Message(8,"8 grey");
		e.other:Message(9,"9 grey");
		e.other:Message(10,"10 white");
		e.other:Message(11,"11 grey");
		e.other:Message(12,"12 lighter grey");
		e.other:Message(13,"13 red");
		e.other:Message(14,"14 green");
		e.other:Message(15,"15 yellow");
		e.other:Message(16,"16 dark blue");
		e.other:Message(17,"17 grey");
		e.other:Message(18,"18 light blue");
		e.other:Message(19,"19 grey");
		e.other:Message(20,"20 white");
	end
end
