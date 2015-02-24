function event_death_complete(e)
	local random_result = int(rand(10));
	if(random_result==1) then
		eq.spawn2(89182,0,0,546,-592,-50,64); --Froglok_Krup_Watcher
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
