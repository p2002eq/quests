--A_Myrmidon_of_Stone (222139)
--Warlord Event Trigger
--poearthb

function event_spawn(e)
	local instance_id = eq.get_zone_instance_id();
	eq.delete_global(instance_id .. "_Galronar_PoEarthB");
end

function event_death_complete(e)	
	eq.signal(222155,1);	--#warlord_controller (222155)
end
