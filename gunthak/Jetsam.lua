-- Jetsam for Stoicism quest in Gunthak

-- depop timer
function event_spawn(e)
    eq.set_timer('depop', 60 * 60 * 1000);
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.stop_timer('depop');
        eq.depop();
    end
end
