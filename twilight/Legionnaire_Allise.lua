function event_say(e)
	if(e.message:findi("armor")) then
		e.self:Say("Valana must have sent you here. Tell me are you a monk?");
	end
	if(e.message:findi("i am a monk")) then
		e.self:Say("Good the pieces I have are the veil, cloak, hand wraps, choker, belt, and a bo stick.");
	end
	if(e.message:findi("veil")) then
		e.self:Say("To receive the veil you must retrieve for me a sun jewel, a mark of discipline, and some oiled scales.");
	end
	if(e.message:findi("cloak")) then
		e.self:Say("To receive the cloak you must retrieve for me a moon jewel, a mark of training, a scorched idol, and a gem of longevity.");
	end
	if(e.message:findi("hand wraps")) then
		e.self:Say("To receive the hand wraps you must retrieve for me a star jewel, a mark of rank, and a golden gem.");
	end
	if(e.message:findi("choker")) then
		e.self:Say("To receive the choker you must retrieve for me a cloud jewel, a mark of aggression, and some sun fiend bones.");
	end
	if(e.message:findi("belt")) then
		e.self:Say("To receive the belt you must retrieve for me a sky jewel, a mark of defense, a protector gem, and an indigo sapphire.");
	end
	if(e.message:findi("bo stick")) then
		e.self:Say("To receive the bo stick you must retrieve for me a meteor jewel, a mark of the dragon, an embedded gravel tablet, and a gilded wrist chain.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5254, item3 = 5255})) then
		e.other:SummonItem(3782);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5256, item3 = 5257, item4 = 5258})) then
		e.other:SummonItem(3783);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5529, item3 = 5260})) then
		e.other:SummonItem(3784);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5261, item3 = 5262})) then
		e.other:SummonItem(3785);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5263, item3 = 5264, item4 = 5266})) then
		e.other:SummonItem(3786);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5265, item3 = 5267, item4 = 5268})) then
		e.other:SummonItem(3787);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
