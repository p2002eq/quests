------------------------------------------------------------------------------------------------------------------
-- Phiz Frugrin (ID:56177)
-- Zone:   Steamfont (steamfont)
-- Quest:  Telescope Lenses
-- Author: a_sewer_rat
------------------------------------------------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello my friend. Good to meet you.");
	end
	if(e.message:findi("lens")) then
		e.self:Say("Oh my. I have bad news. It was stolen by a dark elf rogue. She fled very quickly. My little legs could not keep up. Here. She dropped this. You must find her. Get it back. We have very few Lenses.");
		e.other:SummonItem(18867); -- filthy towel
	end
end

--END of FILE Zone:steamfont  ID:56115 -- Phiz_Frugrin

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
