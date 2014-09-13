-- Quest for Staff of Temperate Flux and Weeping Wand
-- Quest for Bard Lambent Sapphire

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("I am Gardern, listed among the chosen of Solusek Ro.  I hold the lore to the [Staff of Temperate Flux] and the [Weeping Wand] - items coveted by my Wizardly brethren.");
	elseif(e.message:findi("staff of temperate flux")) then
		e.self:Say("The Staff of Temperate Flux is a boon to those who dabble in the elemental arts, for it can increase the susceptibility of a creature to both fire and cold.  Are you [interested in the staff]?");
	elseif(e.message:findi("interested in the staff")) then
		e.self:Say("I will craft you a Staff of Temperate Flux, but you must bring me the components which I require to make it.  I will need a Heart of Fire from an Inferno Goblin Wizard in the Caverns of Solusek, a Heart of Frost from a Goblin Wizard in the Caverns of Permafrost, a Rod of Bone from a Stone Skeleton by the shores of Lake Rathe and a Staff of Ro.  Bring me these items, and I will make you your staff.");
	elseif(e.message:findi("weeping wand")) then
		e.self:Say("The Weeping Wand is a fine item for a Wizard - it can aid as a focus for concentration, and, if needed, be used to parry as well.  Are you [interested in the wand]?");
	elseif(e.message:findi("interested in the wand")) then
		e.self:Say("I can make you a Weeping Wand, but you will need to bring me certain components.  I will need a Silver Wand from a Silvered Guard in the Temple Cazic Thule, A Bloodblack Wand from the Mountains of Rathe, Twice-Woven Silk from a Faerie Guard in Faydark and a Scepter of Sorrow from the Tomb in Castle Mistmoore.  Bring me these items and I will make for you a Weeping Wand.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 10548,item2 = 10549,item3 = 10550,item4 = 6048})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ". Now I will craft your Staff of Temperate Flux, as promised.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,6342,1000); -- Staff
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10551,item2 = 6338, item3 = 10557, item4 = 14364})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ". Now I will craft your Weeping Wand, as promised.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,6341,1000); -- Wand
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10034,item2 = 10034,item3 = 10000})) then
		e.self:Say("Ahh, Genni must have sent you to me.  Very well, here is your Lambent Sapphire.");
		e.other:Faction(320,5);
		e.other:Faction(291,-5);
		e.other:QuestReward(e.self,0,0,0,0,10119,1000); -- Bard Lambent Stone
	end
end

-- Quest edited by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------