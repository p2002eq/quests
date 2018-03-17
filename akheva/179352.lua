-- Adds for Shei event

function event_timer(e) -- timer for these is set in the Shei encounter
    if e.timer == 'depop' then
       eq.depop() 
    end
end