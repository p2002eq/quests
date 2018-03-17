-- #Rhag`Zhezum (162178) for Rhag cycle AKA Rhag 1

function event_death_complete(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Set QGlobal Lockout to Instance ID
	eq.unique_spawn(162192, 0, 0, 644, -280, 146, 392); -- spawn Rhag`Mozdezh
	eq.unique_spawn(162193, 0, 0, 561, -235, 138, 256);  -- guard
	eq.unique_spawn(162194, 0, 0, 660, -309, 146, 436);  -- guard
	eq.unique_spawn(162195, 0, 0, 660, -246, 146, 330);  -- guard
	eq.unique_spawn(162196, 0, 0, 561, -323, 138, 0);  -- guard
	eq.set_global(instance_id.. "_AL_Cycle_Rhag2","UP",3,"F");  --sets global to "R2" to flag Rhag`Mozdezh as next target in cycle in case of zone crash/reboot
end


