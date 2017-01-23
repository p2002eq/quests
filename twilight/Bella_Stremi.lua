function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah hello and welcome ".. e.other:GetName() .. ". tis a pleasure to see some new faces.  I have the finest wares to be found. be sure to check them out. Are ya by chance a [necromancer]");
	end
	if(e.message:findi("necromancer")) then
		e.self:Say("I have a cap, robes, sleeves, pants, shawl, bracer, and sandals for a necromancer. Frantip has the rest just ask him about armor and I'm sure he'll help you. Which are you interested in?");
	end
	if(e.message:findi("cap")) then
		e.self:Say("For the cap of pestilence you'll have to bring me a sky jewel, an aged gold coin, a dark gem, and a priceless book.");
	end
	if(e.message:findi("robe")) then
		e.self:Say("For the robe of pestilence you'll have to bring me a meteor jewel, a miniature armband, a mark of fortune, and a sun wraith eye.");
	end
	if(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves of pestilence you'll have to bring me an astral jewel, a petrified totem, a frozen hailstone, and a glowing crystal.");
	end
	if(e.message:findi("pants")) then
		e.self:Say("For the pants of pestilence you'll have to bring me a sun jewel, a divining rod, an aged platinum symbol, and a silver sign.");
	end
	if(e.message:findi("shawl")) then
		e.self:Say("For the shawl of pestilence you'll have to bring me a moon jewel an ancient fossil, and some wrought iron shavings.");
	end
	if(e.message:findi("bracer")) then
		e.self:Say("For the bracer of pestilence you'll have to bring me a star jewel, a granite idol, and an ancient silver coin.");
	end
	if(e.message:findi("sandals")) then
		e.self:Say("For the sandals of pestilence you'll have to bring me a cloud jewel, a blackened ornament, and a snake scale sceptre.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4741, item3 = 4742, item4 = 4743})) then
		e.other:SummonItem(3723);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4744, item3 = 4745, item4 = 4746})) then
		e.other:SummonItem(3724);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4748, item3 = 4749, item4 = 4750})) then
		e.other:SummonItem(3725);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4751, item3 = 4752, item4 = 4753})) then
		e.other:SummonItem(3726);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4771, item3 = 4772})) then
		e.other:SummonItem(3727);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4773, item3 = 4774})) then
		e.other:SummonItem(3728);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4775, item3 = 4776})) then
		e.other:SummonItem(3729);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
