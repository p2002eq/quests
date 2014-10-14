function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh. hello there " .. e.other:GetName() .. ".  Thank you for stopping by. but this is just not a very good time for visitors.  My daughter is very upset over what has happened.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5954})) then
		e.self:Say("Ah so Gawfed wants his vase.  Unfortunately that vase has been broken.  Maybe you could go and speak with Chogar so that he can repair the vase.  Then Gawfed and I can finish our transaction.");  --ad lib text
		e.other:QuestReward(e.self,0,0,0,0,5955);  --need confirmation of item from live
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
