function event_say(e)
	if(e.message:findi("Hail")) then
		e.self.Say("OH HI! This is soooo boring, I wish I had something else to do.");
	end
	if(e.message:findi("armor")) then
		e.self.Say("Oh you want me to make some armor? If you're a druid I could make you some.");
	end
	if(e.message:findi("I am a druid")) then
		e.self.Say("can make you a cap, tunic, sleeves, leggings, mantle, bracer, and boots. If you want other druid armor you'll have to talk to Edgar.");
	end
	if(e.message:findi("cap")) then
		e.self.Say("For the earth blessed cap you will have to go get me a moon jewel, a mark of the wild, a braided vine bracelet, and an aged dark wood shaft.");
	end
	if(e.message:findi("tunic")) then
		e.self.Say("For the earth blessed tunic you will have to go get me a star jewel, a mark of nature, a primal earth rune, and a growth stone.");
	end
	if(e.message:findi("sleeves")) then
		e.self.Say("For the earth blessed sleeves you will have to go get me a cloud jewel, a mark of vitality, an etched diamond of nature, and a storm filled vial.");
	end
	if(e.message:findi("leggings")) then
		e.self.Say("For the earth blessed leggings you will have to go get me a sky jewel, a mark of life, an etched emerald of nature, and a sack of purified soil.");
	end
	if(e.message:findi("mantle")) then
		e.self.Say("For the earth blessed mantle you will have to go get me a meteor jewel, a mark of regeneration, and an etched sapphire of nature.");
	end
	if(e.message:findi("bracer")) then
		e.self.Say("For the earth blessed bracer you will have to go get me an astral jewel, a mark of growth, and an etched ruby of nature.");
	end
	if(e.message:findi("boots")) then
		e.self.Say("For the earth blessed boots you will have to go get me a sun jewel, a mark of weather, and an etched star ruby of nature.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4961, item3 = 4962, item4 = 4992})) then
		e.other:SummonItem(3762);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4993, item3 = 4994, item4 = 4995})) then
		e.other:SummonItem(3763);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4996, item3 = 4997, item4 = 4998})) then
		e.other:SummonItem(3764);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4999, item3 = 5000, item4 = 5068})) then
		e.other:SummonItem(3765);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5069, item3 = 5079})) then
		e.other:SummonItem(3766);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5089, item3 = 5094})) then
		e.other:SummonItem(3767);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5095, item3 = 5096})) then
		e.other:SummonItem(3768);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
