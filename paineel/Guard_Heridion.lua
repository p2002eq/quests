function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Uggg. You needz [keyz]? Rrrrrrr.");
		elseif(e.message:findi("key")) then
			e.self:Say("Uggggg. Take dis keyz.");
			e.other:SummonItem(6378);
		end
	end
end

--END of FILE Zone:paineel  ID:75010 -- Guard_Heridion
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------