-- Rhozth Ssrakezh (162509) for Cursed cycle - fake one!

function event_spawn(e) 
	-- depop and deactivate it spawn if it tried to spawn while cursed lockout is on or while real Rhozth is active or
	local cursed = eq.get_qglobals(e.self)['cursed_progress'] or 0
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(162258) or cursed > 2 then
		eq.set_timer('depop', 500);
		eq.get_entity_list():GetSpawnByID(368763):Disable();
	end
end

function event_death_complete(e)
	eq.signal(162266, 512);
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop_with_timer();
	end
end
