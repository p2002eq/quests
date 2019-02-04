--player.lua for
--Plane of Valor
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

--zone in to hohonora after killing Aerin`Dar
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	--eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs
		
	local tier3 = 46;
	if door == 3 then
		if e.self:GetLevel() >= tier3 and ((qglobals.pop_poj_mavuin ~= nil and qglobals.pop_poj_tribunal ~= nil and qglobals.pop_poj_valor_storms ~= nil and qglobals.pop_pov_aerin_dar ~= nil) or qglobals.pop_alt_access_hohonora ~= nil) then
			if not e.self:HasZoneFlag(211) then
				e.self:SetZoneFlag(211);
				e.other:Message(15,"You've received a character flag!");
			end
		end
	end
	
	---PoV lair door
	if door == 8 then
		if e.self:HasItem(25596) or e.self:KeyRingCheck(25596) or e.self:GetGM() then --check for Crystalline Globe
			local lever = eq.get_entity_list():GetDoorsByDoorID(2);  --rotating door
			lever:ForceOpen(e.self);
		else 
			e.self:Message(13,"It's locked and you're not holding the key.");
			e.door:ForceClose(e.self);
		end
	end

	if door == 9 then
		if e.self:HasItem(25596) or e.self:KeyRingCheck(25596) or e.self:GetGM() then --check for Crystalline Globe
			local lever = eq.get_entity_list():GetDoorsByDoorID(2);  --rotating door
			lever:ForceOpen(e.self);
		else
			e.self:Message(13,"It's locked and you're not holding the key.");
			e.door:ForceClose(e.self);
		end
	end
	
	--Aerin`Dar Platform - should remain locked while AD is still alive
	if door == 11 then
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(208074) and not e.self:GetGM() then 	--Aerin Dar
			e.door:ForceClose(e.self);		
		end
	end
end