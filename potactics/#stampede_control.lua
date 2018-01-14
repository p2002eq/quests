--#stampede_control (214310)
--potactics

function event_spawn(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if qglobals[tostring(eq.get_zone_instance_id()) .. "_rztw_event"] == nil then
		eq.spawn2(214291,189,0,1200,-700,-285,0);
	end
	eq.depop_with_timer();
end
	