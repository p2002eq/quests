function event_say(e)
	if(e.message:findi("hobby")) then
		e.self:Say("I used to collect rare coins and gems. I came to Firiona Vie to do just that, but I never have the time to [collect rare coins] when I am always here working.");
	elseif(e.message:findi("collect rare coins")) then
		e.self:Say("If you want to help, you can begin by replacing my prized Star of Odus which was taken from my vault when I stepped out to dine. Do so, and I may trust you to collect coins. I will also reward you with an item a composer left here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
