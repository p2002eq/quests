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

function event_click_door(e)	
	local door = e.door:GetDoorID();
	local zone_id = eq.get_zone_id();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 
	eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	if door == 14 or door == 15 or door == 16 or door == 17 then
		if qglobals[instance_id .. "_rztw_event"] == nil and not e.self:GetGM() then 
			e.door:ForceClose(e.self);
		end
	end	
end

-----------------------------------
--POP ALPHA TESTING MODULE
function event_say(e)
	local pop_flags = require("pop_flags");
	pop_flags.options(e)
end

-----------------------------------
