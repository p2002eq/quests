function event_spawn(e)
	e.self:GMMove(-221, 207, -156, 120);
	e.self:TempName("Daeron");
end

function event_say(e)
	local qglobals = eq.get_qglobals();
	local forumName = e.other:GetForumName(e.other:AccountID());
	local globalName = forumName .. "-Daeron";
	local num = qglobals[globalName];

	if (e.message:findi("hail")) then
		if (num == nil) then
			e.self:Say("Well hey there, are you here seeking my [" .. eq.say_link("approval") .. "]?");
		elseif (num == "1" and qglobals[forumName .. "-Cauldron"] ~= nil and qglobals[forumName .. "-Orb"] ~= nil and qglobals[forumName .. "-BookCase"] ~= nil) then
			e.self:Say("The Relics!  Thanks a lot for these, you have my approval.  Here is also something for your efforts.");
			eq.set_global(globalName ,"99",7,"F");
			e.other:SummonItem(100010, 1);
		elseif (num == "1") then
			e.self:Say("Are you having problems finding the relics?  Just look closely at the locations I mentioned and I'm sure you will find them.");
		else
			e.self:Say("While I appreciate your help, I already gave you something for your efforts.");
		end
	elseif (e.message:findi("approval")) then
		e.self:Say("Oh yes, I have the perfect [" .. eq.say_link("job") .. "] for you if you want my approval.");
	elseif (e.message:findi("job")) then
		e.self:Say("I have been researching the location of some [" .. eq.say_link("relics") .. "], but need someone to obtain them for me.");
	elseif (e.message:findi("relics")) then
		e.self:Say("Oh yes, there are many relics hidden all over norrath, even in plain sight.  Will you [" .. eq.say_link("retrieve") .. "] some of them for me?");
	elseif (e.message:findi("retrieve")) then
		e.self:Say("The first is located at the ruins on the island within Dagnors Cauldron.  For the next one, search the book case in the abandoned temple within the dreadlands.  Lastly, inspect the orb that leads to Crystal Caverns in the Eastern Wastes, I suspect you will find another one there.");	
		eq.set_global(globalName ,"1",7,"F");
	end
end