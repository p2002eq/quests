-- #a_grimling_soulstealer in Acrylia (NPC#: 154106)
--part of Trondol Shir escort quest for Inner Acrylia Key

function event_spawn(e)
    eq.set_timer('depop', 120 * 1000);  -- 2 min depop if not engaged
end

function event_combat(e)
    if e.joined then
        eq.stop_timer('depop');
    else
        eq.set_timer('depop', 60 * 1000);
    end
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.depop();
    end
end
