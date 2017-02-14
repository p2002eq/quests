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

function event_signal(e)
    if(e.signal == 1) then
        local random_result = math.random(100);
        if(random_result <= 50) then
            eq.unique_spawn(172183,0,0,-1425,576,317,64); -- Heratius Grolden
        end
    end
end