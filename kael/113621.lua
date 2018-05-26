--[[ #Doldigun Steinwielder (NPC ID 113621)
Zone:  kael

this is the spawned version of Doldigun at the end of the plate cycle.  He will run upon spawning and depop at the end of his pathing grid.  Killing him signifies a successful
completion of the plate cycle.  If he depops then event is failed and Plate Cycle Trigger will respawn 2 hrs later  ]]

function event_spawn(e)
    e.self:SetRunning(true);
	e.self:Say("Uhh, I think I'll be leaving now... Give my regards to Thurgadin.");
end

function event_death_complete(e)
    eq.delete_global("platecycle");  --removes global to allow event to be restarted (success!)
end
