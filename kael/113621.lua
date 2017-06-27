--[[ #Doldigun Steinwielder (NPC ID 113621)
Zone:  kael

this is the spawned version of Doldigun at the end of the plate cycle.  He will run upon spawning and depop at the end of his pathing grid.  Killing him signifies a successful
completion of the plate cycle.  If he depops then event is failed and Plate Cycle Trigger will respawn 2 hrs later  ]]

function event_spawn(e)
    e.self:SetRunning(true);
end

function event_death_complete(e)
    eq.spawn2(113632, 0, 0 , 1139, -839, -128, 0) --Respawns Plate Cycle Trigger
end
