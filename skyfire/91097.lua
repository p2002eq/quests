function event_spawn(e)
	e.self:Shout("You have awakened something which you should not have, fool!");
	eq.set_timer("2",3600000);
end

function event_death_complete(e)
	eq.set_global("dragon_not_ready","1",3,"H72");
end

function event_timer(e)
	if(timer == 2) then
		eq.stop_timer(2);
		eq.set_global("dragon_not_ready","1",3,"H1");
		eq.depop();
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
