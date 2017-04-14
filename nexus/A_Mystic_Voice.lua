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
        old_world_port(eq.get_entity_list():GetClientList());
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
        velious_port(eq.get_entity_list():GetClientList());
        ThreadManager:Wait(5.0);
    end
end

function old_world_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
            elseif player:CalculateDistance(-363, 39, -44) <= 22 then -- antonica platform & port
				player:SpellFinished(2708, player);
			elseif player:CalculateDistance(30, 350, -44) <= 22 then -- faydwer platform & port
				player:SpellFinished(2706, player);
            elseif player:CalculateDistance(370, -37, -44) <= 22 then -- odus platform & port (shared locs with velious)
				player:SpellFinished(2707, player);
			if player:CalculateDistance(110, -462, -59) <= 22 then -- kunark platform & port
				player:SpellFinished(2709, player);
			end
		end
	end
end

function velious_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
            elseif player:CalculateDistance(370, -37, -44) <= 22 then -- velious platform & port (shared locs with odus)
				player:SpellFinished(2062, player);
			end
		end
	end
end
