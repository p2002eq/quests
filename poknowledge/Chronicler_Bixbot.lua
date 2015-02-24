function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome..Welcome! I am so excited to see a new face around New Tanaan. The Great Library of New Tanaan has a plethora of magnificent tomes to tantilize ones mind. I have here some books telling stories of gnomes that have shaped the history of our people. You may borrow them if you are literate in the Gnomish language. The books will return to me when you are finished with them via the enchantments placed upon them by New Tanaan.");
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
