-- Doomshade in Umbral Planes

function event_spawn(e)
	-- set timers for chants and depop
	eq.set_timer('depop', 60 * 60 * 1000);
	eq.set_timer('chant', 10 * 60 * 1000);
end

function event_timer(e)
	-- give chant emote if a dark master is spawned. depop after 1 hour.
	if e.timer == 'chant' and eq.get_entity_list():IsMobSpawnedByNpcTypeID(176042) then
		eq.zone_emote(1, 'An unearthly wail fills the air as the Dark Masters begin chanting for the coming of doom.');
	elseif e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop()
	end
end