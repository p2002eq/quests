---- Twilight Armor - Shadow Knight
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why hello. I'm in charge of the fishing operations here on Jern's Isle.  [" .. eq.say_link("Fish") .. "] are my area of expertise.'");
	elseif(e.message:findi("fish")) then
		e.self:Say("We have fish come in here all the time. Sometimes we catch an [" .. eq.say_link("oddity") .. "] now and again.");
	elseif(e.message:findi("oddity")) then
		e.self:Say("Once we pulled up this ancient chest filled with this dark plate [" .. eq.say_link("armor") .. "].");
	elseif(e.message:findi("armor")) then
		e.self:Say("Looked the like kind of armor a dark knight would wear. if ya want it I'm sure we could arrange a [" .. eq.say_link("trade") .. "] of some sort.");
	elseif(e.message:findi("trade")) then
		e.self:Say("Since Trevor and I are the ones that found it we split it between ourselves. I have a [" .. eq.say_link("helm") .. "], [" .. eq.say_link("breastplate") .. "], [" .. eq.say_link("vambraces") .. "], [" .. eq.say_link("greaves") .. "], [" .. eq.say_link("pauldrons") .. "], [" .. eq.say_link("bracer") .. "], and [" .. eq.say_link("boots") .. "]. Ask Trevor about the rest of the armor.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the darkened knight's breastplate fetch me a cloud jewel, a mark of fear, a delicate glass sculpture, and a painted ornament.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the darkened knight's vambraces fetch me a sky jewel, a mark of terror, a runed ornamental mace, and an ancient tablet.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the darkened knight's greaves fetch me a meteor jewel, a mark of dread, the King's Tome, and a polished ivory idol.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the darkened knight's pauldrons fetch me an astral jewel, a mark of hatred, and an ancient petrified tulip.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the darkened knight's bracer fetch me a sun jewel, a mark of intimidation, and a small rough marble figurine.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the darkened knight's boots fetch me a moon jewel, a mark of horror, and a fanged talisman.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the darkened knight's helm fetch me a star jewel, a mark of shadows, a primitive totem, and a golden spoon.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5871, item3 = 5872})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3965,10000); -- Darkened Knights Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5869, item3 = 5870})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3964,10000); -- Darkened Knights Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5857, item3 = 5860, item4 = 5859})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3960,10000); -- Darkened Knights Breastplate
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5864, item3 = 5865, item4 = 5866})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3962,10000); -- Darkened Knights Greaves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5854, item3 = 5855, item4 = 5856})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3959,10000); -- Darkened Knights Helm
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5867, item3 = 5868})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3963,10000); -- Darkened Knights Pauldrons
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5861, item3 = 5862, item4 = 5863})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3961,10000); -- Darkened Knights Vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end