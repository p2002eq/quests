function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Oh hello there, I'm in charge of the docks here and wife to Alton.");
	end
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
	if(e.message:findi("None")) then
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5850, item2 = 5849, item3 = 5848, item4 = 4489})) then
		e.other:SummonItem(3957);
		e.self:Emote("smiles at you.");
		e.self:Say("Thank You! Here is your payment.");
		e.other:AddEXP(25000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5844, item2 = 5698, item3 = 4492, item4 = 5699})) then
		e.other:SummonItem(3954);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5981, item3 = 5847})) then
		e.other:SummonItem(3956);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5845, item2 = 4493, item3 = 5846})) then
		e.other:SummonItem(3955);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5690, item2 = 4488, item3 = 5691})) then
		e.other:SummonItem(3950);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5696, item3 = 5697})) then
		e.other:SummonItem(3953);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
