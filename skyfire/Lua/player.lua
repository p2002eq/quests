function event_click_door(e)
	local qglobals = eq.get_qglobals();
	if((e.door:GetDoorID() == 1) and qglobals["dragon_not_ready"] == nil) then
		eq.set_global("door_two","1",3,"S60");
		e.self:Message(4,"The globe begins to spin faster and faster...");
	end
	if((e.door:GetDoorID() == 2) and qglobals["dragon_not_ready"] == nil) then
		eq.set_global("door_three","1",3,"S60");
		e.self:Message(4,"The globe begins to spin faster and faster...");
	end
	if((e.door:GetDoorID() == 3) and qglobals["dragon_not_ready"] == nil) then
		eq.set_global("door_four","1",3,"S60");
		e.self:Message(4,"The globe begins to spin faster and faster...");
	end
	if((e.door:GetDoorID() == 232) and qglobals["dragon_not_ready"] == nil) then
		eq.set_global("door_one","1",3,"S60");
		e.self:Message(4,"The globe begins to spin faster and faster...");
	end
	if((e.door:GetDoorID() == 1) and qglobals["dragon_not_ready"] == 1) then
		e.self:Message(4,"The globe does not seem to do anything");
	end
	if((e.door:GetDoorID() == 2) and qglobals["dragon_not_ready"] == 1) then
		e.self:Message(4,"The globe does not seem to do anything");
	end
	if((e.door:GetDoorID() == 3) and qglobals["dragon_not_ready"] == 1) then
		e.self:Message(4,"The globe does not seem to do anything");
	end
	if((e.door:GetDoorID() == 232) and qglobals["dragon_not_ready"] == 1) then
		e.self:Message(4,"The globe does not seem to do anything");
	end
	if(e.door:GetDoorID() == 135) then
		if(e.other:HasItem( 69311)) then
			e.self:KeyRingAdd(69311);
		end
		if(e.other:HasItem( 69312)) then
			e.self:KeyRingAdd(69312);
		end
		if(e.self:KeyRingCheck(69311) or (e.other:Admin() > 99)) then
			e.other:MovePC(108,1682,41,25.9);
		else
			e.self:Message(13, "You lack the will to use this object!");
		end
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
