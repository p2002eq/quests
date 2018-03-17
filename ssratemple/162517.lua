-- #Arch Lich Rhag`Zadune (162517) 

function event_death_complete(e)
	-- Get Instance ID
	local instance_id = eq.get_zone_instance_id();
	-- Set QGlobal Lockout to Instance ID
	eq.delete_global(instance_id.. "_AL_Cycle_ArchLich");
end
