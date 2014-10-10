-- Enchanter quests

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Sultin - keeper of the three [Incandescent]s of power and the [Rod] of Insidious Glamour. If you are an Enchanter, perhaps we can deal.");
	elseif(e.message:findi("incandescent")) then
		e.self:Say("There are three Incandescent items of power - [Wand], [Mask] and [Gloves]. Are you [interested] in any of them?");
	elseif(e.message:findi("wand")) then
		e.self:Say("Ahh, the Incandescent Wand. If you will get the components to make another, I will give you mine. I will need a Pouch of Silver Dust, found on the dusty Werebat in the Estate of Unrest. I will also need a Silver wand, found on a Silvered Guard in the Temple of Cazic Thule. This wand will not be enchanted - you will need to pay Esmirella of the Northern Karana Gypsy Camp 50 gold to enchant it for you. When the Wand is fully enchanted, bring it and the pouch to me and I will give you the Incandescent Wand.");
	elseif(e.message:findi("mask")) then
		e.self:Say("An item of power - the Incandescent Mask. If you will bring me the components to make another, I will give you an Incandescent Mask. I will need a Glowing Mask, found on the skeletal monk in the caverns of Guk. I will also need all three Runes of Fortune. One Rune can be found on the Dark Elf Enynti in the Chasm below Castle Mistmoore. The other two can each be purchased for 50 golden coins each - one from Mizr N`Mar in the Neriak City Library and the other from Madam Serena in the city of Qeynos. Bring me all three Runes and the Glowing Mask and I will give you your reward.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("My personal favorite - Incandescent Gloves. If you bring me the components to make another pair, I will give you my gloves. Incandescent Gloves are made by sewing together four other sets of gloves. Glowing Gloves can be found on our mortal enemies - the Shadowed Men. Radiant Gloves can be found on Radiant in the Feerrott. Enchanted and Gleaming gloves can be purchased for 50 golden coins from Tizina of the Lavastrom Gypsies and a bloodstone from Tarn Vislin of HighKeep. Bring me all four sets of gloves and I will give you a pair of Incadescent ones.");
	elseif(e.message:findi("rod")) then
		e.self:Say("I am keeper of the Rod of Insidious Glamour - a device of guile and deceit. The rod will increase the Charisma of whomever holds it. Are you [interested] in obtaining the [rod]?");
	elseif(e.message:findi("rod")) then
		e.self:Say("If I am to give you this rod, you must bring me the parts to make another. I will need the Golden Rod from the froglok priest in Guk, as well as a Shining Stone from our mortal enemies, the Shadowed Men. Once you have obtained the Shining Stone, you will need to get it enchanted. Cynthia of the Rathe Mountain Gypsy Clan will enchant the Shining Stone for you - give it to her with 50 golden coins. When the Stone is fully enchanted, bring it and the rod to me and I will give you a Rod of Insidious Glamour.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Rod of Insidious Glamour
	if(item_lib.check_turn_in(e.trade, {item1 = 10087, item2 = 6337})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ".  Here is your reward."); -- Made this text up
		e.other:Faction(320,15);
		e.other:Faction(291,-15);
		e.other:QuestReward(e.self,0,0,0,0,6329,1000);
	end
	-- Incandescent Wand
	if(item_lib.check_turn_in(e.trade, {item1 = 12240, item2 = 6340})) then
		e.self:Say("I see that you are resourceful... you have earned your incandescent wand.");
		e.other:Faction(320,15);
		e.other:Faction(291,-15);
		e.other:QuestReward(e.self,0,0,0,0,6334,1000);
	end
	-- Incandescent Gloves
	if(item_lib.check_turn_in(e.trade, {item1 = 2353, item2 = 2354, item3 = 2355, item4 = 2356})) then
		e.self:Say("Four pairs of gloves you have given me ? I will give you one pair in return. We shall see who had the better deal.");
		e.other:Faction(320,15);
		e.other:Faction(291,-15);
		e.other:QuestReward(e.self,0,0,0,0,2351,1000);
	end
	-- Incandescent Mask
	if(item_lib.check_turn_in(e.trade, {item1 = 2352, item2 = 10530, item3 = 10531, item4 = 10532})) then
		e.self:Say("Fortune favors you .. as will this mask.");
		e.other:Faction(320,15);
		e.other:Faction(291,-15);
		e.other:QuestReward(e.self,0,0,0,0,2350,1000);
	end
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
