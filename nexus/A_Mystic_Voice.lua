-- A_Mystic_Voice (152019) in the Nexus - coordinator for spire teleports

local ThreadManager = require("thread_manager");

function event_spawn(e)
	eq.set_timer("heartbeat", 100);
    
	ThreadManager:Clear();
	ThreadManager:Create("Norrath", old_world_cycle, e);
	ThreadManager:Create("Velious", velious_cycle, e);
end
 
function event_timer(e)
    ThreadManager:Resume("Predictable");
    ThreadManager:Resume("Swapping");
end

function old_world_cycle(evt)
    while true do
        eq.zone_emote(15, "norrath will port in 15")
        ThreadManager:Wait(13);
        eq.zone_emote(15, "norrath will port in 2")
        ThreadManager:Wait(2);
        eq.zone_emote(15, "Porting Norrath!")
        ThreadManager:Wait(15);
    end
end

function velious_cycle(evt)
    while true do
        ThreadManager:Wait(10)
        eq.zone_emote(15, "velious will port in 15")
        ThreadManager:Wait(13);
        eq.zone_emote(15, "velious will port in 2")
        ThreadManager:Wait(2);
        eq.zone_emote(15, "Porting Velious!")
        ThreadManager:Wait(5);
    end
end
