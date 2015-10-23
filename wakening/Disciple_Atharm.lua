function event_spawn(e)
	eq.set_timer("onset3", 90000); -- 
end

function event_timer(e)
    if(e.timer == "onset3") then
        e.self:MoveTo(-4357,-715,-183,-1,1);
        eq.stop_timer("onset3");
    end
end

function event_signal(e)
    if(e.signal == 1) then --
        eq.start(26);
        
    end
    
end