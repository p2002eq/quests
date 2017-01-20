function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Another traveler to our fair city of Katta Castellum, you be careful now.");
	end
	if(e.message:findi("None")) then
		e.self.Say("Yes I am one of the keepers of the soldier's armor. The pieces I have are the helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. Eandalion keeps the other pieces just ask him about armor.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the boots you will have to bring to me a cloud jewel, a mark of the martial, and a hope ruby.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the bracer you will have to bring to me a star jewel, a mark of the siege, and a blue egg.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the breastplate you will have to bring to me a meteor jewel, a mark of war, a weathered yew wand, and some dew of dawn.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the greaves you will have to bring to me a sun jewel, a mark of archery, a golden torch, and a small meteor fragment.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the helm you will have to bring to me a sky jewel, a mark of battle, some petrified toes, and a fire blossom.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the pauldrons you will have to bring to me a moon jewel, a mark of swordsmanship, and a water blossom.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the vambraces you will have to bring to me an astral jewel, a mark of arms, a small sponge, and a scorched rock.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5496, item3 = 5497})) then
		e.other:SummonItem(3939);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5494, item3 = 5495})) then
		e.other:SummonItem(3938);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5483, item3 = 5484, item4 = 5485})) then
		e.other:SummonItem(3934);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5489, item3 = 5490, item4 = 5491})) then
		e.other:SummonItem(3936);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5480, item3 = 5481, item4 = 5482})) then
		e.other:SummonItem(3788);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5492, item3 = 5493})) then
		e.other:SummonItem(3933);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5486, item3 = 5487, item4 = 5488})) then
		e.other:SummonItem(3935);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
