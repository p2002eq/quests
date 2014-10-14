function event_spawn(e)
	eq.set_timer("1",80000);
end

function event_timer(e)
	e.self:Say("Hey there! Come take a look at my torches. It beats hunting in the dark. I have food and bandages.");
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail wanderer. I have basic supplies available if you are interested. Have a look.");
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
