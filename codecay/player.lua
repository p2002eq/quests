--player.lua for
--CoDecay
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



--Chair down to Bertoxx Event 
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local zone_id = eq.get_zone_id();
	local qglobals = eq.get_qglobals(e.self);
	--e.self:Message(14,"Door ID is: [" .. door .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "]");   --debug to easily check door IDs
	
	
	
	if door == 7 then
		if qglobals.pop_cod_preflag ~= nil  or e.self:GetGM() then
			e.door:SetLockPick(0);
			e.self:MovePCInstance(zone_id,instance_id,0,-16,-290,255);
		else
			e.door:SetLockPick(-1);
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



