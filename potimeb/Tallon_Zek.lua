--Tallon_Zek (223077)
--Phase 4
--potimeb

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	eq.set_global(instance_id .. "_potimeb_p4_tallon","Dead",7,"H132");
end