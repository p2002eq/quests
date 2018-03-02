--Sleeper event control script

function event_spawn(e)
	eq.set_timer("warder_check",1*1000);  	--check warders
end

function event_timer(e)
	local qglobals = eq.get_qglobals(e.self);
	local instance_id = eq.get_zone_instance_id();

    if(e.timer == "warder_check") then
        if (not eq.get_entity_list():IsMobSpawnedByNpcTypeID(128090) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(128091) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(128092) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(128093)) then
			if (qglobals[instance_id .. "_sleeper"] == nil) then
				eq.signal(128094,66);		-- awaken The Sleeper
				eq.set_global(instance_id .. "_sleeper","1",3,"D7");		--set qglobal that sleeper event enabled
			end
		else
			if(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(128094)) then	--if warders are respawned and Sleeper is not up then will respawn Sleeper
				eq.spawn2(1280.094,0,0,-1499,-2344.8,-1052.8,0);		--respawns The_Sleeper
			end
			eq.delete_global(instance_id .. "_sleeper");	--event reset
		
		end
    end
end
