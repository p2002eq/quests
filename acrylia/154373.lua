-- A_Grimling_Hero (154373) in Acrylia Caverns... summoned when someone casts CoH

function event_spawn(e)
    eq.set_timer('depop', 30 * 60 * 1000);
end

function event_timer(e)
    if e.timer == 'depop' then
        eq.depop()
    end
end
