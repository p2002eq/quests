--NPC: a_minotaur_slaver   Zone: steamfont
--
--Emotes & Chance to trigger Minotaur Hero spawn on death
--
--by Qadar

function event_death_complete(e)
	local random_result = int(rand(100));
	if(random_result >= 94) then
		eq.unique_spawn(56152,177,0,-1294,1360,-103);
	end
	e.self:Say("I die soon! Meldrath, help me!");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
