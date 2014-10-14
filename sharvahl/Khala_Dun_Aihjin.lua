-- Quest for luclin smithing
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. ".  Careful around some of the rougher pubs late at night. wouldn't want to see you caught up in a fight like the last one I broke up.  Did you hear about it?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- takes repair order from master Barkhem
	if(item_lib.check_turn_in(e.trade, {item1 = 29803})) then
		e.self:Say("Well it's about time Barkhem got around to us, and he couldn't even be bothered to come himself. Please get this back to me as soon as you can... you do know that we are here to guard the city, right?");
		e.other:SummonItem(29810);
		e.other:QuestReward(e.self,0,0,0,0,29810);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29811})) then
		e.self:Say("Well done, I sure will be ready for next time something tries to cause a disturbance in our city. My thanks to you " .. e.other:GetName() .. ".");
		e.other:SummonItem(29812);
		e.other:QuestReward(e.self,0,0,0,0,29812); -- Aihjin's Dented Shield
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
