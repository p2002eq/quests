function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gimme duffynitey rocks! Me grindem GUUD!!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10073})) then --Dufrenite
		e.self:Emote("takes the dufrenite and grinds it with his bare hands.");
		e.self:Say("Here ya go!");
		e.other:SummonItem(19051); --Ground Dufrenite
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
