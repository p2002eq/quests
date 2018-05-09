--player.lua for
--Plane of Storms

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
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	
	if door == 4 then	--Shrine near whirling tempest at lake
		if qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil and qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pos_askr_the_lost ~= nil and  qglobals.pop_pos_askr_the_lost_final ~= nil then
			if not e.self:HasZoneFlag(209) then
				e.self:Message(7,"An aura of soft light gleams around you as the shrine reacts to your Talisman of Thunderous Foyer and sends you forth into the mighty Bastion of Thunder.");
				e.self:Message(15,"You've received a character flag!");
				e.self:SetZoneFlag(209);
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
