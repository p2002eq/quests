function event_combat(e)
	if(e.joined) then
		e.self:Say("Time to die " .. e.other:GetName() .. "!");
	end
end

function event_death_complete(e)
	e.self:Say("My comrades will avenge my death.");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------