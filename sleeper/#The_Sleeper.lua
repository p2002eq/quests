function event_signal(e)
    if(e.signal == 66) then
        eq.world_emote(13, "The Sleeper shouts, I AM FREE!");
        local clientList = eq.get_entity_list():GetClientList();
        if ( clientList ) then
            for client in clientList.entries do
                e.self:AddToHateList(client);
            end
        end
    end
end

function event_spawn(e)
    eq.set_timer('sleeper_spawn', 1);
end

function event_timer(e)
    if(e.timer == 'sleeper_spawn') then
        eq.stop_timer(e.timer)
        e.self:SetAppearance(1);
    end
end
