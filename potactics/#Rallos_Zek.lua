function event_spawn(e)
	eq.set_next_hp_event(60);
	eq.set_timer("despawn", 60 * 60 * 1000);	--1 hour till he despawns on his own
end

function event_hp(e)
	eq.signal(214123, 214052);	--tell trigger mob mini Rallos is dead
	eq.stop_timer("despawn");
	eq.depop();
end

function event_signal(e)
	eq.stoptimer("despawn");
	eq.depop();
end

function event_timer(e)
	if e.timer == "despawn" then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end

--End of File  Zone: PoTactics  ID: 214109 -- #Rallos_Zek