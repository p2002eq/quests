--player.lua for
--PoAir

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
	-- populate the current entity list whenever someone clicks.
	entity_list = eq.get_entity_list();
	zone_id = eq.get_zone_id();
	instance_id = eq.get_zone_instance_id();
	-- drop the door information into some local variables
	local door_id = e.door:GetDoorID();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	client_e = e;
	--e.self:Message(14,"Door ID is: [" .. door_id .. "] Open Type: [" .. e.door:GetOpenType() .. "] Lock Pick: [" .. e.door:GetLockPick() .. "] Key Item: [" .. e.door:GetKeyItem() .. "]");   --debug to easily check door IDs
	-- make sure the player_list is clear
	player_list = nil;
	player_list_count = nil;

	local raid = e.self:GetRaid();
	if (raid.valid) then
		player_list = raid;
		player_list_count = raid:RaidCount();
	else
		-- if group is not valid, it is a single player click up
		local group = e.self:GetGroup();
		if (group.valid) then
			player_list = group;
			player_list_count = group:GroupCount();
		end
	end

	
	if (door_id == 1) then	--Portal to Xegony Island
		if (e.self:GetGM()) then
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 150, -617, 5, 1450, 128);
		elseif (e.self:HasItem(28638) or e.self:KeyRingCheck(28638)) then		--Wind Etched Key
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 150, -617, 5, 1450, 128);
		end
	end
end

function PortIntoTower(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z, dest_h)
	-- player_list contains e.self:GetGroup or e.self:GetRaid or is nil for a single player
	-- if it is not nil then port up the group/raid as long as they are in range
	if (player_list ~= nil) then
		-- iterate through the player_list (it is 0 based)
		for i = 0, player_list_count - 1, 1 do
			-- MovePC and GetAggroCount are client functions and group:GetMember returns a mob (raid:GetMember returns client)
			local client_v = player_list:GetMember(i):CastToClient();
			-- make sure we actually have a valid client
			if (client_v.valid) then
				-- check the distance and port them up if close enough
				if (client_v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
					-- port the player up
					client_v:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
				end
			end
		end
	else
		-- port the player up
		client_e.self:MovePCInstance(zone_id,instance_id, dest_x, dest_y, dest_z, dest_h);
	end
end