function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Hiya, I be a fishin', what ya need somethin?");
	end
	if(e.message:findi("None")) then
		e.self.Say("Oh ya want some of the druid equipment that Rilla and I make?");
	end
	if(e.message:findi("None")) then
		e.self.Say("I can make ya a mask, cloak, gloves, talisman, belt, and a crook. Just ask about each one and I'll tell ya what ya need to bring so I can make it.");
	end
	if(e.message:findi("None")) then
		e.self.Say("'For the earth blessed mask you need to bring me a moon jewel, a mark of storms, and an etched fire opal of nature.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the earth blessed cloak you need to bring me a star jewel, a mark of the earth, an etched peridot of nature, and a tablet of wolves.");
	end
	if(e.message:findi("None")) then
		e.self.Say("'For the earth blessed gloves you need to bring me a cloud jewel, a mark of blossoms, and an etched pearl of nature.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the earth blessed talisman you need to bring me a sky jewel, a mark of rain, and an etched opal of nature.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the earth blessed belt you need to bring me a meteor jewel, a mark of flora, an etched onyx of nature, and an ancient writ of nature.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the earth blessed crook you need to bring me an astral jewel, mark of fauna, an etched fire emerald of nautre, and a vial of moon dew.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5097, item3 = 5098})) then
		e.other:SummonItem(3769);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5099, item3 = 5107})) then
		e.other:SummonItem(3770);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5108, item3 = 5109})) then
		e.other:SummonItem(3771);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5110, item3 = 5116})) then
		e.other:SummonItem(3772);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5117, item3 = 5118, item4 = 5119})) then
		e.other:SummonItem(3773);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5129, item3 = 5190, item4 = 5191})) then
		e.other:SummonItem(3774);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
