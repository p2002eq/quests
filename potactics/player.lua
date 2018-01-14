--player.lua for
--Plane of Tactics

function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

--[[
function event_click_door(e)	
	local door = e.door:GetDoorID();
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 
	eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	if door == 14 or door == 15 then
		door1 = eq.get_entity_list():GetDoorsByDoorID(14);
		door2 = eq.get_entity_list():GetDoorsByDoorID(15);
		if qglobals[instance_id .. "_rztw_event"] == nil or not e.self:GetGM() then 
			door1:ForceClose(e.self);		
			door2:ForceClose(e.self);
		else
			if door == 14 then
				door2:ForceOpen(e.self);
			else
				door1:ForceOpen(e.self);
			end
		end
	end	
end]]
