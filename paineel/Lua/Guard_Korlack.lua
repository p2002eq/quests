function event_say(e)
	if(e.message:findi("hail") and e.other:GetFaction(e.self) <= 5) then
		e.self:Say("Uggg. You needz [keyz]? Rrrrrrr.");
	end
	if(e.message:findi("key") and e.other:GetFaction(e.self) <= 5) then
		e.self:Say("Uggggg. Take dis keyz.");
		e.other:SummonItem(6378);
	end
end

--END of FILE Zone:paineel  ID:75014 -- Guard_Korlack

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
