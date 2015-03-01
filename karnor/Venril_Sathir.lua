function event_spawn(e)
	eq.depop(102099);
end
function event_death_complete(e)
    eq.set_timer("Remainspop",300000); --86400000
end
function event_timer(e)
	if(e.timer == "Remainspop") then
	    eq.unique_spawn(102099,0,0,-559,-77,19);
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