-- Rhozth Ssrakezh (162509) for Cursed cycle - fake one!

function event_spawn(e) 
	-- depop and deactivate it spawn if it tried to spawn while cursed lockout is on or while real Rhozth is active or
	local cursed = tonumber(eq.get_qglobals(e.self)['cursed_progress']) or 0
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) or cursed > 2 then
		eq.set_timer('depop', 500);
	end
end

function event_death_complete(e)
	eq.signal(162266, 512);
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.spawn_condition('ssratemple', 0, 10, 2)
	end
end
