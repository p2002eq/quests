function event_signal(e)
    if(e.signal == 66) then		--signal from #The_Sleeper
        eq.world_emote(13, "The Sleeper shouts, 'I AM FREE!'");
		eq.spawn2(128136,0.0,0,-1499,-2344.8,-1052.8,0);		--spawn Kerafyrm
		eq.depop();
    end
end

function event_spawn(e)
    eq.set_timer('sleeper_spawn', 1);
end

function event_timer(e)
    if(e.timer == 'sleeper_spawn') then
        eq.stop_timer(e.timer);
        e.self:SetAppearance(1);
    end
end
