function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. disciple " .. e.other:GetName() .. ". Feel free to inspect my wares. I am here to serve all necromancers of the Dead. I can also enchant a [ring of the Dead] if you have one.");
	end
end

--END of FILE Zone:neriakc  ID:42063 -- Xantis_Ixtax
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
