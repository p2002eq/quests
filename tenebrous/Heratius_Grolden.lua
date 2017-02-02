---- Quest:Vampyre Troubles
function event_spawn(e)
    eq.set_timer("Heratius", 3600000);
end

function event_timer(e)
    if (e.timer == "Heratius") then
        eq.depop_with_timer();
    end
    eq.stop_timer(e.timer)
end

function event_death_complete(e)
    eq.unique_spawn(172184,0,0,-1425,576,317,64); -- Valdanov Zevfeer
end