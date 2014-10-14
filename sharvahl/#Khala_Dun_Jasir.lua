-- Quest for luclin smithing
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You there. Have you seen the [poachers] out in the thicket? You best not be one of them!");
	elseif(e.message:findi("poachers")) then
		e.self:Say("There has been an outbreak in the thicket of people hunting wild cats for their hides. Their hides!!! People profiting off of that which was never theirs, bringing pain to any that they may overrun with force. I can think of nothing else that turns my stomach so! A former Khala Dun named Ferin is out there heading up the initial investigation into the despicable actions. My apologies if I seemed a bit gruff, but I am not quite myself when discussing such matters as these.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 29803})) then -- takes repair order from master Barkhem
		e.self:Say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?");
		e.other:QuestReward(e.self,0,0,0,0,29807);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 29808})) then
		e.self:Say("Thank you very much " .. e.other:GetName() .. ", and I must apologize for the way I spoke to you earlier. We just got word of some [poachers] out in the Thicket, they really get me angry. In any case, you have done a fine job, worthy of Barkhem himself.");
		e.other:QuestReward(e.self,0,0,0,0,29809); -- Jasir's Work Order
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
