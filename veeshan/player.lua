function event_click_door(e)
    local left_door = 40;
    local right_door = 37;
	local dragonsup = 0;
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108511)) then --Xygoz
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108512)) then --Druushk
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108513)) then --Nexona
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108517)) then --Hoshkar
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108509)) then --Silverwing
		dragonsup = 1;
	end
	if(e.door:GetDoorID() == left_door or e.door:GetDoorID() == right_door) then
		if(dragonsup == 0) then
			e.self:Message(0,"You got the door open.");
			e.door:ForceOpen(left_door);
			e.door:ForceOpen(right_door);
		else
			e.self:Message(0,"A seal has been placed on this door by Phara Dar. Perhaps there is a way to remove it.");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
