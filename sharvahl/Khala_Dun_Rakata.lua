function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("May your spirit thrive with strength traveler. You are at the south gates of the Merchants Quarter. Within. you may find the bank. arena. armory. as well as many other fine shops. In your bustle. do not forget to take a moment to enjoy our many fountains and gardens.");
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
