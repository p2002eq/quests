-- #burrower_spawner (154091) event tracker for Restless Burrower

burrower_cycle = { 154097, 154365, 154364, 154366, 154367, 154368, 154369 };

function event_spawn(e)
	mob_check();
	eq.set_timer('cycle', 60 * 1000);
end

function event_timer(e)
	if e.timer == 'cycle' then
		mob_check();
	end
end

function mob_check()
	local qglobals = eq.get_qglobals(e.self);
	local timer = qglobals['restless_timer'];
	local cycle = qglobals['restless_progress'];
	if timer == nil then
		if cycle == nil then
			eq.set_global('restless_progress', '1', 2, 'F');
			eq.set_global('restless_timer', 'started', 2, 'M1'); -- 'H24')
			cleanup();
			eq.unique_spawn(burrower_cycle[1], 0, 0, -684, -299, -88, 188);
		elseif cycle ~= nil then
			local next_cycle = tonumber(cycle) + 1;
			eq.set_global('restless_progress', tostring(next_cycle), 2, 'F');
			cleanup();
			eq.unique_spawn(burrower_cycle[next_cycle], 0, 0, -684, -299, -88, 188);
			if next_cycle < 7 then
				eq.set_global('restless_timer', 'started', 2, 'M1') -- 'H24')
			else
				eq.set_global('restless_timer', 'started', 2, 'F')
			end
		end
	end
end

function event_signal(e)
	if e.signal == 99 then
		eq.delete_global('restless_progress');
		eq.set_global('restless_timer', 'started', 2, 'M1') --'H' .. math.random(24))
	end
end

function cleanup()
	for _, mobid in pairs(burrower_cycle) do
		eq.depop(mobid)
	end
end
