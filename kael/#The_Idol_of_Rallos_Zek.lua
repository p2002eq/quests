--on death spawns the Avatar of War

function event_death_complete(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Set QGlobal Lockout to Instance ID
	eq.set_global(instance_id.."_idol",2,3,"D6");
	--eq.set_global("Idol","2",3,"D6");			--sets qglobal value to 2 (Idol dead)
	-- Spawns Avatar of War
	eq.spawn2(113627,0,0,1291,1252,-97,254.5);
end
