function event_signal(e)
    
    if(e.signal == 1) then --vs died
        eq.set_timer("talk", 600000); -- 10 min
        e.self:Say("BUUURRRPPPP....MORE CHEEZY POOFS! Get me another Ale");
    end
end

function event_timer(e)
    if(e.timer == "talk") then
        eq.signal(XXXXX, 1) -- signal Fitzy_Slobbernoggen
    end
end