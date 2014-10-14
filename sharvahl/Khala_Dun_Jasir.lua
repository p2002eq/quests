-- Quest for luclin smithing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to North Gate side of the Merchant's Corridor.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- takes repair order from master Barkhem
	if(item_lib.check_turn_in(e.trade, {item1 = 29803})) then
		e.self:Say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?");
		e.other:SummonItem(29807);
		e.other:QuestReward(e.self,0,0,0,0,29807);
	end
	-- You receive Jasir's Dented Shield. Take the dented shield and place it into a forge with your Vah Shir Apprentice Mallet. This creates Jasir's Immaculate Shield (the mallet will be returned). Give this shield back to Jasir to receive Jasir's Work Order.
	if(item_lib.check_turn_in(e.trade, {item1 = 29808})) then
		e.self:Say("Thank you very much " .. e.other:GetName() .. ", and I must apologize for the way I spoke to you earlier. We just got word of some [poachers] out in the Thicket, they really get me angry. In any case, you have done a fine job, worthy of Barkhem himself.");
		e.other:SummonItem(29809);
		e.other:QuestReward(e.self,0,0,0,0,29809);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
