-- Ring 7 encounter.  Attack Corbin Blackwell

function event_signal(e)
    if (e.signal == 1161111) then
        eq.attack_npc_type(116119);
    end
end