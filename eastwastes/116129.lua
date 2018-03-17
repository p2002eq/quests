-- Ring 7 encounter.  Attack Corbin Blackwell
function event_signal(e)
    if (e.signal == 1161112) then
        eq.attack_npc_type(116119); -- Corbin Blackwell
    end
end

function event_spawn(e)
	eq.set_timer("depop", 600000); -- 10 Minutes
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end