function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why you bother Wislen?  Wislen trying to get fishies.  Leave Wislen alone to get [fish]. please.");
	elseif(e.message:findi("fish")) then
		e.self:Say("Fish.  Wislen fish.  Wislen is mamluk. not just fisher.  Mamluk is warrior but they also helps provide for all Kerran.  This is hadi place in life.  We happy doing this.  Please. let Wislen fish now.");
	end
end

--END of FILE Zone:kerraridge  ID:74021 -- Wislen_Mamluk
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------