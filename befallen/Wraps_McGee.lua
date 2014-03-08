function event_spawn(e)
	eq.set_timer(2,45000);
end

function event_say(e)
	if(e.message:findi("trick or treat")) then
		e.self:Say("Here I'll just wrap this up for you. . . Get it? Hahaha!");
		e.other:SummonItem(eq.ChooseRandom(84091,84092,84093,6800,6800,6800,6800,6800,6800,6800));
		e.other:UpdateTaskActivity(220,9);
	end
end

function event_timer(e)

	if(timer == 2) then
		e.self:Shout("Trick or treat! Smell my feet! Give me something good to eat!");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
