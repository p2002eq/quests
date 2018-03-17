-- Detective_Taian (202345) in PoK for anniversary quest!

function event_spawn(e)
	e.self:TempName("Taian");
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Taian";
	local qglobals = eq.get_qglobals();
	if (e.message:findi("hail") and qglobals[globalName] ~= nil) then
		if (qglobals[globalName] == "1") then
			e.self:Say("Good job running the gauntlet, provided me with some good laughs!  Here take this as reward.");
			e.other:SummonItem(100010, 1);
			eq.set_global(globalName ,"99",7,"F");
		else
			e.self:Say("No more, I can only laugh so much for the day!");
		end
	elseif (e.message:findi("hail")) then
		e.self:Say("Well hello there, are you here for my [" .. eq.say_link("approval") .. "]?");
	elseif (e.message:findi("approval")) then
		e.self:Say("I will be happy to give it, but first you will have to humor me with a [" .. eq.say_link("contest") .. "] of balance and patience!");
	elseif (e.message:findi("contest")) then
		e.self:Say("Oh yes, this should be fun to watch.  Let me know when you are [" .. eq.say_link("ready") .. "] and I will send you to the contest location.  You will have 5 minutes to complete it!");
	elseif (e.message:findi("ready")) then
		e.other:MovePCInstance(112, 0, -62, 532, -174, 132);
	end	
end