function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Twilight Sea!  This is the docking entrance to Katta Castellum. ".. e.other:GetName() .. ". Tell me do you know any songs?");
	end
	if(e.message:findi("i know some songs")) then
		e.self:Say("Ah you do. You don't happen to be a bard do you?");
	end
	if(e.message:findi("i am a bard")) then
		e.self:Say("Great. I have just what you need. Would you like to earn some armor?");
	end
	if(e.message:findi("i would like to earn some armor")) then
		e.self:Say("I thought so I have a [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. For the rest speak to Brolan over there about armor.");
	end
	if(e.message:findi("what breastplate")) then
		e.self:Say("For the breastplate you must bring me an astral jewel. a mark of music. a diamond studded medal. and a glorious flower.");
	end
	if(e.message:findi("what vambracers")) then
		e.self:Say("For the vambraces you must bring me a sun jewel. a mark of entertainment. a sapphire studded medal. and velvet sleeves.");
	end
	if(e.message:findi("what greaves")) then
		e.self:Say("For the greaves you must bring me a moon jewel. a mark of the drum. an emerald studded medal. and memory crystal.");
	end
	if(e.message:findi("what pauldrons")) then
		e.self:Say("For the pauldrons you must bring me a star jewel. a mark of the mandolin. and an opal studded medal.");
	end
	if(e.message:findi("what bracer")) then
		e.self:Say("For the bracer you must bring me a cloud jewel. a mark of song. and a pearl studded medal.");
	end
	if(e.message:findi("what boots")) then
		e.self:Say("For the boots you must bring me a sky jewel. a mark of poetry. and a star ruby studded medal.");
	end
	if(e.message:findi("helm")) then
		e.self:Say("For the helm you must bring me a meteor jewel, a mark of rhythm, a ruby studded medal, and a fancy necklace.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5347, item2 = 4492, item3 = 534})) then
		e.other:SummonItem(3909);
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("here, you have earned this");
		e.other:AddEXP(50000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5346, item2 = 5345, item3 = 4491})) then
		e.other:SummonItem(3908);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5335, item3 = 5336, item4 = 5334})) then
		e.other:SummonItem(3898);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5431, item2 = 5340, item3 = 5342, item4 = 4489})) then
		e.other:SummonItem(3900);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5343, item2 = 5344, item3 = 4490})) then
		e.other:SummonItem(3907);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5337, item2 = 5338, item3 = 4488, item4 = 5339})) then
		e.other:SummonItem(3899);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5330, item2 = 5328, item3 = 4493, item4 = 5329})) then
		e.other:SummonItem(3897);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
