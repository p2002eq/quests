function event_spawn(e)
	eq.set_timer("1",1000);
end

function event_timer(e)
	local qglobals = eq.get_qglobals();
	eq.stop_timer("1");
	eq.set_timer("1",1000);
	if(timer == 1 and qglobals["door_one"] ~= nil and qglobals["door_two"] ~= nil and qglobals["door_three"] ~= nil and qglobals["door_four"] and qglobals["dragon_not_ready"] == nil) then
		eq.spawn2(91097,0,0,921.7,936.8,-172.7,144.4);
		eq.depop_with_timer();
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
