-- player.lua for Howling Stones (Charasis)
	
function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered an Instanced Version of the zone.");
    end
end


function event_click_door(e)	
	local door = e.door:GetDoorID();	
	if door == 8 or door == 10 or door == 11 or door == 35 or door == 40 or door == 46 then	
		if e.self:HasItem(17274) and not e.self:KeyRingCheck(17274) then	--check for Hand of Glory
			e.self:KeyRingAdd(17274);	--Add to keyring (keyring add is disabled in DB due to other keys used on doors being temporary items)
		end
	end	
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end