--A_Rathe_Councilman (222140) (NON-MEZZABLE VERSION)
--signals #rathe_controller (222156) to load encounter
--poearthb

function event_spawn(e)
	eq.set_next_hp_event(75);
end

function event_combat(e)
	if e.joined then
		eq.signal(222156,1);	--#rathe_controller (222156)
		eq.set_timer("banish",math.random(1,12) * 1000);
	end
end
