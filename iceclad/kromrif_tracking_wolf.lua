-- Shawl 8 encounter.  Attack General Bragmur
function event_signal(e)
    if (e.signal == 2) then
        eq.attack_npc_type(110227);
    elseif (e.signal == 1) then
        eq.attack_npc_type(110227);
        e.self:Say("going to random");
        if (math.random(100) < 26) then
            e.self:AddItem(8905);
            e.self:Say("added item");
        end
    end
end

