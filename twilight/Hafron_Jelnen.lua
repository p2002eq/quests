function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail and well met friend.  I'm one of master Vornol's four apprentices.  I am being trained to be an expert on all things dealing with the element of fire.'");
	end
	if(e.message:findi("what armor")) then
		e.self:Say("This armor is indeed mighty if you wish to have it you must do some tasks for me. I have the coif, mail, vambraces, greaves, pauldrons, bracer, and boots. My sister, Sarah, has the rest just ask her about armor and she will help you.");
	end
	if(e.message:findi("what boots")) then
		e.self:Say("To get the boots you must fetch for me a moon jewel, a mark of the seer, and a hewed augury stone.");
	end
	if(e.message:findi("what bracer")) then
		e.self:Say("To get the bracer you must fetch for me a sun jewel, a mark of soul, and a spirit gem.");
	end
	if(e.message:findi("what coif")) then
		e.self:Say("To get the coif you must fetch for me a star jewel, a mark of sight, an ancient sun fetish, and the tablet of spirits.");
	end
	if(e.message:findi("what greaves")) then
		e.self:Say("To get the greaves you must fetch for me a meteor jewel, a mark of omens, a pouch of false gems, and an adorned cap");
	end
	if(e.message:findi("what mail")) then
		e.self:Say("To get the mail you must fetch for me a cloud jewel, a mark of vision, a writ of safid, and some throwing bones.");
	end
	if(e.message:findi("what pauldrons")) then
		e.self:Say("To get the pauldrons you must fetch for me a astral jewel, a mark of spirit, and Genalan's Chronicle.");
	end
	if(e.message:findi("what vambraces")) then
		e.self:Say("To get the vambraces you must fetch for me a sky jewel, a mark of prophecy, a polished stone fetish, and a woven anklet.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4936, item3 = 4937})) then
		e.other:SummonItem(3755);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4934, item3 = 4935})) then
		e.other:SummonItem(3754);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4898, item3 = 4899, item4 = 4900})) then
		e.other:SummonItem(3749);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4929, item3 = 4930, item4 = 4931})) then
		e.other:SummonItem(3752);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4908, item4 = 4910})) then
		e.other:SummonItem(3750);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4932, item3 = 4933})) then
		e.other:SummonItem(3753);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4918, item3 = 4927, item4 = 4928})) then
		e.other:SummonItem(3751);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
