---- Twilight Armor - Monk
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Are you the [monk] that was sent?");
	elseif(e.message:findi("monk")) then
		e.self:Say("'The armor that I have to reward you is a [headband], [gi], [arm wraps], [leggings], [shawl], [wrist wraps], and [sandals]. My friend and guard Allise has the rest. If you wish to speak with her, just ask about the armor.");
	elseif(e.message:findi("headband")) then
		e.self:Say("For the headband you must retrieve for me a sun jewel, a mark of peace, an oblong clay bowl, and a great gem.");
	elseif(e.message:findi("arm wraps")) then
		e.self:Say("For the arm wraps you must retrieve for me a star jewel, a mark of harmony, a triple beaded circlet, and some fresh spring water.");
	elseif(e.message:findi("leggings")) then
		e.self:Say("For the leggings you must retrieve for me a cloud jewel, a mark of meditation, Ralcom's Writ, and a jar of ointment.");
	elseif(e.message:findi("gi")) then
		e.self:Say("For the gi you must retrieve for me a moon jewel, a mark of tranquility, sharpened rock hopper claws, and some etched steel shavings.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl you must retrieve for me a sky jewel, a mark of unity and a pewter figurine.");
	elseif(e.message:findi("wrist wraps")) then
		e.self:Say("For the wrist wraps you must retrieve for me a meteor jewel, a mark of true self, and a coiled steel wire.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals you must retrieve for me an astral jewel, a mark of form, and some spire spirit dust.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5194, item2 = 5192, item3 = 5193, item4 = 4488})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3775,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5197, item2 = 5195, item3 = 4489, item4 = 5196})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3776,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5244, item2 = 5198, item3 = 4490, item4 = 5199})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3777,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5247, item3 = 5245, item4 = 5246})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3778,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5248, item2 = 5249, item3 = 4492})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3779,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5251, item2 = 5250, item3 = 4493})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3780,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5252, item3 = 5253})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3781,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
