--#rztw_controller (214108)
--unloads rztw event on win

local pit_spawns = {361134,361166,361167,361170,361173,361176,361188,361191,361192,361193,361194,361195,361196,361197,361198,361199,361202,361203,361204,361205,361206,361208,361209,361211,361212,361219};

function event_spawn(e)
	RepopPit(1);
end

function event_signal(e)
	if e.signal == 1 then
		local instance_id = eq.get_zone_instance_id();
		eq.delete_global(tostring(instance_id) .. "_rztw_event");
		eq.unload_encounter("rztw_event");		
	elseif e.signal == 2 then
		DepopPit();
		eq.set_timer("pit_repop", 40 * 60 * 1000);	--40 min repop (allows 20 min for phase 3 timer then another 20 min for recovery)
	end
end

function event_timer(e)
	if e.timer == "pit_repop" then
		eq.stop_timer(e.timer);
		RepopPit();
	end
end

function RepopPit()
	for _,spawns in pairs(pit_spawns) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Enable();
		spawnpoint:Repop(1);
	end
end

function DepopPit()
	for _,spawns in pairs(pit_spawns) do
		local spawnpoint = eq.get_entity_list():GetSpawnByID(spawns);
		spawnpoint:Disable();
		spawnpoint:ForceDespawn();
	end
end