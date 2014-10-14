function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome noble one. Please feel free to select any of our wonderfully prepared meals. All of them are prepared with quality ingredients and skilled chefs.");
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
