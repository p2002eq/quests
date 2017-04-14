-- mob in calling besties event

function event_timer(e)
    if e.timer == 'depop' then -- timer is set in the mob spawn trigger
        eq.depop()
    end
end
