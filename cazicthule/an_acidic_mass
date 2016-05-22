local timerUp = false;      
local inCombat = false;

function event_spawn(e)
    eq.set_timer("MASS",1800000);   -- 30 minutes before despawn
end


function event_combat(e)
    if (e.joined == false) then
        inCombat = false;
        if (timerUp) then
            eq.stop_timer("MASS");
            eq.depop_all(48322);
        end
    else
        inCombat = true;
    end
end


function event_timer(e)
    if (e.timer == "MASS") then
        if (inCombat) then
            timerUp = true;
        else
            eq.depop_all(48322);
        end
    end
end