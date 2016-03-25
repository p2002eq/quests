-- Shawl 8 encounter.  Attack General Bragmur
function event_signal(e)
    if (e.signal == 1) then
        eq.attack_npc_type(110227);
    end
end

