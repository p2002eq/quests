function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  I have some of the finest baked goods in Paineel.  It's the best home cooking you have had. ever.  That be my word."); end
	end
end
--END of FILE Zone:paineel  ID:75104 -- Iva_Tersala


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
