--player.lua for
--PoEarthA

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
	local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);
	--e.self:Message(14,"Door ID is: [" .. door .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "]");   --debug to easily check door IDs
	
	if door == 9 or door == 10 or door == 11 then
		if (qglobals.pop_elemental_grand_librarian ~= nil and qglobals.pop_eartha_arbitor_projection ~= nil) then
			if not e.self:HasZoneFlag(222) then
				e.self:SetZoneFlag(222);
			end
		end
	end	
end

