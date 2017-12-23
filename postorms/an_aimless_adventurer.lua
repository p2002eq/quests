function event_say(e)
	if e.message:findi("hail") then
		local ran = math.random(1,5);
		
		if ran == 1 then
			e.self:Say("My brother was stranded here long ago. I tried to come to find him, but ended up just getting myself lost as well. Now I can't seem to find him; I fear the worst has happened to him.");
		elseif ran == 2 then
			e.self:Say("What could you possibly be looking at? Hmm?! Mind your own business!");
		elseif ran == 3 then
			e.self:Say("How a scholar like myself came to be in a place like this is dumbfounding. Had I but known, I would never have gotten on that ill-fated sea cruiser. To think that there are not even any scrolls here for me to peruse. I need something before I go MAD!");
		elseif ran == 4 then
			e.self:Say("Dem Storms are bery bad! Me wud smoosh dem if me could, but me no can. Me thot me was big strong smoosher, but dem Storms are bigger smooshers den me.");
		elseif ran == 5 then
			e.self:Say("Hello there. stranger. I see you've had the misfortune of winding up stranded like we have here. What's that you say? You're not stranded? Well, that's news to me, for sure! Maybe there's a way out of this wretched place. You'd let us know if there was one, right? Right?!"); 
		end
	end
end

--END of FILE Zone:postorms  ID:210071 -- an_aimless_adventurer 

