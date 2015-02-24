function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. traveler! I am Wilacor Goldenmead. resident of this most fair of cities and baking is my trade. I know that the worlds beyond this place are treacherous indeed. and one needs their strength to withstand the dangers that they most certainly face. The supplies that I provide are ideal for all adventurers and will keep the most hardy of warriors strong and well-nourished so that they may be at their best when battle is nigh. Come. search my wares and purchase as you will!");
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
