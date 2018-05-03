--player.lua for
--PoEarthB

function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

function event_click_door(e)	
	local door = e.door:GetDoorID();
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	if door == 2 or door == 3 then
		if spawn_check(1) and not e.self:GetGM() then 
			e.door:ForceClose(e.self);
			e.self:Message(7,"As you attempt to move the wall of stone it is clear that it is being held in place by a powerful force.");
		end
	end	
	
	if door == 4 or door == 5 then
		if (spawn_check(2) or (tonumber(qglobals[instance_id .. "_Warlord_PoEarthB"]) ~= 2)) and not e.self:GetGM() then 
			e.door:ForceClose(e.self);
			e.self:Message(7,"The massive wall of rock, dirt and stone seems to be impenetrable. It is obviously held in place by a magical force.");
		end
	end	
end

function spawn_check(room)
	spawnpoints = {	[1] = {369055, 369056, 369057, 369065, 369066, 369067, 369068, 369109,369063, 369064, 369122, 369123, 369058, 369059, 369060, 369061, 369062, 369082, 369083, 369084, 369081, 369110, 369112, 369114, 369111, 369113, 369120, 369121, 369115}, 	--initial room spawnpoints required to open first door
							[2] = {369069, 369070, 369071, 369086, 369124, 369125,369072, 369085, 369116, 369117,369073, 369087, 369126, 369127,369088, --2nd room trash mobs
							369158, 369159, 369160, 369161, 369154, 369155, 369156, 369157, 369096, 369151, 369152, 369153}} --warlord event triggers


	for k,v in pairs(spawnpoints[room]) do
		spawn = eq.get_entity_list():GetSpawnByID(v);
		if spawn:NPCPointerValid() then
			return true;	--mob is still up
		end
	end
	return false;	--no mobs found - OK to proceed
end							
