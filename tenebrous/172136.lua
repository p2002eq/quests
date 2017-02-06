---- Quest:Johanius Stake of Slaying
function event_spawn(e)
    killcount = 0
    eq.set_timer("jbkill", 110000);
end

function event_signal(e)
    if(e.signal == 1) then
        count = count + 1;
        if(count == 8) then
            eq.signal(172136,1,1); -- #invis_johanius_one
            eq.depop();
        end
    end
end

function event_timer(e)
    if (e.timer == "jbkill") then
        eq.signal(172192,2,1); -- Aellana_Barleou
        eq.signal(172193,2,1); -- Lyrra_Rutledge
        eq.depop();
    end
    eq.stop_timer(e.timer)
end