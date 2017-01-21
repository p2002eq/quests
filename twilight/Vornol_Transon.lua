function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("pauses for a second staring off into the distance. 'Ah welcome friend. I am Vornol, a summoner of sorts, and master of this tower.'");
	end
		e.self:Say("Most excellent what I have is some armor, if you will do few errands for me it is yours. The pieces I have are the cap, robe, sleeves, pants, shawl, and bracer. My apprentice, the lady Galdara, has the rest. Just ask her about armor and she will tell you what you need to do.");
	end
	if(e.message:findi("cap")) then
		e.self:Say("For the cap you will have to bring back to me a sun jewel, a fire idol, a fire marked scroll and a runed ring of fire.");
	end
	if(e.message:findi("robe")) then
		e.self:Say("For the robe you will have to bring back to me a moon jewel, a vial of purified fire, a vial of purified water, and a vial of purified air.");
	end
	if(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves you will have to bring back to me a star jewel, an air idol, an air marked scroll and a runed ring of air.");
	end
	if(e.message:findi("pants")) then
		e.self:Say("For the pants you will have to bring back to me a cloud jewel, an earth idol, an earth marked scroll, and a runed ring of earth.");
	end
	if(e.message:findi("shawl")) then
		e.self:Say("For the shawl you will have to bring back to me a sky jewel, a talisman of burning earth, and a vial of purified earth.");
	end
	if(e.message:findi("bracer")) then
		e.self:Say("For the bracer you will have to bring back to me a meteor jewel, talisman of moisture, and a vial of aqua waters.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4495, item3 = 4496, item4 = 4497})) then
		e.other:SummonItem(3684);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4498, item3 = 4499, item4 = 4506})) then
		e.other:SummonItem(3685);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4507, item3 = 4508, item4 = 4509})) then
		e.other:SummonItem(3686);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4510, item3 = 4511, item4 = 4512})) then
		e.other:SummonItem(3687);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4513, item3 = 4514})) then
		e.other:SummonItem(3688);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4584, item3 = 4585})) then
		e.other:SummonItem(3689);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
