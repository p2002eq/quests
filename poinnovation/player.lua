--player lua for PoInnovation
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
	local door = e.door:GetDoorID()
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
	
	--Sets permissions to open factory door
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	
	if door == 7 then
		if qglobals.pop_poi_dragon ~= nil or e.self:GetGM() then 
			e.self:Message(15,"You remember Nitram's words - 'three small turns to the right on the bottommost rivet should open the door'.");
		else 
			e.self:Message(4,"It's locked and you're not holding the key.");
			e.door:ForceClose(e.self);
		end
	end	
	
	if door == 145 then		--CHECK FOR ENTRY INTO PLANE OF TIME
		if pop_time_maelin ~= nil or e.self:GetGM() then 
			e.self:SetZoneFlag(219);		--potimea
			e.self:SetZoneFlag(223);		--potimeb
			e.self:Message(15,"You've received a character flag!");
			e.self:Message(15,"The ages begin to tear through your body. You wake to find yourself in another time.");
			e.self:MovePC(219,223,140,9,94);	
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


