-- #A_Possessed_Warmonger (154359) in Acrylia for Ring of Fire

function event_combat(e)
    if e.joined then
        eq.stop_timer('depop');
    else
        eq.set_timer('depop', 60 * 1000);
    end
end

function event_timer(e)
    if e.timer == 'depop' then
        e.self:Say("The tresspassers have been slain. Glory to the master!");
        eq.depop();
    end
end
