-- #a_summoned_hatchling (154097) for Restless Burrower

function event_spawn(e)
	eq.set_timer('cycle', 60 * 1000)
end

function event_timer(e)
	if e.timer == 'cycle' then
		local qglobals = eq.get_qglobals(e.self);
		if qglobals['restless_burrower'] == nil then
			eq.set_global('restless_burrower', 'started', 2, 'M1');
			
			local cond = eq.get_spawn_condition('acrylia', 0, 10);
			eq.spawn_condition('acrylia', 0, 10, cond + 1);
		end
	end
end
