function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Hi Hi, Im one of master Vornol's four apprentices. My specialty is with all things concerning the element of air.");
	end
	if(e.message:findi("None")) then
		e.self.Say("You must have spoken with master Vornol. He has me keeping this armor for him and various tasks for those to do who wish to wear it. Tell me are you a magician?");
	end
	if(e.message:findi("None")) then
		e.self.Say("Very good, the pieces that I have are the sandals, mask, cloak, gloves, choker, belt, and a staff.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the sandals you must bring me an astral jewel, a talisman of wind, and a mark of aeration.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the mask you must bring me a sun jewel, a talisman of earth, and a sack of shadowed soil.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the cloak you must bring me a moon jewel, a water idol, a water marked scroll, and a runed ring of water.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the gloves you must bring me a star jewel, petrified bones, and a vial of dark earth.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the choker you must bring me a cloud jewel, fiery gourd, and a flaming candle.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the belt you must bring me a sky jewel, a vial of the morning mist, fastened links and a water etched wand.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the staff you must me a meteor jewel, a fire etched wand, an earth etched wand, and an air etched wand.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4586, item3 = 4587})) then
		e.other:SummonItem(3690);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4588, item3 = 4589})) then
		e.other:SummonItem(3691);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4597, item3 = 4598, item4 = 4599})) then
		e.other:SummonItem(3692);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4600, item3 = 4601})) then
		e.other:SummonItem(3693);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4602, item3 = 4603})) then
		e.other:SummonItem(3694);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4604, item3 = 4828, item4 = 4605})) then
		e.other:SummonItem(3695);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4672, item3 = 4674, item4 = 4673})) then
		e.other:SummonItem(3696);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
