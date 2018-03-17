function event_spawn(e)
	eq.set_timer("onset1", 58000); -- 
end

function event_timer(e)
    if(e.timer == "onset1") then
        e.self:MoveTo(-4311,-720,-183,-1,1);
        eq.stop_timer("onset1");
    end
end

function event_signal(e)
    if(e.signal == 1) then --
        eq.start(24);
        eq.signal(119168,1,300);
    end
    if(e.signal == 2) then --
        e.self:Say("Woah! we're being ambushed!!");
        eq.signal(119168,2,300);
    end
end