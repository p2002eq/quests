function event_signal(e)
    if (e.signal == 1161112) then
        eq.attack_npc_type(116591);
    end
end

function event_death_complete(e)
    eq.signal(116591, 1161114);     -- send signal to Corbin for each death
end