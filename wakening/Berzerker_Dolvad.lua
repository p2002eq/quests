function event_spawn(e)
	eq.set_timer("onset2", 55000); -- 
end

function event_timer(e)
    e.self:MoveTo(4310,-741,-183,-1,1);
    eq.stop_timer("onset2");
end

function event_signal(e)
    if(e.signal == 1) then --
        -- quest::start(25);
    end
end