-- Draz_Nurakk (96387) for BST epic

function event_spawn(e)
	eq.set_timer('depop', 24 * 60 * 60 * 1000) -- 24 hour depop timer - this is intentionally long, as a fail here will require redoing whole epic up to this part
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'depop' then
		eq.depop()
	end
end

function event_death_complete(e)
	eq.spawn2(96385,0,0,1988,-9203,10,0); -- Draz_Nurakk's_Image (unslowable version)
	eq.spawn2(96386,0,0,1995,-9219,10,0); -- Draz_Nurakk's_Image
	eq.spawn2(96386,0,0,2013,-9198,10,0); -- Draz_Nurakk's_Image
	eq.spawn2(96386,0,0,1990,-9179,10,0); -- Draz_Nurakk's_Image
	eq.spawn2(96386,0,0,1965,-9202,11,0); -- Draz_Nurakk's_Image
	eq.spawn2(96386,0,0,2001,-9181,10,0); -- Draz_Nurakk's_Image
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

