function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met! You look like someone ready for adventure. It's a tough world out there and you will need to keep your combat skills sharp. I have lots of wooden weapons made especially to help young adventurers practice their skills.");
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
