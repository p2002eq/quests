function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18850})) then --Blood Stained Note
		e.other:SummonItem(13595); --Stained Purple Robe*
		e.other:Ding();
		e.other:Faction(21,100); --Bloodsabers
		e.other:Faction(135,-15); --Guards of Qeynos
		e.other:Faction(235,10); --Opal Dark Briar
		e.other:Faction(257,-25); --Priest of Life
		e.other:Faction(53,5); --Corrupt Qeynos Guards
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
