function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Salutations traveler. please have a look at my inventory of goods. I have some cloth armor that has been padded with comfortable lightweight materials. This extra padding will provide you with the protection you need if you wish to travel through hostile regions.");
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
