function event_spawn(e)
	e.self:GMMove(-221, 207, -156, 120);
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Chunky";
	local num = qglobals[globalName];

	if (e.message:findi("hail")) then
		if (num == nil) then
			e.self:Say("Hail Adventurer.  Are you looking for my [" .. eq.say_link("approval") .. "]?");
		elseif (num == "1" and qglobals[forumName .. "-EvilEye"] ~= nil and qglobals[forumName .. "-OddMole"] ~= nil and qglobals[forumName .. "-Torklar"] ~= nil and qglobals[forumName .. "-Yelloweyes"] ~= nil) then
			e.self:Say("Good job, here is a token for your not so hard work.");
			eq.set_global(globalName ,"99",7,"F");
			e.other:SummonItem(100010, 1);
		elseif (num == "1") then
			e.self:Say("What are you looking at me for, you still have illusions to get!");
		else
			e.self:Say("I'd give you another token, but then Cocain would kill me.");
		end
	elseif (e.message:findi("approval")) then
		e.self:Say("If you want my approval, I need some [" .. eq.say_link("assistance") .. "] from you.");
	elseif (e.message:findi("assistance")) then
		e.self:Say("I am running out of illusions to cast on players, will you [" .. eq.say_link("collect") .. "] more for me?");
	elseif (e.message:findi("collect")) then
		e.self:Say("I need you to go steal illusions from the following creatures.  An odd mole in Kurns, an Evil Eye from East Karana, Torklar in Unrest and Yelloweyes from Paludal.  Take this wand, it will auto steal the illusions once you get close enough to the creatures.");
		e.other:Message(15,"You have recieved Chunkys magical wand of illusion stealing!");
		eq.set_global(globalName ,"1",7,"F");
	end
end
