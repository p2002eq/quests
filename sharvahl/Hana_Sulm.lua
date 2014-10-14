function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 6144})) then
		e.self:Say("Well, you're going to need to practice for a while to make these things. Take these sketches and read up on the lore concerning sonic wolves. You'll learn how to use the sketches. Practice all you can. I'm sure that you're going to have a lot of people coming to you with requests.");
		e.other:SummonItem(6144);
		e.other:SummonItem(6139);
		e.other:Faction( 132,10 );
		e.other:QuestReward(e.self,0,0,0,0,6137);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
