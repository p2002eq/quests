local player_list = nil
local player_list_count = nil
local client_e = nil
local entity_list = nil

function event_click_door(e)

	entity_list = eq.get_entity_list(); --Get current entity list of zone

	local door_id = e.door:GetDoorID();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	
	client_e = e
			
	player_list = nil;
	player_list_count = nil; --clear the lists
	
	if (door_id == 2) or (door_id == 166) then --First floor Door
		if (e.self:HasItem(20033)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 660, 100, 40);
			eq.debug("Porting up!");
		end
	elseif (door_id == 4) or (door_id == 167) then --Second Floor Door
		if (e.self:HasItem(20034)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 670, 750, 75);
			eq.debug("Porting up!");
		end
	elseif (door_id == 16) or (door_id == 165) then --Third Floor Door
		if (e.self:HasItem(20035)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 170, 775, 175);		
			eq.debug("Porting up!");
		end
	elseif (door_id == 27) or (door_id == 169) then --Fourth Floor Door
		if (e.self:HasItem(20036)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -150, 160, 217);
			eq.debug("Porting up!");
		end
	elseif (door_id == 34) or (door_id == 168) then --Fifth Floor Door
		if (e.self:HasItem(20037)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -320, 725, 12);
			eq.debug("Porting up!");
		end
	elseif (door_id == 1) then --Sixth Floor Door	
		if (e.self:HasItem(20039)) then
			PortCharacters(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 20, 250, 255);
			eq.debug("Porting up!");
		end
	end
end


function PortCharacters(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z)
	if (player_list ~= nil) then
		for i=0, player_list_count - 1, 1 do
			local client_v = player_list:GetMember(i):CastToClient();
			--validate client
			if (client_v.valid) then
				--check distance
				if (client_v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
					--port up
					client_v:move_to(dest_x, dest_y, dest_z);				
				end
			end
		end
	else
		--port player
		client_e.self:move_to(dest_x, dest_y, dest_z);
	end	

end
