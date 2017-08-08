---- Twilight Armor - Shadow Knight
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Can't ya see I'm busy working.  Leave me be.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Bah, Brodlan should know better than opening his big mouth. Anyway, this looks like armor for a dark knight if ye want to [" .. eq.say_link("trade") .. "] for it.");
	elseif(e.message:findi("trade")) then
		e.self:Say("Good ya want to trade. I have the [" .. eq.say_link("mask") .. "], [" .. eq.say_link("cloak") .. "], [" .. eq.say_link("gauntlets") .. "], [" .. eq.say_link("gorget") .. "], [" .. eq.say_link("girdle") .. "], and [" .. eq.say_link("mace") .. "]. Just tell me what piece you want to trade for and Ill tell ya what I want.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the darkened knight's cloak you'll have to bring me a cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the darkened knight's gauntlets you'll have bring me a sky jewel, a mark of fright, and a true silver idol");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the darkened knight's girdle you'll have to bring me an astral jewel, a mark of gloom, some gilded beads, and an etched tablet.");
	elseif(e.message:findi("gorget")) then
		e.self:Say("For the darkened knigh's gorget you'll have to bring me a meteor jewel, a mark of darkness, a runed stone brazier.");
	elseif(e.message:findi("mace")) then
		e.self:Say("For the darkened knight's mace you'll have to bring me a sun jewel, a mark of night, a beaded circlet, and a heating stone.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the darkened knight's mask you'll have to bring me a star jewel, a mark of dark fate, and a crystalline idol.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5875, item3 = 5876, item4 = 5877})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3967,10000); -- Darkened Knights Cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5880, item3 = 5881})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3969,10000); -- Darkened Knights Gorget
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5878, item3 = 5879})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3968,10000); -- Darkened Knights Gauntlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5882, item3 = 5883, item4 = 5884})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3970,10000); -- Darkened Knights Girdle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5885, item3 = 5886, item4 = 5887})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3971,10000); -- Darkened Knights Mace
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5873, item3 = 5874})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3966,10000); -- Darkened Knights Mask
	end
	item_lib.return_items(e.self, e.other, e.trade)
end