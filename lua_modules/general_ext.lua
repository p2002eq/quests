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
