function event_spawn(e)
	eq.set_timer("91", 1000000); --16.67 min
end

function event_timer(e)
	if (e.timer == "91") then
		eq.depop_all(116548);
	end

end

-- Ring 7 encounter.  Attack Corbin Blackwell

function event_signal(e)
    if (e.signal == 1161112) then
        eq.attack_npc_type(116119);
    end
end

function event_death_complete(e)
    eq.signal(116119, 1161114);     -- send signal to Corbin for each death
end