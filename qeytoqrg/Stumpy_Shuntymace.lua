function event_signal(e)
    
    if(e.signal == 1) then --vs died
        eq.set_timer("talk", 600000); -- 10 min
        e.self:Say("BUUURRRPPPP....MORE CHEEZY POOFS! Get me another Ale");
    elseif(e.signal == 2) then
        eq.attack_npc_type(4209);
        eq.set_timer("talk", 600000); -- 10 min
        e.self:Say("BUUURRRPPPP....What did you say about my mom?! Die Fool!");
    end
end

function event_timer(e)
    if(e.timer == "talk") then
        eq.signal(4209, 1) -- signal Fitzy_Slobbernoggen
    end
end