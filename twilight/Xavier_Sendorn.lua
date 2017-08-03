---- Twilight Armor - Enchanter
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hey there!");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh, you've decided you're going to help Lara out with her visions? If so I can reward you with armor if you happen to be an [" .. eq.say_link("enchanter") .. "].");
	elseif(e.message:findi("enchanter")) then
		e.self:Say("I have the [" .. eq.say_link("sandals") .. "], [" .. eq.say_link("mask") .. "], [" .. eq.say_link("cloak") .. "], [" .. eq.say_link("gloves") .. "], [" .. eq.say_link("choker") .. "], [" .. eq.say_link("belt") .. "], and [" .. eq.say_link("staff") .. "].");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you must get for me a meteor jewel, a mark of refinement, and a hope onyx.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask you must get for me an astral jewel, a mark of charm, and a hope pearl.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak you must get for me a sun jewel, a mark of desire, a hope diamond, and a tarnished silver nugget.");
	elseif(e.message:findi("gloves")) then
		e.self:Say("For the gloves you must get for me a moon jewel, a mark of intellect, and a tarnished gold nugget.");
	elseif(e.message:findi("choker")) then
		e.self:Say("For the choker you must get for me a star jewel, a mark of thought, and a tarnished platinum nugget.");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt you must get for me a cloud jewel, a mark of reason, a tarnished electrum nugget, and a friendship bracelet.");
	elseif(e.message:findi("staff")) then
		e.self:Say("For the staff you must get for me a sky jewel, a mark of mind, an enchanted bundle of wood, and a shadow crystal.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4691, item3 = 4692})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3703,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4693, item3 = 4694})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3704,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4695, item3 = 4696, item4 = 4697})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3705,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4698, item3 = 4699})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3706,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4701, item3 = 4702})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3707,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4703, item3 = 4704, item4 = 4705})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3708,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4706, item3 = 4707, item4 = 4708})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3709,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end