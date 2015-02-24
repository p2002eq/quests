function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings! You wouldn't happen to be the one delivering the tea I requested from Ahlan, are you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 31766})) then
		e.self:Say("Ah the tea! I've been anxiously awaiting your arrival " .. e.other:GetName() .. "! We'd almost run out of this wonderful Gravel leaf tea. Take this seal back to Ahlam, and give him my thanks.");
		e.other:QuestReward(e.self,0,0,0,0,31775);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
