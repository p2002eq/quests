function event_spawn(e)
  e.self:GMMove(-322, 844, -99, 120);
  eq.set_timer("quips",math.random(750000));
end

function event_timer(e)
  local random_say = math.random(2);

  if(random_say == 1) then
    e.self:Say("Two decades. Amazing...");
  else
    e.self:Say("Souls from all over the land are feeling a change in this world.");
  end
  eq.set_timer("quips",math.random(750000));
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Dhampyre19";
	local num = qglobals[globalName];

	if (e.message:findi("hail")) then
		if (num == nil) then
			e.other:Message(15,"Hail Adventurer.  Are you seeking some fresh [" .. eq.say_link("blood") .. "]?");
		elseif (num == "1" and qglobals[forumName .. "-CloakedDhampyre19"] ~= nil and qglobals[forumName .. "-Yaroslav19"] ~= nil and qglobals[forumName .. "-Nathyn19"] ~= nil and qglobals[forumName .. "-GuardNMar19"] ~= nil) then
			e.other:Message(15,"Well, you still look rather alive. So take this token and leave before I drain your life essence.");
			e.other:Message(15,"You are feel the power of undeath leaving you.");
			eq.set_global(globalName ,"99",7,"F");
			e.other:SummonItem(100010, 1);
		elseif (num == "1") then
			e.other:Message(15,"Your lips are untainted. You are no vampire.");
		else
			e.other:Message(15,"You cannot double-dip... lest I dip my teeth into your veins. Move along.");
		end
	elseif (e.message:findi("blood")) then
		e.other:Message(15,"If you want my approval, I need you to [" .. eq.say_link("drink") .. "] some blood and fully embrace the undeath.");
	elseif (e.message:findi("drink")) then
		e.other:Message(15,"The blood of the undead is a good thing to [" .. eq.say_link("find") .. "].");
	elseif (e.message:findi("find")) then
		e.other:Message(15,"I need you to drink the life from the following creatures.  A cloaked dhampyre in Castle Mistmoore, Yaroslav Verilak in the Tenebrous Mountains, Nathyn Illuminious in Katta Castellum, and Guard N'Mar in the Neriak Commons.  I have infused you with my essence, now you can automatically take their life by proximity. Go forth and hunt!");
		e.other:Message(15,"You are infused with the power of undeath, for now...");
		eq.set_global(globalName ,"1",7,"F");
	end
end
