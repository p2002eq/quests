--a_grimling_battlepriest
--Final Grimling War


function event_spawn(e)
    eq.set_timer('depop', 15 * 60 * 1000);
end


function event_combat(e)
    if e.joined then
        eq.stop_timer('depop');
    else
        eq.set_timer('depop', 15 * 60 * 1000);
    end
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.depop();
    end
end
