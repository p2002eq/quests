---- Twilight Armor - Necromancer
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("smiles briefly. ''Greetings to ye. If you be needin' the goods Ive got 'em.'");
	elseif(e.message:findi("armor")) then
		e.self:Say("Ah yes, I've been trying to get rid of this armor for some time. Do you happen to be a [necromancer]?");
	elseif(e.message:findi("I am a necromancer")) then
		e.self:Say("Very good! I have the [veil], [cloak], [gloves], [choker], [belt], and [staff]. Which do you want?");
	elseif(e.message:findi("veil")) then
		e.self:Say("For the veil of pestilence you will have to go retrieve for me a sky jewel, a jeweled rod, and a bronze brazier.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak of pestilence you will have to go retrieve for me a meteor jewel, a hardened agate, a veiled lantern, and a white garnet.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves of pestilence you will have to go retrieve for me an astral jewel, an antique lantern, and a glowing meteor fragment.");
	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker of pestilence you will have to go retrieve for me a sun jewel, an ancient relic of Tzon, and a fluorescent gem.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt of pestilence you will have to go retrieve for me a moon jewel, an ancestral statuette, some dark hued wood, and an ocher gem.");
	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff of pestilence you will have to go retrieve for me a star jewel, some cultured spirits, some golden mushrooms, and a gem of awe.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4777, item3 = 4778})) then -- Sky Jewel, Jeweled Rod, Bronze Brazier
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3730,10000); -- Veil of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4779, item3 = 4781, item4 = 4782})) then -- Meteor Jewel, Hardened Agate, Veiled Lantern & White Garnet
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3731,10000); -- Cape of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4783, item3 = 4784})) then -- Astral Jewel, Antique Lantern & Glowing Meteor Fragment
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3732,10000); -- Gloves of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4785, item3 = 4786})) then -- Sun Jewel, Ancient Relic of Tzon & Fluorescent Gem
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3733,10000); -- Choker of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4787, item3 = 4788, item4 = 4789})) then -- Moon Jewel, Ancestral Statuette, Dark Hued Wood & Ocher Gem
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3734,10000); -- Belt of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4790, item3 = 4791, item4 = 4792})) then -- Star Jewel, Cultured Spirits, Golden Mushrooms & Gem of Awe
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3735,10000); -- Staff of Pestilence
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
