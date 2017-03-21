-- Adds for gnome walk

function event_timer(e) -- timer for these is set in the gnome walk script
    if e.timer == 'depop' then
       eq.depop() 
    end
end