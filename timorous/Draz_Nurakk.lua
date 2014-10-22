function event_death_complete(e)
	eq.spawn2(96322,0,0,1988,-9203,10,0);
	eq.spawn2(96322,0,0,1995,-9219,10,0);
	eq.spawn2(96322,0,0,2013,-9198,10,0);
	eq.spawn2(96322,0,0,1990,-9179,10,0);
	eq.spawn2(96322,0,0,1965,-9202,11,0);
	eq.spawn2(96322,0,0,2001,-9181,10,0);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
