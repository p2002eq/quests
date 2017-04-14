-- Nexus_Scion (118086) in Great Divide

local ThreadManager = require("thread_manager");
 
function event_spawn(e)
	eq.set_timer("heartbeat", 500);
    
	ThreadManager:Clear();
	ThreadManager:Create("Luclin", luclin_cycle, e);
end
 
function event_timer(e)
    evt = e;
    ThreadManager:Resume("Luclin");
end

function event_say(e)
    if e.message:findi("hail") then
        e.self:Say("Hello, traveler! Do you wish to [journey to luclin]?");
    elseif e.message:findi("journey to luclin") then
        e.self:Say("Take this, " .. e.other:GetName() .. ". You must stay inside the circle of the Spires, and keep this shard on your person. Should you need another, simply ask me. I do not think we will run out of shards any time soon! If you do NOT wish to travel to Luclin, destroy that which I gave you, or step well away from the Spires lest you be caught up in the portal. It will open soon.");
        e.other:SummonItem(19720); -- Spire Stone
    end
end

function luclin_cycle(evt)
    while true do
        eq.zone_emote(0, "A Mystic Voice says 'The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.'")
        ThreadManager:Wait(120)
        eq.zone_emote(0, "A Mystic Voice says 'As a reminder, the portal will become active in three minutes.'")
        ThreadManager:Wait(60);
        eq.zone_emote(0, "A Mystic Voice says 'Two minutes till teleportation. Please be prepared to step inside the circle of Spires.'")
        ThreadManager:Wait(60);
        eq.zone_emote(0, "A Mystic Voice says 'One minute till teleportation. Please stand inside the circle of Spires and have a shard upon your person.'")
        ThreadManager:Wait(60);
        luclin_port(eq.get_entity_list():GetClientList());
        ThreadManager:Wait(600);
    end
end

function luclin_port(player_list)
	if player_list ~= nil then
		for player in player_list.entries do
            local x, y = player:GetX(), player:GetY();
            if player:HasItem(19720) and x > -2795 and x < -2605 and y > -1985 and y < -1805 then -- has stone, is within spires, then port
                player:NukeItem(19720);
				player:SpellFinished(2935, player);
			end
		end
	end
end