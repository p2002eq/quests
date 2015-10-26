function event_signal(e)
    
    if(e.signal == 1) then --vs died
        eq.set_timer("talk", 600000); -- 10 min
        e.self:Say("BUUURRRPPPP....Did you bring us more ale?");
    end
end

function event_timer(e)
    if(e.timer == "talk") then
        eq.signal(4210, 1) -- signal Stumpy shuntymace
    end
end