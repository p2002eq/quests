-- Cocain_God (202344) in PoK for anniversary quest!
function event_spawn(e)
	e.self:GMMove(-167, 253, -156, 380);
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Cocain";
	local num = qglobals[globalName];
	if (e.message:findi("hail")) then
		if (num ~= nil) then
			if (tonumber(num) == 20) then
				e.self:Say("Well done, now I can feed the orphan Gnomes again!  Here, take this also I guess.");
				eq.set_global(globalName ,"99",7,"F");
				e.other:SummonItem(100010, 1);
			elseif (tonumber(num) < 20) then
				e.self:Say("I need more bread damn you!");
			else
				e.self:Say("Thanks for the help, I guess I won't death touch you next time you get on my nerves. Now leave me alone.");
			end
		else
			e.self:Say("Where has all my [" .. eq.say_link("bread") .. "] gone!");
		end
	elseif (e.message:findi("bread")) then
		e.self:Say("I need bread to give to all the Gnome [" .. eq.say_link("orphans") .. "] in Norrath.");
	elseif (e.message:findi("orphans")) then
		e.self:Say("Can't you see all the little gnome bastards running over the place? Annoying anklebiters. No matter. I need more Bread to make them [" .. eq.say_link("happy") .. "] so they stop annoying me.");
	elseif (e.message:findi("happy")) then
		e.self:Say("To keep them happy I usually feed them some of my bread, but the damn goblins of ill omen have stolen it all.  Go get me twenty pieces will ya, and make sure those goblins pay with their lives.");
		eq.set_global(globalName ,"0",7,"F");
	end
end