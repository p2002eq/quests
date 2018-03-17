--#a_manaetic_contraption(206207)		
--Endurance Testing Event
--Version with loottable that spawns on wave 8 of each round
--poinnovation

function event_spawn(e)
    eq.set_timer('depop', 5 * 60 * 1000);
end


function event_combat(e)
    if e.joined then
        eq.stop_timer('depop');
    else
        eq.set_timer('depop', 5 * 60 * 1000);
    end
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.depop();
    end
end
