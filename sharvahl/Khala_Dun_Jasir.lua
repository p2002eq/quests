-- Quest for luclin smithing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to North Gate side of the Merchant's Corridor.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29803})) then -- A Shield Repair Order
		e.self:Say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?");
		e.other:QuestReward(e.self,0,0,0,0,29807); -- Jasirs Dented Shield
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29808})) then -- Jasirs Immaculate Shield
		e.self:Say("Thank you very much " .. e.other:GetName() .. ", and I must apologize for the way I spoke to you earlier. We just got word of some [poachers] out in the Thicket, they really get me angry. In any case, you have done a fine job, worthy of Barkhem himself.");
		e.other:QuestReward(e.self,0,0,0,0,29809); -- Jasirs work order
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
