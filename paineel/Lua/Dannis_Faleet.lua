function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Fortune's Fancy. " .. e.other:GetName() .. "!  I carry only the finest jewels and jewelry in all the land.  All of the [charges and accusations] made against me are obviously false. as you can see by my beautiful wares."); end
	end
end
--END of FILE Zone:paineel  ID:75078 -- Dannis_Faleet


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
