-- A_Mystic_Voice (152019) in the Nexus - coordinator for spire teleports

local ThreadManager = require("thread_manager");

function event_spawn(e)
	eq.set_timer("heartbeat", 100);
    
	ThreadManager:Clear();
	ThreadManager:Create("Norrath", old_world_cycle, e);
	ThreadManager:Create("Velious", velious_cycle, e);
end
 
function event_timer(e)
    evt = e;
    ThreadManager:Resume("Norrath");
    ThreadManager:Resume("Velious");
end

function old_world_cycle(evt)
    while true do
        eq.zone_emote(15, "norrath will port in 15")
        ThreadManager:Wait(13.0);
        eq.zone_emote(15, "norrath will port in 2")
        ThreadManager:Wait(2.0);
        eq.zone_emote(15, "Porting Norrath!")
        kunark_port(eq.get_entity_list():GetClientList());
        ThreadManager:Wait(15.0);
    end
end

function velious_cycle(evt)
    while true do
        ThreadManager:Wait(10.0)
        eq.zone_emote(15, "velious will port in 15")
        ThreadManager:Wait(13.0);
        eq.zone_emote(15, "velious will port in 2")
        ThreadManager:Wait(2.0);
        eq.zone_emote(15, "Porting Velious!")
        ThreadManager:Wait(5.0);
    end
end

function kunark_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
			if player:CalculateDistance(110, -462, -59) <= 22 then
				player:CastSpell(2709);
			end
		end
	end
end
