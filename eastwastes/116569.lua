-- Ring 7 encounter.  Attack Corbin Blackwell

function event_signal(e)
    if (e.signal == 1161111) then
        eq.attack_npc_type(116119);
    end
end

function event_death_complete(e)
    eq.signal(116591, 1161113);     -- send signal to Corbin for each death
en3