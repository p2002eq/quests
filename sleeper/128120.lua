local combatStarted = false;
local spawnedMobs = 0;

function event_combat(e)
    e.self:Say("testing this cycle");
    if(combatStarted) then 
        e.self:Say("combat ended");
        combatStarted = false;
        --despawn_cycle();
    else
        e.self:Say("combat started");
        combatStarted = true;
        --start_cycle(e);
    end
end