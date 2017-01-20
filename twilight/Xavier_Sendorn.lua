function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Hey there!");
	end
	if(e.message:findi("None")) then
		e.self.Say("Oh, youve decided your going to help Lara out with her visions? If so I can reward you with armor if you happen to be an enchanter.");
	end
	if(e.message:findi("None")) then
		e.self.Say("I have the sandals, mask, cloak, gloves, choker, belt, and staff. ");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the sandals you must get for me a meteor jewel, a mark of refinement, and a hope onyx.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the mask you must get for me an astral jewel, a mark of charm, and a hope pearl.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the cloak you must get for me a sun jewel, a mark of desire, a hope diamond, and a tarnished silver nugget.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the gloves you must get for me a moon jewel, a mark of intellect, and a tarnished gold nugget.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the choker you must get for me a star jewel, a mark of thought, and a tarnished platinum nugget.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the belt you must get for me a cloud jewel, a mark of reason, a tarnished electrum nugget, and a friendship bracelet.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the staff you must get for me a sky jewel, a mark of mind, an enchanted bundle of wood, and a shadow crystal.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4691, item3 = 4692})) then
		e.other:SummonItem(3703);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4693, item3 = 4694})) then
		e.other:SummonItem(3704);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4695, item3 = 4696, item4 = 4697})) then
		e.other:SummonItem(3705);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4698, item3 = 4699})) then
		e.other:SummonItem(3706);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4701, item3 = 4702})) then
		e.other:SummonItem(3707);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4703, item3 = 4704, item4 = 4705})) then
		e.other:SummonItem(3708);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4706, item3 = 4707, item4 = 4708})) then
		e.other:SummonItem(3709);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
