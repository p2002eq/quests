function event_click_door(e)
	local dragonsup = 0;
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108053)) then --Xygoz
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108040)) then --Druushk
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108047)) then --Nexona
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108043)) then --Hoshkar
		dragonsup = 1;
	elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(108050)) then --Silverwing
		dragonsup = 1;
	end
	if(e.door:GetDoorID() == 56 or e.door:GetDoorID() == 57) then
		if(dragonsup == 0) then
			e.self:Message(0,"You got the door open.");
			e.door:ForceOpen(56);
			e.door:ForceOpen(57);
		else
			e.self:Message(0,"A seal has been placed on this door by Phara Dar. Perhaps there is a way to remove it.");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
