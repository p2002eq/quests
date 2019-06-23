function eq.ChooseRandom(...)
	local tbl = {...};
	return tbl[math.random(#tbl)];
end

function eq.SelfCast(spell_id)
	local init = eq.get_initiator();
	local sp = Spell(spell_id);
	
	if(init.null or sp.null) then
		return;
	end
	
	init:SpellFinished(spell_id, init, 10, 0, -1, sp:ResistDiff());
end

function eq.ClassType(class)
	if(class == 8 or class == 15 or class == 3 or class == 4 or class == 5) then
		return "hybrid";
	elseif(class == 1 or class == 7 or class == 16 or class == 9) then
		return "melee";
	elseif(class == 11 or class == 12 or class == 13 or class == 14) then
		return "caster"
	elseif(class == 2 or class == 10 or class == 6) then
		return "priest";
	end
	
	return "other";
end

-- This is a function to produce a local emote, using similar syntax to zone_emote from lua_general.
-- Expected data types - locs: table in { x, y, z } format, color: int, radius: int, message: string.
-- Does not return any values.
function eq.local_emote(locs, color, radius, message)

	local player_list = eq.get_entity_list():GetClientList();
	if(player_list ~= nil) then
		for player in player_list.entries do	
			if(player:CalculateDistance(locs[1], locs[2], locs[3]) <= radius) then
				player:Message(color, message)
			end
		end
	end
end

--send a message only to GM toggled characters (useful for debugging/monitoring)
function eq.GM_Message(color,text)
	local client_list = eq.get_entity_list():GetClientList();
	
	if(client_list ~= nil) then
		for client in client_list.entries do
			if client:GetGM() then
				client:Message(color,text);
			end
		end
	end
end

--check for players within a specified unit range
function eq.PlayerCheck(x,y,z,dist)
	local client_list = eq.get_entity_list():GetClientList();
	
	if (client_list ~= nil) then
		for client in client_list.entries do
			if client:CalculateDistance(x,y,z) <= dist then
				return true; --client in range
			end
		end
	end
	return false;
end

function eq.ZoneMarquee(color,opacity,fade_in,fade_out,duration,message)
	--type = color, priority = text opacity, fade_in = 1, fade_out = fade out in MS, duration = duration in MS
	--SendMarqueeMessage(Integer type, Integer priority, Integer fade_in, Integer fade_out, Integer duration, String msg);
	--e.self:SendMarqueeMessage(15, 510, 1, 100, 10000, "
	local now_clients = eq.get_entity_list():GetClientList();
	for client in now_clients.entries do
		if (client.valid) then
			client:SendMarqueeMessage(color,opacity,fade_in,fade_out,duration,message);
		end
	end
end