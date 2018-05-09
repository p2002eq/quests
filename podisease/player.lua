--player.lua for
--Plane of Disease 
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

--if initially zoning into CoDecay after Grummus
function event_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local tier2 = 46;
	if e.zone_id == 200 then
		if e.self:GetLevel() >= tier2 and ((qglobals.pop_pod_alder_fuirstel ~= nil and qglobals.pop_pod_grimmus_planar_projection ~= nil) or qglobals.pop_alt_access_codecay ~= nil) then
			if not e.self:HasZoneFlag(200) then
				e.self:SetZoneFlag(200);
			end
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