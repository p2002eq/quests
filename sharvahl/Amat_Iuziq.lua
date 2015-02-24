function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, friend. May I be of assistance?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 6265})) then
		e.self:Say("Ah so there you are we've been expecting you. Take this spear and go speak with Arms Historian Qua. He can provide further instructions.");
		e.other:SummonItem(6147);
		e.other:QuestReward(e.self,0,0,0,0,6147);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 5544, item2 = 6268})) then
		e.self:Say("Well done --name!  You have proven your worth and can now be considered a Dar Khura Journeyman!");
		e.other:SummonItem(6268);
		e.other:QuestReward(e.self,0,0,0,0,6267,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
