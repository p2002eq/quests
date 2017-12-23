
function event_click_door(e)
	local instance_id = eq.get_instance_id();
	door_id = e.door:GetID();
	-- gm can always use the door
	-- used status > 79 because that is what bothunder/player.pl used
	if(e.self:GetGM() and (door_id == 2 or door_id == 3 or door_id == 4 or door_id == 5)) then
		e.self:MovePCInstance(214,instance_id, 278,178,2);
		
	--vallon's doors
	elseif(door_id == 2 or door_id == 3) then	
		--check if Vallon is up
		if(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214083)) then
			e.self:MovePCInstance(214,instance_id,278,178,2);
		end		
	
	--tallon's doors
	elseif(door_id == 4 or door_id == 5) then		
		--check if Tallon is up
		if(not eq.get_entity_list():IsMobSpawnedByNpcTypeID(214026)) then
			e.self:MovePCInstance(214,instance_id,278,178,2);
		end
	end
end
