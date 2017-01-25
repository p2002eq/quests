function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18321})) then -- Friazs Shopping List
		e.self:Say("Ahhh... I see that Noril is trying to get out of work. That lad is a lazy one. Not a problem though... you'll do all the same. Here, let me add a few more things to that list, since you look nice and strong. Take this list and my grocery bag and I'll see about scrounging up the beetle horns that Noril's been bugging me about.");
		e.other:SummonItem(18322); -- Friazs New Shopping List
		e.other:QuestReward(e.self,0,0,0,0,17606); -- Woven Grocery Bag
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5548})) then -- Full Grocery Bag
		e.self:Say("I thank you, " .. e.other:GetName() .. ". I should make Noril come get these horns himself, but I guess that I can understand what it feels like to be too busy to get everything done. You've been a great help to me today. Give these horns to Noril and tell him that I thank him for your assistance. Take care, young one.");
		e.other:QuestReward(e.self,0,0,0,0,5549); -- Bag of Beetle Horns
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
