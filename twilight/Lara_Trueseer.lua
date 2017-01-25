function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hey there!");
	end
	if(e.message:findi("armor")) then
		e.self:Emote("Lara Trueseer grimaces in pain. 'The visions are so strong they hurt...please make them stop..'");
	end
	if(e.message:findi("I am an enchanter")) then
		e.self:Say("Very good. I have a cap, robe, sleeves, pants, shawl, and bracer. My friend Xavier has the rest just ask him about armor. ");
	end
	if(e.message:findi("cap")) then
		e.self:Say("For the cap I will need an astral jewel, a golden flower, a grail of enchantment, and a mark of beauty.");
	end
	if(e.message:findi("robe")) then
		e.self:Say("For the robe I will need a sun jewel, the eye of the enraptured, a mark of affection, and a book of inspiration.");
	end
	if(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves I will need a moon jewel, a page of prose, a mark of reality, and a truncated ring.");
	end
	if(e.message:findi("pants")) then
		e.self:Say("For the pants I will need a star jewel, a mark of passion, an adamantium quill, and pristine shik-nar claws.");
	end
	if(e.message:findi("shawl")) then
		e.self:Say("For the shawl I will need a cloud jewel, a mark of understanding, and a hope emerald.");
	end
	if(e.message:findi("bracer")) then
		e.self:Say("For the bracer I will need a sky jewel, a mark of elegance, and a hope sapphire.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4675, item3 = 4676, item4 = 4677})) then
		e.other:SummonItem(3697);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4678, item3 = 4679, item4 = 4680})) then
		e.other:SummonItem(3698);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4681, item3 = 4682, item4 = 4683})) then
		e.other:SummonItem(3699);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4684, item3 = 4685, item4 = 4686})) then
		e.other:SummonItem(3700);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4687, item3 = 4688})) then
		e.other:SummonItem(3701);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4689, item3 = 4690})) then
		e.other:SummonItem(3702);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
