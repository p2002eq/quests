-- Boragar_Lord_of_the_Pixels (202343) in PoK for anniversary quest!

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Boragar";
	local num = qglobals[globalName];

	if (e.message:findi("hail")) then
		if (num == nil) then
			e.self:Say("Hail Adventurer.  Let me guess, you are seeking my [" .. eq.say_link("approval") .. "]?");
		elseif (num == "1" and qglobals[forumName .. "-Scruffy"] ~= nil and qglobals[forumName .. "-Scryer"] ~= nil and qglobals[forumName .. "-CaveLord"] ~= nil) then
			e.self:Say("Excellent, good work, you have my approval.  Take this token for my appreciation.");
			eq.set_global(globalName ,"99",7,"F");
			e.other:SummonItem(100010, 1);
		elseif (num == "1") then
			e.self:Say("What are you back here for, you still have some creatures to capture for me!");
		else
			e.self:Say("I don't think so, you already got your reward, now move along!");
		end
	elseif (e.message:findi("approval")) then
		e.self:Say("Well I don't hand out approvals for nothing, you will have to do some [" .. eq.say_link("things") .. "] for me.");
	elseif (e.message:findi("things")) then
		e.self:Say("I have an interest in all creatures of Norrath, perhaps you can [" .. eq.say_link("capture") .. "] some for me?");
	elseif (e.message:findi("capture")) then
		e.self:Say("Here, take this cage.  Once you have downed the [" .. eq.say_link("creatures") .. "], the cage will trap them.");
		e.other:Message(15,"You have recieved Boragars magical cage.");
	elseif (e.message:findi("creatures")) then
		e.self:Say("Oh right, the creatures.  Lets see here.  I have been trying to get my hands on Scruffy in qeynos hills ever since he gave me rabies.  Also I could use the froglok scryer from upper guk and a cave bat lord from the warrens to add to my collection.  Come back to me when you have captured them all.");	
		eq.set_global(globalName ,"1",7,"F");
	end
end
