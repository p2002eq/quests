-- #burrower_spawner (154091) event tracker for Restless Burrower

burrower_cycle = { 154097, 154365, 154364, 154366, 154367, 154368, 154369 };

function event_spawn(e)
	mob_check(e);
	eq.set_timer('cycle', 20 * 1000);
end

function event_timer(e)
	local instance_id = eq.get_zone_instance_id();
	if e.timer == 'cycle' then
		mob_check(e);
		
	elseif e.timer == 'mob_spawn' then
		eq.stop_timer(e.timer)
		local spawn_num = tonumber(eq.get_qglobals(e.self)[instance_id.. '_restless_progress']);
		eq.unique_spawn(burrower_cycle[spawn_num], 0, 0, -684, -299, -88, 188);
	end
end

function mob_check(e)
	local instance_id = eq.get_zone_instance_id();
	
	local qglobals = eq.get_qglobals(e.self);
	local timer = qglobals[instance_id.. '_restless_timer'];
	local cycle = qglobals[instance_id.. '_restless_progress'];
	
	if timer == nil then
		if cycle == nil then
			eq.set_global(instance_id.. '_restless_progress', '1', 2, 'F');
			eq.set_global(instance_id.. '_restless_timer', 'started', 2, 'H24')
			
		elseif cycle ~= nil then
			local next_cycle = tonumber(cycle) + 1;
			eq.set_global(instance_id.. '_restless_progress', tostring(next_cycle), 2, 'F');

			if next_cycle < 7 then
				eq.set_global(instance_id.. '_restless_timer', 'started', 2, 'H24')
			else
				eq.set_global(instance_id.. '_restless_timer', 'started', 2, 'F')
			end
		end
	end
	
	local cycle_progress = eq.get_qglobals(e.self)[instance_id.. '_restless_progress'];
	if cycle_progress ~= nil and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(burrower_cycle[tonumber(cycle_progress)]) then
		eq.set_timer('mob_spawn', 1000)
		cleanup();
	end
end

function event_signal(e)
	local instance_id = eq.get_zone_instance_id();
	if e.signal == 99 then
		eq.delete_global(instance_id.. '_restless_progress');
		eq.set_global(instance_id.. '_restless_timer', 'started', 2, 'H' .. tostring(math.random(24)))
	end
end

function cleanup()
	for _, mobid in pairs(burrower_cycle) do
		eq.depop(mobid)
	end
end
