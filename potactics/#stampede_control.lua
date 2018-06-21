--#stampede_control (214310)
--potactics

function event_spawn(e)
	--check if in instance (if so depop)
	local instance_id = eq.get_zone_instance_id();
	if instance_id ~= 0 then
		eq.depop();
	end
	
	local qglobals = eq.get_qglobals(e.self);
	
	if qglobals[tostring(eq.get_zone_instance_id()) .. "_rztw_event"] == nil then
		eq.spawn2(214291,189,0,1200,-700,-285,0);
	end
	eq.depop_with_timer();
end
	