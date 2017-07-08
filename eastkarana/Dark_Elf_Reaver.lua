-- dark elf reaver - ranger/druid epic
function event_spawn(e)
	eq.set_timer("despawn",600000); -- 10 Minutes
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_death_complete(e)
	eq.stop_timer("despawn");
end