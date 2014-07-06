--Andara C'Luzz, Neriaka 41095
--Need Ending Statement
--Need Factions
--Status: Not Complete

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 16166, item2 = 19582, item3 = 19583})) then
		e.other:AddEXP(150);
		e.other:SummonItem(19611);
		e.self:Say("Here's your bow. Use it well, young rogue.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
