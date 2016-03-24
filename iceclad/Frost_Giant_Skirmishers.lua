-- Shawl 8 encounter.  Attack General Bragmur
function event_spawn(e)
    e.self:Say("giants spawn");
end

function event_signal(e)
    e.self:Say("giants spawn");
    if (e.signal == 1) then
        eq.attack_npc_type(110227);
    end
end