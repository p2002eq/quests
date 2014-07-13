--There's a gate in the Neriak Commons that is actually three separate doors, but the gates should all lift together as one. This CLICKDOOR script accomplishes that.

function event_click_door(e)
	if(e.door:GetDoorID() == 1) then
		e.door:ForceOpen(2);
		e.door:ForceOpen(49);
	end
	if(e.door:GetDoorID() == 2) then
		e.door:ForceOpen(1);
		e.door:ForceOpen(49);
	end
	if(e.door:GetDoorID() == 49) then
		e.door:ForceOpen(1);
		e.door:ForceOpen(2);
	end
end

--Submitted by Jim Mills

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
