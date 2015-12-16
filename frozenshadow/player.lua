-- declare globals

local player_list = nil;
local player_list_count = nil;
local entity_list = nil;

function event_click_door(e)

	entity_list = eq.get_entity_list(); --get current entity list of zone
	
	local door_id = e.door:GetDoorID(); 
	local open_type = entity_list:FindDoor(door_id):GetOpenType();

	player_list = nil;
	player_list_count = nil;
	--clear both the lists
	
	local group = e.self:GetGroup();
	
	if (group.valid == true) then
		player_list = group;
		player_list_count = group:GroupCount();
	--if Group is True then drop these variables
	end
	
	if (door_id == 2) or (door_id == 166) then --First Floor
		if (e.self:HasItem(20033) == 1) then --Crystal Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 660, 100, 40, 0);
		end
	elseif (door_id == 4) or (door_id == 167) then --Second Floor
		if (e.self:HasItem(20034) == 1) then --Three Toothed Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 670, 750, 75, 0);
		end
	elseif (door_id == 16) or (door_id == 165) then --Third Floor
		if (e.self:HasItem(20035) == 1) then --Frosty Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 170, 775, 175, 0);
		end
	elseif (door_id == 27) or (door_id == 169) then --Fourth Floor
		if (e.self:HasItem(20036) == 1) then --Small Rusty Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -150, 160, 217, 0);
		end
	elseif (door_id == 34) or (door_id == 168) then --Fifth Floor
		if (e.self:HasItem(20037) == 1) then --Bone Finger Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, -320, 725, 12, 0);
		end
	elseif (door_id == 1) then --Sixth Floor
		if (e.self:HasItem(20039) == 1) then --Tserinas Key
			PortChars(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 20, 250, 255, 0);
		end
	end

end


function PortChars(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z, dest_h)
	if (player_list ~= nil) then -- Group.valid == true
		for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
			local v = player_list:GetMember(i);
			
			if (v.valid == true) then --valid client
				if (v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
			  --check distance	
				v:CastToClient():MovePC(111, dest_x, dest_y, dest_h);
				end
			end
		end
	else --not grouped
		e.self:CastToClient():MovePC(111, dest_x, dest_y, dest_z, dest_h);
	end

end
