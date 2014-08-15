function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ".  You have come to the Anthenaeum Necromanita.  This place serves as the stores of knowledge for the Seekers of the [Dark Truth].");
	elseif(e.message:findi("dark truth")) then
		e.self:Say("The Dark Truth is what all the [necromancers] in Paineel seek to learn.  The [real truth] is far more interesting.");
	elseif(e.message:findi("necromancers")) then
		e.self:Say("The necromancers here are called the Seekers of the Dark Truth.  The leader of the Seekers is known as the Speaker of the Dark Truth.  The current Speaker is Coriante Verisue.  She does. however. have many [rivals].");
	elseif(e.message:findi("rivals")) then
		e.self:Say("I support Coriante due to my respect for her.  Many have no such respect and covet her power and position.  One such individual is Darton. the Seeker's Chief Researcher.  He is a direct descendant of [Dartain]. a hero to our people.");
	elseif(e.message:findi("dartain")) then
		e.self:Say("That is a long story indeed. " .. e.other:GetName() .. ".  Many years ago. the heretics and the people of Erudin had a grand battle.  During the conflicts. great magics were performed and many catastrophic effects plagued these lands. a good example of which would be the Hole.");
	elseif(e.message:findi("real truth")) then
		e.self:Say("The real truth is actually a theory of mine which I believe to be true.  You see. the Seekers believe that necromancy is all that can be gained from the Dark Truth. whereas I believe it is merely a by-product.");
	end
end

--END of FILE Zone:paineel  ID:75077 -- Talloth_Vara
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------