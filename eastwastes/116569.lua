function event_spawn(e)
    e.self:Say("spawned");
end

function event_signal(e)
    if (e.signal == 1161111) then
        e.self:Say("signal");
        eq.attack_npc_type(116119);
        e.self:Say("attack");
    end
end